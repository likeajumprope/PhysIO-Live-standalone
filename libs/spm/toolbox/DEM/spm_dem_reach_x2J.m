function [J] = spm_dem_reach_x2J(x)
% returns the joint posititions for a two-joint arm
% FORMAT [J] = spm_dem_reach_x2J(x)
%
% x    - hidden states (joint angles)
% x    - hidden states
%   x(1) - joint angle
%   x(2) - joint angle
%
% J1   - position of 1st joint
% J2   - position of 2nd joint (relative to first)
%__________________________________________________________________________
 
% Karl Friston
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging

% evaluate positions
%--------------------------------------------------------------------------
J{1} = [ cos( x(1,:));          sin( x(1,:))         ];
J{2} = [-cos(-x(1,:) - x(2,:)); sin(-x(1,:) - x(2,:))];
