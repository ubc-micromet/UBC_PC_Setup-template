function Photo_Download(siteID,optional_path)

% Purpose: To download photos in CC5MPX remotely
% ----------------------------
% Information settings
% ----------------------------
siteID = char(siteID);

if strcmp(siteID,'DSM')
    in_dir='http://173.181.139.5:7980/sdcard/SelfTimed1Still/';  % input directory
    out_dir='P:\Sites\DSM\Phenocam\';                   % output directory
    R_url="http://173.181.139.5:7980/sdcard1.htm?FLAG=DIR&DIR=/mnt/mmc"; % root url 
    
elseif strcmp(siteID,'RBM')
    in_dir='http://173.181.139.4:7980/sdcard/SelfTimed1Still/';  % input directory
    out_dir='P:\Sites\RBM\Phenocam\';                   % output directory
    R_url="http://173.181.139.4:7980/sdcard1.htm?FLAG=DIR&DIR=/mnt/mmc"; % root url 
end

in_dir='http://173.181.139.5:7980/sdcard/SelfTimed1Still/';  % input directory
out_dir='P:\Sites\DSM\Phenocam\';                   % output directory
R_url="http://173.181.139.5:7980/sdcard1.htm?FLAG=DIR&DIR=/mnt/mmc"; % root url 

if ~isempty(optional_path)==1
    out_dir = fullfile(optional_path,siteID);
end



% ----------------------------
% Program start
% ----------------------------

% (1) Get all date
url_1 = strcat(R_url,"&FILE=SelfTimed1Still");
sourcefile = webread(url_1);
expr='"SelfTimed1Still","(\w+)","';
[~, data]= regexp(sourcefile, expr, 'match', 'tokens');
DList=string(data); % Date list (also the folder names)

% (2) Get all files
%     This loop will search files folder by folder
for i=1:length(DList)
    url_2=strcat(R_url,"/SelfTimed1Still&FILE=",data{i});
    Dsub=webread(url_2);
    expr=['"(\w+.jpg)"'];
    [~, data2]= regexp(Dsub, expr, 'match', 'tokens');
    % data2: all the files under this folder
    
    fprintf(1,'-> There are %d files under "%s"\n',length(data2),DList(i))
    %tic
    for j=1:length(data2)
        
        %fprintf(1,"   [%d] %s ",j,char(data2{j})); % show the process
        
        infile=fullfile(in_dir,char(data{i}),char(data2{j}));
        infile(strfind(infile,'\'))='/';
        outfile=fullfile(out_dir,char(data2{j}));
        
        if ~exist(outfile,'file')
            fprintf(1,"   [%d] %s  downloading\n",j,char(data2{j}));
            rgbImage = imread(infile);
            imwrite(rgbImage,outfile);
        %else
        %    fprintf(1," already exist\n");
        end
    end
    fprintf(1,"Download completed.\n");
    %toc
    fprintf(1,"\n");
end

