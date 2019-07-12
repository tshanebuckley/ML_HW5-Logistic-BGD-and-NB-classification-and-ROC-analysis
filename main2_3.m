% import training data
train = importdata('pima_train.txt');
% identify vector of target attributes
train_targets = train(:,9);
% identity vector of train attributes
train = train(:,1:8);
% split set based on binary target attribute
[train_1,train_0] = binary_split(train,train_targets);
% import testing data
test = importdata('pima_test.txt');
% identify vector of test attributes
test_targets = test(:,9);
% identity vector of test attributes
test = test(:,1:8);
% split set based on binary target attribute
[test_1,test_0] = binary_split(test,test_targets);
% predict train and test using predict_NB
p_train = [];
for c = 1:size(train,1)
    p_train = [p_train;predict_NB(train(c,:),train_1,train_0)];
end
p_test = [];
for c = 1:size(test,1)
    p_test = [p_test;predict_NB(test(c,:),train_1,train_0)];
end
% build cm for train and test
cm_train = build_binary_cm(p_train,train_targets)
cm_test = build_binary_cm(p_test,test_targets)
% calculate misclassification error (given function)
train_mis = mean_misclass_error(train_targets,p_train)
test_mis = mean_misclass_error(test_targets,p_test)
% calculate misclassification error
train_err = (cm_train(2,1)+cm_train(1,2))/sum(sum(cm_train))
test_err = (cm_test(2,1)+cm_test(1,2))/sum(sum(cm_test))
% calculate test sensitivity 
sens = cm_test(1,1)/(cm_test(1,1)+cm_test(2,1))
% calculate test specificity
spec = cm_test(2,2)/(cm_test(2,2)+cm_test(1,2))
% ROC for testing set
%test_targets
%p_test
[X,Y,T,AUC] = perfcurve(test_targets,p_test,1);
AUC
plot(X,Y)