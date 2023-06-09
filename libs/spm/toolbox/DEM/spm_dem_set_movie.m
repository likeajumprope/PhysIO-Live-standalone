function spm_dem_cue_movie(DEM,q)
% creates a movie of cued pointing
% FORMAT spm_dem_cue_movie(DEM,q)
%
% DEM - DEM structure from reaching simulations
% q   - flag switching from true to perceived reaching
%__________________________________________________________________________

% Karl Friston
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging

% Dimensions
%--------------------------------------------------------------------------
N    = size(DEM.pU.v{1},2);
n    = size(DEM.pP.P{1},2);

% evaluate true location (targets)
%----------------------------------------------------------------------
for i = 1:N
    L(:,:,i) = DEM.pP.P{1};
end

if nargin > 1
    
    % evaluate perceived positions (motor plant)
    %----------------------------------------------------------------------
    x    = tan(DEM.qU.v{1}(1:2,:));                  % finger location
    c    = DEM.qU.v{1}(4 + (1:n),:);                 % target contrast
    
else
    
    % evaluate true positions (motor plant)
    %----------------------------------------------------------------------
    x    = tan(DEM.pU.v{1}(1:2,:));                  % finger location
    c    = DEM.pU.v{1}(4 + (1:n),:);                 % target contrast
    
end
c    = c - min(c(:)) + 1/32;
c    = c/max(c(:));
fin  = imread('pointfinger.jpg');


% movie
%--------------------------------------------------------------------------
s     = 2;
for i = 1:N
    
    cla
    axis image ij
    hold on
    
    % finger
    %----------------------------------------------------------------------
    imagesc(([-1 0] + .68)*s + x(1,i),([-1 0] + .96)*s + x(2,i),fin);
    hold on
    
    % trajectory
    %----------------------------------------------------------------------
    plot(x(1,1:i),x(2,1:i),'k:')
    
    % targets
    %----------------------------------------------------------------------
    for j = 1:n
        plot(L(1,j,i),L(2,j,i),'.','MarkerSize',64,'color',[c(j,i) (1 - c(j,i)) 0])
    end
    axis([-1 1 -1 1]*2)
    hold off
    drawnow
    
    % save
    %----------------------------------------------------------------------
    M(i) = getframe(gca);
    
end

% set ButtonDownFcn
%--------------------------------------------------------------------------
h = findobj(gca,'type','image');
set(h(1),'Userdata',{M,16})
set(h(1),'ButtonDownFcn','spm_DEM_ButtonDownFcn')
