% repstatsa.m  - Statistical data reduction upon learning rule.
%
% do a further reduction between runs

addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode/


load repA
load repA2
load repB
load repC

a = [compc1(1).alpha(1) compc2(1).alpha(1) compc3(1).alpha(1) ...
        compc4(1).alpha(1) compc5(1).alpha(1) compa2(1).alpha(1) ...
        compa6(1).alpha(1)];

d = [compc1(1).limit(1) compc2(1).limit(1) compc3(1).limit(1) ...
        compc4(1).limit(1) compc5(1).limit(1) 0  0];

%
% define some meta statistics to pull from a single _set_ of monte-carlo runs
%
% msm1 = Market Share (absolute) time mean, ensemble mean, best company at each time
% msd1 = Market Share (absolute) ensemble standard deviation, best company at each time
% msm2 = Market Share (absolute) time mean, ensemble mean, 2nd company at each time
% msd2 = Market Share (absolute) ensemble standard deviation, 2nd company at each time
% 
% rvm1 = Revenue (relative) time mean, ensemble mean, best company at each time
% rvd1 = Revenue (relative) ensemble standard deviation, best company at each time
% rvm2 = Revenue (relative) time mean, ensemble mean, 2nd company at each time
% rvd2 = Revenue (relative) ensemble standard deviation, 2nd company at each time
%
for i = 1:7,
if i < 6,
    eval(['dat = statsc',num2str(i),';']);
elseif i == 6,
    dat = statsa2;
elseif i == 7;
    dat = statsa6;
end;
    msm1(i) = mean([dat.preOmx]);
    msd1(i) = std([dat.preOmx]);
    msm2(i) = mean([dat.preO1]);
    msd2(i) = std([dat.preO1]);
    
    rvm1(i) = mean([dat.preOmxr]./[dat.preOrf]./[dat.maxR]);
    rvd1(i) = std([dat.preOmxr]./[dat.preOrf]./[dat.maxR]);
    rvm2(i) = mean([dat.preO2r]./[dat.preOrf]./[dat.maxR]);
    rvd2(i) = std([dat.preO2r]./[dat.preOrf]./[dat.maxR]);
end;


tbl = [a(:) d(:) msm1(:) 1.96*msd1(:) msm2(:) 1.96*msd2(:) rvm1(:) 1.96*rvd1(:) ...
        rvm2(:) 1.96*rvd2(:)];

tbl = tbl([2 3 4 5 7], :);

if (1),
    
    figure(1); clf;
    bar (1:5, tbl(:,7));
    hold on;
    errorbar(1:5,tbl(:,7),tbl(:,8));
    set(gca, 'XTickLabel', '');
%    xlabel('Case #');
    ylabel('<R_1>');
    
    
    figure(2); clf;
    bar (1:5, tbl(:,9));
    hold on;
    errorbar(1:5,tbl(:,9),tbl(:,10));
    xlabel('Case #');
    ylabel('<R_2>');
    set(gca, 'YLim', [0 1]);
    legend('a', 'b', 'c');
    
    
end;