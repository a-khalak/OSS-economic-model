% repstatsa.m  - Statistical data reduction upon learning rule.
%
% set up to do run A

addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode/


load repstudyC1.mat outcome world user codebank company mod
for k = 1:length(world),
statsc1(k) = reduecs2(outcome(k), world(k), user(k));
end;
compc1 = company;
 
load repstudyC2.mat outcome world user codebank company mod
for k = 1:length(world),
statsc2(k) = reduecs2(outcome(k), world(k), user(k));
end;
compc2 = company;

load repstudyC3.mat outcome world user codebank company mod
for k = 1:length(world),
statsc3(k) = reduecs2(outcome(k), world(k), user(k));
end;
compc3 = company;

load repstudyC4.mat outcome world user codebank company mod
for k = 1:length(world),
statsc4(k) = reduecs2(outcome(k), world(k), user(k));
end;
compc4 = company;

load repstudyC5.mat outcome world user codebank company mod
for k = 1:length(world),
statsc5(k) = reduecs2(outcome(k), world(k), user(k));
end;
compc5 = company;


save repC statsc1 compc1 statsc2 compc2 statsc3 compc3 statsc4 compc4 statsc5 compc5
