% runecs.m
%
% run the economic model for a specific case and plot the results
%

w = struct ('N', 100, ...
            'M', 2, ...
            'timelen', 1000, ...
            'OSS', 950);
u = struct ('p', make_dprofile(w.N, 0.8, 3.0));
cb = struct ('b1', 0.7, ...
             'b2', 0.3);
comp = struct ('c',   40*ones(w.M,1), ...
             'alpha', 0.01 * ones(w.M,1));
scheme = 'equal price, comp quant, all raise';


[P,Q] = ecs(w, u, cb, comp, scheme);

plt = struct ('tbegin', -950, 'tend', 0, 'colors', ['wrgbmcyk'], ...
              'plottype', 'standard');

[corprof osmark demcurv] = plotecs (P, Q, w, u, plt);
 
