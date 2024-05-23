function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
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
  
  val1 = fscanf(fid, '%f', 1);
  val2 = fscanf(fid, '%f', 1);
  
  %se inchide fisierul
  fclose(fid);
  
  %pregatesc fisierul in care voi
  %salva datele de iesire
  otf = [nume ".out"];
  out = fopen(otf, 'w');
  
  %afisez numarul de noduri
  fprintf(out, "%d\n", dim2);
  
  %calculez primul vector PageRank prin varianta Iterative
  %si il afisez
  R1 = Iterative(nume, d, eps);
  fprintf(out, "%1.6f\n", R1);
  fprintf(out, "\n");
  
  %calculez al doilea vector PageRank prin varianta Algebraic
  %si il afisez
  R2 = Algebraic(nume, d);
  fprintf(out, "%1.6f\n", R2);
  fprintf(out, "\n");
  
  %sortez vectorul PageRank descrescator si
  %il salvez
  [R3, i] = sort(R2, "descend");
  
  %afisarea element cu element
  for j = 1 : dim2
    
    %calculez gradul de apartenenta
    %pentru fiecare element
    y = Apartenenta(R3(j), val1, val2);
    
    %afisarea propriu-zisa
    fprintf(out, "%d %d %1.6f\n", j, i(j), y);
  endfor
  
  %inchid fisierul de iesire
  fclose(out);
  
 endfunction 
