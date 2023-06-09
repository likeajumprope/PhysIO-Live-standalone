function [g] = spm_gx_Gabor(x,u,P)
% observer equation for Gabor patches
% FORMAT [g] = spm_gx_Gabor(x,u,P)
% x      - state vector
%   x(1) - position
%   x(2) - amplitude
%   x(3) - dispersion
% u      - input
%   u(1) - position  (forcing)
%   u(2) - amplitude (forcing)
%   u(3) - width (forcing)
% f      - dx/dt
%__________________________________________________________________________

% Karl Friston
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging

% exponentiation of hemodynamic state variables
%--------------------------------------------------------------------------
p    = ([1:32]' - x(1) - 16)*(1 + x(3)/16);
g    = (1 + x(2)/2)*cos(2*pi*p/8).*exp(-p.^2/16);