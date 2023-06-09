function E = ROBOT_NMM
% Tests routines in neural mass model (NMM) GUI
%__________________________________________________________________________
 
% Karl Friston
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging


% close and clear everything
%--------------------------------------------------------------------------
cd('C:\spm\toolbox\Neural_Models')
clear all
close all
delete(get(0,'Children'))
if exist('DEMO.ps','file')
    delete('DEMO.ps')
end
clc

% get scripts and functions
%--------------------------------------------------------------------------
P     = importdata('Neural_demo.m');
R     = {};
E     = {};
for i = 1:length(P)
    k = strfind(P{i},'handles,');
    if ~isempty(k)
        str          = P{i}(k + 10:end - 2);
        if exist(str,'file') == 2
            R{end + 1,1} = str;
        end
    end
end

% execute scripts and functions
%--------------------------------------------------------------------------
N     = length(R);
T     = zeros(1,N);
for i = 1:N
    try
        
        % run routine
        %------------------------------------------------------------------
        fprintf('\nChecking %s\n',R{i})
        t     = tic; eval(R{i}); T(i) = toc(t);
        
        % print graphics
        %------------------------------------------------------------------
        H     = sort(get(0,'Children'));
        for j = 1:length(H);
            
            figure(H(j))
            axes('position',[.05 .98 .9 .02]);
            str   = [get(gcf,'Name') ': ' R{i}];
            text(0,0.5,str,'Fontsize',10,'Fontweight','Bold')
            axis off
            
            spm_print('DEMO.ps',gcf);
       
        end
        delete(H)
        
    catch
        
        % errors
        %------------------------------------------------------------------
        E{end + 1} = lasterror;
        
    end
    
    fprintf('\n\n     --------***--------   \n\n')
    
end

% Show failed routines
%--------------------------------------------------------------------------
for i = 1:length(E)
    disp(E{i}.message)
    disp(E{i}.stack(end - 1))
    disp('------------------------------------------------')
end
