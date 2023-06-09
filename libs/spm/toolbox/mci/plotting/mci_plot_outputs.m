function [] = mci_plot_outputs (M,G)
% Plot outputs
% FORMAT [] = mci_plot_outputs (M,G)
% 
% M     Model
% G     Data
%__________________________________________________________________________

% Will Penny
% Copyright (C) 2015 Wellcome Trust Centre for Neuroimaging

lw=2;
h=figure;
set(h,'Name','Outputs');
plot(M.t,G,'LineWidth',lw);
for i=1:M.l,
    outstr{i}=sprintf('y(%d)',i);
end
legend(outstr);
xlabel('Time');
grid on