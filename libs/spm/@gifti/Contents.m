% GIfTI Class for MATLAB
%
% Geometry format under the Neuroimaging Informatics Technology Initiative
% (NIfTI):
%                 http://www.nitrc.org/projects/gifti/
%                      http://nifti.nimh.nih.gov/
%
% This MATLAB class is part of SPM:
%                  https://www.fil.ion.ucl.ac.uk/spm/
%
% It relies on external libraries:
%   Base64, by Peter J. Acklam:
%      http://home.online.no/~pjacklam/
%   miniz, by Rich Geldreich:
%      https://github.com/richgel999/miniz
%   dzip, by Michael Kleder:
%      https://www.mathworks.com/matlabcentral/fileexchange/8899
%   XMLTree and JSONio, by Guillaume Flandin:
%      https://www.github.com/gllmflndn/xmltree
%      https://www.github.com/gllmflndn/JSONio
%__________________________________________________________________________

% Guillaume Flandin
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging

% GIfTI library for MATLAB
% Copyright (C) 2008-2022 Wellcome Centre for Human Neuroimaging
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation Inc, 59 Temple Pl. - Suite 330, Boston, MA 02111-1307, USA.
