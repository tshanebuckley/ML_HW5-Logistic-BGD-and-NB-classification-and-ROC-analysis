% load train and test data from text files
train = importdata('pima_train_norm.txt');
test = importdata('pima_test_norm.txt');
% splits train into attributes and target
train_X = train(:,1:8);
train_y = train(:,9);
% splits test into attributes and target
test_X = test(:,1:8);
test_y = test(:,9);
% initialize w and graph
w = [];
g = init_progress_graph;
col_ones_train = ones(size(train_X,1),1);
col_ones_test = ones(size(test_X,1),1);
% iterates through 2000 instances of updating weights
for c = 0:100:2000
    w = Log_regression(train_X,train_y,c);
    p_train = Log_predict(w,horzcat(col_ones_train,train_X));
    p_test = Log_predict(w,horzcat(col_ones_test,test_X));
    train_err = mean_misclass_error(p_train,train_y);
    test_err = mean_misclass_error(p_test,test_y);
    g = add_to_progress_graph(g,c,train_err,test_err);
end
% w ends iteration with i = 2000
% display train and test misclass error
D = ['Train Error: ',num2str(train_err)];
disp(D)
D = ['Test Error: ',num2str(test_err)];
disp(D)
% create the train and test confusion matrices
cm_training = build_binary_cm(p_train,train_y)
cm_test = build_binary_cm(p_test,test_y)
% calculate test sensitivity 
sens = cm_test(1,1)/(cm_test(1,1)+cm_test(2,1))
% calculate test specificity
spec = cm_test(2,2)/(cm_test(2,2)+cm_test(1,2))
% ROC for testing set
[X,Y,T,AUC] = perfcurve(test_y,p_test,1);
AUC
figure()
plot(X,Y)