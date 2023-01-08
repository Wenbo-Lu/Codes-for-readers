% Calculate GEO with three extrapolation methods
% The intial data used here are derived from extrapolation_by_three_methods.m

clear,clc,close all
%linear
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')

SW = SW_linear;SE = SE_linear;TW = TW_linear;TE = TE_linear;
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = P;
end
P0 = P;P0 = 1100;
dens_W = sw_pden(SW,TW,PG,P0);
dens_E = sw_pden(SE,TE,PG,P0);

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;

detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
detaE(detaE==0) = nan;detaW(detaW==0) = nan;
detaE(1,:) = nan;detaW(1,:) = nan;
detaE(end,:) = nan;detaW(end,:) = nan;

hteric_E = zeros(204,242);hteric_W = zeros(204,242);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(:,i) = trapz(P(i:end),detaE(:,i:end)');
    hteric_W(:,i) = trapz(P(i:end),detaW(:,i:end)');
end

hteric_E(:,242) = detaE(:,242)*200000;
hteric_W(:,242) = detaW(:,242)*200000;

depth = sw_dpth(P/10000,26.5);
GEO_linear = trapz(depth(1:56),(hteric_E(:,1:56)'-hteric_W(:,1:56)'))/f/10^6;
deta_GEO_linear = mean(GEO_linear(52:203),'omitnan')-mean(GEO_linear(4:51),'omitnan');
mean_GEO_linear = mean(GEO_linear,'omitnan');
save('J:\AMOC\RAPID to2020\revision\intermediatedata\GEO_linear_previous','GEO_linear')
plot(mean(dens_W,'omitnan')-1000,P/10000)
axis ij
%%
clear,clc,close all
%quadratic
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')

SW = SW_quadratic;SE = SE_quadratic;TW = TW_quadratic;TE = TE_quadratic;
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = P;
end
P0 = P;P0 = 1100;
dens_W = sw_pden(SW,TW,PG,P0);
dens_E = sw_pden(SE,TE,PG,P0);

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;

detaE = 1./dens_E;
detaW = 1./dens_W;
detaE(detaE==0) = nan;detaW(detaW==0) = nan;
detaE(1,:) = nan;detaW(1,:) = nan;
detaE(end,:) = nan;detaW(end,:) = nan;

hteric_E = zeros(204,242);hteric_W = zeros(204,242);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(:,i) = trapz(P(i:end),detaE(:,i:end)');
    hteric_W(:,i) = trapz(P(i:end),detaW(:,i:end)');
end

hteric_E(:,242) = detaE(:,242)*200000;
hteric_W(:,242) = detaW(:,242)*200000;

depth = sw_dpth(P/10000,26.5);
GEO_quadratic = trapz(depth(1:56),(hteric_E(:,1:56)'-hteric_W(:,1:56)'))/f/10^6;
deta_GEO_quadratic = mean(GEO_quadratic(52:203),'omitnan')-mean(GEO_quadratic(4:51),'omitnan');
mean_GEO_quadratic = mean(GEO_quadratic,'omitnan');
save('J:\AMOC\RAPID to2020\revision\intermediatedata\GEO_quadratic_previous','GEO_quadratic')

%%
clear,clc,close all
%cubic
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')

SW = SW_cubic;SE = SE_cubic;TW = TW_cubic;TE = TE_cubic;
P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure');

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = P;
end
P0 = P;P0 = 1100;
dens_W = sw_pden(SW,TW,PG,P0);
dens_E = sw_pden(SE,TE,PG,P0);

P = ncread('J:\AMOC\derived data\ts_gridded.nc','pressure')*10000;

detaE = 1./dens_E;detaE(isnan(detaE)) = 0;
detaW = 1./dens_W;detaW(isnan(detaW)) = 0;
detaE(detaE==0) = nan;detaW(detaW==0) = nan;
detaE(1,:) = nan;detaW(1,:) = nan;
detaE(end,:) = nan;detaW(end,:) = nan;

hteric_E = zeros(204,242);hteric_W = zeros(204,242);
f = sw_f(26.5);
for i = 241:-1:1
    hteric_E(:,i) = trapz(P(i:end),detaE(:,i:end)');
    hteric_W(:,i) = trapz(P(i:end),detaW(:,i:end)');
end

hteric_E(:,242) = detaE(:,242)*200000;
hteric_W(:,242) = detaW(:,242)*200000;

depth = sw_dpth(P/10000,26.5);
GEO_cubic = trapz(depth(1:51),(hteric_E(:,1:51)'-hteric_W(:,1:51)'))/f/10^6;
GEO_cubic_1000 = trapz(depth(1:56),(hteric_E(:,1:56)'-hteric_W(:,1:56)'))/f/10^6;
GEO_1000 = trapz(depth(1:57),(hteric_E(:,1:57)'-hteric_W(:,1:57)'))/f/10^6;
GEO_E = trapz(depth(1:51),hteric_E(:,1:51)')/f/10^6;
GEO_W = -trapz(depth(1:51),hteric_W(:,1:51)')/f/10^6;
deta_GEO_cubic = mean(GEO_cubic(52:203),'omitnan')-mean(GEO_cubic(4:51),'omitnan');
mean_GEO_cubic = mean(GEO_cubic,'omitnan');
save('J:\AMOC\RAPID to2020\revision\intermediatedata\GEO_1000_previous','GEO_1000')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\GEO_cubic_previous','GEO_cubic','GEO_E','GEO_W')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\GEO_cubic_previous_1000','GEO_cubic_1000 ','GEO_E','GEO_W')