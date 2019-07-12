function p = predict_norm(x,mu,std)
%p = (log(2*pi) + log(std^2) + ((mu - x)^2)/(std^2))/(-2);
p = log((1/(std*sqrt(2*pi)))*exp(((x-mu)^2)/(-2*std^2)));
end

