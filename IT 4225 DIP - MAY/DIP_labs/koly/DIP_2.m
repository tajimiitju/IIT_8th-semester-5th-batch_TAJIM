%% Read a grayscale image
I = imread('insect.jpg');
I = rgb2gray(I);

figure
subplot(1,2,1)
imshow(I)
subplot(1,2,2)
imhist(I,64)

%% I image with uniform intensity
J = histeq(I);

figure
subplot(1,2,1)
imshow(J);
subplot(1,2,2)
imhist(J,64)

%% Mean of Gaussian noise=0
K = imnoise(J,'gaussian');
imshow(K);
%% Mean of Gaussian noise=0.5
L = imnoise(J,'gaussian',.5);
imshow(L);
%% Mean of Gaussian noise=0.2
M = imnoise(J,'gaussian',.2);
imshow(M);
%% Mean of Gaussian noise=1
N = imnoise(J,'gaussian',1);
imshow(N);
%% Apply the averaging filter
h = ones(4,4)/16;

I2 = imfilter(K,h);

figure
imshow(I2)
title('Filtered Image')