% Exercise 2.2
% 
% author: Dominik Wirsig (2020067), Ravishankar Selvaraj (2036915)
%
% number of iterations to obtain machine precision are 799

beta = .17;
x_star = .24062696159732;
x1 = 1;
n = 1;

% find the number of iterations
while(true)
x2 = tanh(6*beta*x1);

if x2 ~= 0
    delta(n) = abs(x2 - x1)/abs(x1);
    disp(delta(n));
end

if delta(n) <= eps(1)
    % plot the error
    plot(1:n,log10(delta),'r-');
    xlabel('Number of Iterations n')
    ylabel('log10\delta(n)')
    fprintf('Number of iterations to obtain machine precision are %d\n', n);
    break;  
end

n = n+1;
x1 = x2;

end