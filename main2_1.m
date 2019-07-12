% import data
pima = importdata('pima.txt');
% identify vector of target attributes
targets = pima(:,9);
% split set based on binary target attribute
[pima_1,pima_0] = binary_split(pima,targets)
% creates a figure with 16 hists for split data
figure()
subplot(2,8,1)
for c = 1:8
    subplot(2,8,c);
    histogram_analysis(pima_1(1:end,c));
    hold on
    T = ['Target 1: Attribute ',int2str(c)];
    title(T);
    hold off
    subplot(2,8,c+8);
    histogram_analysis(pima_0(1:end,c));
    hold on
    T = ['Target 0: Attribute ',int2str(c)];
    title(T);
    hold off
end