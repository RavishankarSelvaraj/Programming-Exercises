% Exercise 11.1
%
% author: Dominik Wirsig (2020067), Ravishankar Selvaraj(2036915)

n=50;%given
for m = 1:1:2 %comparing m=1 and m=2
    
    e =(((n*(n-1)*(2*n-1))/6)+((n*(n-1))/2)+((m*(n*(n-1)))/2));% Formula for elimination step
    b = ((n*(n+1)/2)*m);                                      % Formula for back substitution
    fprintf('Total no of division and multiplication in elimination step at m = %d is %d \n',m,e)
    fprintf('Total no of division and multiplication in back substitution at m = %d is %d \n',m,b)
end