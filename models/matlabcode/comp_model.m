function [price, popt, flag] = comp_model(Q2, Q1, P2, P1, risk_fac)
%
% this version of comp_model uses derivative feedback on the
% revenue stream to maximize profits.
%
  if (P2 ~= P1),
     del = (Q2*P2 - Q1*P1) / (P2 - P1) ;
     flag = 0;
  else
     del = (Q2*P2 - Q1*P1);
     flag = 1;
  end;

  if del > 0,
    price = (1+risk_fac)*P2;
  else
    price = (1-risk_fac)*P2;
  end;


