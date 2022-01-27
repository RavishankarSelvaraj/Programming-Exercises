% Exercise 4.2
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Extended trapezoidal rule 


% solve numerically the two given integrals
f = @(x) sqrt(4-x^2); % exact(10^-8) solution for integral [0, 2]: pi = 3.14159265
ExTra(f, 0, 2, 1);

 
function [TN] = ExTra(func,a,b,N)
xExact = 3.14159265;
delta(1) = 1;
k = 1;
tol = 1e-8;
if N < 0
    error('negative n in extended trapez');
elseif N == 0                % only one interval
    h = b - a;  
    TN = h/2*(feval(func,a) + feval(func,b));
else
    while delta(1,end)> tol
    h = (b - a) / N;
    TN = 0;
    for i=a+2*h:h:b-h        
        TN = TN + feval(func,i); % add the terms f1 + ... + fN-1
    end
    x0 = a + h;
    TN = TN + .5*(feval(func,x0) + feval(func,b)); % add the first and last term f0 and fN
    
    TN = h*TN;    % trapezoidal rule
    delta(k) = abs(TN - xExact)/xExact;
    k = k + 1;
    N = N + 30000000;
    subinterval(k) = N;
    end
    disp(N); % How many function calls needed?
    % Our programs do not give the exact number of calls. The runtime is
    % too long, so we can only provide pseudocode to find the exact N:
    % while delta > tol
    %   TN = TNnew
    %   delta = deltaNew
    %   N++
    % end
    % print(N)
    loglog(subinterval(1,2:end),delta);
end
end