% Make a convolution animation
function convani(x, zx, h, zh, span, duration, delay)
  lx = length(x);
  lh = length(h);
  if(span < (lx+(2*lh)))
    disp("Error! span argument must be greater than length(x) + 2* length(h)")
    return
  endif
  tani = round((duration*1e6)/span);
  rang = round(-span/2):round(span/2);s
  tempx = x;
  temph = h;
  temph = fliplr(temph);
  temph(numel(1:(lx+lh))) = 0;
  tempx(numel(1:(lx+lh))) = 0;
  temph = shift(temph, lx);
  x(numel(rang)) = 0;
  h(numel(rang)) = 0;
  swap = 0;
  sleep(delay);
  initI = round(span/2)-zx-lh+1;
  endI = round(span/2)+(lx-zh);
  idTotal = 1;
  addSignals = zeros(1, length(rang));
  figure(1); clf;
  for i = 1:span+1;
    hold on;
    subplot(2,1,1);
    cla;
    pa = stem(rang.+(round(span/2)-zx), x, "color", "r", "linewidth", 5);
    pb = stem(rang.+i, h, "color", "b", "linewidth", 5);
    axis([round(-span/2),round(span/2)]);
    hold off;
    if((i>=initI)&&(i<=endI))
      temph = shift(temph,1);
      convtot = tempx .* temph;
      addSignals(1,idTotal) = sum(convtot);
      idTotal++;
      hold on;
      subplot(2,1,2);
      cla;
      stem(rang, shift(addSignals,initI+zh), "color", "g", "linewidth", 5);
      axis([round(-span/2),round(span/2)]);
      hold off;
    endif
    usleep(tani);
  endfor
  hold off;
endfunction
