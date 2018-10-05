z = 1 + 1i;
loop = 4;
resA = 0;
resA = (z + 1) / (z - 1);
printf("       z: (%f)+j(%f)\n\n", real(z), imag(z))
printf("Function: (%f)+j(%f)\n\n", real(resA), imag(resA))
for m = 1:loop
  len = 10**m;
  if(abs(z) < 1)
    resB = -1;
    for n = 1:len
      resB = (-1)*(2*(z**n)) + resB;
    end
  end
  if(abs(z) > 1)
    resB = 1;
    for n = 1:len
      resB = (2 / (z**n)) + resB;
    end
  end
  printf("  Taylor: (%f)+j(%f) :: Ite: %f\n", real(resB), imag(resB), len)
  printf("   Error: %f%%\n", abs(((abs(resA) / abs(resB))*100) - 100))
  printf("\n")
end
