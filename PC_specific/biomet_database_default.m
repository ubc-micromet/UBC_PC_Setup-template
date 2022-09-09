function x = biomet_database_default
% Micromet database default path

% Edit the lines below to make it work on your PC.
if ispc
    % if you are connected to Geog VPN and working from home:
    x = '\\vinimet.geog.ubc.ca\Database\';
    % if you are working on your local copy of database 
    % and you have it in your Documents folder:
    % x = 'C:\Users\your_name\Documents\Database'
elseif ismac
    % if you are on a Mac and have mounted remote 
    % drive vinimet.geog.ubc.ca/Database
    x = '/Volumes/Database/';
    % if you are working on your local copy of database 
    % and you have it in your Library folder:
    %x = '/Users/your_name/Library/Database/';
end

