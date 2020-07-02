function percentage = Image_Recognition(histogram, count_bins, path_to_dataset, path_to_testset)
  [X, y] = preprocess(path_to_dataset, histogram, count_bins);
  w = learn(X, y, 0.01, 500);
  [percentage new_images new_y] = evaluate(path_to_testset, w, histogram, count_bins);
endfunction
