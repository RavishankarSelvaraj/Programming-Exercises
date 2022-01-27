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
disp('T for angles between 0 and 90 degrees:');
% generate the table of our results
for i=0:5:90 % angles between 0 and 90 degree
    K = @(x) (1 / sqrt(1 - (sind(i/2)^2*sin(x)^2)));
    K = ExSim(K, 0, pi/2, 100000);
    T = 4 * sqrt(l/g) * K;
    disp(T);
end

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