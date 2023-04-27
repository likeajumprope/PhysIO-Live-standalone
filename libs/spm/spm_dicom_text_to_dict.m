function dict = spm_dicom_text_to_dict(textfile)
% Create a DICOM dictionary .mat file from a text version
% FORMAT dict = spm_dicom_text_to_dict(textfile)
% OR            spm_dicom_text_to_dict(textfile)
% textfile    - the name of a suitable text version of the dictionary.
%               With no output argument, the results are saved in a .mat
%               file of the same base name.
%__________________________________________________________________________
% The text version is typically generated by copy/pasting from the
% "Digital Imaging and Communications in Medicine (DICOM) Part 6:
% Data Dictionary" pdf file from http://medical.nema.org/standard.html,
% and manually tidying it up (about a solid day's effort).  A
% re-formatted text version is then obtained by running the following:
%
% awk < DICOM2011_dict.txt '{if ($NF=="RET") print $1,$(NF-3),$(NF-2),$(NF-1); else print $1,$(NF-2),$(NF-1),$(NF);}' | sed 's/(/ /' | sed 's/,/ /' | sed 's/)//' | awk '{printf("%s\t%s\t%s\t%s\t%s\n", $1,$2,$3,$4,$5)}' > new_dicom_dict.txt 
%
% After this, the spm_dicom_text_to_dict function can be run to generate
% the data dictionary.
%__________________________________________________________________________

% John Ashburner
% Copyright (C) 2002-2022 Wellcome Centre for Human Neuroimaging


if ~nargin, textfile = fullfile(spm('Dir'),'spm_dicom_dict.txt'); end

fid  = fopen(textfile,'rt');
file = textscan(fid,'%s','delimiter','\n','whitespace',''); file = file{1};
fclose(fid);
clear values
i = 0;
for j=1:numel(file)
    words = textscan(file{j},'%s','delimiter','\t'); words = words{1};
    if length(words)>=5 && ~strcmp(words{1}(3:4),'x') && ~strcmp(words{2}(3),'x')
        grp = sscanf(words{1},'%x');
        ele = sscanf(words{2},'%x');
        if ~isempty(grp) && ~isempty(ele)
            i          = i + 1;
            group(i)   = grp;
            element(i) = ele;
            vr         = {};
            for k=1:length(words{4})/2
                vr{k}  = words{4}(2*(k-1)+1:2*(k-1)+2);
            end
            name       = words{3};
            msk        = ~(name>='a' & name<='z') & ...
                         ~(name>='A' & name<='Z') & ...
                         ~(name>='0' & name<='9') & ...
                         ~(name=='_');
            name(msk)  = '';
            values(i)  = struct('name',name,'vr',{vr},'vm',words{5});
        end
    end
end

if ~nargout
    matname = spm_file(textfile,'ext','.mat');
    save(matname,'values','group','element', spm_get_defaults('mat.format'));
else
    dict = struct('values',values,'group',group,'element',element);
end

%tags = sparse(group+1,element+1,1:length(group));
%dict = struct('values',values,'tags',tags);
%dict = desparsify(dict);


%==========================================================================
% function dict = desparsify(dict)
%==========================================================================
function dict = desparsify(dict)
[group,element] = find(dict.tags);
offs            = zeros(size(group));
for k=1:length(group)
    offs(k) = dict.tags(group(k),element(k));
end
dict.group(offs)   = group-1;
dict.element(offs) = element-1;
