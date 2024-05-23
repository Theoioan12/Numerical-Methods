function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  
  %prima ramura a functiei
  if (x >= 0 && x < val1) 
    y = 0;
  end
  
  %a doua ramura a functiei
  %a si b reprezinta valorile calculate
  %pentru ca functia sa fie continua
  if (x >= val1 && x <= val2)
    a = 1 / (val2 - val1);
    b = -val1 / (val2 - val1);
    y = a * x + b;
  end
  
  %cea de-a treia ramura a functiei
  if (x > val2 && x <= 1)
    y = 1;
  end
endfunction