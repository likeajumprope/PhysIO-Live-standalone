function [f] = mci_nmm_r2p2_fx (x,u,P,M)
% Flow for two region, two parameter NMM
% FORMAT [f] = mci_nmm_r2p2_fx (x,u,P,M)
%
% x         State
% u         Inputs
% P         Parameters
% M         Model structure
%
% f         Flow, dx/dt
%__________________________________________________________________________

% Will Penny and Biswa Sengupta
% Copyright (C) 2015 Wellcome Trust Centre for Neuroimaging

curr_P=M.can_P; % Canonical parameter set

% 2 free parameters
curr_P.A{1}(2,1)=P(1); % Forward connection, w_21
curr_P.A{2}(1,2)=P(2); % Backward connection, w_12

f = mci_nmm_fx_delay(x,u,curr_P,M);

