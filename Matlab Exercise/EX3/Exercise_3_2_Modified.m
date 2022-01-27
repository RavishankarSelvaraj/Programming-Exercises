% Exercise 3.2
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Secant Method
%
% to modify the secant method so it converges garantueed we must check for the next
% interval that the root is contained. After computing
% the next point x_next we must check if f(x1)*f(x_next) or f(x2)*f(x_next)
% has a negative sign. Then that will be the next intervall which contains
% garantueed the root. 
% 

beta = 0.17;
f = @(m) (tanh(1.02*m)-m);

% with initial values x1 = 0.1 and x2 = 2 this method doesnt converge
x = secant(f, 0.1, 0.3, 1e-10);
disp(x);

% ideas for ploting delta and to find the convergence exponent alpha
% len_delta=length(delta); 
% ln(e3/e2)/ln(e2/e1)
% alpha = log(delta(len_delta-1)/delta(len_delta-2))/log(delta(len_delta-2)/delta(len_delta-3));

  function [x0] = secant(func,x1,x2,tol)
  f1=feval(func,x1); if f1 == 0, x0=x1; return; end
  f2=feval(func,x2); if f2 == 0, x0=x2; return; end
  if f1*f2 >= 0 || x1 >= x2
    error(' bad choice of x1, x2');
  end

  % secant loop:
  for i=1:500
    x0 = x1 - (func(x1) * ((x1 - x2) / (func(x1) - func(x2))));
    
    %ending condiditin if the solution is precise enough
    if abs(f1 - f2) < tol 
        return; 
    end
    f0 = func(x0);
 
    % choose the next x1 and x2
    % the root is contained between x1 and x0
    if f1*f0 < 0
        x2 = x0; f2=f0;
    end
    % the root is contained between x2 and x0
    if f2*f0 < 0
       x1 = x0; f1=f0;
    end
  end
  error(' did not find a zero')
  end