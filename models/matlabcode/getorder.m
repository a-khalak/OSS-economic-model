function order = getorder(PI, factor, N_users, OSS)
%
% getorder outputs a list of companies w/ in random order with a 
% probablility based upon their popularity index...
%
Mp = length(PI);
prob = rand(Mp, N_users);
if ~OSS, 
  prob(Mp,:) = zeros(1,N_users); 
  end;
[junk,order] = sort(-(1-factor) * PI * ones(1,N_users) - factor * prob);
