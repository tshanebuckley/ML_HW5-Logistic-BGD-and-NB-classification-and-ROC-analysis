% load train and test data from text files
pima_train = importdata('pima_train.txt');
pima_test = importdata('pima_test.txt');
% splits train into attributes and target
train_target = pima_train(:,9);
pima_train = pima_train(:,1:8);
% splits test into attributes and target
test_target = pima_test(:,9);
pima_test = pima_test(:,1:8);
% normalize the data 
[train_mean_norm train_std_norm] = compute_norm_parameters(pima_train);
pima_train = normalize(pima_train,train_mean_norm,train_std_norm);
[test_mean_norm test_std_norm] = compute_norm_parameters(pima_test);
pima_test = normalize(pima_test,test_mean_norm,test_std_norm);
% add targets back to train and test sets
pima_train = horzcat(pima_train,train_target);
pima_test = horzcat(pima_test,test_target);
% create new text files
fileID = fopen('pima_train_norm.txt','w');
for c = 1:size(pima_train,1)
    fprintf(fileID,'%15e %15e %15e %15e %15e %15e %15e %15e %15e\r\n',pima_train(c,:));
end
fclose(fileID);
fileID = fopen('pima_test_norm.txt','w');
for c = 1:size(pima_test,1)
    fprintf(fileID,'%15e %15e %15e %15e %15e %15e %15e %15e %15e\r\n',pima_test(c,:));
end
fclose(fileID);