row=512;col=512;
fin=fopen('CT.raw','r');
I=fread(fin,[row col],'uint16=>uint16');
figure,imshow(I);
N=imnoise(I,'gaussian',0.5);
SNR=[];
figure, imshow(N)
for c = 1:10
N = averagefilter(N, [3 3]);
img=double(N(:));
ima=max(img(:));
imi=min(img(:));
ims=std(img(:));
snr=20*log10((ima-imi)./ims);
SNR(end+1)=snr;
end
figure,
ind=1:10;
plot(ind,SNR);
xlabel('Number of filtering');
ylabel('SNR');
title('filtering vs SNR');