function BB_webupdate

% BB_webupdate
%
% Sara Knox             File created:       Oct 21, 2019                      

% This file is intended to create csv files to export data for web plots
% for Burns Bog (https://ibis.geog.ubc.ca/~micromet/data/burnsbog.html#)

%% Define path & csv output path, current time, and date range
pth = db_pth_root;  
opath = 'P:\Micromet_web\www\webdata\resources\csv\';
 
% Current time & year
c = clock;
Year_now = c(1);

% Define date range (i.e. years of interest)
Years = 2014:Year_now;

% plot figures?
plot_fig = 0; %0 for no, 1 for yes

%% Load time vector
var = 'clean_tv';  
tv = year_append(Years,'BB','Met',var,pth,8);                                   

formatOut = 'yyyy-mm-dd HH:MM:SS';
tv_export = datestr(tv,formatOut);

%% Air temperature (BBDTA)
var1_name = 'MET_HMP_T_2m_Avg';
var2_name = 'MET_HMP_T_30cm_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);

data = [var1 var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Air Temperature (2.05m)' 'Air Temperature (0.38m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBDTA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Relative humidity (BBRHA)
var1_name = 'MET_HMP_RH_2m_Avg';
var2_name = 'MET_HMP_RH_30cm_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);

data = [var1 var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Relative Humidity (2.05m)' 'Relative Humidity (0.38m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBRHA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Radiation (BBRAD)
var1_name = 'MET_CNR1_SWi_Avg';
var2_name = 'MET_CNR1_SWo_Avg';
var3_name = 'MET_CNR1_LWi_Avg';
var4_name = 'MET_CNR1_LWo_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);
var3 = year_append(Years,'BB','Met',var3_name,pth,1);
var4 = year_append(Years,'BB','Met',var4_name,pth,1);

data = [var1 var2 var3 var4];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Shortwave Irradiance (4.25m)' 'Shortwave Reflectance (4.25m)'...
    'Longwave Downward Radiation (4.25m)' 'Longwave Upward Radiation (4.25m)'};
cFormat = '%12.6f, %12.6f, %12.6f, %12.6f\n';
fileName = 'BBRAD.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% PAR (BBPAR)
var1_name = 'MET_PARin_Avg';
var2_name = 'MET_PARout_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);

data = [var1 var2];
if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Incoming Photosynthetic Active Radiation (1.80m)' 'Reflected Photosynthetic Active Radiation (4.25m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBPAR.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Wind velocity (BBWVA) - ADD CR1000 data 
var1_name = 'MET_Young_WS_Avg';
var2_name = 'wind_speed';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var1 var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Wind Velocity Cup Anemometer (5.00m)' 'Wind Velocity EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBWVA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Wind direction (BBWDA) - ADD CR1000 data 
var1_name = 'MET_Young_WS_WVc2';
var2_name = 'wind_dir'; 

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var1 var2];

if plot_fig == 1
    plot(tv, data,'.')
end

% Export as csv file
cHeader = {'Time (PST)' 'Wind Direction Cup Anemometer (5.00m)' 'Wind Direction EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBWDA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Turbulent Kinteric Energy (BBTKE) - ADD CR1000 data 
%var1_name = 'MET_Young_WS_Avg';
var2_name = 'TKE';

%var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'TKE EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f\n';
fileName = 'BBTKE.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Barometric Pressure (BBPSA) - ADD CR1000 data 
%var1_name = 'MET_Young_WS_Avg';
var2_name = 'air_pressure';
var3_name = 'MET_Barom_Press_kPa_Avg';

%var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);
var3 = year_append(Years,'BB','Met',var3_name,pth,1);

data = [var2./1000 var3];

% Basic filtering
data(data<95) = NaN;

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Barometric Pressure EC System 2 [Air] (1.80m)' ...
    'Barometric Pressure Barometer (1.5m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBSTA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Precipitation (BBPCT) 
var1_name = 'MET_RainTips_Tot';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);

data = [var1];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Precipitation (1.00m)'};
cFormat = '%12.6f\n';
fileName = 'BBPCT.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% SVWC (BBSMA) 
var1_name = 'MET_616_VolW_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);

data = [var1];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Soil Volumetric Water Content'};
cFormat = '%12.6f\n';
fileName = 'BBSMA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% SHF (BBSHA) 
var1_name = 'MET_SHFP_1_Avg';
var2_name = 'MET_SHFP_2_Avg';
var3_name = 'MET_SHFP_3_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);
var3 = year_append(Years,'BB','Met',var3_name,pth,1);

data = [var1 var2 var3];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Soil Heat Flux Density (uncorrected) (-0.05m) 1' ...
    'Soil Heat Flux Density (uncorrected) (-0.05m) 2' 'Soil Heat Flux Density (uncorrected) (-0.05m) 3'};
cFormat = '%12.6f, %12.6f, %12.6f\n';
fileName = 'BBSHA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Soil temperatures (BBSTA) 
var1_name = 'MET_SoilT_5cm_Avg';
var2_name = 'MET_SoilT_10cm_Avg';
var3_name = 'MET_SoilT_50cm_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);
var3 = year_append(Years,'BB','Met',var3_name,pth,1);

data = [var1 var2 var3];
data(data>100) = NaN;

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Soil Temperature (-0.05m)' ...
    'Soil Temperature (-0.10m)' 'Soil Temperature (-0.50m)'};
cFormat = '%12.6f, %12.6f, %12.6f\n';
fileName = 'BBSTA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Water temperatures (BBWTA) 
var1_name = 'MET_WaterT_10cm_Avg';
var2_name = 'MET_WaterT_30cm_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);

data = [var1 var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Water Temperature (-0.10m)' ...
    'Water Temperature (-0.30m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBWTA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% oxidation reduction potential (BBORP) 
var1_name = 'MET_WaterORP_10cm_Avg';
var2_name = 'MET_WaterORP_30cm_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);

data = [var1 var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Oxidation Reduction Potential (-0.10m)' ...
    'Oxidation Reduction Potential (-0.30m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBORP.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Water table depth & bog height (BBWPT) 
var1_name = 'MET_WaterLevel_Avg';
var2_name = 'MET_Bog_Height_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);

data = [var1 var2];
data(data > 500 | data < -300) = NaN;

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Water Table Height (-1.00m)' ...
    'Bog Height (1.00m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBWPT.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Sensible heat flux (BBQHB) - ADD CR1000 data 
%var1_name = 'MET_WaterLevel_Avg';
var2_name = 'H';

%var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Sensible Heat Flux (Best available) (1.80m) 2'};
cFormat = '%12.6f\n';
fileName = 'BBQHB.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Latent heat flux (BBQEB) - ADD CR1000 data 
%var1_name = 'MET_WaterLevel_Avg';
var2_name = 'LE';

%var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Latent Heat Flux (Best available) (1.80m) 2'};
cFormat = '%12.6f\n';
fileName = 'BBQEB.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Evapotranspiration (BBETB) - ADD CR1000 data 
%var1_name = 'MET_WaterLevel_Avg';
var2_name = 'ET';

%var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Evapotranspiration EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f\n';
fileName = 'BBETB.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% CO2 mixing ratio (BBC2A) - ADD CR1000 data 
%var1_name = 'MET_WaterLevel_Avg';
var2_name = 'co2_mixing_ratio';

%var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var2];

% Some basic filtering
data(data>10000) = NaN;

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'CO2 Mixing Ratio EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f\n';
fileName = 'BBC2A.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% CO2 flux (BBFCA) - ADD CR1000 data 
%var1_name = 'MET_WaterLevel_Avg';
var2_name = 'co2_flux';

%var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'CO2 Flux Corrected EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f\n';
fileName = 'BBFCA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Methane mixing ratios (BBC4A) 
var1_name = 'ch4_mixing_ratio';

var1 = year_append(Years,'BB','Flux',var1_name,pth,1);

data = [var1];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'CH4 Mixing Ratio EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f\n';
fileName = 'BBC4A.csv';

%% Methane flux (BBFMA) 
var1_name = 'ch4_flux';

var1 = year_append(Years,'BB','Flux',var1_name,pth,1);

data = [var1];
data = data.*1000; % convert from umol m-2 s-1 to nmol m-2 s-1

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'CH4 Flux Corrected EC System 2 [Smartflux] (1.80m)'};
cFormat = '%12.6f\n';
fileName = 'BBFMA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Voltage (BBBVA) 
var1_name = 'SYS_CR1000_Batt_Volt_Avg';
var2_name = 'SYS_PBox_Batt_Volt_Avg';
var3_name = 'SYS_PBox_Batt_Volt2_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);
var3 = year_append(Years,'BB','Met',var3_name,pth,1);

data = [var1 var2 var3];

% Basic filtering
data(data > 50 | data < 5) = NaN;

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Logger Voltage' 'Battery Voltage 1' 'Battery Voltage 2'};
cFormat = '%12.6f, %12.6f, %12.6f\n';
fileName = 'BBBVA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Power System Current (BBBCR) 
var1_name = 'SYS_Batt_DCCurrent_Avg';
var2_name = 'SYS_Batt_DCCurrent2_Avg';

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);

data = [var1 var2];
data = -data;

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Battery Current 1' 'Battery Current 2'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBBCR.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% System temperatures (BBXTA) 
var1_name = 'SYS_PanelT_CR1000_Avg';
var2_name = 'SYS_BatteryBoxTC_Avg';
var3_name = 'SYS_BatteryBoxTC2_Avg';
var4_name = 'MET_CNR1_TC_Avg'; 

var1 = year_append(Years,'BB','Met',var1_name,pth,1);
var2 = year_append(Years,'BB','Met',var2_name,pth,1);
var3 = year_append(Years,'BB','Met',var3_name,pth,1);
var4 = year_append(Years,'BB','Met',var4_name,pth,1);

data = [var1 var2 var3 var4];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Panel Temperature' 'Battery Box Temperature 1' ...
    'Battery Box Temperature 2' 'Case Temperature (4.25m)'};
cFormat = '%12.6f, %12.6f, %12.6f, %12.6f\n';
fileName = 'BBXTA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)

%% Gas analyzer signal strengths (BBSSA)
var1_name = 'avg_signal_strength_7200_mean';
var2_name = 'rssi_77_mean';

var1 = year_append(Years,'BB','Flux',var1_name,pth,1);
var2 = year_append(Years,'BB','Flux',var2_name,pth,1);

data = [var1 var2];

if plot_fig == 1
    plot(tv, data)
end

% Export as csv file
cHeader = {'Time (PST)' 'Average Signal Strength of LI-7200 (1.80m)' 'Average Signal Strength Li-7700 (1.80m)'};
cFormat = '%12.6f, %12.6f\n';
fileName = 'BBSSA.csv';

csv_save(cHeader,opath,fileName,cellstr(tv_export),cFormat,data)
