function [percentage new_images new_y] = evaluate(path_to_testset, w, histogram, count_bins)
  
 %Ne folosim de functia preprocess pentru a genera matricea de histograme
  %pentru pozele ce trebuie testate
  [X y] = preprocess(path_to_testset,histogram, count_bins);
  Copy = X;
  [l c] = size(X);
  
  %se scaleaza valorile lui X si se adauga o coloana de valori de 1
  X = (X .- mean(X))./std(X);
  X(:,c+1) = ones(l,1);
  
 %se creaza un vector test_y, care ne arata cum ar fi evaluate pozele cu
  %ajutorul vectorului w
  test_y = sign(X*w);
  comparison = y .* test_y;
  comparison(:,2) = 1:size(comparison,1);
  comparison = comparison(comparison(:,1) > 0, :);
  new_images = Copy(comparison(:,2),:);
  new_y = y(comparison(:,2),:);
  
  %se insumeaza valorile corecte si se calculeaza procentul
  succesfull = size(comparison,1);
  percentage = succesfull / l; 
endfunction