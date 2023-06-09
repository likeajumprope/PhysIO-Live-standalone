function [f,J] = spm_fx_null(x,u,P,M)
% State equations for null (Jacobian) model
% FORMAT [f,J] = spm_fx_null(x,u,P,M)
%
% x - hidden states
% u - exogenous input
% P - parameters
% M - model
%
% f - flow
% J - Jacobian
%__________________________________________________________________________
 
% Karl Friston
% Copyright (C) 2005-2022 Wellcome Centre for Human Neuroimaging

% input
%==========================================================================
if isfield(M,'u')
    
    % endogenous input
    %----------------------------------------------------------------------
    U = P.D*u(:);
    
else
    % exogenous input
    %----------------------------------------------------------------------
    U = P.D*P.C*u(:);
    
end

% flow and Jacobian
%==========================================================================
J     = -expm(P.A);
f     = J*x + U;
