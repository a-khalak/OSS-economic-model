% sizestudy.m  - Parametric runs of OSS model to investigate world size.
%
addpath /home/asif/other_work/OSSeconomics/models/datproc/runmodel/

% set up baseline parameters
w = struct ('N', 100, ...
            'M', 1, ...
            'timelen', 400, ...
            'OSS', 200);
cb = struct ('b1', 0.7, ...
             'b2', 0.3);
scheme = 'equal price, comp quant, all raise';

for i = 1:16;

codebank(i) = cb;
mod(i).scheme = scheme;

j = i/4;
j = exp(floor((j)));

world(i) = w;
world(i).N = floor(world(i).N * (1 + j));
world(i).M = floor(world(i).M * (1 + j));

user(i) = struct ('p', make_dprofile(world(i).N, 0.8, 3.0));
company(i) = struct ('c',   0.25*sum(user(i).p)/world(i).M ...
                                      *ones(world(i).M,1), ...
             'alpha', 0.01 * ones(world(i).M,1));


[P,Q] = ecs(world(i), user(i), codebank(i), company(i), ...
            mod(i).scheme);

outcome(i).P = P;
outcome(i).Q = Q;

end;

save sizestudy1.mat outcome world user codebank company mod


% set up baseline parameters
w = struct ('N', 100, ...
            'M', 2, ...
            'timelen', 400, ...
            'OSS', 200);
cb = struct ('b1', 0.7, ...
             'b2', 0.3);
scheme = 'equal price, comp quant, all raise';

for i = 1:16;

codebank(i) = cb;
mod(i).scheme = scheme;

j = i/4;
j = exp(floor((j)));

world(i) = w;
world(i).N = floor(world(i).N * (1 + j));
world(i).M = floor(world(i).M * (1 + j));

user(i) = struct ('p', make_dprofile(world(i).N, 0.8, 3.0));
company(i) = struct ('c',   0.25*sum(user(i).p)/world(i).M ...
                                      *ones(world(i).M,1), ...
             'alpha', 0.01 * ones(world(i).M,1));


[P,Q] = ecs(world(i), user(i), codebank(i), company(i), ...
            mod(i).scheme);

outcome(i).P = P;
outcome(i).Q = Q;

end;

save sizestudy2.mat outcome world user codebank company mod

% set up baseline parameters
w = struct ('N', 100, ...
            'M', 5, ...
            'timelen', 400, ...
            'OSS', 200);
cb = struct ('b1', 0.7, ...
             'b2', 0.3);
scheme = 'equal price, comp quant, all raise';

for i = 1:16;

codebank(i) = cb;
mod(i).scheme = scheme;

j = i/4;
j = exp(floor((j)));

world(i) = w;
world(i).N = floor(world(i).N * (1 + j));
world(i).M = floor(world(i).M * (1 + j));

user(i) = struct ('p', make_dprofile(world(i).N, 0.8, 3.0));
company(i) = struct ('c',   0.25*sum(user(i).p)/world(i).M ...
                                      *ones(world(i).M,1), ...
             'alpha', 0.01 * ones(world(i).M,1));


[P,Q] = ecs(world(i), user(i), codebank(i), company(i), ...
            mod(i).scheme);

outcome(i).P = P;
outcome(i).Q = Q;

end;

save sizestudy5.mat outcome world user codebank company mod

% set up baseline parameters
w = struct ('N', 100, ...
            'M', 10, ...
            'timelen', 400, ...
            'OSS', 200);
cb = struct ('b1', 0.7, ...
             'b2', 0.3);
scheme = 'equal price, comp quant, all raise';

for i = 1:16;

codebank(i) = cb;
mod(i).scheme = scheme;

j = i/4;
j = exp(floor((j)));

world(i) = w;
world(i).N = floor(world(i).N * (1 + j));
world(i).M = floor(world(i).M * (1 + j));

user(i) = struct ('p', make_dprofile(world(i).N, 0.8, 3.0));
company(i) = struct ('c',   0.25*sum(user(i).p)/world(i).M ...
                                      *ones(world(i).M,1), ...
             'alpha', 0.01 * ones(world(i).M,1));


[P,Q] = ecs(world(i), user(i), codebank(i), company(i), ...
            mod(i).scheme);

outcome(i).P = P;
outcome(i).Q = Q;

end;

save sizestudy10.mat outcome world user codebank company mod


