% Buliga Theodor Ioan, 313 CA
function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaz? coeficien?ii de Interpolare Bicubic? pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
    M = [1, 0, 0, 0; 0, 0, 1, 0; -3, 3, -2, -1; 2, -2, 1, 1];
    INTRM = [f(y1, x1), f(y2, x1), Iy(y1, x1), Iy(y2, x1);
      f(y1, x2), f(y2, x2), Iy(y1, x2), Iy(y2, x2);
      Ix(y1, x1), Ix(y2, x1), Ixy(y1, x1), Ixy(y2, x1);
      Ix(y1, x2), Ix(y2, x2), Ixy(y1, x2), Ixy(y2, x2)];
      
    % TODO: Converte?te matricile intermediare la double.
    M = cast(M, "double");
    INTRM = cast(INTRM, "double");
    
    % TODO: Calculeaz? matricea final?.
    tM = M';
    A = M * INTRM * tM;
    
endfunction