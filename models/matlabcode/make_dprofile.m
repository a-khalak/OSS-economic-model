function out = make_dprofile (N, min, max)
%
% generate user parameters (demand profile)
%
% function out = make_dprofile (N, min, max)
%
out = (min:(max-min)/(N-1):max)';
