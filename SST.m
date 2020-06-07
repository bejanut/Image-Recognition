function [x] = SST(A, b)
    [l c] = size(A);
    %se reduce matricea A la o matrice patratica
    A = A(1:c,1:c);
    
    %valoarea ultimei componente a lui x se afla in coltul din stanga, jos.
    x(c,1) = b(c,1)/A(c,c);
    
    %calculeaza componenetele lui x, urcand pe randurile matricei si folosindu-ne
    %de valorile calculate precedent
    for i = c:-1:1
      x(i,1)=(b(i,1) - A(i,i+1:c) * x(i+1:c,1)) / A(i,i);
    endfor
end
    