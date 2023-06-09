function [a,v1,v2,k] = mci_discount_act (P,M,U)
% Activation of discounting model
% FORMAT [a,v1,v2,k] = mci_discount_act (P,M,U)
%
% P         parameters
% M         model structure
% U         contains rewards and times
%
% a         activation for discount model
%__________________________________________________________________________

% Will Penny
% Copyright (C) 2015 Wellcome Trust Centre for Neuroimaging

k = exp(P(1));  % discount rate
beta = exp(P(2)); % decision noise

v1 = U.r1./(1+k*U.t1);
v2 = U.r2./(1+k*U.t2);

a = beta * (v1 - v2);