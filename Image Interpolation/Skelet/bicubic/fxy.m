% Buliga Theodor Ioan, 313 CA
function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    [m n] = size(f);
    
    if (x - 1) == 0 || (x - n) == 0 || (y - 1) == 0 || (y - m) == 0
      r = 0;
      return;
    else
      r = (f(y - 1, x - 1) + f(y + 1, x + 1) - f(y - 1, x + 1) - f(y + 1, x - 1)) / 4;
    endif
endfunction