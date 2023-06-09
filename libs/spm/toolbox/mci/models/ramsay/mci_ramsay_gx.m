function [y,L] = spm_ramsay_gx (x,u,P,M)
% Observation equation for Ramsay model
% FORMAT [y,L] = spm_ramsay_gx (x,u,P,M)
%
% x,u,P,M     state,input,params,model
%
% y           observations
% L           dy/dx
%__________________________________________________________________________

% Will Penny
% Copyright (C) 2015 Wellcome Trust Centre for Neuroimaging

nx=length(x);
L=eye(nx);
y=x;

