% Buliga Theodor Ioan, 313 CA
function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % TODO: Calculeaza derivata.
    [m n] = size(f);
    
    if (x - 1) == 0 || (x - n) == 0
      r = 0;
      return;
    else
      r = (f(y, x + 1) - f(y, x - 1)) / 2;
    endif

endfunction