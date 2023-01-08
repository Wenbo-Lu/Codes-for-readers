% get monthly-binned RAPID T/S profiles
% RAPID profiles (monthlyTS_previous) can be download from https://rapid.ac.uk/rapidmoc/rapid_data/datadl.php

clear,clc,close all
ncdisp('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc')
pres = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','pressure');
%26.52N/76.74W;26.99N/16.23W
TW_raw = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','TG_west');
TW_flag = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','TG_east_flag');
TW_raw(TW_raw<-20) = nan;
TE_raw = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','TG_east');
TE_flag = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','TG_east_flag');
TE_raw(TE_raw<-20) = nan;
SW_raw = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','SG_west');
SW_flag = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','SG_east_flag');
SW_raw(SW_raw<20) = nan;
SE_raw = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','SG_east');
SE_flag = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','SG_east_flag');
SE_raw(SE_raw<20) = nan;

time = ncread('J:\AMOC\RAPID to2020\raw data\ts_gridded0.nc','time')+datenum(2004,4,0);

% T = datestr(time);
t = 1:204;
for year = 2004:2020
    for month = 1:12
        t((year-2004)*12+month) = datenum(year,month,1);
    end
end

TW = zeros(204,242);
TE = zeros(204,242);
SW = zeros(204,242);
SE = zeros(204,242);

for i = 2:203
    TW(i,:) = mean(TW_raw(find(time>=t(i) & time<t(i+1)),:),'omitnan');
    TE(i,:) = mean(TE_raw(find(time>=t(i) & time<t(i+1)),:),'omitnan');
    SW(i,:) = mean(SW_raw(find(time>=t(i) & time<t(i+1)),:),'omitnan');
    SE(i,:) = mean(SE_raw(find(time>=t(i) & time<t(i+1)),:),'omitnan');
end
SE(1,:) = nan;
TE(1,:) = nan;
SW(1,:) = nan;
TW(1,:) = nan;
SE(end,:) = nan;
TE(end,:) = nan;
SW(end,:) = nan;
TW(end,:) = nan;


contourf(TW)
colorbar
save('J:\AMOC\RAPID to2020\revision\intermediatedata\monthlyTS_previous.mat','TW','TE','SW','SE','pres','t')
