% Exercise 9
%
% author: Dominik Wirsig (2020067), Ravishankar Selvaraj(2036915)
%
% Land satellite on the Moon
%
% Sorry we couldnt land the satellite on the moon. The programm is not
% running anymore and we couldnt fix it by time. Also we couldnt 
% find the initial values (alpha, v0). So this should be seen as kind of 
% pseudo code.  

% b)

t0 = 0;     % initial value for the time 
Re = 1.208; % position of earth
Rm = 59.192; % position of moon
rs = 1.06; % radius of satellites parking orbit in EU
opts = odeset('RelTol',2e-6);
landed = false;
t = 10;

% find these initial conditions
v0 = 10; % instantaneous tangential velocity
a = pi/2;

y0 = [-Re+rs*cos(a) rs*sin(a) v0*cos(a) v0*sin(a)]; % initial values y0

% first plot to mark the origin of the coordinate system which should be
% the Center of Mass
plot(0,0);
hold

% from day 1 to day 28
for i=1:28
    tfinal = t0 + 24; % integration over 24h
    tspan = [t0 tfinal];
    [t, y] = ode45('dydt', tspan, y0, opts);
    t0 = tfinal;
    y0 = y(end,:);
    
    % positions of earth and moon
    [xm, ym] = rmoon(t);
    [xe, ye] = rearth(t);
    for j=1:length(t)
        p = sqrt((xm(j) - y(j,1))^2 + (ym(j) - y(j, 2))^2); % distance between satellite and moon
        % if the satellite has "landed" exit the loop
        if p < 3500
            landed = true;
            break;
        end
    end
    % update the plot
    drawnow;
end

% the satellites position and velocity form a vetor y and the dif. eq. is
% y' = f(t, y)
function yprime = dydt(t, y)
    yprime(1, 1) = y(3);
    yprime(2, 1) = y(4);
    yprime(3, 1) = -y(1) / (y(1)^2 + y(2)^2)^(3/2);
    yprime(4, 1) = -y(2) / (y(1)^2 + y(2)^2)^(3/2);
end

% gives earth position at time t
function [x, y] = rearth(t)
    x = -1.208 * cos(2 * pi / 27.322 * 24 * t);
    y = -1.208 * sin(2 * pi / 27.322 * 24 * t);
end

% gives moon position at time t
function [x, y] = rmoon(t)
    x = 59.192 * cos(2 * pi / 27.322 * 24 * t);
    y = 59.192 * sin(2 * pi / 27.322 * 24 * t);
end