// Make a convolution animation
function conv_dis_ani(x, zx, h, zh, span, duration, delay)
  lx = length(x);
  lh = length(h);
  if(span < (lx+(2*lh)))
    disp("Error! span argument must be greater than length(x) + 2* length(h)")
    exit
  end
  tani = round((duration*1e3)/span);
  rang = round(-span/2):round(span/2);
  tempx = x;
  temph = h;
  temph = flipdim(temph, 2);
  numel = size(1:(lx+lh));
  temph(numel(2)) = 0;
  tempx(numel(2)) = 0;
  temph = cshift(temph, [0 lx]);
  numel = size(rang);
  x(numel(2)) = 0;
  h(numel(2)) = 0;
  if(delay>0)
      sleep(delay*1e3);
  end
  initI = round(span/2)-zx-lh+1;
  endI = round(span/2)+(lx-zh);
  idTotal = 1;
  addSignals = zeros(1, length(rang));
  for i = 1:span+1;
    clf;
    set(gca(),"auto_clear","off");
    subplot(2,1,1);
    if(max(x)>=max(h)) 
      Y= max(x)
    else
      Y = max(h)
    end
    if(min(x)<=min(h))
      y = min(x)
    else
      y = min(h)
    end
    pa = plot2d3("gnn", rang+(round(span/2)-zx), x, rect=[round(-span/2),y,round(span/2),Y]);
    pb = plot2d3("gnn", rang+i, h, rect=[round(-span/2),y,round(span/2),Y]);
    set(gca(),"auto_clear","on")
    if((i>=initI)&(i<=endI))
      temph = cshift(temph,[0 1]);
      convtot = tempx .* temph;
      addSignals(idTotal) = sum(convtot);
      idTotal = idTotal + 1;
    end
    subplot(2,1,2);
    plot2d3("gnn", rang, cshift(addSignals,[0 initI+zh]), rect=[round(-span/2),min(addSignals),round(span/2),max(addSignals)]);
    sleep(tani);
  end
endfunction
