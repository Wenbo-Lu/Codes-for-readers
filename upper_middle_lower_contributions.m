% Calculate upper, middle and lower contributions
% The intial data used here are derived from extrapolation_by_three_methods.m

clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');
T_W = TW_cubic';T_E = TE_cubic';S_W = SW_cubic';S_E = SE_cubic';

S_E_upper_contribution = S_E;S_W_upper_contribution = S_W;
S_E_middle_contribution = S_E;S_W_middle_contribution = S_W;
S_E_lower_contribution = S_E;S_W_lower_contribution = S_W;
T_E_upper_contribution = T_E;T_W_upper_contribution = T_W;
T_E_middle_contribution = T_E;T_W_middle_contribution = T_W;
T_E_lower_contribution = T_E;T_W_lower_contribution = T_W;
for i = 4:203
    S_W_upper_contribution(57:end,i) = mean(S_W(57:end,4:203),2,'omitnan');
    S_W_middle_contribution(1:51,i) = mean(S_W(1:51,4:203),2,'omitnan');
    S_W_middle_contribution(102:end,i) = mean(S_W(102:end,4:203),2,'omitnan');
    S_W_lower_contribution(1:101,i) = mean(S_W(1:101,4:203),2,'omitnan');
    
    S_E_upper_contribution(57:end,i) = mean(S_E(57:end,4:203),2,'omitnan');
    S_E_middle_contribution(1:51,i) = mean(S_E(1:51,4:203),2,'omitnan');
    S_E_middle_contribution(102:end,i) = mean(S_E(102:end,4:203),2,'omitnan');
    S_E_lower_contribution(1:101,i) = mean(S_E(1:101,4:203),2,'omitnan');
    
    T_W_upper_contribution(57:end,i) = mean(T_W(57:end,4:203),2,'omitnan');
    T_W_middle_contribution(1:51,i) = mean(T_W(1:51,4:203),2,'omitnan');
    T_W_middle_contribution(102:end,i) = mean(T_W(102:end,4:203),2,'omitnan');
    T_W_lower_contribution(1:101,i) = mean(T_W(1:101,4:203),2,'omitnan');
    
    T_E_upper_contribution(57:end,i) = mean(T_E(57:end,4:203),2,'omitnan');
    T_E_middle_contribution(1:51,i) = mean(T_E(1:51,4:203),2,'omitnan');
    T_E_middle_contribution(102:end,i) = mean(T_E(102:end,4:203),2,'omitnan');
    T_E_lower_contribution(1:101,i) = mean(T_E(1:101,4:203),2,'omitnan');
end

SE_clim = SE_cubic';
SW_clim = SW_cubic';
TE_clim = TE_cubic';
TW_clim = TW_cubic';

for i = 1:204
    SE_clim(:,i) = mean(SE_cubic(:,:),'omitnan');
    SW_clim(:,i) = mean(SW_cubic(:,:),'omitnan');
    TE_clim(:,i) = mean(TE_cubic(:,:),'omitnan');
    TW_clim(:,i) = mean(TW_cubic(:,:),'omitnan');
end

save('J:\AMOC\RAPID to2020\revision\intermediatedata\eastlower_previous','S_E_lower_contribution','T_E_lower_contribution')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\eastupper_previous','S_E_upper_contribution','T_E_upper_contribution')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\eastmiddle_previous','S_E_middle_contribution','T_E_middle_contribution')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\westlower_previous','S_W_lower_contribution','T_W_lower_contribution')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\westupper_previous','S_W_upper_contribution','T_W_upper_contribution')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\westmiddle_previous','S_W_middle_contribution','T_W_middle_contribution')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\TE_clim_previous','TE_clim')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\TW_clim_previous','TW_clim')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SE_clim_previous','SE_clim')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SW_clim_previous','SW_clim')

%%
%lower_S
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastlower_previous','S_E_lower_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westlower_previous','S_W_lower_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TE_clim_previous','TE_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TW_clim_previous','TW_clim')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(S_W_lower_contribution,TW_clim,PG,P0);
dens_E = sw_pden(S_E_lower_contribution,TE_clim,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_lower_S_previous','dens_W','dens_E')
%%
%middle_S
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastmiddle_previous','S_E_middle_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westmiddle_previous','S_W_middle_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TE_clim_previous','TE_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TW_clim_previous','TW_clim')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(S_W_middle_contribution,TW_clim,PG,P0);
dens_E = sw_pden(S_E_middle_contribution,TE_clim,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_middle_S_previous','dens_W','dens_E')
%%
%upper_S
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastupper_previous','S_E_upper_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westupper_previous','S_W_upper_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TE_clim_previous','TE_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TW_clim_previous','TW_clim')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(S_W_upper_contribution,TW_clim,PG,P0);
dens_E = sw_pden(S_E_upper_contribution,TE_clim,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_upper_S_previous','dens_W','dens_E')
%%
% lower GEO
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastlower_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westlower_previous')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(S_W_lower_contribution,T_W_lower_contribution,PG,P0);
dens_E = sw_pden(S_E_lower_contribution,T_E_lower_contribution,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_lower_GEO_previous','dens_W','dens_E')
%%
% middle GEO
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastmiddle_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westmiddle_previous')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(S_W_middle_contribution,T_W_middle_contribution,PG,P0);
dens_E = sw_pden(S_E_middle_contribution,T_E_middle_contribution,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_middle_GEO_previous','dens_W','dens_E')
%%
% upper GEO
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastupper_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westupper_previous')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(S_W_upper_contribution,T_W_upper_contribution,PG,P0);
dens_E = sw_pden(S_E_upper_contribution,T_E_upper_contribution,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_upper_GEO_previous','dens_W','dens_E')
%%
%lower_T
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastlower_previous','T_E_lower_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westlower_previous','T_W_lower_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SE_clim_previous','SE_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SW_clim_previous','SW_clim')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(SW_clim,T_W_lower_contribution,PG,P0);
dens_E = sw_pden(SE_clim,T_E_lower_contribution,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_lower_T_previous','dens_W','dens_E')
%%
%middle_T
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastmiddle_previous','T_E_middle_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westmiddle_previous','T_W_middle_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SE_clim_previous','SE_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SW_clim_previous','SW_clim')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(SW_clim,T_W_middle_contribution,PG,P0);
dens_E = sw_pden(SE_clim,T_E_middle_contribution,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_middle_T_previous','dens_W','dens_E')
%%
%upper_T
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\eastupper_previous','T_E_upper_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\westupper_previous','T_W_upper_contribution')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SE_clim_previous','SE_clim')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SW_clim_previous','SW_clim')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(242,204);P0 = PG;P0(:,:) = 1100;
for i = 1:204;
    PG(:,i) = P;
end
dens_W = sw_pden(SW_clim,T_W_upper_contribution,PG,P0);
dens_E = sw_pden(SE_clim,T_E_upper_contribution,PG,P0);

save('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_upper_T_previous','dens_W','dens_E')
%%
% T_steric_S_uppercontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_upper_S_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\upper_S_previous','Tsteric')
%%
% T_steric_S_middlecontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_middle_S_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\middle_S_previous','Tsteric')
%%
% T_steric_S_lowercontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_lower_S_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\lower_S_previous','Tsteric')
%%
% T_steric_T_uppercontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_upper_T_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\upper_T_previous','Tsteric')
%%
% T_steric_T_middlecontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_middle_T_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\middle_T_previous','Tsteric')
%%
% T_steric_T_lowercontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_lower_T_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\lower_T_previous','Tsteric')

%%
% T_steric_GEO_uppercontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_upper_GEO_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\upper_GEO_previous','Tsteric')
%%
% T_steric_GEO_middlecontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_middle_GEO_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\middle_GEO_previous','Tsteric')
%%
% T_steric_GEO_lowercontribute
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\pden_lower_GEO_previous','dens_W','dens_E')
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;
detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
hteric_E = zeros(242,204);hteric_W = zeros(242,204);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(i,:) = trapz(P(i:end),detaE(i:end,:));
    hteric_W(i,:) = trapz(P(i:end),detaW(i:end,:));
end
hteric_E(242,:) = detaE(242,:)*200000;
hteric_W(242,:) = detaW(242,:)*200000;

depth = sw_dpth(P/10000,26.5);
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;Tsteric(Tsteric==0) = nan;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:51));
save('J:\AMOC\RAPID to2020\revision\intermediatedata\lower_GEO_previous','Tsteric')