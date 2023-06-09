function [dLdp,iCpY,L] = mci_logistic_deriv (P,M,U,Y)
% Gradient of likelihood for logistic model
% FORMAT [dLdp,iCpY,L] = mci_logistic_deriv (P,M,U,Y)
%
% P         parameters
% M         model
% U         inputs
% Y         data
%
% dLdp      gradient of log joint
% iCpY      curvature (Fisher Information)
% L         log joint
%__________________________________________________________________________

% Will Penny
% Copyright (C) 2015 Wellcome Trust Centre for Neuroimaging

dLdp = spm_diff(M.L,P,M,U,Y,1);
dLdp = full(dLdp(:));

g = mci_logistic_gen (P,M,U);
Lambda=diag(g.*(1-g));
iCpY=U.X'*Lambda*U.X;

if nargout > 2
    L=mci_logistic_like (P,M,U,Y);
end