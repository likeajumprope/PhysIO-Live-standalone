function spm_dcm_create(syn_model,source_model,SNR)
% Create a DCM with simulated data (specified via GUI or an existing model)
% FORMAT spm_dcm_create(syn_model,source_model,SNR)
%
% syn_model     - name of the synthetic DCM to be created 
% source_model  - define new model ('GUI')
%                 or import existing model via file selector ('import')
%                 or import existing model (directly specified by directory
%                 and name) 
%                 [default: 'GUI']
% SNR           - signal-to-noise ratio [default: 1]
%
% This function allows to create DCM networks with known connectivity
% parameters from which synthetic data are then generated by calling 
% spm_dcm_generate.
%
% This function is very much like spm_dcm_specify_ui but inputs etc. are 
% specified either via the user interface or from an existing model. 
% Currently, the interface provided by this function does not allow for 
% manual specification of nonlinear DCMs; however, these can be imported 
% from existing files.
%__________________________________________________________________________

% Will Penny & Klaas Enno Stephan & Peter Zeidman
% Copyright (C) 2002-2022 Wellcome Centre for Human Neuroimaging


Finter = spm_figure('GetWin','Interactive');
header = get(Finter,'Name');
set(Finter,'Name','Dynamic Causal Modelling')

%-Check parameters and insert default values, if necessary
%==========================================================================
if nargin == 0
    syn_model    = spm_input('Name for target DCM_???.mat','+1','s');
    SNR          = spm_input('Signal-to-noise ratio (SNR)? ','+1','r',[],1);
    source_model = 'GUI';
else
    try, source_model; catch, source_model = 'GUI'; end
    try, SNR;          catch, SNR = 1;              end
end


%-Outputs
%==========================================================================
switch upper(source_model)
    
    case 'GUI'
        
        %-Define model by GUI
        %==================================================================
        
        % Load SPM for experimental timing
        %------------------------------------------------------------------        
        [spm_file, sts] = spm_select(1,'^SPM\.mat$','Select SPM.mat');
        if ~sts, return; end
        try
            SPM = load(spm_file);
            SPM = SPM.SPM;
        catch
            error('Cannot read %s.',spm_file);
        end        
        
        % Check for which session to create the DCM
        %------------------------------------------------------------------
        session = length(SPM.Sess);
        if session > 1
            session   = spm_input('which session','!+1','n1',1,session);
            if isempty(session) || ~isnumeric(session)
                error('A session number is required');
            end
        end     
        
        % Get cell array of region structures
        %------------------------------------------------------------------
        n = spm_input('Enter number of regions',1,'r',[],1);
        for i=1:n
            str         = sprintf('Region %d',i);
            xY(i).name  = spm_input(['Name for ',str],'+1','s');
            % Make up spurious VOI info
            % for compatibility with spm_dcm_display
            xY(i).xyz   = [i i i]'*10;
            xY(i).XYZmm = [i i i]'*10;
            xY(i).s     = 1;
            xY(i).spec  = 1;
            % for compatibility with spm_dcm_specify
            xY(i).Sess  = session;
            xY(i).u     = 1;
            xY(i).X0    = [];
        end
        
        % Run through standard specification questions
        %------------------------------------------------------------------
        DCM   = spm_dcm_specify_ui(SPM,xY);
        
        % Get desired number of scans
        %------------------------------------------------------------------        
        DCM.v = SPM.nscan(session);
        
        % Set default connection strengths to reasonable values
        %------------------------------------------------------------------                
        DEFAULT_SELF    = 0;
        DEFAULT_BETWEEN = 0.3;
        DEFAULT_DRIVING = 0.8;
                       
        def   = struct();
        def.A = DEFAULT_BETWEEN .* DCM.a;
        def.A = def.A - diag(diag(def.A));
        def.A = def.A + diag(repmat(DEFAULT_SELF,n,1));                   
        def.B = DEFAULT_BETWEEN .* DCM.b;        
        def.C = DEFAULT_DRIVING .* DCM.c;
        
        % Build A-matrix
        %------------------------------------------------------------------                        
              
        % Initialize DCM.Ep with prior values
        DCM.Ep  = spm_dcm_fmri_priors(DCM.a,DCM.b,DCM.c,DCM.d);     
       
        enabled = struct('A',DCM.a,'B',DCM.b,'C',DCM.c);
        
        entry_accepted = false;
        while ~entry_accepted
            % Prompt for A-matrix
            str = 'Connectivity for';
            con = spm_dcm_connectivity_ui(DCM,'A', str, def, enabled);
            DCM.Ep.A = con.A;        
        
            % Check stability
            if spm_dcm_check_stability(DCM)
                entry_accepted = true;
            else
                % Query for another attempt
                qtext = ...
                    'Parameters may lead to an unstable estimate. Edit your selection?';
                options = struct('Default','Yes','Interpreter','none');
                choice = questdlg(qtext,'Stability','Yes','No',options);                
                entry_accepted = ~strcmp(choice,'Yes');
                
                % Ensure any new values are re-populated
                def = struct('A',DCM.Ep.A,'B',DCM.Ep.B,'C',DCM.Ep.C);
            end            
        end
        
        % Build B-matrix and C-matrix
        %------------------------------------------------------------------               
        con = spm_dcm_connectivity_ui(DCM,'B', str, def, enabled);
        DCM.Ep.B = con.B;        
        con = spm_dcm_connectivity_ui(DCM,'C', str, def, enabled);
        DCM.Ep.C = con.C;
                
    case 'IMPORT'
        
        % Import existing model - prompt user to choose it
        %==================================================================
        P     = spm_select(1,'^DCM.*\.mat$','Select source DCM_???.mat');
        load(P)

    otherwise
        
        % Import existing model (directly specified by directory & name)
        %==================================================================
        try
            load(source_model)
        catch
            error('Cannot load source model');
        end
        
end


% Now set up output structure 
%--------------------------------------------------------------------------
X0    = ones(DCM.v,1);
switch upper(source_model)
    case 'GUI'
        Y              = DCM.Y;
        DCM.Ep.decay   = sparse(DCM.n,1);
        DCM.Ep.transit = sparse(DCM.n,1);
        DCM.Ep.epsilon = sparse(1,1);
    otherwise
        try
            Y.dt = DCM.Y.dt;
        catch
            Y.dt = DCM.delays(1);
        end
end
Y.X0  = X0;
for i = 1:DCM.n
    Y.name{i} = DCM.xY(i).name;
end
Y.Q   = spm_Ce(ones(1,DCM.n)*DCM.v);
DCM.Y = Y;


%-Save
%--------------------------------------------------------------------------
dcm_filename = ['DCM_' syn_model '.mat'];
save(dcm_filename,'DCM', spm_get_defaults('mat.format'));

% Generate synthetic output data
%==========================================================================
spm_dcm_generate(dcm_filename,SNR);

spm('FigName',header);
