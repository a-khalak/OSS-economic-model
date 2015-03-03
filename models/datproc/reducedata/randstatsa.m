% cbstatsa.m  - Statistical data reduction upon code bank study.
%
% set up to do run A
addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode/

load randstudya.mat outcome world user codebank company mod
for k = 1:length(world),
statsa(k) = reduecs(outcome(k), world(k), user(k));
end;
codea = codebank;
 
save rndA statsa codea
