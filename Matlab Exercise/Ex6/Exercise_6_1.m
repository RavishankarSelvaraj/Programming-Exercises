% Exercise 6.1
%
% author: Dominik Wirsig(2020067), Ravishankar Selvaraj(2036915)
%
% Image compression

% in the attached .pdf file there are
% - the image after the DCT transform
% - the image after the IDCT transform, to show the functions are inverse
% - the cropped image with rho = 0.3

Y = double(imread('test_image.tif','TIF'));
DCT(Y);
crop(Y, 0.3);

% a)
% DCT and IDCT in one function. The plot of the images are also handled in
% the end of the function
function B = DCT(im)
    % DCT
    N1 = length(im(:,1,1));
    N2 = length(im(1,:,1));
    A = zeros(N1, N2);
    B = zeros(N1, N2);
    % transform along one dimension
    for k1 = 1:N1
        if k1 == 1
            wk1 = 1;
        else
            wk1 = 2;
        end
        for n1 = 1:N1
            A(k1, :) = A(k1,:) + im(n1, :) * cos(pi * (2 * n1 - 1) * (k1 - 1) / (2 * N1));
        end
        A(k1, :) = A(k1, :) * sqrt(wk1/N1);
    end
    % transform along other dimension
    for k2 = 1:N2
        if k2 == 1
            wk2 = 1;
        else
            wk2 = 2;
        end
        for n2 = 1:N2
            B(:, k2) = B(:, k2) + A(:, n2) * cos(pi * (2 * n2 - 1) * (k2 - 1) / (2 * N2));
        end
        B(:, k2) = B(:, k2) * sqrt(wk2/N2);
    end
    
    % IDCT
    C = zeros(N1, N2);
    D = zeros(N1, N2);
    for n1 = 1:N1
        for k1 = 1:N1
            if k1 == 1
                wk1 = 1;
            else 
                wk1 = 2;
            end
            C(n1, :) = C(n1, :) + B(k1, :) * cos(pi * (2 * n1 - 1) * (k1 - 1) / (2 * N1)) * sqrt(wk1/N1);
        end
    end
    for n2 = 1:N2
        for k2 = 1:N2
            if k2 == 1
                wk2 = 1;
            else
                wk2 = 2;
            end
            D(:, n2) = D(:, n2) + C(:, k2) * cos(pi * (2 * n2 - 1) * (k2 - 1) / (2* N2)) * sqrt(wk2/N2);
        end
    end
    
    % display the image after DCT and then after IDCT
    dim = size(B);
    figure('Units', 'pixels','position',[1 1 20+dim(2) 20+dim(1)])
    ax=axes('Units', 'pixels', 'position', [10, 10, dim(2), dim(1)],'visible','off','Ydir','reverse');
    hold on;
    image(B,'parent',ax);
    colormap(gray(256)); % correct mapping: values<->colors
    
    dim = size(D);
    figure('Units', 'pixels','position',[1 1 20+dim(2) 20+dim(1)])
    ax=axes('Units', 'pixels', 'position', [10, 10, dim(2), dim(1)],'visible','off','Ydir','reverse');
    hold on;
    image(D,'parent',ax);
    colormap(gray(256)); % correct mapping: values<->colors
end

% b)
function A = crop(Y, rho)
    A = Y;
    N1 = length(A(:,1,1));
    N2 = length(A(1,:,1));
    
    for i = 1 : N1
        for j = 1 : N2
            if (i^2 + j^2) > (rho^2 * (N1^2 + N2^2))
                A(i, j) = 0;
            end
        end
    end
    % display the cropped image
    dim = size(A);
    figure('Units', 'pixels','position',[1 1 20+dim(2) 20+dim(1)])
    ax=axes('Units', 'pixels', 'position', [10, 10, dim(2), dim(1)],'visible','off','Ydir','reverse');
    hold on;
    image(A,'parent',ax);
    colormap(gray(256)); % correct mapping: values<->colors
end