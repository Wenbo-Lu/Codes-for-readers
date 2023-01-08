% Calculate TC and SC
% The intial data used here are derived from extrapolation_by_three_methods.m

%get averge TS
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')

TM = (TE_cubic+TW_cubic)/2;
SM = (SE_cubic+SW_cubic)/2;

TM_clim = TM;
SM_clim = SM;

for i = 1:204
    TM_clim(i,:) = mean(TM(:,:),'omitnan');
    SM_clim(i,:) = mean(SM(:,:),'omitnan');
end

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_previous','TM_clim')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_previous','SM_clim')

%%
%SC(pure)
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_previous','TM_clim')

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = pres;
end
P0 = pres;P0 = 1100;
dens_W = sw_pden(SW_cubic,TM_clim,PG,P0)';
dens_E = sw_pden(SE_cubic,TM_clim,PG,P0)';

save('J:\AMOC\RAPID to2020\revision\intermediatedata\SC(pure)_previous','dens_W','dens_E')
%%
%TC(pure)
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_previous','SM_clim')

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = pres;
end
P0 = pres;P0 = 1100;
dens_W = sw_pden(SM_clim,TW_cubic,PG,P0)';
dens_E = sw_pden(SM_clim,TE_cubic,PG,P0)';

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TC(pure)_previous','dens_W','dens_E')

%%
% T_steric_S
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SC(pure)_previous','dens_W','dens_E')
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
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;
Tsteric_1000 = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W(1:56,:)))/f/10^6;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:56));
Tsteric(Tsteric==0) = nan;
Tsteric_1000(Tsteric_1000==0) = nan;
deta_Tsteric = mean(Tsteric(52:194),'omitnan')-mean(Tsteric(4:51),'omitnan');
mean_Tsteric = mean(Tsteric(4:194),'omitnan');
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SCpure_previous','Tsteric','Tsteric_W','Tsteric_E')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SCpure_previous_1000','Tsteric_1000')

%%
% T_steric_T
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TC(pure)_previous','dens_W','dens_E')
dens_E(:,1:3) = nan;
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
Tsteric = trapz(depth(1:51),(hteric_E(1:51,:)-hteric_W(1:51,:)))/f/10^6;
Tsteric_1000 = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W(1:56,:)))/f/10^6;
Tsteric_E = trapz(depth(1:51),hteric_E(1:51,:))/f/10^6;
Tsteric_W = -trapz(depth(1:51),hteric_W(1:51,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
Tsteric(Tsteric==0) = nan;
Tsteric_1000(Tsteric_1000==0) = nan;

deta_Tsteric = mean(Tsteric(52:203),'omitnan')-mean(Tsteric(4:51),'omitnan');
mean_Tsteric = mean(Tsteric,'omitnan');

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TCpure_previous','Tsteric','Tsteric_W','Tsteric_E')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\TCpure_previous_1000','Tsteric_1000')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%linear
%get averge TS
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')

TM = (TE_linear+TW_linear)/2;
SM = (SE_linear+SW_linear)/2;

TM_clim = TM;
SM_clim = SM;

for i = 1:204
    TM_clim(:,i) = mean(TM(:,:),2,'omitnan');
    SM_clim(:,i) = mean(SM(:,:),2,'omitnan');
end

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_linear_previous','TM_clim')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_linear_previous','SM_clim')

%%
%SC(pure)
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_linear_previous','TM_clim')

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = pres;
end
dens_W = sw_dens(SW_linear,TM_clim,PG)';
dens_E = sw_dens(SE_linear,TM_clim,PG)';

save('J:\AMOC\RAPID to2020\revision\intermediatedata\SC(pure)_linear_previous','dens_W','dens_E')
%%
%TC(pure)
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_linear_previous','SM_clim')

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = pres;
end
dens_W = sw_dens(SM_clim,TW_linear,PG)';
dens_E = sw_dens(SM_clim,TE_linear,PG)';

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TC(pure)_linear_previous','dens_W','dens_E')

%%
% T_steric_S
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SC(pure)_linear_previous','dens_W','dens_E')
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
Tsteric = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W(1:56,:)))/f/10^6;
Tsteric_E = trapz(depth(1:56),hteric_E(1:56,:))/f/10^6;
Tsteric_W = -trapz(depth(1:56),hteric_W(1:56,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:56));
Tsteric(Tsteric==0) = nan;
deta_Tsteric = mean(Tsteric(52:194),'omitnan')-mean(Tsteric(4:51),'omitnan');
mean_Tsteric = mean(Tsteric,'omitnan');
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SCpure_linear_previous','Tsteric','Tsteric_W','Tsteric_E')

%%
% T_steric_T
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TC(pure)_linear_previous','dens_W','dens_E')
dens_E(:,1:3) = nan;
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
Tsteric = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W(1:56,:)))/f/10^6;
Tsteric_E = trapz(depth(1:56),hteric_E(1:56,:))/f/10^6;
Tsteric_W = -trapz(depth(1:56),hteric_W(1:56,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
Tsteric(Tsteric==0) = nan;

deta_Tsteric = mean(Tsteric(52:194),'omitnan')-mean(Tsteric(4:51),'omitnan');
mean_Tsteric = mean(Tsteric,'omitnan');

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TCpure_linear_previous','Tsteric','Tsteric_W','Tsteric_E')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%quadratic
%get averge TS
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')

TM = (TE_quadratic+TW_quadratic)/2;
SM = (SE_quadratic+SW_quadratic)/2;

TM_clim = TM;
SM_clim = SM;

for i = 1:204
    TM_clim(:,i) = mean(TM(:,:),2,'omitnan');
    SM_clim(:,i) = mean(SM(:,:),2,'omitnan');
end

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_quadratic_previous','TM_clim')
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_quadratic_previous','SM_clim')

%%
%SC(pure)
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TM_clim_quadratic_previous','TM_clim')

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = pres;
end
dens_W = sw_dens(SW_quadratic,TM_clim,PG)';
dens_E = sw_dens(SE_quadratic,TM_clim,PG)';

save('J:\AMOC\RAPID to2020\revision\intermediatedata\SC(pure)_quadratic_previous','dens_W','dens_E')
%%
%TC(pure)
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous')
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SM_clim_quadratic_previous','SM_clim')

PG = zeros(204,242);
for i = 1:204
    PG(i,:) = pres;
end
dens_W = sw_dens(SM_clim,TW_quadratic,PG)';
dens_E = sw_dens(SM_clim,TE_quadratic,PG)';

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TC(pure)_quadratic_previous','dens_W','dens_E')

%%
% T_steric_S
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\SC(pure)_quadratic_previous','dens_W','dens_E')
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
Tsteric = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W(1:56,:)))/f/10^6;
Tsteric_E = trapz(depth(1:56),hteric_E(1:56,:))/f/10^6;
Tsteric_W = -trapz(depth(1:56),hteric_W(1:56,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
deta = mean(Tsteric(58:end)) - mean(Tsteric(1:56));
Tsteric(Tsteric==0) = nan;
deta_Tsteric = mean(Tsteric(52:203),'omitnan')-mean(Tsteric(4:51),'omitnan');
mean_Tsteric = mean(Tsteric,'omitnan');
save('J:\AMOC\RAPID to2020\revision\intermediatedata\SCpure_quadratic_previous','Tsteric','Tsteric_W','Tsteric_E')

%%
% T_steric_T
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\intermediatedata\TC(pure)_quadratic_previous','dens_W','dens_E')
dens_E(:,1:3) = nan;
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
Tsteric = trapz(depth(1:56),(hteric_E(1:56,:)-hteric_W(1:56,:)))/f/10^6;
Tsteric_E = trapz(depth(1:56),hteric_E(1:56,:))/f/10^6;
Tsteric_W = -trapz(depth(1:56),hteric_W(1:56,:))/f/10^6;
Tsteric_all = trapz(depth,(hteric_E-hteric_W))/f/10^6;
Tsteric(Tsteric==0) = nan;
Tsteric(195) = nan;

deta_Tsteric = mean(Tsteric(52:194),'omitnan')-mean(Tsteric(4:51),'omitnan');
mean_Tsteric = mean(Tsteric,'omitnan');

save('J:\AMOC\RAPID to2020\revision\intermediatedata\TCpure_quadratic_previous','Tsteric','Tsteric_W','Tsteric_E')