% repstatsa.m  - Statistical data reduction upon learning rule.
%
% do a further reduction between runs

addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode/

load repstudyB1.mat outcome world user codebank company mod
for k = 1:length(world),
statsb1(k) = reduecs2(outcome(k), world(k), user(k));
end;
compb1 = company;


save repB statsb1 compb1
