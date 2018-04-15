                                % Make a convolution animation
function conv_dis_ani(x, zx, h, zh, duration = 5, delay = 0)
  graphics_toolkit("gnuplot");
  lx = length(x);
  lh = length(h);
  if((zx<0)||(zx>lx))
    disp("Error! Element zero of X is out of range.")
    return
  endif
  if((zh<0)||(zh>lh))
    disp("Error! Element zero of H is out of range.")
    return
  endif
  %% Span calculation
  span = (lx * 2 + (2 * lh));
  if(duration < 0)
    disp("Error! Duration must be greater than 0.")
    return
  endif
  tmpConv = conv(x, h);
  tani = round(duration/span);
  rang = round(-span/2):round(span/2);
  tempx = x;
  temph = h;
  temph = fliplr(temph);
  temph(numel(1:(lx+lh))) = 0;
  tempx(numel(1:(lx+lh))) = 0;
  temph = shift(temph, lx);
  % Flip H
  h = fliplr(h);
  x(numel(rang)) = 0;
  h(numel(rang)) = 0;
  swap = 0;
  %% Initial delay, 0 by default
  sleep(delay);
  initI = round(span / 2) - zx - zh;
  endI = round(span / 2) + lx + lh - zx - zh - 1;
  initAni = round(span / 2) - lx + zx;
  endAni = round(span / 2) + lh - zh + zx + 1;
  idTotal = 1;
  addSignals = zeros(1, length(rang));
  %% Chart clean
  figure(1);
  clf;
  %% Axis configuration for plots interaction
  axisA = [round(-span / 2), round(span/2), floor(min([min(x),min(h)]) / 5) * 5, ceil(max([max(x),max(h)]) / 5) * 5];
  %% We can get the second axis configuration directly
  axisB = [round(-span / 2), round(span / 2), floor(min(tmpConv) / 5) * 5, ceil(max(tmpConv) / 5) * 5];
for i = 0:(span + 1);
    try;
      %% Work on signal and system interaction
	    figure(1);
	    hold on;
	    subplot(2, 1, 1);
	    cla;
	    pa = stem(rang .+ (round(span / 2) - zx), x, "color", "r", "linewidth", 5, "marker", ".");
	    pb = stem(rang .+ i, h, "color", "b", "linewidth", 5, "marker", ".");
	    axis(axisA);
      grid on;
	    hold off;
      %% Work on convolution animation
	    if (i == 1)
	      subplot(2, 1, 2);
	      stem(rang, zeros(1, numel(rang)), "marker", ".");
	      axis(axisB);
        grid on;
	    elseif((i + 1 >= initAni) && (i + 1 <= endAni))
        temph = shift(temph, 1);
	      convtot = tempx .* temph;
        addSignals(1, idTotal) = sum(convtot);
	      idTotal++;
	      hold on;
	      subplot(2, 1, 2);
	      cla;
	      stem(rang, shift(addSignals, initI + zx), "color", "g", "linewidth", 5, "marker", ".");
	      %%axis(axisB);
        grid on;
	      hold off;
	    endif
      %% Little sleep for better plot performance and animation
      pause(tani);
	  end
  endfor
endfunction
