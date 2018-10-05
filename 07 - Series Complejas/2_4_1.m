z = 0.0001 + 0.999i;
# z = 0.5 + 0.5i
# z + 1 = 1.5 + 0.5i
# 1 / (1.5 + 0.5i) = (1.5 - 0.5i) / ((1.5 + 0.5i)*(1.5 - 0.5i))
# 1 / (1.5 + 0.5i) = (1.5 - 0.5i) / (2.5)
# 1 / (1.5 + 0.5i) = (3/5) - (1/5)i
loop = 4;
resA = 0;
resA = 1 / (1 + z);
printf("       z: (%f)+j(%f)\n\n", real(z), imag(z))
printf("Function: (%f)+j(%f)\n\n", real(resA), imag(resA))
for m = 1:loop
  len = 10**m;
  resB = 0;
  for n = 0:len
    resB = ((-z)**n) + resB;
  end
  printf("  Taylor: (%f)+j(%f) :: Ite: %f\n", real(resB), imag(resB), len)
  printf("   Error: %f%%\n", abs(((abs(resA) / abs(resB))*100) - 100))
  printf("\n")
end
