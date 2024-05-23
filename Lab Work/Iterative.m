function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  %deschid fisierul
  fid = fopen(nume, 'r');
  
  %primesc dimensiunea(nr de noduri)
  dim = fscanf(fid, '%d\n', 1);
  dim2 = dim;
  
  %initializez matricea grafului
  A = zeros(dim);
  
  %initializez un vector in care voi pastra
  %numarul de vecini pentru fiecare element
  v = zeros (dim, 1);
  
  %se iau pe rand nodurile
  while(dim) 
    
    %primesc numarul nodului
    nod = fscanf(fid, '%d', 1);
    
    %primesc numarul de vecini si
    %pastrez valoarea in vectorul de vecini
    nrvecini = fscanf(fid, '%d', 1);
    v(nod, 1) = nrvecini;
    
    %primesc indexul vecinilor si
    %incep sa initializez matricea
    for i = 1: nrvecini 
      aux = fscanf(fid, '%d', 1);
      A(nod, aux) = 1;
    endfor
    
    %in cazul in care nodul e vecin cu el insusi, se va scadea
    %cu 1 din valoarea de la indexul respectiv
    v(nod, 1) = v(nod, 1) - A(nod, nod);
    
    %in cazul in care este vecin cu el
    %ma asigur ca elementul de pe diagonala principala ramane 0
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
  
  %initializez vectorul R(t) si R(t + 1)
  newR = ones(dim2, 1) * (1 / dim2);
  R = zeros(dim2, 1);
  
  %iterez pana cand se depaseste toleranta
  while (norm(newR - R) > eps)
    R = newR;
    
    %calculez noul R conform formulei
    newR = ((1 - d) / dim2) * 1 + d * M * R;
  endwhile

endfunction