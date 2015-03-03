function price = comp_model3(Qvec, Pvec, risk_fac, limit)
%
% this version of comp_model uses derivative feedback on the
% revenue stream to maximize profits.  The derivative is estimated via a linear fit.
%
q = [Pvec(:) ones(length(Pvec),1)]';
qq = q * q';
out = inv(qq)*q*(Qvec(:).*Pvec(:));
del = out(1);
if (abs(del) > limit),
    flag = 1;
else
    flag = 0;
end;

if flag == 1,
    if del > 0,   
        price = (1+risk_fac)*Pvec(end);
    else  
        price = (1-risk_fac)*Pvec(end);
    end;
else
    price = Pvec(end)*(1 + risk_fac*del/limit);
end


