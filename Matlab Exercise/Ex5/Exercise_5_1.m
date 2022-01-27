% Exercise 5.1
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% discrete Fourier transform (DFT)

f = @(x) 5*sin(2*pi*x) + 2 * cos(6*pi*x) + sin(10*pi*x);

% first part:
% own function for DFT
N = 16;
L = 1;
a = 1 / N;
x = (0:N-1) * a;
k = (0:N-1) * 2 * pi / L;
F = f(x);
g = dft(F, x, a, k, N);
figure
plot(t,abs(g));

% second part:
% the Fourier components are imaginary. Three components with the ratio
% 5:2:1 can be found in the second plot at the points (0.0625, 40), (0.1875, 16) and (0.3125, 8)
% With increasing values for N the Maxima get closer to the boundaries
t=0:1/N:1-(1/N);
q = f(t);
m = fft(q);
y = abs(m); % magnitude
figure
plot(t, y);

function dft = dft(Fx, x, a, k, N)
    for m = 1:N
        dft(m) = 0;
        for n=1:N
            dft(m) = dft(m) + a * exp(-1i * k(m) * x(n)) * Fx(n);
        end
    end
end



