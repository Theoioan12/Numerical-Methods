% Buliga Theodor Ioan, 313 CA
function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % TODO: Calculeaza derivata.
    [m n] = size(f);
    
    if (y - 1) == 0 || (y - m) == 0
      r = 0;
      return;
    else
      r = (f(y + 1, x) - f(y - 1, x)) / 2;
    endif
endfunction