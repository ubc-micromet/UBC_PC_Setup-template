server = 0;

% Edit the lines below to make it work on your PC.
if ispc
    % your default folder for Matlab files on your PC
    user_dir = 'C:\Users\your_name\Documents\Matlab';
elseif ismac
    % your default folder for Matlab files on your PC
    user_dir = '/Users/your_name/Matlab/';
end

if ~exist(user_dir,'dir')
    user_dir = '';
end