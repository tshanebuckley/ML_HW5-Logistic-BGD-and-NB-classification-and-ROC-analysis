function [set1,set2] = binary_split(data,factors)
% splits data into two sets based on a binary attribute
% arg1 = the data matrix, arg2 = a vector of the binaries as 1s and 2s from
% the findgroups function
set1 = [];
set2 = [];
for c = 1:size(factors)
    if factors(c) == 1
        set1 = [set1;data(c,1:end)];
    else
        set2 = [set2;data(c,1:end)];
    end
end
end

