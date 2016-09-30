% Make a convolution animation
function conv_dis_ani(x, zx, h, zh, span, duration, delay)
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
  if(span < (lx+(2*lh)))
    disp("Error! span argument must be greater than length(x) + 2* length(h)")
    return
  endif
  if(duration>0)
    tani = round((duration*1e6)/span);
  endif
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
  sleep(delay);
  initI = round(span/2)-zx-lh+1;
  endI = round(span/2)+(lx-zx);
  idTotal = 1;
  addSignals = zeros(1, length(rang));
  figure(1); clf;
  for i = 0:span+1;
	try;
	figure(1);
	hold on;
	subplot(2,1,1);
	cla;
	pa = stem(rang.+(round(span/2)-zx), x, "color", "r", "linewidth", 5);
	pb = stem(rang.+i, h, "color", "b", "linewidth", 5);
	axis([round(-span/2),round(span/2),min([min(x),min(h)]),max([max(x),max(h)])]);
	hold off;
	if(i==1)
	  subplot(2,1,2);
	  stem(rang, zeros(1, numel(rang)));
	  axis([round(-span/2),round(span/2),min([min(x),min(h)]),max([max(x),max(h)])]);
	endif
	if((i>=initI)&&(i<=endI))
	  temph = shift(temph,1);
	  convtot = tempx .* temph;
	  addSignals(1,idTotal) = sum(convtot);
	  idTotal++;
	  hold on;
	  subplot(2,1,2);
	  cla;
	  stem(rang, shift(addSignals,initI+zx), "color", "g", "linewidth", 5);
	  axis([round(-span/2),round(span/2),min(addSignals),max(addSignals)]);
	  hold off;
	endif
	if(duration>0)
	  usleep(tani);
	else
	  figure(1);
	  ##usleep(200000);
	  waitforbuttonpress();
	endif
	end
  endfor
  hold off;
endfunction
