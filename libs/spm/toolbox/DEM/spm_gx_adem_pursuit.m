function [g]= spm_gx_adem_pursuit(x,v,a,P)
% returns the prediction for pursuit model (proprioception and vision)
% FORMAT [g]= spm_gx_adem_pursuit(x,v,a,P)
%
% x    - hidden states:
%   o(1) - oculomotor angle
%   o(2) - oculomotor angle
%   x(1) - target location (visual) - extrinsic coordinates (Cartesian)
%   x(2) - target location (visual) - extrinsic coordinates (Cartesian)
%
% v    - hidden causes
% P    - parameters
%
% g    - sensations:
%   g(1) - oculomotor angle (proprioception)
%   g(2) - oculomotor angle (proprioception)
%   g(3) - target location (visual) - intrinsic coordinates (polar)
%   g(4) - target location (visual) - intrinsic coordinates (polar)
% 
% As for spm_dem_reach but with no visual target
%__________________________________________________________________________
 
% Karl Friston
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging
 
% evaluate positions in intrinsic (polar) coordinates
%--------------------------------------------------------------------------
x.p = atan(x.x) - x.o;
g   = [x.o; x.p];

