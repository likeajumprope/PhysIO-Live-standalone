function [fnames, defaults] = mysubs_fields

% function [fnames, defaults] = mysubs_fields
% This function returns a cell string of names containing the fields
% implemented by a derived class and their default values. It is called
% from the class constructor directly and indirectly for subsasgn/subsref
% via the subs_fields public function of each class.
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: mysubs_fields.m 8404 2023-02-01 18:12:41Z guillaume $

rev = '$Rev: 8404 $'; %#ok

fnames = {'tag','name','val','check','help','rewrite_job','expanded','hidden','def','preview'};
defaults = {'generic','Generic',{{}},'',{{''}},'',true,false,[],''};