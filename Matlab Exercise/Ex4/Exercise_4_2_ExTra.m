% Exercise 4.2
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Extended trapezoidal rule 


% for what small enough k x^k can be integrated exactly?
% for k = 1 its exact
f = @(x) (x^1);
disp(ExTra(f, 0, 1, 0)); % correct solution: 0.5
% for k = 2 its not exact anymore
g = @(x) (x^2); 
disp(ExTra(g, 0, 1, 0)); % correct solution: 0.333...

function [TN] = ExTra(func,a,b,N)
if N < 0
    error('negative n in extended trapez');
elseif N == 0                % only one interval
    h = b - a;  
    TN = h/2*(feval(func,a) + feval(func,b));
else
    h = (b - a) / N;
    TN = 0;
    for i=a+2*h:h:b-h        
        TN = TN + feval(func,i); % add the terms f1 + ... + fN-1
    end
    x0 = a + h;
    TN = TN + .5*(feval(func,x0) + feval(func,b)); % add the first and last term f0 and fN
    
    TN = h*TN;    % trapezoidal rule
end
end