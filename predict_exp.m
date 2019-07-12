function p = predict_exp(x,mu)
%p = log(mu)-(mu*x);
p = log((1/mu)*exp(-1*x/mu));
end

