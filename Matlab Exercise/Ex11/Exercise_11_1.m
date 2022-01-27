% Exercise 11.1
%
% author: Dominik Wirsig (2020067), Ravishankar Selvaraj(2036915)

% numerical error of the Gaussian elimination method without pivoting and
% without iterative improvement
%
% the plot shows that the error increases when the matrix size increases
for n=2:100
    A = (rand(n,n));
    x = (rand(n,1));
    b = A * x;
    y = gaussel(A, b);
    delta(n-1) = max(abs(x - y));
end
n = [1:100];
figure('Name', 'numerical error of the Gaussian elimination')
graphic = semilogy(n,delta);
xlabel('n');
ylabel('delta');

% comparing all three versions
for n=2:100
    A = (rand(n,n));
    x = (rand(n,1));
    b = A * x;
    y = gaussel(A, b);
    yp = gaussel_p(A, b);
    yexact = A\b;
    delta(n-1) = max(abs(x - y));
    deltap(n-1) = max(abs(x - yp));
    deltaexact(n-1) = max(abs(x - yexact));
end
n = [1:100];
figure('Name', 'Errors of Gaussian, Gaussian with pivot and Matlab built in')
grid on
loglog(n, delta,".",'MarkerEdgeColor','b')
hold on
deltap(100) = 0;
loglog(n, deltap, ".",'MarkerEdgeColor','r')
hold on
deltaexact(100) = 0;
loglog(n, deltaexact, ".",'MarkerEdgeColor','g')

legend({"gaussel", "gaussel pivot", "matlab built in"})
xlabel('n')
ylabel('delta')

% Gaussian elimination with partial pivoting
function [x] = gaussel_p(A,b)
[m,n]=size(A);
if m~=n | n~=size(b,1), error('not a square matrix problem'); end;

B=[A b];
N=size(B,2);

% initialize vector p for bookkeeping
p = zeros(1, n);
for i=1:n
    p(i) = i;
end

% bring the matrix into triangular form (Gauss elimination):

for k=1:n-1,    % loop over columns where the zeros will appear with pivoting
    maximal = max(B(p(k:n), k));
    index = B(p(1:n), k) == maximal;
    if p(k) ~=p(index)
        temp = p(index);
        p(index) = p(k);
        p(k) = temp;
    end
    fac=1/B(p(k),k);
    for i=k+1:n   % loop over rows where subtractions take place
    fac1=fac*B(p(i),k); % factor
    B(p(i),k)=0; % new zero by construction
    B(p(i),k+1:N)=B(i,k+1:N)-B(k,k+1:N)*fac1; % subtraction
    end
end

% Solution by backsubstitution :
x=zeros(size(b)); % predefinition of x
for k=n:-1:1
  x(k,:)=B(p(k),n+1:N);
  for j=k+1:n
    x(k,:)=x(k,:)-B(p(k),j)*x(j,:);
  end
  x(k,:)=x(k,:)/B(p(k),k);
end
end

% Code from the lecture
function [x] = gaussel(A,b)
[m,n]=size(A);
if m~=n | n~=size(b,1), error('not a square matrix problem'); end;

B=[A b];
N=size(B,2);

% bring the matrix into triangular form (Gauss elimination):

for k=1:n-1,    % loop over columns where the zeros will appear
  fac=1/B(k,k);
  for i=k+1:n   % loop over rows where subtractions take place
    fac1=fac*B(i,k); % factor
    B(i,k)=0; % new zero by construction
    B(i,k+1:N)=B(i,k+1:N)-B(k,k+1:N)*fac1; % subtraction
  end
end

% Solution by backsubstitution :
x=zeros(size(b)); % predefinition of x
for k=n:-1:1
  x(k,:)=B(k,n+1:N);
  for j=k+1:n
    x(k,:)=x(k,:)-B(k,j)*x(j,:);
  end
  x(k,:)=x(k,:)/B(k,k);
end
end