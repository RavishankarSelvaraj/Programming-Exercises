% Exercise 4.3
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Pendulum

l = 0.5;
g = 9.81;
T0 = 2*pi*sqrt(l/g);
disp('T0:');
disp(T0); % for comparison
disp('T with angles betwween 0 and 90 degrees:');
% generate the table of our results
for i=0:5:90 % angles between 0 and 90 degree
    K = @(x) (1 / sqrt(1 - (sind(i/2)^2*sin(x)^2)));
    K = ExTra(K, 0, pi/2, 10000);
    T = 4 * sqrt(l/g) * K;
    disp(T);
end

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