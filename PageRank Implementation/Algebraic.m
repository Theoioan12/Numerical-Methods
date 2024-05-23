function newR = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  %deschid fisierul
  fid = fopen(nume, 'r');
  
  %primesc dimensiunea(nr de noduri)
  dim = fscanf(fid, '%d\n', 1);
  dim2 = dim;
  
  %initializez matricea grafului
  A = zeros(dim);
  v = zeros (dim, 1);
  
  %se iau pe rand nodurile
  while(dim) 
    
    %primesc numarul nodului
    nod = fscanf(fid, '%d', 1);
    
    %numarul de vecini
    vecini = fscanf(fid, '%d', 1);
    v(nod, 1) = vecini;
    
    %primesc indexul vecinilor si initializez matricea
    for i = 1: vecini 
      aux = fscanf(fid, '%d', 1);
      A(nod, aux) = 1;
    endfor
    
    %in cazul in care nodul e vecin cu el insusi, se va scadea
    v(nod, 1) = v(nod, 1) - A(nod, nod);
    
    A(nod, nod) = 0;
    dim--;
  endwhile
  
  
  %se inchide fisierul
  fclose(fid);
  
  %initializez matricea K
  K = zeros(dim2);
  
  %calculez matricea K
  for i = 1: dim2
    K(i, i) = v(i, 1);
      
  endfor
  
  %calculez matricea M
  M = (K ^ (-1) * A)';
  
  %aplic apoi Gram-Schmidt pt a afla Q si R
  [Q, R] = GS(eye(dim2) - d  * M);
  
  %si rezolv sistemul conform algoritmului SST
  [newR] = SST(R,Q' * (1 - d) / dim2 * ones(dim2, 1));
  
endfunction
