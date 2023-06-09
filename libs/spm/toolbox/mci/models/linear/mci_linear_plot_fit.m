function [] = mci_linear_plot_fit (M,Y,y,names)
% Plot fit of linear time series model
% FORMAT [] = mci_linear_plot_fit (M,Y,y,names)
%
% M         data structure for linear model
% Y         data points
% y{i}      ith time series
% names{i}  name of
%__________________________________________________________________________

% Will Penny
% Copyright (C) 2015 Wellcome Trust Centre for Neuroimaging

lw=2;
cols={'k-','b-','r-'};
hold on
for i=1:length(y)
    plot([1:M.T],y{i},cols{i},'LineWidth',lw);
end
plot(M.t,Y,'kx','LineWidth',lw,'MarkerSize',12);
grid on
set(gca,'FontSize',16);
xlabel('Month');
legend(names);