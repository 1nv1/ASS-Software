function conv_ani(fx, zx, fh, zh, dt = 1, duration = 5, delay = 1)

  function res = getIdx(f, i, dt, q)
    for j=i:dt:q
      if !(f(j) == 0) break; endif
    endfor
    res = j;
  endfunction

  function [rf, rz, rlen] = cleanSignal(f, z)
    len = length(f);
    i = getIdx(f, 1, 1, len);
    q = getIdx(f, len, -1, 1);
    rf = f(i:q);
    rz = z - i;
    rlen = q - i;
  endfunction

  %% graphics_toolkit("gnuplot");
  if (duration < 0)
    disp("Error! Duration must be greater than 0.")
    return
  endif

  %% Get length of "functions"
  x.len = length(fx);
  h.len = length(fh);

  if ((zx < 1) || (zx > x.len))
    disp("Error! Element zero of X is out of range.")
    return
  endif
  if ((zh < 1) || (zh > h.len))
    disp("Error! Element zero of Y is out of range.")
    return
  endif

  %% Clean the charts
  figure(1);
  clf;

  %% Original convolution
  conv.original = conv(fx, fh) .* dt;
  conv.len = length(conv.original);

  [x.f, x.z, x.len] = cleanSignal(fx, zx);
  [h.f, h.z, h.len] = cleanSignal(fh, zh);
  h.f = flip(h.f);
  
  conv.z = x.z + h.z;
  %% Where is the zero of convolution?
  [conv.f, temp, conv.len] = cleanSignal(conv.original, conv.z);
  
    %% Window calculation
  win.len = ((x.len + h.len) * 2) + 1;
  %% Window half
  win.half = round(win.len / 2);
  win.cor = 0;
  if (mod(win.len, 2))
    win.cor = round(1 / dt);
    win.half = win.half - 1;
  endif
  
  %% Discrete time animation
  ani.dt = duration / win.len;
  ani.delay = delay;

  %% Final range
  win.t.f = -win.half:win.half;
  win.t.len = length(win.t.f);
  
  %% Animation
  ani.start = win.half - x.z - h.len - (win.cor > 0);
  ani.finish = win.len - h.len;

  %% Get handlers
  subplot(2, 1, 1);
  hold on;
  t = win.t.f;
  f = [zeros(1, win.half - x.z) x.f zeros(1, win.t.len - x.len - (win.half - x.z) - (win.cor > 0))];
  if (dt == 1)
    pSgs(1) = stem(win.t.f, x.f, 'linewidth', 4, 'color', 'red');
    pSgs(2) = stem(nan, nan, 'linewidth', 4, 'color', 'blue');
  else
    pSgs(1) = area(t, f, "FaceColor", "red");
    set(get(pSgs(1), 'children'), 'facealpha', 0.5);
    pSgs(2) = area(win.t.f, x.f, "FaceColor", "blue");
    set(get(pSgs(2), 'children'), 'facealpha', 0.5);
  end
  win.s.min = floor(min([min(fx),min(fh)]));
  if (win.s.min > 0) win.s.min = 0; end
  win.s.max = ceil(max([max(fx),max(fh)]));
  if (win.s.max < 0) win.s.max = 0; end
  win.s.axis = [-win.half, win.half, win.s.min, win.s.max];
  axis(win.s.axis);
  grid on;

  subplot(2, 1, 2);
  hold on;
  if (dt == 1)
    pConv(1) = stem(nan, 'linewidth', 4, 'color', 'magenta');
  else
    pConv(1) = plot(nan, 'linewidth', 4, 'color', 'magenta');
  end
  win.c.min = floor(min(conv.original));
  if (win.c.min > 0) win.c.min = 0; end
  win.c.max = ceil(max(conv.original));
  if (win.c.max < 0) win.c.max = 0; end
  win.c.axis = [-win.half, win.half, win.c.min, win.c.max];
  axis(win.c.axis);
  grid on;

  %% y(t) -> 0
  set(pConv(1),'XData', win.t.f, 'YData', zeros(1, win.len));

  %% Initial delay, 1 sec. by default
  pause(ani.delay);
  ani.idTotal = 0;

  %% Graph until H touch the end of screen
  for i = 1:(win.t.len - h.len - 1);
    %% h(t)
    t = win.t.f;
    f = [zeros(1, i) h.f zeros(1, win.t.len - (h.len + i + (win.cor > 0)))];
    set(pSgs(2), 'XData', t, 'YData', f);
    %% y(t)
	  if (i >= ani.start)
      if (ani.idTotal <= conv.len)
        ani.idTotal++;
        conv.parcial = conv.f(1:ani.idTotal);
      endif
      t = win.t.f;
      f = [zeros(1, win.half - conv.z) conv.parcial zeros(1, win.t.len - (win.half - conv.z + ani.idTotal))];
      set(pConv(1),'XData', t, 'YData', f)
    endif
    %% Animation
    drawnow();
    pause(ani.dt);
  end
end
