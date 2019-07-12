function histogram_analysis(vect)
% generates a histogram with 20 bins using a vector of data
nbins = 20;
[n,xout] = hist(vect,nbins);
bar(xout,n);
end