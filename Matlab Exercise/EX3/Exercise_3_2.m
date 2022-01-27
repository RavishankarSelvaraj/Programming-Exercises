% Exercise 3.2
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Secant Method
%
% unmodified variant

beta = 0.17;
f = @(m) (tanh(1.02*m)-m);
x = secant(f, 0.1, 0.3, 1e-10);
disp(x);

  function [x0] = secant(func,x1,x2,tol)
  f1=feval(func,x1); if f1 == 0, x0=x1; return; end
  f2=feval(func,x2); if f2 == 0, x0=x2; return; end
  if f1*f2 >= 0 || x1 >= x2
    error(' bad choice of x1, x2');
  end
  % secant loop:
  for i=1:100
    x0 = x1 - (func(x1) * ((x1 - x2) / (func(x1) - func(x2))));
    if abs(func(x1) - func(x2)) < tol 
        return; 
    else                 
      x2=x1; x1=x0;
    end
  end
  error(' did not find a zero')
  end