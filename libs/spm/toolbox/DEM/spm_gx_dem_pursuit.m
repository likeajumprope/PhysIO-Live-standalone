function [g] = spm_gx_dem_pursuit(x,v,P)
% returns the prediction for visual pursuit
% FORMAT [g] = spm_gx_dem_pursuit(x,v,P)
%
% x    - hidden states:
%   o(1) - oculomotor angle
%   o(2) - oculomotor angle
%   x(1) - target location (visual) - extrinsic coordinates (Cartesian)
%   x(2) - target location (visual) - extrinsic coordinates (Cartesian)
%   a(:) - attractor (SHC) states
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


