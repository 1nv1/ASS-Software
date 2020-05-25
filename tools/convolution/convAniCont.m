function convAniCont(fx, zx, fh, zh, dt = 0.5, duration = 5, delay = 0)
  %% graphics_toolkit("gnuplot");
  if (duration < 0)
    disp("Error! Duration must be greater than 0.")
    return
  endif
  %% Get length of "functions"
  len_x = length(fx);
  len_h = length(fh);

  if ((zx < 0) || (zx > len_x))
    disp("Error! Element zero of X is out of range.")
    return
  endif
  if ((zh < 0) || (zh > len_h))
    disp("Error! Element zero of H is out of range.")
    return
  endif

  %% Clean the charts
  figure(1);
  clf;

  zx = zx / dt;
  zh = zh / dt;

  %% Span calculation
  span = (len_x + len_h) * 2;
  %% Original convolution
  total_conv = conv(fx, fh) .* dt;
  %% Discrete time animation
  tani = (duration/span);
  %% Half span
  hspan = round(span/2);
  %% Final range
  rang = -hspan:hspan;
  
  %% Complete with zeros
  init = hspan - zx;
  zi = zeros(1, init);
  zq = zeros(1, span - init - len_x + 1);
  fx = [zi fx zq];
  
  % Flip H
  fh = fliplr(fh);

  initI = hspan + zx + zh;
  endI = hspan + len_x + len_h - zx - zh - 1;
  initAni = hspan - len_x + zx;
  endAni = hspan + len_h - zh + zx + 1;
  idTotal = 1;
  addSignals = zeros(1, span);

  %% Initial delay, 0 by default
  pause(delay);
  
  %% Get handlers
  subplot(2, 1, 1);
  xa_data = rang;
  ya_data = fx;
  xb_data = rang;
  yb_data = [fh zeros(1, span - len_h + 1)];
  hold on;
  pXH(1) = plot(xa_data, ya_data, 'linewidth', 4, 'color', 'red');
  pXH(2) = plot(xb_data, yb_data, 'linewidth', 4, 'color', 'blue');
  grid on;
  miny = floor(min([min(fx),min(fh)]));
  maxy = ceil(max([max(fx),max(fh)]));
  axisA = [-hspan, hspan, miny, maxy];
  axis(axisA);
  
  subplot(2, 1, 2);
  pY = plot(nan, 'linewidth', 4, 'color', 'green');
  grid on;
  miny = floor(min(total_conv));
  maxy = ceil(max(total_conv));
  axisB = [-hspan, hspan, miny, maxy];
  axis(axisB);
  
  %% y(t) -> 0
  set(pY,'XData', rang, 'YData', zeros(1, length(rang)));
  
  for i = 0:(span + 1);
    %% h(t)
    xb_data = rang;
    yb_data = [zeros(1, i) fh zeros(1, span - len_h - i + 1)];
    set(pXH(2), 'XData', xb_data, 'YData', yb_data);
    %% y(t)
	  if ((i + 1 >= initAni) && (i + 1 <= endAni))
	    convtot = dt .* fx .* yb_data;
      addSignals(1, idTotal) = sum(convtot);
	    idTotal++;
      set(pY,'XData', rang, 'YData', shift(addSignals, initI + zx))
    end
    %% Animation
    drawnow();
    pause(tani);
  end
end
