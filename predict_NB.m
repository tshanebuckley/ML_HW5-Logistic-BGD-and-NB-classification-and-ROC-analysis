function [predicted] = predict_NB(x,attributes_1,attributes_0)
% predicts class for pima dataset of a single instance of characteristics
x = x';
n = size(x,1);
n_1 = size(attributes_1,1);
n_0 = size(attributes_0,1);
mu_1 = 0;
std_1 = 0;
mu_0 = 0;
std_0 = 0;
% calculate g_1 and g_0
% log Bernoulli prior
g_1 = log(n_1/n);
g_0 = log(n_0/n);
% attribute 1
[mu_1] = expfit(attributes_1(:,1));
[mu_0] = expfit(attributes_0(:,1));
g_1 = g_1 + predict_exp(x(1),mu_1);
g_0 = g_0 + predict_exp(x(1),mu_0);
% attribute 2
[mu_1,std_1] = normfit(attributes_1(:,2));
[mu_0,std_0] = normfit(attributes_0(:,2));
g_1 = g_1 + predict_norm(x(2),mu_1,std_1);
g_0 = g_0 + predict_norm(x(2),mu_0,std_0);
% attribute 3
[mu_1,std_1] = normfit(attributes_1(:,3));
[mu_0,std_0] = normfit(attributes_0(:,3));
g_1 = g_1 + predict_norm(x(3),mu_1,std_1);
g_0 = g_0 + predict_norm(x(3),mu_0,std_0);
% attribute 4
[mu_1,std_1] = normfit(attributes_1(:,4));
[mu_0,std_0] = normfit(attributes_0(:,4));
g_1 = g_1 + predict_norm(x(4),mu_1,std_1);
g_0 = g_0 + predict_norm(x(4),mu_0,std_0);
% attribute 5
[mu_1] = expfit(attributes_1(:,5));
[mu_0] = expfit(attributes_0(:,5));
g_1 = g_1 + predict_exp(x(5),mu_1);
g_0 = g_0 + predict_exp(x(5),mu_0);
% attribute 6
[mu_1,std_1] = normfit(attributes_1(:,6));
[mu_0,std_0] = normfit(attributes_0(:,6));
g_1 = g_1 + predict_norm(x(6),mu_1,std_1);
g_0 = g_0 + predict_norm(x(6),mu_0,std_0);
% attribute 7
[mu_1] = expfit(attributes_1(:,7));
[mu_0] = expfit(attributes_0(:,7));
g_1 = g_1 + predict_exp(x(7),mu_1);
g_0 = g_0 + predict_exp(x(7),mu_0);
% attribute 8
[mu_1] = expfit(attributes_1(:,8));
[mu_0] = expfit(attributes_0(:,8));
g_1 = g_1 + predict_exp(x(8),mu_1);
%g_1
%g_0
% classify as 1 or 0
if g_1 >= g_0
    predicted = 1;
else
    predicted = 0;
end

