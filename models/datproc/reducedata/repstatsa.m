% repstatsa.m  - Statistical data reduction upon learning rule.
%
% set up to do run A

addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode/


load repstudyA1.mat outcome world user codebank company mod
for k = 1:length(world),
statsa1(k) = reduecs2(outcome(k), world(k), user(k));
end;
compa1 = company;
 
load repstudyA2.mat outcome world user codebank company mod
for k = 1:length(world),
statsa2(k) = reduecs2(outcome(k), world(k), user(k));
end;
compa2 = company;

load repstudyA3.mat outcome world user codebank company mod
for k = 1:length(world),
statsa3(k) = reduecs2(outcome(k), world(k), user(k));
end;
compa3 = company;

load repstudyA4.mat outcome world user codebank company mod
for k = 1:length(world),
statsa4(k) = reduecs2(outcome(k), world(k), user(k));
end;
compa4 = company;

save repA statsa1 compa1 statsa2 compa2 statsa3 compa3 statsa4 compa4
