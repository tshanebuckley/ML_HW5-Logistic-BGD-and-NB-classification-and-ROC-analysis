function F = Log_predict(W,X)
% predicts the results of the linear regression (F) from the weights (W) 
% and the given attributes (X)
F = [];
for row = 1:1:size(X,1)
    x = X(row,:)';
    f = 1/(1 + exp(-(W'*x))); 
    %{
    if f >= 0.5
        f = 1;
    end
    %{
    if f ~= 0
        f = 1;
    end
    %}
    %}
    F = [F;f];
end
end

