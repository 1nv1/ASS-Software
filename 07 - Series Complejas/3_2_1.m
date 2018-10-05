z = 0.5 + 0.5i;
loop = 4;
resA = 0;
resA = 1 / (z - 2);
printf("       z: (%f)+j(%f)\n\n", real(z), imag(z))
printf("Function: (%f)+j(%f)\n\n", real(resA), imag(resA))
for m = 1:loop
  len = 10**m;
  resB = 0;
  if(abs(z) < 2)
    for n = 0:len
      resB = (-1)*(1/(2**(n+1)))*(z**n) + resB;
    end
  end
  if(abs(z) > 2)
    for n = 0:len
      resB = (2**(n-1))*(1/(z**n)) + resB;
    end
  end
  printf("  Taylor: (%f)+j(%f) :: Ite: %f\n", real(resB), imag(resB), len)
  printf("   Error: %f%%\n", abs(((abs(resA) / abs(resB))*100) - 100))
  printf("\n")
end
