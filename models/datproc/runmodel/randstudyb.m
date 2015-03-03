% cbstudy.m  - Investigation of OSS model to investigate code bank.
%
addpath /home/asif/work/other_work/OSSeconomics/models/matlabcode

%


% set up baseline parameters
w = struct ('N', 250, ...                     % number of users
            'M', 2, ...                       % number of companies
            'timelen', 150, ...                % number of timesteps, total
            'OSS', 150);                       % timestep at which OSS is introduced
cb = struct ('b1', 0.7, ...                    % initial value of b_pref parameters
             'b2', 0.3);                       % initial value of b_ran parameter
scheme = 'equal price, comp quant, all raise'; % initialization scheme

b1range = [0:0.1:1];                           % mesh spacing of b1
b2range = 1.0;             % mesh spacing of b2
iter    = 4;                                   % number of runs repeated

pmin = 0.2;                                    % min price in demand profile
pmax = 3.0;                                    % max price in demand profile

delta = 0.01;                                  % risk factor

i=0;

for loop1 = 1:length(b2range),
  for loop2 = 1:length(b1range),

  for loop3 = 1:iter

  i = i + 1;
  disp(i);

mod(i).scheme = scheme;
world(i) = w;
user(i) = struct ('p', make_dprofile(world(i).N, pmin, pmax));  
company(i) = struct ('c',   0.25*sum(user(i).p)/world(i).M ...
                                      *ones(world(i).M,1), ...
             'alpha', delta * ones(world(i).M,1));

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


% store the output of this run into "cbstudy.mat"

save randstudyb.mat outcome world user codebank company mod




