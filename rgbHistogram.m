function [sol] = rgbHistogram(path_to_image, count_bins)
  
  %setam marginile pentru histograma
  edges = 0:count_bins;
  edges = edges.*(256/count_bins);
  
  %initializam vectorul cu solutia hostogramei
  sol = zeros(1, 3*count_bins);
  image = imread(path_to_image);
  
  %se creaza cu ajutorul functiei histc o 3 matrice, unite intr-n cub, care au
  %pe linii valorile cautate impartite la linii 
  huge = histc(image,edges);
  
  %se creaza vectorul cautat
  for j = 1:count_bins
    sol(j) = sum(huge(j,:,1)); 
    sol(j+count_bins) = sum(huge(j,:,2)); 
    sol(j+2*count_bins) = sum(huge(j,:,3)); 
  endfor
end