function [P,Q] = ecsold (w, u, cb, corp, initial_scheme); 
% ecs.m  -- Economic simulation of OSS process
%
% [P,Q] = ecs (world_parms, user_parms, cb_parms, comp_parms, initial_scheme); 
%
% w    structure with fields [N, M, timelen, OSS];   (all scalars)
% u    structure with field p                         Nx1 matrix
% cb   structure w/  fields b1 and b2                 scalars
% corp structure with fields c and alpha              each is Mx1 matrix
% initial_scheme, string argument e.g. "equal price, random list, all raise"

% Definitions:
% ============
% world parameters
% N    - number of users
% M    - number of companies
% timelen - length of simulation
% OSS  - time of open source introduction
% 
% company parameters          code bank parameters           
% c    - fixed costs	      b1   - market share vs. advert 
% alpha- risk factor	      b2   - random vs. determ.      

%
% initialize variables and unpack world parameters
%
N  = w.N; M = w.M;
timelen = w.timelen; OSS = w.OSS;
Q  = zeros(M+1,timelen);       % quantity sold at time t
P  = zeros(M+1,timelen);       % prices at time t

% Initial conditions case 1:
% initial price equal to mean demand, initial quantities are specified as the
% "fair" share of the market.  Everyone slightly raises their prices in the
% second round.
%
if (length(strmatch(initial_scheme, ...
    'equal price, comp quant, all raise', 'exact'))>0), 
pinitial = mean(u.p);
qinitial = sum(pinitial < u.p) / M;
P(1:M,1) = ones(M,1)*pinitial;
Q(1:M,1) = ones(M,1)*qinitial;
P(1:M,2) = (1 + corp.alpha) .*P (1:M,1);
end;


%%%  TIME LOOP
%
for k1 = 2:timelen,

% first do the code bank stuff
%
  MS = Q(:,k1-1) / sum(Q(:,k1-1));
  AD = max((Q(:,k1-1) .* P(:,k1-1) - [corp.c;0]),0);
  if sum(AD) > 0, AD = AD / sum(AD); end;
  PI = (1-cb.b1)*AD + cb.b1*MS;

% now go over users
%
Q(:,k1) = model_users(u.p, P(:,k1), PI, cb.b2, N, M, k1>OSS );

% now loop over companies
%
for k3 = 1:M,
  P(k3,k1+1) = ...
          comp_model (Q(k3,k1),Q(k3,k1-1),P(k3,k1),P(k3,k1-1), corp.alpha(k3));
end;

end;           
%
%%% END TIME LOOP



