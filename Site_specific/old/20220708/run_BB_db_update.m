function run_BB_db_update(yearIn,sites,skipWebUpdates)

dv=datevec(now);
arg_default('yearIn',dv(1));                                  % default - current year
arg_default('sites',{'BB','BB2','DSM','RBM','Young','Hogg'}); % default - all sites
arg_default('skipWebUpdates',0);                              % default - update Web

%Run import for all sites, webplotting is optional
try
    db_update_BB_site(yearIn,sites,skipWebUpdates);
catch
    fprintf('An error happen while running db_update_BB_site in run_BB_db_update.m\n');
end
%Run photo download for the two tidal sites
siteID = char(sites);
switch siteID
    case 'DSM'
        %Photo_Download(sites,[]);
        netCam_Link = 'http://173.181.139.5:4925/netcam.jpg';
    case 'RBM'
        %Photo_Download(sites,[]);
        netCam_Link = 'http://173.181.139.4:4925/netcam.jpg';
end

Call_WebCam_Picture(siteID,netCam_Link)

%Run quick daily total calculation for Pascal (DUC)
switch siteID
    case 'Hogg'
        Manitoba_dailyvalues(sites,[]);
    case 'Young'
        Manitoba_dailyvalues(sites,[]);
end
