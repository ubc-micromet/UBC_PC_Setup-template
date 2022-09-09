function run_BB_db_update(yearIn,sites)

dv=datevec(now);
arg_default('yearIn',dv(1));
arg_default('sites',{'BB','BB2'});


db_update_BB_site(yearIn,sites,0);

exit