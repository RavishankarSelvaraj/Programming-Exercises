% Exercise 8.1
%
% author: Dominik Wirsig (2020067), Ravishankar Selvaraj(2036915)
%
% Adaptive step-size

clear;
% play with tau between 10^-3 and 1
tau1 = 0.69;
tau2 = 10^-1;
tau3 = 10^-2;
tau4 = 10^-3;

format long;
x1 = ode56(tau1);
fprintf('tau=0.69:\nRK 5 = %12e\nRK 6 = %e\n', x1(1), x1(2));
x2 = ode56(tau2);
fprintf('tau=10^-1:\nRK 5 = %e\nRK 6 = %e\n', x2(1), x2(2));
x3 = ode56(tau3);
fprintf('tau=10^-2:\nRK 5 = %e\nRK 6 = %e\n', x3(1), x3(2));
x4 = ode56(tau4);
fprintf('tau=10^-3:\nRK 5 = %e\nRK 6 = %e\n', x4(1), x4(2));

function [result] = ode56(tau)
    result = zeros(2, 1); % 2x1 vector for the results
    f = @(x,y) 0.1*y;
    
    % 5th order
    y = 1; % initial value
    for i=1:10000
        t = i * tau;
        k1 = tau * f(t,y);
        k2 = tau * f(t + 2/9 * tau, y + 2/9 * k1);
        k3 = tau * f(t + 1/3 * tau,  y + 1/12 * k1 + 1/4 * k2);
        k4 = tau * f(t + 3/4 * tau, y + 69/128 * k1 - 243/128 * k2 + 135/64 * k3);
        k5 = tau * f(t + tau, y - 17/12 * k1 + 27/4 * k2 - 27/5 * k3 + 16/15 * k4);
        
        y = y + 1/9 * k1 + 9/20 * k3 + 16/45 * k4 + 1/12 * k5;
    end
    result(1) = y;
    
    % 6th order
    y = 1; % initial value
    for i=1:10000
        t = i * tau;
        k1 = tau * f(t,y);
        k2 = tau * f(t + 2/9 * tau, y + 2/9 * k1);
        k3 = tau * f(t + 1/3 * tau,  y + 1/12 * k1 + 1/4 * k2);
        k4 = tau * f(t + 3/4 * tau, y + 69/128 * k1 - 243/128 * k2 + 135/64 * k3);
        k5 = tau * f(t + tau, y - 17/12 * k1 + 27/4 * k2 - 27/5 * k3 + 16/15 * k4);
        k6 = tau * f(t + 5/6 * tau, y + 65/432 * k1 - 5/16 * k2 + 13/16 * k3 + 4/27 * k4 + 5/144 * k5);
        
        y = y + 47/450 * k1 + 12/25 * k3 + 32/225 * k4 + 1/30 *k5 + 6/25 * k6;
    end
    result(2) = y;
end


