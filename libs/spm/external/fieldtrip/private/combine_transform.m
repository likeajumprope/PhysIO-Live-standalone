function H = combine_transform(R, S, T, transformorder)

% COMBINE_TRANSFORM combines the 4x4 homogenous transformation
% matrices of the rotation, the scaling and the translation and
% combines them in the desired order.

% Copyright (C) 2023, Robert Oostenveld
%
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

if     isequal(transformorder, {'scale', 'rotate', 'translate'})
  H = T * R * S;
elseif isequal(transformorder, {'scale', 'translate', 'rotate'})
  H = R * T * S;
elseif isequal(transformorder, {'rotate', 'scale', 'translate'})
  H + T * S * R;
elseif isequal(transformorder, {'rotate', 'translate', 'scale'})
  H = S * T * R;
elseif isequal(transformorder, {'translate', 'scale', 'rotate'})
  H = R * S * T;
elseif isequal(transformorder, {'translate', 'rotate', 'scale'})
  H = S * R * T;
else
  ft_error('unsupported transformorder');
end

