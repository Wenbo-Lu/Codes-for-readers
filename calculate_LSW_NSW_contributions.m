% Calculate netural density. 
% Here we use the code eos80_legacy_gamma_n.m provided by David Jackett to calculate netural density
% The code can be downloaded from http://www.teos-10.org/preteos10_software/neutral_density.html
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')
PG = zeros(204,242);
for i = 1:204
    PG(i,:) = pres;
end
nden_W = eos80_legacy_gamma_n(SW_cubic,TW_cubic,PG,-76.74,26.52);
save('J:\AMOC\RAPID to2020\revision\intermediatedata\nden_W_previous.mat','nden_W')

%%
% Calculate LSW and Nordic Sea Water contributions
% The intial profiles data used here are derived from calculate_TC_SC.m and RAPID_monthly_binned.m
% P used here is the standard layers of RAPID data. Here we get P from ts_gridded.nc provided by the RAPID group.
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_previous','TM_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_previous','SM_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthlyTS_previous.mat','TW','TE','SW','SE','pres','t')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\nden_W_previous','nden_W')

TM_LSW = TM_clim';
TM_NSW = TM_clim';
SM_LSW = SM_clim';
SM_NSW = SM_clim';
TW = TW';
SW = SW';

%reserve LSW
for i = 1:204
    location = find(nden_W(i,:)>27.897 & nden_W(i,:)<27.983);
    TM_LSW(location,i) = TW(location,i);
    SM_LSW(location,i) = SW(location,i);
end

%reserve NSW
for i = 1:204
    location = find(nden_W(i,:)>27.983 & nden_W(i,:)<28.125);
    TM_NSW(location,i) = TW(location,i);
    SM_NSW(location,i) = SW(location,i);
end

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204
    PG(:,i) = P;
end
dens_W_LSW = sw_pden(SM_LSW,TM_LSW,PG,P0);
dens_W_NSW = sw_pden(SM_NSW,TM_NSW,PG,P0);
dens_E = sw_pden(SM_clim',TM_clim',PG,P0);

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW_LSW = 1./dens_W_LSW;detaW_LSW(isnan(detaW_LSW)) = 0;
detaW_NSW = 1./dens_W_NSW;detaW_NSW(isnan(detaW_NSW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W_LSW(i,:) = trapz(P(i:end),detaW_LSW(i:end,:));
    hteric_W_NSW(i,:) = trapz(P(i:end),detaW_NSW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W_LSW(242,:) = detaW_LSW(242,:)*200000;
hteric_W_NSW(242,:) = detaW_NSW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric_LSW = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W_LSW(1:56,:)))/f/10^6;
Tsteric_LSW(Tsteric_LSW==0) = nan;%Tsteric_LSW(195) = nan;
Tsteric_NSW = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W_NSW(1:56,:)))/f/10^6;
Tsteric_NSW(Tsteric_NSW==0) = nan;%Tsteric_NSW(195) = nan;
save('J:\AMOC\RAPID to2020\revision\intermediatedata\LSW_NSW_Tsteric_previous','Tsteric_LSW','Tsteric_NSW','t')

%%
%SC
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_previous','TM_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_previous','SM_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthlyTS_previous.mat','TW','TE','SW','SE','pres','t')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\nden_W_previous','nden_W')

TM_LSW = TM_clim';
TM_NSW = TM_clim';
SM_LSW = SM_clim';
SM_NSW = SM_clim';
TW = TW';
SW = SW';

%reserve LSW
for i = 1:204
    location = find(nden_W(i,:)>27.897 & nden_W(i,:)<27.983);
    SM_LSW(location,i) = SW(location,i);
end

%reserve NSW
for i = 1:204
    location = find(nden_W(i,:)>27.983 & nden_W(i,:)<28.125);
    SM_NSW(location,i) = SW(location,i);
end

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204
    PG(:,i) = P;
end
dens_W_LSW = sw_pden(SM_LSW,TM_LSW,PG,P0);
dens_W_NSW = sw_pden(SM_NSW,TM_NSW,PG,P0);
dens_E = sw_pden(SM_clim',TM_clim',PG,P0);

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW_LSW = 1./dens_W_LSW;detaW_LSW(isnan(detaW_LSW)) = 0;
detaW_NSW = 1./dens_W_NSW;detaW_NSW(isnan(detaW_NSW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W_LSW(i,:) = trapz(P(i:end),detaW_LSW(i:end,:));
    hteric_W_NSW(i,:) = trapz(P(i:end),detaW_NSW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W_LSW(242,:) = detaW_LSW(242,:)*200000;
hteric_W_NSW(242,:) = detaW_NSW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric_LSW = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W_LSW(1:56,:)))/f/10^6;
Tsteric_LSW(Tsteric_LSW==0) = nan;%Tsteric_LSW(195) = nan;
Tsteric_NSW = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W_NSW(1:56,:)))/f/10^6;
Tsteric_NSW(Tsteric_NSW==0) = nan;%Tsteric_NSW(195) = nan;
save('J:\AMOC\RAPID to2020\revision\intermediatedata\LSW_NSW_Tsteric_SC_previous','Tsteric_LSW','Tsteric_NSW','t')

%%
%TC
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_previous','TM_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_previous','SM_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthlyTS_previous.mat','TW','TE','SW','SE','pres','t')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\nden_W_previous','nden_W')

TM_LSW = TM_clim';
TM_NSW = TM_clim';
SM_LSW = SM_clim';
SM_NSW = SM_clim';
TW = TW';
SW = SW';

%reserve LSW
for i = 1:204
    location = find(nden_W(i,:)>27.897 & nden_W(i,:)<27.983);
    TM_LSW(location,i) = TW(location,i);
end

%reserve NSW
for i = 1:204
    location = find(nden_W(i,:)>27.983 & nden_W(i,:)<28.125);
    TM_NSW(location,i) = TW(location,i);
end

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204
    PG(:,i) = P;
end
dens_W_LSW = sw_pden(SM_LSW,TM_LSW,PG,P0);
dens_W_NSW = sw_pden(SM_NSW,TM_NSW,PG,P0);
dens_E = sw_pden(SM_clim',TM_clim',PG,P0);

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW_LSW = 1./dens_W_LSW;detaW_LSW(isnan(detaW_LSW)) = 0;
detaW_NSW = 1./dens_W_NSW;detaW_NSW(isnan(detaW_NSW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W_LSW(i,:) = trapz(P(i:end),detaW_LSW(i:end,:));
    hteric_W_NSW(i,:) = trapz(P(i:end),detaW_NSW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W_LSW(242,:) = detaW_LSW(242,:)*200000;
hteric_W_NSW(242,:) = detaW_NSW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric_LSW = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W_LSW(1:56,:)))/f/10^6;
Tsteric_LSW(Tsteric_LSW==0) = nan;%Tsteric_LSW(195) = nan;
Tsteric_NSW = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W_NSW(1:56,:)))/f/10^6;
Tsteric_NSW(Tsteric_NSW==0) = nan;%Tsteric_NSW(195) = nan;
save('J:\AMOC\RAPID to2020\revision\intermediatedata\LSW_NSW_Tsteric_TC_previous','Tsteric_LSW','Tsteric_NSW','t')