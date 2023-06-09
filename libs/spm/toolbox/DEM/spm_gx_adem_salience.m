function [g]= spm_gx_adem_salience(x,v,a,P)
% returns the prediction for visual search (proprioception and vision)
% FORMAT [g]= spm_gx_adem_salience(x,v,a,P)
%
% x    - hidden states:
%   o(1) - oculomotor angle
%   o(2) - oculomotor angle
%
% v    - hidden causes
% P    - parameters
%
% g    - sensations:
%   g(1) - oculomotor angle (proprioception - x)
%   g(2) - oculomotor angle (proprioception - y)
%   g(3) - retinal input - channel 1
%   g(4) - retinal input - channel 2
%   g(5) - ...
% 
% As for spm_dem_reach but with no visual target
%__________________________________________________________________________
 
% Karl Friston
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging
 
% sensory input sampled from image
%--------------------------------------------------------------------------
global STIM
 
% retinotopic sampling
%--------------------------------------------------------------------------
s   = ADEM_sample_image(STIM.V,x,STIM.R);
 
% add proprioceptive angles in intrinsic (polar) coordinates
%--------------------------------------------------------------------------
g   = spm_vec(x,s);
 
