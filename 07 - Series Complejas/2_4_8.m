z = 0.3223 + 0.112i;
loop = 6;
resA = 0;
resA = log(1 + z);
printf("       z: (%f)+j(%f)\n\n", real(z), imag(z))
printf("Function: (%f)+j(%f)\n\n", real(resA), imag(resA))
for m = 1:loop
  len = 10**m;
  # Este sería el modelado tradicional usando una estructura FOR
  time1 = time();
  resB = 0;
  for n = 0:len
    resB = (((-1)** n)*(z**(n + 1))/(n + 1)) + resB;
  end
  time2 = time();
  timeElapsed = (time2 - time1) * 1000;
  printf("  Taylor: (%f)+j(%f) :: Ite: %d :: mSec: %f\n", real(resB), imag(resB), len, timeElapsed);
  # La forma de modelar el anterior cálculo sería la siguiente
  time1 = time();
  n = [0:len];
  resC = sum(((-1).**n).*(z.**(n + 1))./(n + 1));
  time2 = time();
  timeElapsed = (time2 - time1) * 1000;
  printf("  Taylor: (%f)+j(%f) :: Ite: %d :: mSec: %f\n", real(resC), imag(resC), len, timeElapsed);
  printf("   Error: %f%%\n", abs(((abs(resA) / abs(resB))*100) - 100))
  printf("\n")
end
