z = 0.0001 + 0.999i;
loop = 4;
resA = 0;
resA = log(1 + z);
printf("       z: (%f)+j(%f)\n\n", real(z), imag(z))
printf("Function: (%f)+j(%f)\n\n", real(resA), imag(resA))
for m = 1:loop
  len = 10**m;
  resB = 0;
  for n = 0:len
    resB = (((-1)** n)*(z**(n + 1))/(n + 1)) + resB;
  end
  printf("  Taylor: (%f)+j(%f) :: Ite: %f\n", real(resB), imag(resB), len)
  printf("   Error: %f%%\n", abs(((abs(resA) / abs(resB))*100) - 100))
  printf("\n")
end
