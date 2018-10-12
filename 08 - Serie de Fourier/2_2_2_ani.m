graphics_toolkit("gnuplot");
figure(1);
t = 0;
inc = 0;
for n = 1:(24/0.01)
  inc = inc + 0.01;
  t = [t inc];
  fz = cos(t.*pi./3) + (sin(t.*pi./4)).*i;
  fr = cos(t.*pi./3) + (sin(t.*pi./4));
  pause(0.01);
  if(mod(n, 40) == 0)
    clf;
    subplot(2, 1, 1);
    hold on;
    plot(real(fz), imag(fz), 'linewidth', 2, 'color', 'red');
    plot(real(fz(length(fz))), imag(fz(length(fz))), 'o');
    axis([-2 2 -2 2]);
    subplot(2, 1, 2);
    hold on;
    plot(t, fr, 'linewidth', 2, 'color', 'blue');
    plot(t(length(t)), fr(length(fr)), 'o');
    axis([0 24 -2 2]);
  endif
end
k = waitforbuttonpress();
