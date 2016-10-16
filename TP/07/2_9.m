for z = 0.5:0.5:3;
  printf("-----------");  
  fz = (1/(z*(z-2)*(z-3)));
  printf("La funcion original en z = %f resulta en %f\n", z, fz);
  printf("Vemos los resultados segun diferentes cantidad\n");
  for j=10:20:100
    n = 0:j;
    fzA = (1/(6*z));
    fzB = ((z).^(n))./((2).^(n+2));
    fzC = -((z).^(n))./((3).^(n+2));
    fz = sum(fzA) + sum(fzB) + sum(fzC);
    printf("La serie de la funcion en z = %f resulta en %f con %u elementos\n", z, fz, j);
  end
end