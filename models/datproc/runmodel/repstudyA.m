% cbstudyD.m  - Investigation of different learning rules for a single parameter set.
%
addpath /home/asif/work/other_work/OSSeconomics/models/datproc/runmodel/
addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode



% set up baseline parameters
% w = struct ('N', 2500, ...
%             'M', 10, ...
%             'timelen', 400, ...
%             'OSS', 200);
w = struct ('N', 500, ...
            'M', 5, ...
            'timelen', 600, ...
            'OSS', 600);
cb = struct ('b1', 0.7, ...
             'b2', 0.3);
scheme = 'equal price, comp quant, all raise';

b1range = 0.7;
b2range = 0.3;
iter    = 250;

pmin = 0;                                    % min price in demand profile
pmax = 3.0;                                    % max price in demand profile

%delta = 0.01;                                   % risk factor
delta = 0.05;                                   % risk factor
lim   = w.N;

i=0;

for loop1 = 1 
    for loop2 = 1
  for loop3 = 1:iter

  i = i + 1;
  disp([i, loop3]);

mod(i).scheme = scheme;
world(i) = w;
user(i) = struct ('p', make_dprofile(world(i).N, pmin, pmax));
% company(i) = struct ('c',   0.25*sum(user(i).p)/world(i).M ...
%                                       *ones(world(i).M,1), ...
%              'alpha', delta * ones(world(i).M,1));
company(i) = struct ('c',   0.25*sum(user(i).p)/world(i).M ...
                                      *ones(world(i).M,1), ...
                     'alpha', delta * ones(world(i).M,1), ...
                     'limit', lim * ones(world(i).M,1));
codebank(i) = cb;
codebank(i).b1 = b1range(loop2);
codebank(i).b2 = b2range(loop1);

[P,Q] = ecs(world(i), user(i), codebank(i), company(i), ...
            mod(i).scheme);

outcome(i).P = P;
outcome(i).Q = Q;

end;
end;
end;

save repstudyA1.mat outcome world user codebank company mod




