% Exercise 4.2
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Extended Simpson's rule 

% solve numerically the two given integrals
f = @(x) sqrt(4-x^2); % exact(10^-8) solution for integral [0, 2]: pi = 3.14159265
ExSim(f, 0, 2, 1);

function [SN] = ExSim(func,a,b,N)
xExact = 3.14159265;
delta(1) = 1;
k = 1;
tol = 1e-8;
if N < 0
    error('negative n in extended Simpsons');
elseif N == 0                % only one interval
    h = (b - a) / 2;  
    SN = h*(1/3*feval(func,a) + 4/3 * feval(func,(a+b)/2) + 1/3 * feval(func,b));
else
    while delta(1,end)> tol
    h = (b - a) / N;
    x0 = a + h;
    SN = (feval(func,x0) + feval(func,b)); % add the first and last term f0 and fN
    sumEven = 0;
    sumOdd = 0;
    for i=3:2:N-1
        sumOdd = sumOdd + feval(func,a + i*h); % add the terms with odd index f1, f3,.. , fN-1 
    end
    for i=2:2:N-2
        sumEven = sumEven + feval(func,a + i*h);  % add the terms with even index f2, f4,.. , fN-2
    end
    SN = SN + 2 * sumOdd + 4 * sumEven;
    SN = h/3*SN;  
    delta(k) = abs(SN - xExact) / xExact;
    k = k + 1;
    N = N + 30000000;
    subinterval(k) = N;
    end
    disp(N); % How many function calls needed?
    loglog(subinterval(1,2:end),delta);
end
end