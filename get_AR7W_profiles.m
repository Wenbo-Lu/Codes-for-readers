% get AR7W profiles
% AR7W is a yearly repeated program with many profiles in each year.
% You can download the excel data from https://www.pangaea.de.
% Here we get the space mean LSW T/S profiles in 1993 as an example.
% We use the code eos80_legacy_gamma_n.m provided by David Jackett to calculate netural density, which is introduced in calculate_LSW_NSW_contributions.m.

clear,clc,close all
cd('J:\AMOC\derived data\AR7W\1993')
name = dir('*.csv');
n = length(name);
S = zeros(4600,n);S(:,:) = nan;
T = zeros(4600,n);T(:,:) = nan;
p = T;
lat = zeros(n,1);lat(:) = nan;
lon = zeros(n,1);lon(:) = nan;

for i = 1:n
    data = csvread(name(i).name,20,2);
    l = size(data,1)-1;
    S(1:l,i) = data(1:l,3);
    T(1:l,i) = data(1:l,1);
    p(1:l,i) = csvread(name(i).name,20,0,[20,0,l+19,0]);
    DATA = importdata(name(i).name);
    lat(i) = str2double(DATA.textdata{16,1}(14:20));
    lon(i) = str2double(DATA.textdata{17,1}(14:20));
end
T(T==-999) = nan;
S(S==-999) = nan;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lon_location = find(lon<-50);
lat_location = find(lat>50 & lat<60);
location = intersect(lat_location,lon_location);

location = 1:length(lon);

p = p(:,location);
S = S(:,location);
T = T(:,location);
n = length(location);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ndens = zeros(4600,n);ndens(:,:) = nan;
for i = 1:n
    ndens(:,i) = eos80_legacy_gamma_n(S(:,i),T(:,i),p(:,i),lon(i),lat(i));
end

nden_g = 23.5:.005:28.2;
S_g = zeros(941,n);S_g(:,:) = nan;
T_g = zeros(941,n);T_g(:,:) = nan;
for i = 1:n
    location = find(~isnan(ndens(:,i)));
    S_g(:,i) = interp1(ndens(location,i),S(location,i),nden_g);
    T_g(:,i) = interp1(ndens(location,i),T(location,i),nden_g);
end

S_1993 = mean(S_g,2,'omitnan');
T_1993 = mean(T_g,2,'omitnan');

save('J:\AMOC\derived data\AR7W\intermediatedata\1993','S_1993','T_1993','nden_g')