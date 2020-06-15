function draw_line(a, b)
  % Get zets
  z1.x = real(a);
  z1.y = imag(a);
  z2.x = real(b);
  z2.y = imag(b);
  % Get axis
  x.min = min([z1.x, z2.x]);
  x.max = max([z1.x, z2.x]);
  y.min = min([z1.y, z2.y]);
  y.max = max([z1.y, z2.y]);
  % Axis
  ex = max([x.min, x.max, y.min, y.max]);
  ex = abs(ex)*2;
  x.min = x.min - ex;
  x.max = x.max + ex;
  y.min = y.min - ex;
  y.max = y.max + ex;
  % Parameters
  p.d = 0.1;
  p.dr = ex * 0.2;
  % Line
  if (z1.y != 0) && (z2.y != 0)
    line.x = [x.min:p.d:x.max];
    line.y = -1 * ((z1.x**2 - z2.x**2) + (z1.y**2 - z2.y**2) + line.x * (2 * z2.x - 2 * z1.x));
    line.y = line.y / (2 * z2.y - 2 * z1.y);
  endif
  % Charts
  figure(1);
  clf;
  hold on;
  plot([z1.x z2.x], [z1.y z2.y], 'o--', 'linewidth', 1, 'color', 'black');
  if (z1.y == 0) && (z2.y == 0)
    xx = linspace(0, 0, 100);
    yy = linspace(y.min, y.max, 100);
    plot(xx, yy, 'linewidth', 4, 'color', 'green');
  else
    plot(line.x, line.y, 'linewidth', 4, 'color', 'green');
  endif
  text(z1.x + p.d, z1.y + p.d, strcat('\fontsize{24}a'));
  text(z2.x + p.d, z2.y + p.d, strcat('\fontsize{24}b'));
  axis([x.min, x.max, y.min, y.max]);
  xlabel(strcat('\fontsize{18}Re'));
  ylabel(strcat('\fontsize{18}Im'));
  grid on;
  % Circles
  t = linspace(0,2*pi,50)';
  for r = p.dr:p.dr:ex
    circsx = r .* cos(t) + z1.x;
    circsy = r .* sin(t) + z1.y;
    plot(circsx, circsy, '--', 'linewidth', 1, 'color', 'red');
  endfor
  for r = p.dr:p.dr:ex
    circsx = r .* cos(t) + z2.x;
    circsy = r .* sin(t) + z2.y;
    plot(circsx, circsy, '--', 'linewidth', 1, 'color', 'blue');
  endfor
  hold off;
endfunction
