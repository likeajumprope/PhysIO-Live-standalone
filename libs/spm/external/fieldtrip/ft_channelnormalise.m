function [dataout] = ft_channelnormalise(cfg, data)

% FT_CHANNELNORMALISE shifts and scales all channels of the the input data.
% The default behavior is to subtract each channel's mean, and scale to a
% standard deviation of 1, for each channel individually.
%
% Use as
%   [dataout] = ft_channelnormalise(cfg, data)
%
% The configuration can contain
%   cfg.channel = 'all', or a selection of channels
%   cfg.trials  = 'all' or a selection given as a 1xN vector (default = 'all')
%   cfg.demean  = 'yes' or 'no' (or boolean value) (default = 'yes')
%   cfg.scale   = scalar value used for scaling (default = 1)
%   cfg.method  = 'perchannel', or 'acrosschannel', computes the
%                   standard deviation per channel, or across all channels.
%                   The latter method leads to the same scaling across
%                   channels and preserves topographical distributions
%
% To facilitate data-handling and distributed computing you can use
%   cfg.inputfile   =  ...
%   cfg.outputfile  =  ...
% If you specify one of these (or both) the input data will be read from a *.mat
% file on disk and/or the output data will be written to a *.mat file. These mat
% files should contain only a single variable, corresponding with the
% input/output structure.
%
% See also FT_COMPONENTANALYSIS, FT_FREQBASELINE, FT_TIMELOCKBASELINE
%
% Copyright (C) 2010, Jan-Mathijs Schoffelen

% This file is part of FieldTrip, see http://www.fieldtriptoolbox.org
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id$

% these are used by the ft_preamble/ft_postamble function and scripts
ft_revision = '$Id$';
ft_nargin   = nargin;
ft_nargout  = nargout;

% do the general setup of the function
ft_defaults
ft_preamble init
ft_preamble debug
ft_preamble loadvar data
ft_preamble provenance data

% the ft_abort variable is set to true or false in ft_preamble_init
if ft_abort
  return
end

% store the original datatype
dtype = ft_datatype(data);

% check if the input data is valid for this function
data = ft_checkdata(data, 'datatype', 'raw', 'feedback', 'yes');

% check if the input cfg is valid for this function
cfg = ft_checkconfig(cfg, 'forbidden',  {'channels', 'trial'}); % prevent accidental typos, see issue 1729

% set the defaults
cfg.channel   = ft_getopt(cfg, 'channel', 'all');
cfg.trials    = ft_getopt(cfg, 'trials', 'all', 1);
cfg.scale     = ft_getopt(cfg, 'scale', 1);
cfg.demean    = ft_getopt(cfg, 'demean', 'yes');
cfg.method    = ft_getopt(cfg, 'method', 'perchannel'); % or acrosschannel

if ~strcmp(cfg.channel, 'all') || ~strcmp(cfg.trials, 'all')
  % select channels and trials of interest
  tmpcfg = keepfields(cfg, {'trials', 'channel', 'tolerance', 'showcallinfo', 'trackcallinfo', 'trackusage', 'trackdatainfo', 'trackmeminfo', 'tracktimeinfo', 'checksize'});
  data   = ft_selectdata(tmpcfg, data);
  % restore the provenance information
  [cfg, data] = rollback_provenance(cfg, data);
end

% initialise some variables
nchan  = numel(data.label);
ntrl   = numel(data.trial);
datsum = zeros(nchan,1);
datssq = zeros(nchan,1);

% create output data, omitting sensor information
% FIXME this can be kept, provided the scaling is built in appropriately
dataout         = [];
dataout.label   = data.label;
dataout.trial   = cell(1,ntrl);
dataout.time    = data.time;

% some fields from the input should be copied over in the output
copyfield = {'fsample', 'sampleinfo', 'trialinfo'};
for i=1:length(copyfield)
  if isfield(data, copyfield{i})
    dataout.(copyfield{i}) = data.(copyfield{i});
  end
end

% compute the sum and sum-of-squares
n = zeros(numel(data.label), numel(data.trial));
for k = 1:ntrl
  n(:,k) = sum(~isnan(data.trial{k}),2);
  datsum = datsum + nansum(data.trial{k},2);
  datssq = datssq + nansum(data.trial{k}.^2,2);
end

% compute the mean always per channel
datmean = datsum./nansum(n, 2);

if strcmp(cfg.method, 'perchannel')
  % keep the intermediate sum and sum-of-squares as they are
elseif strcmp(cfg.method, 'acrosschannel')
  % update the intermediate sum and sum-of-squares in order to compute std across channels
  datsum(:) = nansum(datsum);
  datssq(:) = nansum(datssq);
  n         = repmat(nansum(n, 1), size(n, 1), 1);
else
  ft_error('unsupported method "%s"', cfg.method);
end

% this is a quick way to compute the std from the sum and sum-of-squared values
datstd = sqrt( (datssq - (datsum.^2)./nansum(n, 2))./nansum(n, 2));

% keep mean and std in output cfg
if istrue(cfg.demean)
  cfg.mu    = datmean;
else
  cfg.mu    = [];
end
cfg.sigma = datstd;

% demean and normalise
for k = 1:ntrl
  onesvec = ones(1,size(data.trial{k},2));
  if istrue(cfg.demean)
    dataout.trial{k} = cfg.scale * (data.trial{k}-datmean(:,onesvec))./datstd(:,onesvec);
  else
    dataout.trial{k} = cfg.scale * data.trial{k}./datstd(:,onesvec);
  end
end

% convert back to input type if necessary
switch dtype
  case 'timelock'
    dataout = ft_checkdata(dataout, 'datatype', 'timelock');
  otherwise
    % keep the output as it is
end

% do the general cleanup and bookkeeping at the end of the function
ft_postamble debug
ft_postamble previous   data
ft_postamble provenance dataout
ft_postamble history    dataout
ft_postamble savevar    dataout
