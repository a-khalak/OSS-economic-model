function red_data = reduecs2(outcome, world, user);
%
% function red_data = reduecs(outcome, world, user);
%
% reduecs takes in a (P,Q) structure called "outcome", as well as the
% world parameters to get the time, and returns a set of statistics to
% characterize (P,Q).  These statistics are stored in red_data
%

% Statistics:
%
% red_data.maxQ
% red_data.maxR
% red_data.preO1  -  Max Mean Market share of a single company pre-OSS (times -50 to 0)
% red_data.preO1r -  Max Mean revenues of a single company pre-OSS
% red_data.pre0mx -  Mean Max market share of any company pre-OSS
% red_data.pre0mxr-  Mean Max revenues of any company pre-OSS
% red_data.preO2  -  Market share of 2nd most dominant company pre-OSS
% red_data.preO2r -  Mean revenues of 2nd most dominant company pre-OSS
% red_data.preOrf - Fraction of potential revenue extracted from market pre-OSS
% red_data.preOmf - Fraction of potential sales extracted pre-OSS
% red_data.totalpresales
% red_data.totalprerev
% red_data.inigro - Estimate of initial impact of OSS (first 4 timesteps)
% red_data.inimean- Mean OSS market share in times 10-50.
% red_data.inivar - Variance of OSS market share in times 10-50.
% red_data.ini1   - Mean market share of dominant company. (after OSS)
% red_data.ini1r  - Mean revenue of dominant company (after OSS)
% red_data.ini2   - Mean market share of 2nd most dominant company
% red_data.ini2r  - Mean revenue of 2nd most dominant company (after OSS)
% red_data.lngmean- Mean OSS market share in long term times 10-200.
% red_data.lngvar - Variance of OSS market share in long term times 10-200.
% red_data.endmean- Mean OSS market share in long term times 175-200.
%
%pre_range = (world.OSS-50):world.OSS;
%post_range = world.OSS+10:world.OSS+50;

prangelen = floor(world.OSS*0.8);
pre_range = (world.OSS-prangelen):world.OSS;
%post_range = world.OSS+10:world.timelen-50;
post_range = world.OSS;

aftertimelen = world.timelen - world.OSS;
beforetimelen = world.OSS;

%trans_range = world.OSS:world.OSS+3;
trans_range = world.OSS;

post_longrange = world.OSS:world.timelen;

% average over only the last 80% of the run
end_range = world.OSS+0.2*aftertimelen:world.timelen;
maxQ = world.N;
maxR = sum(user.p);
diffDSP = [-0.1    -0.7000   0.7000   0.1];


redu = struct ('maxQ', maxQ, 'maxR', maxR, ...
'totalpresales', 0, 'totalprerev', 0, ...
'preOmx', 0, 'preOmxr', 0, ... 
'preO1', 0, 'preO1r', 0, 'preO2', 0, 'preO2r', 0, ...
'preOrf', 0, 'preOmf', 0, 'inigro', 0, 'inimean', 0, 'inivar', 0, ...
'ini1', 0, 'ini1r', 0, 'ini2', 0, 'ini2r', 0, 'lngmean', 0, 'lngvar', 0);
P = outcome.P;
Q = outcome.Q;
R = P(:,1:size(Q,2)).*Q;

% pre-OSS statistics
preO  = mean (Q(1:world.M,pre_range),2);
preOr = mean(R(1:world.M,pre_range),2);
[junk, ind] = sort(preOr);
firstcomp = ind(world.M);
secondcomp = ind(world.M-1);

totalpresales = sum(preO);
totalprerev   = sum(preOr);
redu.totalpresales = totalpresales;
redu.totalprerev  = totalprerev;

redu.preO1  = preO(firstcomp)/maxQ;
redu.preO2  = preO(secondcomp)/maxQ;
redu.preO1r = preOr(firstcomp);
redu.preO2r = preOr(secondcomp);
redu.preOmf = totalpresales / maxQ;
redu.preOrf = totalprerev / maxR;

redu.preOmx = mean(max(Q(1:world.M,pre_range)))/maxQ;
redu.preOmxr = mean(max(R(1:world.M,pre_range)));

% transient immediately after introduction
growth = Q(world.M+1,trans_range) * diffDSP'; 
redu.inigro = growth / maxQ;

% region just after OSS
redu.inimean = mean(Q(world.M+1,post_range)) /maxQ;
redu.inivar  = var (Q(world.M+1,post_range)/maxQ);

redu.ini1    = mean (Q(firstcomp,post_range))/maxQ;
redu.ini1r   = mean (R(firstcomp,post_range));
redu.ini2    = mean (Q(secondcomp,post_range))/maxQ;
redu.ini2r   = mean (R(secondcomp,post_range));

% long term stats
redu.lngmean = mean(Q(world.M+1,post_longrange))/maxQ;
redu.lngvar  = var(Q(world.M+1,post_longrange)/maxQ);
redu.endmean = mean(Q(world.M+1,end_range))/maxQ;

red_data = redu;
