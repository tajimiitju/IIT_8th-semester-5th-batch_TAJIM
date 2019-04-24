clc;    
close all;  

I = 50*ones(500,500,'uint8'); 
subplot(3, 3, 1);
imshow(I);
title('original image');
   
   
   G=imnoise(I,'gaussian',0.0005,0.0019);
   subplot(3, 3, 2);
   imshow(G);
   title('noisy image');
   
   
   img=G;
img=double(img(:));
ima=max(img(:));
imi=min(img(:));
mse=std(img(:));
snr_noisy=20*log10((ima-imi)./mse)
   
   h = fspecial('average', 3);
   F=imfilter(G,h);
   subplot(3, 3, 3);
   imshow(F);
   title('blured k=3');
   

img1=F;
img1=double(img1(:));
ima1=max(img1(:));
imi1=min(img1(:));
mse1=std(img1(:));
snr_mask3=20*log10((ima1-imi1)./mse1)


 h2 = fspecial('average', 5);
   F2=imfilter(G,h2);
   subplot(3, 3, 4);
   imshow(F2);
   title('blured k=5');
   

img2=F2;
img2=double(img2(:));
ima2=max(img2(:));
imi2=min(img2(:));
mse2=std(img2(:));
snr_mask5=20*log10((ima2-imi2)./mse2)




 h3 = fspecial('average', 7);
   F3=imfilter(G,h3);
   subplot(3, 3, 5);
   imshow(F3);
   title('blured k=7');
   

img3=F3;
img3=double(img3(:));
ima3=max(img3(:));
imi3=min(img3(:));
mse3=std(img3(:));
snr_mask7=20*log10((ima3-imi3)./mse3)





 h4 = fspecial('average', 9);
   F4=imfilter(G,h4);
   subplot(3, 3, 6);
   imshow(F4);
   title('blured k=9');
   

img4=F3;
img4=double(img4(:));
ima4=max(img4(:));
imi4=min(img4(:));
mse4=std(img4(:));
snr_mask9=20*log10((ima4-imi4)./mse4)





 h5 = fspecial('average', 11);
   F5=imfilter(G,h5);
   subplot(3, 3, 7);
   imshow(F5);
   title('blured k=11');
   

img5=F5;
img5=double(img5(:));
ima5=max(img5(:));
imi5=min(img5(:));
mse5=std(img5(:));
snr_mask11=20*log10((ima5-imi5)./mse5)
