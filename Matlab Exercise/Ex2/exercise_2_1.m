% Exercise 2.1
%
% author: Dominik wirsig(2020067), Ravishankar Selvaraj(2036915)
% 
%          1
%         /
%  y_n = | x^n/(x+10)dx
%         /
%         0
%
% we are using backward recurrence because it is numerically stable 
% y(100)   = 1
% y(n-1) = (1-(n)*(y(n))) / (10*(n)  
% y(n) = (1-(n+1)*(y(n+1))) / (10*(n+1)
% In this case, Forward Iteration is inverse of Backward Iteration.
%


% FORWARD ITERATION y(1) to y(20) is unstable
fprintf('FORWARD ITERATION y(1) to y(20) is unstable from y(15) and ongoing!\n\n')

y(1) = 1-(10*log(11/10));

for n=1:20
   y(n+1) = ((1/(n+1))-(10*y(n)));
   fprintf('y_%2d = %0.16f\n',n,y(n))
end


% BACKWARD ITERATION
fprintf('\n');
fprintf('BACKWARD ITERATION y(1) to y(20) computed to machine precision.\n\n')

 y(100) = 1;
for n=99:-1:1
    y(n) = (1-(n+1)*(y(n+1))) / (10*(n+1));
end

for n=1:20
   fprintf('y_%2d = %0.16f\n',n,y(n)) 
end
