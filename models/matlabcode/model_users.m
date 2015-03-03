function Q = model_usersfast(p, P, PI, codebank2, N_users, M_companies, OSS);
%
% implement model of users
%
order = getorder(PI, codebank2, N_users, OSS);
check = P(order) < ones(M_companies+1,1)*p';
if ~OSS, 
  check(M_companies+1,:) = zeros(size(check(1,:))); 
  end;
next = 1:N_users;

for k1 = 1:M_companies,
out = next(find(check(k1,next)==1));
in  = next(find(check(k1,next)==0));
check (k1+1:M_companies+1,out) = zeros(size(check (k1+1:M_companies+1,out)));  
 if ~isempty(in),
   next = in;
 else
   break;
 end;
end;

reorder = sum(order .* check);

for k2 = 1:M_companies+1;
Q(k2) = sum(reorder == k2);
end;

Q = Q';
