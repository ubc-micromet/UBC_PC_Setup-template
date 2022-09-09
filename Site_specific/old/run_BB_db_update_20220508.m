function run_BB_db_update(yearIn,sites,skipWebUpdates)

dv=datevec(now);
arg_default('yearIn',dv(1));
arg_default('sites',{'BB','BB2'});

%Run import for all sites, webplotting is optional
db_update_BB_site(yearIn,sites,skipWebUpdates);

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
