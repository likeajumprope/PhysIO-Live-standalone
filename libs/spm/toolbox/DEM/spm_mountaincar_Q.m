function [Q] = spm_mountaincar_Q(x)
% Desired ensemble density
% FORMAT [Q] = spm_mountaincar_Q(x)
%
% x:  (n x m) matrix of n m-D point in states space
%
% Q   - desired equilibrium density; p(x)
%__________________________________________________________________________
 
% Karl Friston
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging
 
% desired equilibrium density
%--------------------------------------------------------------------------
[n m] = size(x);
Q     = sparse(n,1);
qE    = [1 -1; 0 0];
m     = length(qE);
m     = 1; %***
qC    = [(2/32)^2 0; 0 (2/32)^2];
for i = 1:n
    for k = 1:m
        q    = spm_MNpdf(qE(:,k)',qC,x(i,:));
        Q(i) = Q(i) + q/m;
    end
end
 
