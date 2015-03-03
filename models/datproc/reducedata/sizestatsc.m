% sizestatsc.m  - Statistical data reduction upon size study.
%
% set up to do run C

load sizestudyc.mat outcome world user codebank company mod
for k = 1:28,
statsc(k) = reduecs(outcome(k), world(k), user(k));
end;
worldc = world;
 
save sizeC statsc worldc
