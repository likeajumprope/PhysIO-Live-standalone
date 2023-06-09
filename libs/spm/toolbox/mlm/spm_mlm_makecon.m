function [con_vec] = spm_mlm_makecon (mlm,w)
% Make contrast to test if the subset of coefficients indexed by w = 0 ?
% FORMAT [con_vec] = spm_mlm_makecon (mlm,w)
%
% mlm           MLM data structure containing
%               [p x d] matrix of regression coefficients mlm.wmean
% w             [p x d] matrix of comprising 1's and 0's with
%               1s selecting the coefficients of interest
%
% con_vec       Vectorised contrast matrix that can be passed 
%               to spm_mlm_posthoc.m
%__________________________________________________________________________

% Will Penny 
% Copyright (C) 2011-2022 Wellcome Centre for Human Neuroimaging


[p,d]=size(mlm.wmean);

con_vec=[];
for i=1:p
    for j=1:d
        if w(i,j)==1
            con=zeros(p,d);
            con(i,j)=1;
            con_vec=[con_vec;con(:)'];
        end
    end
end
