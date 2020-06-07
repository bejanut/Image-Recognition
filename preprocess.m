function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  %se creaza calea completa catre directorul cu poze cu pisici si catre cel cu
  %poze fara pisici
  cat_dir = strcat(path_to_dataset,"/cats/*.jpg");
  not_cat_dir = strcat(path_to_dataset,"/not_cats/*.jpg");
  
  %se creaza celule cu denumirile pozelor din fiecare director
  cat_list = glob(cat_dir);
  not_cat_list = glob(not_cat_dir);
  
  %se stabileste cate linii va avea matricea X si vectorul y
  lines = length(cat_list) + length(not_cat_list);
  
  %se initializeaza matricea X si vectorul y
  X = zeros(lines, 3*count_bins);
  y = ones(lines,1);
  
  %se stabileste limita pana la care se afla pozele cu pisici si se creaza
  %vectorul y
  limit = length(cat_list);
  y(limit+1:lines,1) = (-1)*y(limit+1:lines,1);
  
  %se verifica timpul de histograma ce trebuie implementat si construieste
  %matricea X, denumirea pozelor fiind extrasa din celule intr-un sir de caractere
  %prin functia cell2mat
  if (strcmp(histogram,"RGB")) 
    
      for i = 1:length(cat_list)
        file = cell2mat(cat_list(i,1));
        sol = rgbHistogram(file,count_bins);
        X(i,:) = sol;
      endfor
      
      for i = 1:length(not_cat_list)
        file = cell2mat(not_cat_list(i,1));
        sol = rgbHistogram(file,count_bins);
        X(i+limit,:) = sol;
      endfor
      
  else
      
      for i = 1:length(cat_list)
        file = cell2mat(cat_list(i,1));
        sol = hsvHistogram(file,count_bins);
        X(i,:) = sol;
      endfor
      
      for i = 1:length(not_cat_list)
        file = cell2mat(not_cat_list(i,1));
        sol = hsvHistogram(file,count_bins);
        X(i+limit,:) = sol;
      endfor
  endif
endfunction
