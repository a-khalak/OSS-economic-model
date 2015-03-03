% sizestats.m  - Statistical data reduction upon size study.
%
% set up to do run B

load sizestudy1b.mat outcome world user codebank company mod
for k = 1:16,
stats1b(k) = reduecs(outcome(k), world(k), user(k));
end;
world1b = world;
 
load sizestudy2b.mat outcome world user codebank company mod
for k = 1:16,
stats2b(k) = reduecs(outcome(k), world(k), user(k));
end;
world2b = world;
 
load sizestudy5b.mat outcome world user codebank company mod
for k = 1:16,
stats5b(k) = reduecs(outcome(k), world(k), user(k));
end;
world5b = world;
 
load sizestudy10b.mat outcome world user codebank company mod
for k = 1:16,
stats10b(k) = reduecs(outcome(k), world(k), user(k));
end;
world10b = world; 
