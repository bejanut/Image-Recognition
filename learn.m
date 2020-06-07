function [w] = learn(X, y, lr, epochs)
  [l c] = size(X);
  
  %se scaleaza valorile lui X si se adauga o coloana de valori de 1
  X = (X .- mean(X))./std(X);
  X(:,c+1) = ones(l,1);
  
  %se creaza w cu valori aleatoare
  w = rand(c+1 ,1) .* randi([-200 200],c+1,1) ./2000;
  
  %se implementeaza algoritmul prezentat in enunt
  for epoch = 1:epochs
    %se aleg 64 de coloane aleatoare si se sorteaza
    r_list = randi([1 l],64,1);
    sort(r_list);
    
    %se aleg X_batch si y_batch corespunzator coloanelor aleatoare
    X_batch = X(r_list,1:c+1);
    y_batch = y(r_list,1);
    
    %se calculeaza valorile lui w
    for i = 1 : c+1
      w(i,1) = w(i,1) .- ((lr/l)*(sum(X_batch*w)-y_batch'*X_batch(:,i)));
    endfor
  endfor
endfunction
