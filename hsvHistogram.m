function [sol] = hsvHistogram(path_to_image, count_bins)
  
  %setam marginile pentru histograma
  edges = 0:count_bins;
  edges = edges./count_bins;
  edges = 1.01*edges;
  
  %initializam vectorul cu solutia hostogramei
  sol = zeros(1,3*count_bins);
  image = imread(path_to_image);
  
  %construim cubul hsv cu valorile h,s,v, obtinute din cubul rgb
  [h s v] = RGB_to_HSV (image);
  hsv(:,:,1)=h;
  hsv(:,:,2)=s;
  hsv(:,:,3)=v;
  
  %se creaza cu ajutorul functiei histc o 3 matrice, unite intr-n cub, care au
  %pe linii valorile cautate impartite la linii 
  huge = histc(hsv,edges);
  
  %se creaza vectorul cautat
    for j = 1:count_bins
      sol(j) = sum(huge(j,:,1)); 
      sol(j+count_bins) = sum(huge(j,:,2)); 
      sol(j+2*count_bins) = sum(huge(j,:,3)); 
    endfor
end