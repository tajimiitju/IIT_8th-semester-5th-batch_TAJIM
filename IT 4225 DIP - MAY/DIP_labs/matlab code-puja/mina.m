a = [11 11; 11 11];
P = mat2gray(a,[0 15]);
imshow(P)
K=P;
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K+wgn(2,2,0);
K = K/10;
imin = min(K);
imax = max(K);
isd = std(K);
SNR = 20*log10((imax-imin)/isd);
disp(SNR)
imshow(K)