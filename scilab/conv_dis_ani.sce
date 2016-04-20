// Make a convolution animation
function conv_dis_ani(x, zx, h, zh, span, duration, delay)
  lx = length(x);
  lh = length(h);
  if(span < (lx+(2*lh)))
    disp("Error! span argument must be greater than length(x) + 2* length(h)")
    exit
  end
  tani = round((duration*1e6)/span);
  rang = round(-span/2):round(span/2);
  tempx = x;
  temph = h;
  temph = flipdim(temph, 1);
  numel = size(1:(lx+lh));
  temph(numel(2)) = 0;
  tempx(numel(2)) = 0;
  temph = cshift(temph, [0 lx]);
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
    pa = stem(rang+(round(span/2)-zx), x, "color", "r", "linewidth", 5);
    pb = stem(rang+i, h, "color", "b", "linewidth", 5);
    axis([round(-span/2),round(span/2)]);
    hold off;
    if((i>=initI)&(i<=endI))
      temph = cshift(temph,[0 1]);
      convtot = tempx .* temph;
      addSignals(1,idTotal) = sum(convtot);
      idTotal = idTotal + 1;
      hold on;
      subplot(2,1,2);
      cla;
      stem(rang, cshift(addSignals,[0 initI+zh]), "color", "g", "linewidth", 5);
      axis([round(-span/2),round(span/2)]);
      hold off;
    end
    usleep(tani);
  end
  hold off;
endfunction
