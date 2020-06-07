function [h s v] = RGB_to_HSV(rgb)
  %se converteste matricea rgb la valori reale si se aduc valorile in intervalul
  %[0 1]
  rgb = double(rgb);
  rgb = rgb./255;
  [linii coloane dimensiune] = size(rgb);
  
  %se intializeaza h
  h = zeros(1,linii*coloane);
  
  %cele 3 matrici r, g si b sunt transformate in vectori
  r = rgb(:,:,1);
  r = r(:)';
  g = rgb(:,:,2);
  g = g(:)';
  b = rgb(:,:,3);
  b = b(:)';
  
  %se construieste o matrice cu 3 linii foarte lungi, calculandu-se un vector de
  %valori minime si unul de valori maxime
  aux = [r; g; b];
  c_min = min(aux);
  c_max = max(aux);
  delta = c_max - c_min;

  %se formeaza matricea v prin formarea unui matrice din vectorul c_max
  v = reshape(c_max,linii,coloane);
  
  %se calculeaza s prin initializarea lui cu valorile lui delta, ce vor fi
  %impartite la c_max, daca acest lucru va fi posibil(c_max(i,j) ~= 0)
  s = delta;
  pos_zeros = find(c_max > 0);
  s(1,pos_zeros) = s(1,pos_zeros) ./ c_max(1,pos_zeros);
  
  %se creaza matricea s
  s = reshape(s,linii,coloane);
  
  %este creat vectorul h corespunzator celor 3 cazuri posibile
  aux = find(r == c_max & delta > 0);
  h(1,aux) = 60*(mod(((g(aux)-b(aux))./delta(aux)),6));
  
  aux = find(g == c_max & delta > 0);
  h(1,aux) = 60*(((b(aux)-r(aux))./delta(aux)).+ 2);
  
  aux = find(b == c_max & delta > 0);
  h(1,aux) = 60*(((r(aux)-g(aux))./delta(aux)).+ 4);
  
  %se creaza matricea h si apoi valorile sale sunt aduse in intervalul [0 1]
  h = reshape(h,linii,coloane);
  h = h ./360;
endfunction
