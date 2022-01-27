% Exercise 3.1
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Newton-Raphson

% f(x) = exp(x) - R 
% R = 4, x0 = ln(4) = 1,3863... But R can be any number to
% compute ln(R) with Newton-Raphson
% The written formula of the iteration for this case is
% x(n+1) = x(n) - ((exp(x(n)) - R) / exp(x(n)))
f = @(x) exp(x) - 4;

% f'(x) = exp(x)
df = @(x) exp(x);

% start value
x1 = 1;

xRoot = newRa(f, df, x1, 1e-15);
disp(xRoot);

function x = newRa(func, dfunc, x1, tol)

    xPrev = x1;
    x = xPrev - func(xPrev)/dfunc(xPrev);
    delta = Inf;
    
    while delta > tol
        xPrev = x;
        x = xPrev - func(xPrev)/dfunc(xPrev);
        fprintf('%f \n', x);
        delta = abs((x-xPrev)/xPrev);
    end
end
 
