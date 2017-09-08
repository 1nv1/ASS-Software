format long;
arg_list = argv();
angle = str2num(arg_list{1}) * pi;
printf("    Nativo = %li\n", sin(angle));
n = 0:str2num(arg_list{2});
ser = (((-1).^n).*((angle.^((2.*n).+1))./factorial((2.*n).+1)));
printf("Por Taylor = %li\n", sum(ser));
