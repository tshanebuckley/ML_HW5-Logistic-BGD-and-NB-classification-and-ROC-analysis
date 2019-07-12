% import training data
train = importdata('pima_train.txt');
% identify vector of target attributes
train_targets = train(:,9);
% split set based on binary target attribute
[train_1,train_0] = binary_split(train,train_targets);
% gather mu for attributes 1, 5, 7, and 8 of both classes
% attribute 1
[exp_1_1_muhat, exp_1_1_muci] = expfit(train_1(:,1))
[exp_0_1_muhat, exp_0_1_muci] = expfit(train_0(:,1))
% attribute 5
[exp_1_5_muhat, exp_1_5_muci] = expfit(train_1(:,5))
[exp_0_5_muhat, exp_0_5_muci] = expfit(train_0(:,5))
% attribute 7
[exp_1_7_muhat, exp_1_7_muci] = expfit(train_1(:,7))
[exp_0_7_muhat, exp_0_7_muci] = expfit(train_0(:,7))
% attribute 8
[exp_1_8_muhat, exp_1_8_muci] = expfit(train_1(:,8))
[exp_0_8_muhat, exp_0_8_muci] = expfit(train_0(:,8))
% gather mu and std for attributes 2, 3, 4, and 6 of both classes
% attribute 2
[norm_1_2_mu,norm_1_2_sigma,muci_1_2,sci_1_2] = normfit(train_1(:,2))
[norm_0_2_mu,norm_0_2_sigma,muci_0_2,sci_0_2] = normfit(train_0(:,2))
% attribute 3
[norm_1_3_mu,norm_1_3_sigma,muci_1_3,sci_1_3] = normfit(train_1(:,3))
[norm_0_3_mu,norm_0_3_sigma,muci_0_3,sci_0_3] = normfit(train_0(:,3))
% attribute 4
[norm_1_4_mu,norm_1_4_sigma,muci_1_4,sci_1_4] = normfit(train_1(:,4))
[norm_0_4_mu,norm_0_4_sigma,muci_0_4,sci_0_4] = normfit(train_0(:,4))
% attribute 6
[norm_1_6_mu,norm_1_6_sigma,muci_1_6,sci_1_6] = normfit(train_1(:,6))
[norm_0_6_mu,norm_0_6_sigma,muci_0_6,sci_0_6] = normfit(train_0(:,6))