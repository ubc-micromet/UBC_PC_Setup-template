%===================================================================
%
%               This is standard Startup.m file for BIOMET group
%
%===================================================================

%
% (c) Zoran Nesic           File created:                1995
%                           Last modification:   Sep  9, 2022

%
% Revisions:
%
%   Sep 9, 2022 (Zoran)
%       - Start making changes so this function can work with MacOS as well
%         as with Windows. When we decide to go with Git and stop backing up
%         and/or copying Biomet.net manually, we can get rid of \\paoa001 option
%         because every user will be able to maintain an up-to-date Biomet.net
%         on their PC/Mac.
%   Feb 3, 2017 (Zoran)
%       - Added path to UTILS folder for the server (PAOA001) only
%         (this might be needed on other machines too)
%   Jan 18, 2006
%       - did the below for the \\paoa001 paths too.
%   May 20, 2004
%       - added path Trace_Analysys_FCRN_THIRDSTAGE
%   Apr 26, 2004
%       - added path SystemComparison
%   Apr 17, 2004
%       - added paths for new_eddy
%   May 30, 2001
%       - added paths for the Trace Analysis tools (FirstStage,SecondStage and Tools)
%   Dec  4, 2000
%       - added checking for run_matlab_1.m
%   Nov 30, 2000
%       - changed the old path to site_specific to:
%           c:\ubc_pc_setup\site_specific
%                          \pc_specific
%   Sep 25, 1998
%       -   changed of name: PAOA_001 -> PAOA001
%   Apr 24, 1998
%       -   removed the \\paoa_001\...\new_met\site_specific from the path list
%   Apr 20, 1998
%       -   added xxx\new_met\site_specific to the rest of the paths
%           This directory will hold information/files that are specific
%           for that particular computer so we don't overwrite them each
%           time xxx\new_met software is synchronized with PAOA_001 PC.
%

% Call the setup program for this machine (it sets user_dir
% and server variables)
user_set

%
% Biomet toolbox path (mirror copy of the server's toolbox is stored there)
% (This can be removed once every PC starts maintaining its own Biomet.net
%  via GitHub)
if ispc
    % this works on PC-s only
    path('c:\Biomet.net\matlab\TraceAnalysis_FCRN_THIRDSTAGE',path);
    path('c:\Biomet.net\matlab\TraceAnalysis_Tools',path);
    path('c:\Biomet.net\matlab\TraceAnalysis_SecondStage',path);
    path('c:\Biomet.net\matlab\TraceAnalysis_FirstStage',path);
    path('c:\Biomet.net\matlab\soilchambers',path); 
    path('c:\Biomet.net\matlab\BOREAS',path);
    path('c:\Biomet.net\matlab\BIOMET',path);      
    path('c:\Biomet.net\matlab\new_met',path);      
    path('c:\Biomet.net\matlab\met',path);    
    path('c:\Biomet.net\matlab\new_eddy',path); 
    path('c:\Biomet.net\matlab\SystemComparison',path);         % use this line on the workstations
    path('c:\Biomet.net\matlab\Micromet',path);
    % These two files always 
    path('c:\ubc_PC_setup\site_specific',path);      
    path('c:\ubc_PC_setup\PC_specific',path);
elseif ismac
    % this works on Mac-s only
    path('/Users/your_name/Code/Biomet.net/matlabTraceAnalysis_FCRN_THIRDSTAGE',path);
    path('/Users/your_name/Code/Biomet.net/matlabTraceAnalysis_Tools',path);
    path('/Users/your_name/Code/Biomet.net/matlabTraceAnalysis_SecondStage',path);
    path('/Users/your_name/Code/Biomet.net/matlabTraceAnalysis_FirstStage',path);
    path('/Users/your_name/Code/Biomet.net/matlabsoilchambers',path); 
    path('/Users/your_name/Code/Biomet.net/matlabBOREAS',path);
    path('/Users/your_name/Code/Biomet.net/matlabBIOMET',path);      
    path('/Users/your_name/Code/Biomet.net/matlabnew_met',path);      
    path('/Users/your_name/Code/Biomet.net/matlabmet',path);    
    path('/Users/your_name/Code/Biomet.net/matlabnew_eddy',path); 
    path('/Users/your_name/Code/Biomet.net/matlabSystemComparison',path);         % use this line on the workstations
    path('/Users/your_name/Code/Biomet.net/matlabMicromet',path);
    % These two files always 
    path('/Users/your_name/Code/ubc_PC_setup/site_specific',path);      
    path('/Users/your_name/Code/ubc_PC_setup/PC_specific',path);   
end

path(user_dir,path);

% If the user wants to customize his Matlab environment he may create
% the localrc.m file in Matlab's main directory
if exist('localrc','file') ~= 0
    localrc
end

clear server user_dir
