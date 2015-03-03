% repstatsa.m  - Statistical data reduction upon learning rule.
%
% set up to do run A

addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode/


load repstudyA5.mat outcome world user codebank company mod
for k = 1:length(world),
statsa5(k) = reduecs2(outcome(k), world(k), user(k));
end;
compa5 = company;
 
load repstudyA6.mat outcome world user codebank company mod
for k = 1:length(world),
statsa6(k) = reduecs2(outcome(k), world(k), user(k));
end;
compa6 = company;


save repA2 statsa5 compa5 statsa6 compa6
