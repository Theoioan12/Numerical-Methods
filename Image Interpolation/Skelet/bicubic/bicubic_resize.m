% Buliga Theodor Ioan, 313 CA
function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Se scaleaza imaginea folosind algoritmul de Interpolare Bicubic?.
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q.
    % =========================================================================

    [m n nr_colors] = size(I);

    % TODO: Initializeaza matricea finala drept o matrice nula.
    I = cast(I, "double");
    R = zeros(p, q);
    
    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % respectiv s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul [0, n - 1]!


    % TODO: Calculeaza factorii de scalare
    % Obs: Daca se lucreaza cu indici in intervalul [0, n - 1], ultimul pixel
    % al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % TODO: Defineste matricea de transformare pentru redimensionare.
     T = [s_x, 0; 0, s_y];
    
    % TODO: Calculeaza inversa transformarii.
    invT = inv(T);
    
    % TODO: Precalculeaza derivatele.
    [Ix, Iy, Ixy] = precalc_d(I);

    % Parcurge fiecare pixel din imagine.
    for y = 0 : p - 1
        for x = 0 : q - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            aux = [x, y]';
            sol = invT * aux;
            
            xp = sol(1);
            yp = sol(2);

            % TODO: Trece (xp, yp) din sistemul de coordonate 0, n - 1 in
            % sistemul de coordonate 1, n pentru a aplica interpolarea.
            xp += 1;
            yp += 1;
            
            % TODO: Gaseste cele 4 puncte ce inconjoara punctul x, y
            x1 = floor(xp);
            y1 = floor(yp);
            
            x2 = x1 + 1;
            y2 = y1 + 1;
            
            % in cazul in care y se afla pe ultima linie, y2 nu trebuie sa iasa
            % din matrice 
            if y1 == m
              
              y1 = m - 1;
              y2 = m;
              
            endif
    
            % cazul in care x se afla pe ultima coloana
            if x1 == n
              
              x1 = n - 1;
              x2 = n;
              
            endif
            
            % TODO: Calculeaza coeficientii de interpolare A.
            A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);

            % TODO: Trece coordonatele (xp, yp) in patratul unitate, scazand (x1, y1).
            xp -= x1;
            yp -= y1;
            
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            % Obs: Pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n.
            yT = [1, yp, yp ^ 2, yp ^ 3]';
            R(y + 1, x + 1) = [1, xp, xp^2, xp^3] * A * yT;

        endfor
    endfor

    % TODO: Transforma matricea rezultata �n uint8 pentru a fi o imagine valida.
    R = cast(R, "uint8");
endfunction





