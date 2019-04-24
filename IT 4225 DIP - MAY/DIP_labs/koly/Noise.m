I = imread('insect.jpg');
I = rgb2gray(I);
imshow(I);

%%
J = imnoise(I,'gaussian');
imshow(J);
%%
K = imnoise(I,'gaussian',1);
imshow(K);
%%
L = imnoise(I,'gaussian',.5);
imshow(L);
%%
M = imnoise(I,'gaussian',.2);
imshow(M);
%%
[peaksnr, snr] = psnr(J,I);
  
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);
%%
[peaksnr, snr] = psnr(K,I);
  
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);
%%
[peaksnr, snr] = psnr(L,I);
  
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);
%%
[peaksnr, snr] = psnr(M,I);
  
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);