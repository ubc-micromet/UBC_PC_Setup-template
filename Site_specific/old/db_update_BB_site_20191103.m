function db_update_BB_site(yearIn,sites,skipWebUpdates)
% renames Burns Bog logger files, moves them from CSI_NET\old on PAOA001 to
% CSI_NET\old\yyyy, updates the annex001 database

% user can input yearIn, sites (cellstr array containing site suffixes)
% use do_eddy = 1, to turn on dbase updates using calculated daily flux
% files

% file created:  June 24, 2019        
% last modified: June 24, 2019 (Zoran)
%

% function based on db_update_HH_sites

% Revisions:
%
% Oct 27, 2019 (Zoran)
%   - Added skipWebUpdates update flag that has to be set to 0 if user
%   wants to update the web page too. Used to speed up the debugging


dv=datevec(now);
arg_default('yearIn',dv(1));
arg_default('sites','BB');
arg_default('skipWebUpdates',1);   % skip web plot updates by default

missingPointValue = NaN;        % For BB sites we'll use NaN to indicate missing values (new feature since Oct 20, 2019)

% Add file renaming + copying to \\paoa001
pth_db = db_pth_root;

fileExt = datestr(now,30);
fileExt = fileExt(1:8);

for k=1:length(yearIn)
    for j=1:length(sites)

        % Progress list for BB_MET (CR1000) logger
        cmdTMP = (['progressList' char(sites(j)) '_30min_Pth = fullfile(pth_db,''' char(sites(j))...
            '_30min_progressList_' num2str(yearIn(k)) '.mat'');']);
        eval(cmdTMP);
        
        % Path to Climate Database: HHClimatDatabase_Pth
        cmdTMP = ([char(sites(j)) 'ClimatDatabase_Pth = [pth_db ''yyyy\' char(sites(j))...
            '\Met\5min''];']);
        eval(cmdTMP);

        % Progress list for SmartFlux files: progressListHH_SmartFlux_Pth =
        % \\annex001\database\HH_SmartFlux_ProgressList
        cmdTMP = (['progressList' char(sites(j)) '_SmartFlux_Pth = fullfile(pth_db,''' char(sites(j))...
            '_SmartFlux_progressList_' num2str(yearIn(k)) '.mat'');']);
        eval(cmdTMP);

        % Path to Flux Database: HHFluxDataBase_Pth
        cmdTMP = ([char(sites(j)) 'FluxDatabase_Pth = [pth_db ''yyyy\' char(sites(j))...
            '\Flux\''];']);
        eval(cmdTMP);
        
        % move .DAT files from /old  to  old/yyyy  ; remove .DAT extension
        % and add date .yyyymmdd
        % This next group of lines is skipped because there is another 
        % LoggerNet task that does renaming. See renam_csi_dat_files.m
        % (Zoran 20190624)
        %------------------
        
%         filePath = sprintf('d:\\sites\\%s\\CSI_net\\',char(sites(j)));
%         datFiles = dir(fullfile(filePath,'*.dat'));
%         for i=1:length(datFiles)
%             sourceFile      = fullfile(filePath,datFiles(i).name);
%             destinationFile1 = fullfile(fullfile(filePath,num2str(yearIn(k))),[datFiles(i).name(1:end-3) fileExt]);
%             [Status1,Message1,MessageID1] = fr_movefile(sourceFile,destinationFile1);
%             if Status1 ~= 1
%                 uiwait(warndlg(sprintf('Message: %s\nSource path: %s\nDestination path: %s',...
%                     Message1,sourceFile,destinationFile1),'Moving files to PAOA001 failed','modal'))
%             end %if
%         end %i
% 
%         % move .DAT files from csi_net  to  csi_net/old/yyyy  ; remove .DAT extension
%         % and add date .yyyymmdd_a
%         filePath = sprintf('d:\\sites\\%s\\CSI_net\\',char(sites(j)));        
%         datFiles = dir(fullfile(filePath,'*.dat'));
%         for i=1:length(datFiles)
%             sourceFile      = fullfile(filePath,datFiles(i).name);
%             destinationFile1 = fullfile(fullfile([filePath 'old\\'],num2str(yearIn(k))),[datFiles(i).name(1:end-3) fileExt '_a']);
%             [Status1,Message1,MessageID1] = fr_movefile(sourceFile,destinationFile1);
%             if Status1 ~= 1
%                 uiwait(warndlg(sprintf('Message: %s\nSource path: %s\nDestination path: %s',...
%                     Message1,sourceFile,destinationFile1),'Moving files to PAOA001 failed','modal'))
%             end %if
%         end %i

%         % lastly, move *.* files from csi_net  to  csi_net/old/yyyy
%         % (those should be already in LGR1*.yyyymmdd format, renamed at the
%         % site already)
%         filePath = sprintf('d:\\sites\\%s\\CSI_net\\',char(sites(j)));        
%         datFiles = dir(fullfile(filePath,'*.*'));
%         for i=1:length(datFiles)
%             if  ~datFiles(i).isdir 
%                 sourceFile      = fullfile(filePath,datFiles(i).name);
%                 destinationFile1 = fullfile(fullfile([filePath 'old\\'],num2str(yearIn(k))),datFiles(i).name);
%                 [Status1,Message1,MessageID1] = fr_movefile(sourceFile,destinationFile1);
%                 if Status1 ~= 1
%                     uiwait(warndlg(sprintf('Message: %s\nSource path: %s\nDestination path: %s',...
%                         Message1,sourceFile,destinationFile1),'Moving files to PAOA001 failed','modal'))
%                 end %if
%             end
%         end %i       
            
        %=================================        
        % Process BB_MET (CR1000) logger
        % its table is updated in 5-minute intervals so I needed to add
        % "_30min_Pth,outputPath,2,0,5" to the end of cmdTMP (see below)
        % (Zoran 20190624)
        %=================================
        outputPath = fullfile(eval([char(sites(j)) 'ClimatDatabase_Pth'])); %#ok<*NASGU>
        cmdTMP = (['[numOfFilesProcessed,numOfDataPointsProcessed] = fr_site_met_database(''p:\sites\' char(sites(j)) ...
            '\MET\BB_MET.*''' ',[],[],[],progressList' ...
            char(sites(j)) '_30min_Pth,outputPath,2,0,5,[],missingPointValue);']);
        eval(cmdTMP);
        eval(['disp(sprintf(''' char(sites(j)) ...
            ' BB_MET:  Number of files processed = %d, Number of 5-minute periods = %d'',numOfFilesProcessed,numOfDataPointsProcessed))']);

        %=====================================
        % Process SmartFlux EP-summary files 
        %======================================
        
        % First synchronize the current SmartFlux download folder with the 
        % new one.
        fprintf('Synchronizing vmicromet.geog.ubc.ca SmartFlux folder with P:\\Sites\\BB\\Flux folder ...\n'); 
        dos('robocopy    \\vmicromet.geog.ubc.ca\sftptransfer\SmartFlux_Data  P:\Sites\BB\Flux /R:3 /W:10 /REG /NDL /NFL /NJH /log+:P:\Sites\Log_files\SmartFlux_sync.log');
        % Then process the new files
        outputPathStr = [char(sites(j)) 'FluxDatabase_Pth'];
        eval(['outputPath = ' outputPathStr ';']);
        inputPath = ['p:\sites\' char(sites(j)) '\Flux\' num2str(yearIn(k)) '*_EP-Summary*.txt'];
        cmdTMP = ['progressList = progressList' char(sites(j)) '_SmartFlux_Pth;'];  
        eval(cmdTMP);
        [numOfFilesProcessed,numOfDataPointsProcessed]= fr_SmartFlux_database(inputPath,progressList,outputPath,[],[],missingPointValue);           
        fprintf('%s  HH_SmartFlux:  Number of files processed = %d, Number of HHours = %d\n',char(sites(j)),numOfFilesProcessed,numOfDataPointsProcessed);

        % converte 5-minute files into 30-min files
        foo = BB_5min_2_30min(yearIn(k), char(sites(j)));
        
        if skipWebUpdates ==0 
            %fprintf('\n\n\n Temporarly removed BB_webupdate from the script while testing. Return it when done! \n\n');
            % create CSV files for the web server
            BB_webupdate

            % Upload CSV files to the web server
            dos('C:\Ubc_flux\BiometFTPsite\BB_Web_Update.bat');
        else
            fprintf('*** Web-plot update skipped. Use flag skipWebUpdates=0 to do the updates.\n\n');
        end
    end %j  site counter
    
end %k   year counter
 