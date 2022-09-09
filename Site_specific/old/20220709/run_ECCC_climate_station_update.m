function run_ECCC_climate_station_update
[yearNow,monthNow,~]= datevec(now);
monthRange = monthNow-1:monthNow;
db_ECCC_climate_station(yearNow,monthRange,49088,fullfile(biomet_database_default,'yyyy\BB\MET\ECCC'),60);