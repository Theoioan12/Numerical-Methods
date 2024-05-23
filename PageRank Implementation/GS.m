function [Q R] = GS(A)
  [m , n] = size(A);
  Q = [];
  for k = 1:n
    q = A(1:m,k);
    temp = q;
    for j = 1:k-1
      S = sum(temp .* Q(:,j));
      q = q - S * Q(1:m,j);
    endfor
    q = q / norm(q);
    Q = [Q q];
  endfor
  R = Q'*A; 
endfunction