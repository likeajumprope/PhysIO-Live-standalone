% Demo script for interactive plotting in FieldTrip
%
% Disclaimer: this code is provided as an example and is not guaranteed to work
% with data on which it was not tested. If it does not work for you, feel
% free to improve it and contribute your improvements to the MEEGtools toolbox
% in SPM (http://www.fil.ion.ucl.ac.uk/spm)
%__________________________________________________________________________

% Vladimir Litvak
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging


iD = spm_eeg_load;

data = iD.fttimelock;

if iD.ntrials > 1
    clb = iD.conditions;
    ind = spm_input('Select trial',1, 'm', sprintf('%s|', clb{:}),1:iD.ntrials);
else
    ind = 1;
end

modality = spm_eeg_modality_ui(iD, 1, 1);

%-Configure
%--------------------------------------------------------------------------
cfg = [];
cfg.trackcallinfo  = 'no';
cfg.interactive    = 'yes';

switch modality
    case 'EEG'
        cfg.elec   = iD.sensors('EEG');
        cfg.rotate = 0;
        data.elec  = cfg.elec;
    case 'MEG'
        cfg.grad   = iD.sensors('MEG');
        data.grad  = cfg.grad;
    case 'MEGCOMB'
        cfg.layout = 'CTF275.lay';
end

cfg.channel = data.label(iD.indchantype(modality, 'GOOD'));

%-Display
%--------------------------------------------------------------------------
figure;

if isfield(data, 'trial')
    data.trial = data.trial(ind, :, :);
    ft_multiplotER(cfg, data);
elseif isfield(data, 'avg')
    ft_multiplotER(cfg, data);
elseif isfield(data, 'powspctrm')
    if strncmpi('rpt', data.dimord, 3)
        data.powspctrm = data.powspctrm(ind, :, :, :);
    end
    ft_multiplotTFR(cfg, data);
end
