% Exercise 10
%
% author: Dominik Wirsig (2020067), Ravishankar Selvaraj(2036915)

% code from the lecture, initial conditions and also
% the time interval choosen from lecture
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf;hold off; % free the plot window
L=6;  % side length of the box
% Initial configuration:
N=5*5;  % Number of particles
x=zeros(N,1); y=zeros(N,1); % reserve storage
vx=zeros(N,1); vy=zeros(N,1); % reserve storage
i=0;
for yi=1:5
    for xi=1:5
        i=i+1;
        x(i)=xi; y(i)=yi;
    end 
end
% Plot the start configuration:
%plot(x,y,'*r');axis([0 L 0 L]);hold on;
%pause;
% random initial momenta
vmax=1; % maximal value
vx=vmax*(2*rand(N,1)-1);vy=vmax*(2*rand(N,1)-1); % 0 < rand < 1 random
vx=vx-mean(vx);vy=vy-mean(vy); % total momentum is set to zero
tf=20;              % final time of the integration of equations of motion
tau=0.005;          % step size
nstep=fix(tf/tau);  % number of steps
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Exercise 10.1

[X,Y,VX,VY,Ekin,Epot]=leapfrog(x,y,vx,vy,L,tau,nstep);
plot(Ekin);
hold
plot(Epot);

function [X,Y,VX,VY, Ekin, Epot]=leapfrog(x,y,vx,vy,L,tau,nstep)

N=length(x); % number of particles
X =zeros(N,nstep+1); Y =zeros(size(X));
VX=zeros(N,nstep+1); VY=zeros(size(X));
Ekin=zeros(nstep+1);
Epot=zeros(nstep+1);
 X(:,1)= x;  Y(:,1)= y;              % start values
VX(:,1)=vx; VY(:,1)=vy;

for n=1:nstep
    X(:,n+1)=X(:,n)+tau*VX(:,n); % positions: n*tau -> (n+1)*tau
    Y(:,n+1)=Y(:,n)+tau*VY(:,n); % using v evaluated at (n+1/2)*tau
    % reflections of particles at the box boundaries:
    for i=1:N
        if X(i,n+1)<0, X(i,n+1)=   -X(i,n+1); VX(i,n)=-VX(i,n); end
        if X(i,n+1)>L, X(i,n+1)=2*L-X(i,n+1); VX(i,n)=-VX(i,n); end
        if Y(i,n+1)<0, Y(i,n+1)=   -Y(i,n+1); VY(i,n)=-VY(i,n); end
        if Y(i,n+1)>L, Y(i,n+1)=2*L-Y(i,n+1); VY(i,n)=-VY(i,n); end
    end
    
    [fx,fy]=LJforce(X(:,n+1),Y(:,n+1));
    
    VX(:,n+1)=VX(:,n)+tau*fx; % momenta: (n+1/2)*tau -> (n+3/2)*tau
    VY(:,n+1)=VY(:,n)+tau*fy; % using fx,fy evaluated at (n+1)*tau
    
    % potential energy double loop over the pairs of atoms i < j
    for i=1:N-1
        for j=i+1:N
            r = sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2);
            fac = 4 * ((1/r)^12-(1/r)^6);
            vx(i+1) = vx(i) + fac;
        end
    end
    Epot(n+1) = sum(vx);
    
    % kinetic energy computet at two times n+1 -> (n+1/2)*tau and 
    % n -> (n-1/2)*tau
    Ekin(n+1) = 1/2 * (dot(VX(:,n+1), VY(:,n+1)) + dot(VX(:,n), VY(:,n)) / 2) ;
    
end
end