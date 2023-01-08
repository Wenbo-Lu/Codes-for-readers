% This code extrapolates the shllow T/S data in each profile. 
% Reference profiles (TW, TE..) are derived from WOD_reference_profiles.m
% Monthly-binned RAPID profiles are derived from RAPID_monthly_binned.m

clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\TW.mat','TW','pres_upper')
TW_WOD = TW;
load('J:\AMOC\RAPID to2020\revision\intermediatedata\monthlyTS_previous')

%TW_linear
TW_linear = TW;
for i = 4:194
    tic
    not_nan = find(~isnan(TW(i,:)));
    pres_true = pres(not_nan);
    TW_true = TW(i,not_nan);
    TW_linear(i,:) = interp1(pres_true,TW_true,pres,'linear','extrap');
    i
    toc
end

%TW_quadratic
TW_quadratic = TW;
deta_z_quadratic = [ones(12,1),((pres_upper-220).^2)'];
alfa = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_quadratic,(TW_WOD(year,:)-TW_linear((year-1)*12+month,1:12))');
        alfa((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(TW(i,:)));
    for j = 1:length(is_nan)
        TW_quadratic(i,j) = deta_z_quadratic(j,2)*alfa(i)+TW_linear(i,j);
    end
    i
    toc
end   

%TW_cubic
TW_cubic = TW;
deta_z_cubic = [ones(12,1),((pres_upper-220).^3)'];
beta = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_cubic,(TW_WOD(year,:)-TW_quadratic((year-1)*12+month,1:12))');
        beta((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(TW(i,:)));
    for j = 1:length(is_nan)
        TW_cubic(i,j) = deta_z_cubic(j,2)*beta(i)+TW_quadratic(i,j);
    end
    i
    toc
end   


linear = mean(TW_linear(:,1:12),'omitnan');
quadratic = mean(TW_quadratic(:,1:12),'omitnan');
cubic = mean(TW_cubic(:,1:12),'omitnan');
WOD = mean(TW_WOD,'omitnan');

plot(linear,pres_upper,'r');hold on
plot(quadratic,pres_upper,'g');
plot(cubic,pres_upper,'b');
plot(WOD,pres_upper,'k');
axis ij
save('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TW_WODinterp_previous','TW_linear','TW_quadratic','TW_cubic','t','pres')
%%
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\TE.mat','TE','pres_upper')
TE_WOD = TE;
load('J:\AMOC\RAPID to2020\revision\intermediatedata\\monthlyTS_previous')

%TE_linear
TE_linear = TE;
for i = 4:194
    tic
    not_nan = find(~isnan(TE(i,:)));
    pres_true = pres(not_nan);
    TE_true = TE(i,not_nan);
    TE_linear(i,:) = interp1(pres_true,TE_true,pres,'linear','extrap');
    i
    toc
end

%TE_quadratic
TE_quadratic = TE;
deta_z_quadratic = [ones(12,1),((pres_upper-220).^2)'];
alfa = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_quadratic,(TE_WOD(year,:)-TE_linear((year-1)*12+month,1:12))');
        alfa((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(TE(i,:)));
    for j = 1:length(is_nan)
        TE_quadratic(i,j) = deta_z_quadratic(j,2)*alfa(i)+TE_linear(i,j);
    end
    i
    toc
end   

%TE_cubic
TE_cubic = TE;
deta_z_cubic = [ones(12,1),((pres_upper-220).^3)'];
beta = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_cubic,(TE_WOD(year,:)-TE_quadratic((year-1)*12+month,1:12))');
        beta((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(TE(i,:)));
    for j = 1:length(is_nan)
        TE_cubic(i,j) = deta_z_cubic(j,2)*beta(i)+TE_quadratic(i,j);
    end
    i
    toc
end   


linear = mean(TE_linear(:,1:12),'omitnan');
quadratic = mean(TE_quadratic(:,1:12),'omitnan');
cubic = mean(TE_cubic(:,1:12),'omitnan');
WOD = mean(TE_WOD,'omitnan');

plot(linear,pres_upper,'r');hold on
plot(quadratic,pres_upper,'g');
plot(cubic,pres_upper,'b');
WOD = WOD-mean(WOD,'omitnan')+mean(cubic,'omitnan');
plot(WOD,pres_upper,'k');
axis ij
save('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_TE_WODinterp_previous','TE_linear','TE_quadratic','TE_cubic','t','pres')
%%
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\SW.mat','SW','pres_upper')
SW_WOD = SW;
load('J:\AMOC\RAPID to2020\revision\intermediatedata\\monthlyTS_previous')

%SW_linear
SW_linear = SW;
for i = 4:194
    tic
    not_nan = find(~isnan(SW(i,:)));
    pres_true = pres(not_nan);
    SW_true = SW(i,not_nan);
    SW_linear(i,:) = interp1(pres_true,SW_true,pres,'linear','extrap');
    i
    toc
end

%SW_quadratic
SW_quadratic = SW;
deta_z_quadratic = [ones(12,1),((pres_upper-220).^2)'];
alfa = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_quadratic,(SW_WOD(year,:)-SW_linear((year-1)*12+month,1:12))');
        alfa((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(SW(i,:)));
    for j = 1:length(is_nan)
        SW_quadratic(i,j) = deta_z_quadratic(j,2)*alfa(i)+SW_linear(i,j);
    end
    i
    toc
end   

%SW_cubic
SW_cubic = SW;
deta_z_cubic = [ones(12,1),((pres_upper-220).^3)'];
beta = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_cubic,(SW_WOD(year,:)-SW_quadratic((year-1)*12+month,1:12))');
        beta((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(SW(i,:)));
    for j = 1:length(is_nan)
        SW_cubic(i,j) = deta_z_cubic(j,2)*beta(i)+SW_quadratic(i,j);
    end
    i
    toc
end   


linear = mean(SW_linear(:,1:12),'omitnan');
quadratic = mean(SW_quadratic(:,1:12),'omitnan');
cubic = mean(SW_cubic(:,1:12),'omitnan');
WOD = mean(SW_WOD,'omitnan');

plot(linear,pres_upper,'r');hold on
plot(quadratic,pres_upper,'g');
plot(cubic,pres_upper,'b');
WOD = WOD-mean(WOD,'omitnan')+mean(cubic,'omitnan');
plot(WOD,pres_upper,'k');
axis ij
save('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SW_WODinterp_previous','SW_linear','SW_quadratic','SW_cubic','t','pres')

%%
clear,clc,close all
load('J:\AMOC\RAPID to2020\revision\procedure\intermediatedata\SE.mat','SE','pres_upper')
SE_WOD = SE;
load('J:\AMOC\RAPID to2020\revision\intermediatedata\\monthlyTS_previous')

%SE_linear
SE_linear = SE;
for i = 4:194
    tic
    not_nan = find(~isnan(SE(i,:)));
    pres_true = pres(not_nan);
    SE_true = SE(i,not_nan);
    SE_linear(i,:) = interp1(pres_true,SE_true,pres,'linear','extrap');
    i
    toc
end

%SE_quadratic
SE_quadratic = SE;
deta_z_quadratic = [ones(12,1),((pres_upper-220).^2)'];
alfa = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_quadratic,(SE_WOD(year,:)-SE_linear((year-1)*12+month,1:12))');
        alfa((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(SE(i,:)));
    for j = 1:length(is_nan)
        SE_quadratic(i,j) = deta_z_quadratic(j,2)*alfa(i)+SE_linear(i,j);
    end
    i
    toc
end   

%SE_cubic
SE_cubic = SE;
deta_z_cubic = [ones(12,1),((pres_upper-220).^3)'];
beta = zeros(204,1);
for year = 1:17
    for month = 1:12
        b = mldivide(deta_z_cubic,(SE_WOD(year,:)-SE_quadratic((year-1)*12+month,1:12))');
        beta((year-1)*12+month) = b(2);
    end
end
for i = 4:194
    tic
    is_nan = find(isnan(SE(i,:)));
    for j = 1:length(is_nan)
        SE_cubic(i,j) = deta_z_cubic(j,2)*beta(i)+SE_quadratic(i,j);
    end
    i
    toc
end   


linear = mean(SE_linear(:,1:12),'omitnan');
quadratic = mean(SE_quadratic(:,1:12),'omitnan');
cubic = mean(SE_cubic(:,1:12),'omitnan');
WOD = mean(SE_WOD,'omitnan');

plot(linear,pres_upper,'r');hold on
plot(quadratic,pres_upper,'g');
plot(cubic,pres_upper,'b');
WOD = WOD-mean(WOD,'omitnan')+mean(cubic,'omitnan');
plot(WOD,pres_upper,'k');
axis ij
save('J:\AMOC\RAPID to2020\revision\intermediatedata\monthly_SE_WODinterp_previous','SE_linear','SE_quadratic','SE_cubic','t','pres')
