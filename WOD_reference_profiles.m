% This code calculates the reference profiles in APPENDIX A from WOD data
% You can download WOD data from https://www.ncei.noaa.gov/products/world-ocean-database

clear,clc,close all
ncdisp('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL17.nc')
TW = zeros(17,12);
z = ncread('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL9.nc','z');
cd('J:\AMOC\derived data\WOD_PFL')
mount = zeros(17,1);

for year = 2004:2020
    tic
    %PFL
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %western boundary 74W-78W ,26-27N
        eval(['T' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['T_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

T_size = [T_size1;T_size2;T_size3;T_size4;T_size5;T_size6;T_size7;T_size8;T_size9;...
    T_size10;T_size11;T_size12;T_size13;T_size14;T_size15;T_size16;T_size17];
clear T_size1 T_size2 T_size3 T_size4 T_size5 T_size6 T_size7 T_size8 T_size9 T_size10 T_size11 T_size12 T_size13 T_size14 T_size15 T_size16 T_size17
time = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16;time17];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16 time17
T = [T1;T2;T3;T4;T5;T6;T7;T8;T9;...
    T10;T11;T12;T13;T14;T15;T16;T17];
clear T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 T17
lat = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16;lat17];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16 lat17
lon = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16;lon17];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16 lon17

%CTD
T9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Temperature');
time9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','time')+datenum(1770,1,0);
T_size9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Temperature_row_size');
% TIME = datestr(time);
lat9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lat');
lon9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lon');

T10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Temperature');
time10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','time')+datenum(1770,1,0);
T_size10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Temperature_row_size');
lat10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lat');
lon10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lon');


T11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Temperature');
time11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','time')+datenum(1770,1,0);
T_size11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Temperature_row_size');
lat11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lat');
lon11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lon');


T12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Temperature');
time12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','time')+datenum(1770,1,0);
T_size12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Temperature_row_size');
lat12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lat');
lon12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lon');


T13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Temperature');
time13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','time')+datenum(1770,1,0);
T_size13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Temperature_row_size');
lat13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lat');
lon13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lon');


T14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Temperature');
time14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','time')+datenum(1770,1,0);
T_size14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Temperature_row_size');
lat14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lat');
lon14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lon');

T_size0 = [T_size9;T_size10;T_size11;T_size12;T_size13;T_size14];
clear T_size9 T_size10 T_size11 T_size12 T_size13 T_size14
T0 = [T9;T10;T11;T12;T13;T14];
clear T9 T10 T11 T12 T13 T14
lat0 = [lat9;lat10;lat11;lat12;lat13;lat14];
clear lat9 lat10 lat11 lat12 lat13 lat14
lon0 = [lon9;lon10;lon11;lon12;lon13;lon14];
clear lon9 lon10 lon11 lon12 lon13 lon14
time0 = [time9;time10;time11;time12;time13;time14];
clear time9 time10 time11 time12 time13 time14

T_size = [T_size;T_size0];
clear T_size0;
T = [T;T0];
clear T0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

%GLD
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %western boundary 74W-78W ,26-27N
        eval(['T' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['T_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

T_size0 = [T_size1;T_size2;T_size3;T_size4;T_size5;T_size6;T_size7;T_size8;T_size9;...
    T_size10;T_size11;T_size12;T_size13;T_size14;T_size15;T_size16];
clear T_size1 T_size2 T_size3 T_size4 T_size5 T_size6 T_size7 T_size8 T_size9 T_size10 T_size11 T_size12 T_size13 T_size14 T_size15 T_size16
time0 = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16
T0 = [T1;T2;T3;T4;T5;T6;T7;T8;T9;...
    T10;T11;T12;T13;T14;T15;T16];
clear T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16
lat0 = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16
lon0 = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16

T_size = [T_size;T_size0];
clear T_size0;
T = [T;T0];
clear T0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

lat(isnan(T_size)) = [];
lon(isnan(T_size)) = [];
T_size(isnan(T_size)) = [];
time(isnan(T_size)) = [];

%get the target profiles
location_time = find(time>=datenum(year,1,1) & time<datenum(year+1,1,1));
location_size = find(T_size>=26);
location_lat = find(lat>=25 & lat<=28);
location_lon = find(lon>=-78 & lon<=-74);
location = intersect(location_time,location_size);
location = intersect(location,location_lat);
location = intersect(location,location_lon);
lat = lat(location);lon = lon(location);
T0 = zeros(length(location),26);
for i = 1:length(location)
    T0(i,:) = T(sum(T_size(1:location(i)-1))+1:sum(T_size(1:location(i)-1))+26);
end
mount(year-2003) = length(location);

%interp the missing values in some profiles
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(T0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end

if ~isempty(cutnan)
    for i = 1:length(cutnan)
    interp0 = T0(cutnan(i),:);
    if ~isnan(interp0(3))
    z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
    z = z0;
    z0(isnan(interp0)) = [];interp0(isnan(interp0)) = [];
    T0(cutnan(i),:) = interp1(z0,interp0,z,'linear','extrap');
    end
    end
end
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(T0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end
if ~isempty(cutnan)
T0(cutnan,:) = [];lat(cutnan) = [];lon(cutnan) = [];
end

%Inverse Distance Weighted method 26.52N/76.74W;
dist = zeros(size(lat));
for i = 1:size(lat)
    dist(i) = sw_dist([lat(i) 26.52],[lon(i) -76.74],'km');
end
dist_reverse = 1./dist;
T = zeros(1,26);
for i = 1:26
    T(i) = sum(T0(:,i).*dist_reverse)/sum(dist_reverse);
end

%Interp to RAPID standard layers
z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
pres0 = sw_pres(z0,26.52);
pres_upper = 0:20:220;
TW(year-2003,:) = interp1(pres0,T,pres_upper);
% TW(year-2003,:) = T;
    year
    toc
end
save('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\TW.mat','TW','pres_upper')

%%
clear,clc,close all

ncdisp('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL17.nc')
TE = zeros(17,12);
z = ncread('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL9.nc','z');
cd('J:\AMOC\derived data\WOD_PFL')
mount = zeros(17,1);

for year = 2004:2020
    tic
    %PFL
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %eastern boundary 18W-12W ,26-27
        eval(['T' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['T_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

T_size = [T_size1;T_size2;T_size3;T_size4;T_size5;T_size6;T_size7;T_size8;T_size9;...
    T_size10;T_size11;T_size12;T_size13;T_size14;T_size15;T_size16;T_size17];
clear T_size1 T_size2 T_size3 T_size4 T_size5 T_size6 T_size7 T_size8 T_size9 T_size10 T_size11 T_size12 T_size13 T_size14 T_size15 T_size16 T_size17
time = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16;time17];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16 time17
T = [T1;T2;T3;T4;T5;T6;T7;T8;T9;...
    T10;T11;T12;T13;T14;T15;T16;T17];
clear T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 T17
lat = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16;lat17];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16 lat17
lon = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16;lon17];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16 lon17

%CTD
T9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Temperature');
time9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','time')+datenum(1770,1,0);
T_size9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Temperature_row_size');
% TIME = datestr(time);
lat9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lat');
lon9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lon');

T10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Temperature');
time10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','time')+datenum(1770,1,0);
T_size10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Temperature_row_size');
lat10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lat');
lon10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lon');


T11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Temperature');
time11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','time')+datenum(1770,1,0);
T_size11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Temperature_row_size');
lat11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lat');
lon11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lon');


T12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Temperature');
time12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','time')+datenum(1770,1,0);
T_size12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Temperature_row_size');
lat12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lat');
lon12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lon');


T13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Temperature');
time13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','time')+datenum(1770,1,0);
T_size13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Temperature_row_size');
lat13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lat');
lon13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lon');


T14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Temperature');
time14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','time')+datenum(1770,1,0);
T_size14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Temperature_row_size');
lat14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lat');
lon14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lon');

T_size0 = [T_size9;T_size10;T_size11;T_size12;T_size13;T_size14];
clear T_size9 T_size10 T_size11 T_size12 T_size13 T_size14
T0 = [T9;T10;T11;T12;T13;T14];
clear T9 T10 T11 T12 T13 T14
lat0 = [lat9;lat10;lat11;lat12;lat13;lat14];
clear lat9 lat10 lat11 lat12 lat13 lat14
lon0 = [lon9;lon10;lon11;lon12;lon13;lon14];
clear lon9 lon10 lon11 lon12 lon13 lon14
time0 = [time9;time10;time11;time12;time13;time14];
clear time9 time10 time11 time12 time13 time14

T_size = [T_size;T_size0];
clear T_size0;
T = [T;T0];
clear T0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

%GLD
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %western boundary 74W-78W ,26-27N
        eval(['T' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['T_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Temperature_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

T_size0 = [T_size1;T_size2;T_size3;T_size4;T_size5;T_size6;T_size7;T_size8;T_size9;...
    T_size10;T_size11;T_size12;T_size13;T_size14;T_size15;T_size16];
clear T_size1 T_size2 T_size3 T_size4 T_size5 T_size6 T_size7 T_size8 T_size9 T_size10 T_size11 T_size12 T_size13 T_size14 T_size15 T_size16
time0 = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16
T0 = [T1;T2;T3;T4;T5;T6;T7;T8;T9;...
    T10;T11;T12;T13;T14;T15;T16];
clear T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16
lat0 = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16
lon0 = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16

T_size = [T_size;T_size0];
clear T_size0;
T = [T;T0];
clear T0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

lat(isnan(T_size)) = [];
lon(isnan(T_size)) = [];
T_size(isnan(T_size)) = [];
time(isnan(T_size)) = [];

%get the target profiles
location_time = find(time>=datenum(year,1,1) & time<datenum(year+1,1,1));
location_size = find(T_size>=26);
location_lat = find(lat>=25 & lat<=28);
location_lon = find(lon>=-18 & lon<=-12);
location = intersect(location_time,location_size);
location = intersect(location,location_lat);
location = intersect(location,location_lon);
lat = lat(location);lon = lon(location);
T0 = zeros(length(location),26);
for i = 1:length(location)
    T0(i,:) = T(sum(T_size(1:location(i)-1))+1:sum(T_size(1:location(i)-1))+26);
end
mount(year-2003) = length(location);

%interp the missing values in some profiles
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(T0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end

if ~isempty(cutnan)
    for i = 1:length(cutnan)
    interp0 = T0(cutnan(i),:);
    if ~isnan(interp0(3))
    z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
    z = z0;
    z0(isnan(interp0)) = [];interp0(isnan(interp0)) = [];
    T0(cutnan(i),:) = interp1(z0,interp0,z,'linear','extrap');
    end
    end
end
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(T0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end
if ~isempty(cutnan)
T0(cutnan,:) = [];lat(cutnan) = [];lon(cutnan) = [];
end

%Inverse Distance Weighted method 26.99N/16.23W;
dist = zeros(size(lat));
for i = 1:size(lat)
    dist(i) = sw_dist([lat(i) 26.99],[lon(i) -16.23],'km');
end
dist_reverse = 1./dist;
T = zeros(1,26);
for i = 1:26
    T(i) = sum(T0(:,i).*dist_reverse)/sum(dist_reverse);
end

%Interp to RAPID standard layers
z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
pres0 = sw_pres(z0,26.99);
pres_upper = 0:20:220;
TE(year-2003,:) = interp1(pres0,T,pres_upper);
% TE(year-2003,:) = T;
    year
    toc
end
save('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\TE.mat','TE','pres_upper')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
clear,clc,close all

ncdisp('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL17.nc')
SW = zeros(17,12);
z = ncread('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL9.nc','z');
cd('J:\AMOC\derived data\WOD_PFL')
mount = zeros(17,1);

for year = 2004:2020
    tic
    %PFL
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %western boundary 74W-78W ,26-27N
        eval(['S' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['S_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

S_size = [S_size1;S_size2;S_size3;S_size4;S_size5;S_size6;S_size7;S_size8;S_size9;...
    S_size10;S_size11;S_size12;S_size13;S_size14;S_size15;S_size16;S_size17];
clear S_size1 S_size2 S_size3 S_size4 S_size5 S_size6 S_size7 S_size8 S_size9 S_size10 S_size11 S_size12 S_size13 S_size14 S_size15 S_size16 S_size17
time = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16;time17];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16 time17
S = [S1;S2;S3;S4;S5;S6;S7;S8;S9;...
    S10;S11;S12;S13;S14;S15;S16;S17];
clear S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 S13 S14 S15 S16 S17
lat = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16;lat17];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16 lat17
lon = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16;lon17];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16 lon17

%CTD
S9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Salinity');
time9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','time')+datenum(1770,1,0);
S_size9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Salinity_row_size');
% TIME = datestr(time);
lat9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lat');
lon9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lon');

S10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Salinity');
time10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','time')+datenum(1770,1,0);
S_size10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Salinity_row_size');
lat10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lat');
lon10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lon');


S11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Salinity');
time11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','time')+datenum(1770,1,0);
S_size11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Salinity_row_size');
lat11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lat');
lon11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lon');


S12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Salinity');
time12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','time')+datenum(1770,1,0);
S_size12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Salinity_row_size');
lat12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lat');
lon12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lon');


S13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Salinity');
time13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','time')+datenum(1770,1,0);
S_size13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Salinity_row_size');
lat13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lat');
lon13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lon');


S14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Salinity');
time14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','time')+datenum(1770,1,0);
S_size14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Salinity_row_size');
lat14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lat');
lon14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lon');

S_size0 = [S_size9;S_size10;S_size11;S_size12;S_size13;S_size14];
clear S_size9 S_size10 S_size11 S_size12 S_size13 S_size14
S0 = [S9;S10;S11;S12;S13;S14];
clear S9 S10 S11 S12 S13 S14
lat0 = [lat9;lat10;lat11;lat12;lat13;lat14];
clear lat9 lat10 lat11 lat12 lat13 lat14
lon0 = [lon9;lon10;lon11;lon12;lon13;lon14];
clear lon9 lon10 lon11 lon12 lon13 lon14
time0 = [time9;time10;time11;time12;time13;time14];
clear time9 time10 time11 time12 time13 time14

S_size = [S_size;S_size0];
clear S_size0;
S = [S;S0];
clear S0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

%GLD
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %western boundary 74W-78W ,26-27N
        eval(['S' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['S_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

S_size0 = [S_size1;S_size2;S_size3;S_size4;S_size5;S_size6;S_size7;S_size8;S_size9;...
    S_size10;S_size11;S_size12;S_size13;S_size14;S_size15;S_size16];
clear S_size1 S_size2 S_size3 S_size4 S_size5 S_size6 S_size7 S_size8 S_size9 S_size10 S_size11 S_size12 S_size13 S_size14 S_size15 S_size16
time0 = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16
S0 = [S1;S2;S3;S4;S5;S6;S7;S8;S9;...
    S10;S11;S12;S13;S14;S15;S16];
clear S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 S13 S14 S15 S16
lat0 = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16
lon0 = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16

S_size = [S_size;S_size0];
clear S_size0;
S = [S;S0];
clear S0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

lat(isnan(S_size)) = [];
lon(isnan(S_size)) = [];
S_size(isnan(S_size)) = [];
time(isnan(S_size)) = [];

%get the target profiles
location_time = find(time>=datenum(year,1,1) & time<datenum(year+1,1,1));
location_size = find(S_size>=26);
location_lat = find(lat>=25 & lat<=28);
location_lon = find(lon>=-78 & lon<=-74);
location = intersect(location_time,location_size);
location = intersect(location,location_lat);
location = intersect(location,location_lon);
lat = lat(location);lon = lon(location);
S0 = zeros(length(location),26);
for i = 1:length(location)
    S0(i,:) = S(sum(S_size(1:location(i)-1))+1:sum(S_size(1:location(i)-1))+26);
end
mount(year-2003) = length(location);

%interp the missing values in some profiles
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(S0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end

if ~isempty(cutnan)
    for i = 1:length(cutnan)
    interp0 = S0(cutnan(i),:);
    if ~isnan(interp0(3))
    z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
    z = z0;
    z0(isnan(interp0)) = [];interp0(isnan(interp0)) = [];
    S0(cutnan(i),:) = interp1(z0,interp0,z,'linear','extrap');
    end
    end
end
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(S0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end
if ~isempty(cutnan)
S0(cutnan,:) = [];lat(cutnan) = [];lon(cutnan) = [];
end

%Inverse Distance Weighted method 26.52N/76.74W;
dist = zeros(size(lat));
for i = 1:size(lat)
    dist(i) = sw_dist([lat(i) 26.52],[lon(i) -76.74],'km');
end
dist_reverse = 1./dist;
S = zeros(1,26);
for i = 1:26
    S(i) = sum(S0(:,i).*dist_reverse)/sum(dist_reverse);
end

%Interp to RAPID standard layers
z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
pres0 = sw_pres(z0,26.52);
pres_upper = 0:20:220;
SW(year-2003,:) = interp1(pres0,S,pres_upper);
% SW(year-2003,:) = S;
    year
    toc
end
save('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\SW.mat','SW','pres_upper')

%%
clear,clc,close all

ncdisp('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL17.nc')
SE = zeros(17,12);
z = ncread('J:\AMOC\derived data\WOD_PFL\ocldb1645518824.18812_PFL9.nc','z');
cd('J:\AMOC\derived data\WOD_PFL')
mount = zeros(17,1);

for year = 2004:2020
    tic
    %PFL
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %eastern74W-78W ,26-27N
        eval(['S' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['S_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

S_size = [S_size1;S_size2;S_size3;S_size4;S_size5;S_size6;S_size7;S_size8;S_size9;...
    S_size10;S_size11;S_size12;S_size13;S_size14;S_size15;S_size16;S_size17];
clear S_size1 S_size2 S_size3 S_size4 S_size5 S_size6 S_size7 S_size8 S_size9 S_size10 S_size11 S_size12 S_size13 S_size14 S_size15 S_size16 S_size17
time = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16;time17];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16 time17
S = [S1;S2;S3;S4;S5;S6;S7;S8;S9;...
    S10;S11;S12;S13;S14;S15;S16;S17];
clear S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 S13 S14 S15 S16 S17
lat = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16;lat17];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16 lat17
lon = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16;lon17];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16 lon17

%CTD
S9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Salinity');
time9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','time')+datenum(1770,1,0);
S_size9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','Salinity_row_size');
% TIME = datestr(time);
lat9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lat');
lon9 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD9.nc','lon');

S10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Salinity');
time10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','time')+datenum(1770,1,0);
S_size10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','Salinity_row_size');
lat10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lat');
lon10 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD10.nc','lon');


S11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Salinity');
time11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','time')+datenum(1770,1,0);
S_size11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','Salinity_row_size');
lat11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lat');
lon11 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD11.nc','lon');


S12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Salinity');
time12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','time')+datenum(1770,1,0);
S_size12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','Salinity_row_size');
lat12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lat');
lon12 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD12.nc','lon');


S13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Salinity');
time13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','time')+datenum(1770,1,0);
S_size13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','Salinity_row_size');
lat13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lat');
lon13 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD13.nc','lon');


S14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Salinity');
time14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','time')+datenum(1770,1,0);
S_size14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','Salinity_row_size');
lat14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lat');
lon14 = ncread('J:\AMOC\derived data\WOD_CTD\CTD\ocldb1644784938.1043_CTD14.nc','lon');

S_size0 = [S_size9;S_size10;S_size11;S_size12;S_size13;S_size14];
clear S_size9 S_size10 S_size11 S_size12 S_size13 S_size14
S0 = [S9;S10;S11;S12;S13;S14];
clear S9 S10 S11 S12 S13 S14
lat0 = [lat9;lat10;lat11;lat12;lat13;lat14];
clear lat9 lat10 lat11 lat12 lat13 lat14
lon0 = [lon9;lon10;lon11;lon12;lon13;lon14];
clear lon9 lon10 lon11 lon12 lon13 lon14
time0 = [time9;time10;time11;time12;time13;time14];
clear time9 time10 time11 time12 time13 time14

S_size = [S_size;S_size0];
clear S_size0;
S = [S;S0];
clear S0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

%GLD
    filename = dir('J:\AMOC\derived data\WOD_PFL\*.nc');
    for i = 1:17
        %eastern74W-78W ,26-27N
        eval(['S' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity'');'])
        eval(['time' num2str(i) ' = ncread(filename(' num2str(i) ').name,''time'')+datenum(1770,1,0);'])
        eval(['S_size' num2str(i) ' = ncread(filename(' num2str(i) ').name,''Salinity_row_size'');'])
        eval(['lat' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lat'');'])
        eval(['lon' num2str(i) ' = ncread(filename(' num2str(i) ').name,''lon'');'])
    end

S_size0 = [S_size1;S_size2;S_size3;S_size4;S_size5;S_size6;S_size7;S_size8;S_size9;...
    S_size10;S_size11;S_size12;S_size13;S_size14;S_size15;S_size16];
clear S_size1 S_size2 S_size3 S_size4 S_size5 S_size6 S_size7 S_size8 S_size9 S_size10 S_size11 S_size12 S_size13 S_size14 S_size15 S_size16
time0 = [time1;time2;time3;time4;time5;time6;time7;time8;time9;...
    time10;time11;time12;time13;time14;time15;time16];
clear time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16
S0 = [S1;S2;S3;S4;S5;S6;S7;S8;S9;...
    S10;S11;S12;S13;S14;S15;S16];
clear S1 S2 S3 S4 S5 S6 S7 S8 S9 S10 S11 S12 S13 S14 S15 S16
lat0 = [lat1;lat2;lat3;lat4;lat5;lat6;lat7;lat8;lat9;...
    lat10;lat11;lat12;lat13;lat14;lat15;lat16];
clear lat1 lat2 lat3 lat4 lat5 lat6 lat7 lat8 lat9 lat10 lat11 lat12 lat13 lat14 lat15 lat16
lon0 = [lon1;lon2;lon3;lon4;lon5;lon6;lon7;lon8;lon9;...
    lon10;lon11;lon12;lon13;lon14;lon15;lon16];
clear lon1 lon2 lon3 lon4 lon5 lon6 lon7 lon8 lon9 lon10 lon11 lon12 lon13 lon14 lon15 lon16

S_size = [S_size;S_size0];
clear S_size0;
S = [S;S0];
clear S0;
time = [time;time0];
clear time0;
lat = [lat;lat0];
clear lat0;
lon = [lon;lon0];
clear lon0;

lat(isnan(S_size)) = [];
lon(isnan(S_size)) = [];
S_size(isnan(S_size)) = [];
time(isnan(S_size)) = [];

location_time = find(time>=datenum(year,1,1) & time<datenum(year+1,1,1));
location_size = find(S_size>=26);
location_lat = find(lat>=25 & lat<=28);
location_lon = find(lon>=-18 & lon<=-12);
location = intersect(location_time,location_size);
location = intersect(location,location_lat);
location = intersect(location,location_lon);
lat = lat(location);lon = lon(location);
S0 = zeros(length(location),26);
for i = 1:length(location)
    S0(i,:) = S(sum(S_size(1:location(i)-1))+1:sum(S_size(1:location(i)-1))+26);
end
mount(year-2003) = length(location);

%interp the missing values in some profiles
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(S0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end

if ~isempty(cutnan)
    for i = 1:length(cutnan)
    interp0 = S0(cutnan(i),:);
    if ~isnan(interp0(3))
    z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
    z = z0;
    z0(isnan(interp0)) = [];interp0(isnan(interp0)) = [];
    S0(cutnan(i),:) = interp1(z0,interp0,z,'linear','extrap');
    end
    end
end
cutnan = [];MOUNT = 0;
for i = 1:length(location)
    findnan = find(isnan(S0(i,:)));
    if ~isempty(findnan)
        MOUNT = MOUNT+1;
        cutnan(MOUNT) = i;
    end
end
if ~isempty(cutnan)
S0(cutnan,:) = [];lat(cutnan) = [];lon(cutnan) = [];
end

%Inverse Distance Weighted method 26.99N/16.23W;
dist = zeros(size(lat));
for i = 1:size(lat)
    dist(i) = sw_dist([lat(i) 26.99],[lon(i) -16.23],'km');
end
dist_reverse = 1./dist;
S = zeros(1,26);
for i = 1:26
    S(i) = sum(S0(:,i).*dist_reverse)/sum(dist_reverse);
end

%Interp to RAPID standard layers
z0 = [0;5;10;15;20;25;30;35;40;45;50;55;60;65;70;75;80;85;90;95;100;125;150;175;200;225];
pres0 = sw_pres(z0,26.52);
pres_upper = 0:20:220;
SE(year-2003,:) = interp1(pres0,S,pres_upper);
% SE(year-2003,:) = S;
    year
    toc
end
save('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\SE.mat','SE','pres_upper')