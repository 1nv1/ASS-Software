function conv_ani(fx, zx, fh, zh, dt = 0.5, duration = 5, delay = 0)
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
  len_r = length(rang);
  %% Detect imperfection
  cion = mod(len_r, 2);
  if (cion) cion = 1; end

  %% Complete with zeros
  init = hspan - zx + cion;
  zi = zeros(1, init);
  zq = zeros(1, span - init - len_x + cion);
  fx = [zi fx zq];

  % Flip H
  fh = fliplr(fh);

  if (dt == 1)
    initI = hspan - zx - zh - (cion * 2);
  else
    initI = hspan - zx - zh - (round(cion / dt) * 2);
  end
  endI = hspan + len_x + len_h - zx - zh - 1;
  initAni = hspan - len_x - zx + 1;
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
  if (dt == 1)
    pXH(1) = stem(xa_data, ya_data, 'linewidth', 4, 'color', 'red');
    pXH(2) = stem(xb_data, yb_data, 'linewidth', 4, 'color', 'blue');
  else
    %pXH(1) = plot(xa_data, ya_data, 'linewidth', 4, 'color', 'red');
    pXH(1) = area(xa_data, ya_data, "FaceColor", "red");
    set(get(pXH(1), 'children'), 'facealpha', 0.5);
    %pXH(2) = plot(xb_data, yb_data, 'linewidth', 4, 'color', 'blue');
    pXH(2) = area(xb_data, yb_data, "FaceColor", "blue");
    set(get(pXH(2), 'children'), 'facealpha', 0.5);
  end
  grid on;
  miny = floor(min([min(fx),min(fh)]));
  if (miny > 0) miny = 0; end
  maxy = ceil(max([max(fx),max(fh)]));
  if (maxy < 0) maxy = 0; end
  axisA = [-hspan, hspan, miny, maxy];
  axis(axisA);

  subplot(2, 1, 2);
  hold on;
  if (dt == 1)
    pY(1) = stem(nan, 'linewidth', 4, 'color', 'magenta');
  else
    pY(1) = plot(nan, 'linewidth', 4, 'color', 'magenta');
  end
  %% pY(2) = stem(nan, 'linewidth', 8, 'color', 'black');
  grid on;
  miny = floor(min(total_conv));
  if (miny > 0) miny = 0; end
  maxy = ceil(max(total_conv));
  if (maxy < 0) miny = 0; end
  axisB = [-hspan, hspan, miny, maxy];
  axis(axisB);

  %% y(t) -> 0
  set(pY(1),'XData', rang, 'YData', zeros(1, length(rang)));

  for i = 0:(span - len_h);
    %% h(t)
    xb_data = rang;
    yb_data = [zeros(1, i) fh zeros(1, span - len_h - i + 1)];
    set(pXH(2), 'XData', xb_data, 'YData', yb_data);
    %% y(t)
	  if ((i >= initAni) && (i <= endAni))
	    convtot = dt .* fx .* yb_data;
      addSignals(1, idTotal) = sum(convtot);
	    idTotal++;
      yt = shift(addSignals, initI + zx);
      set(pY(1),'XData', rang, 'YData', yt)
    end
    %% Animation
    drawnow();
    pause(tani);
  end
end
