function [price, popt, flag] = comp_model2(Q2, Q1, P2, P1, risk_fac, limit)
%
% this version of comp_model uses derivative feedback on the
% revenue stream to maximize profits.
%
  flag = 0;
  if (P2 ~= P1),
     del = (Q2*P2 - Q1*P1) / (P2 - P1);
     if (abs(del) >= limit*Q2),
         flag = 1;
     end;
  else
     del = (Q2*P2 - Q1*P1);
     flag = 1;
  end;

  if flag == 1,
    if del > 0,   
        price = (1+risk_fac)*P2;
    else  
        price = (1-risk_fac)*P2;
    end;
else
    price = P2*(1 + risk_fac*del/limit/Q2);
end


