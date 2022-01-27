% Exercise 4.2
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Extended Simpson's rule 

% for what small enough k x^k can be integrated exactly?
% for k = 1 its exact
f = @(x) (x^1);
disp(ExSim(f, 0, 1, 0)); % correct solution: 0.5
% for k = 2 its exact
g = @(x) (x^2);
disp(ExSim(g, 0, 1, 0)); % correct solution: 0.333...
% for k = 3 its exact
h = @(x) (x^3);
disp(ExSim(h, 0, 1, 0)); % correct solution: 0.25
% for k = 4 its not exact anymore
g = @(x) (x^4);
disp(ExSim(g, 0, 1, 0)); % correct solution: 0.2


function [SN] = ExSim(func,a,b,N)
if N < 0
    error('negative n in extended Simpsons');
elseif N == 0                % only one interval
    h = (b - a) / 2;  
    SN = h*(1/3*feval(func,a) + 4/3 * feval(func,(a+b)/2) + 1/3 * feval(func,b));
else
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
end
end