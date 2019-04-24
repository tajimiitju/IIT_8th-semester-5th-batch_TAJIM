[fname path]=uigetfile('*.raw','select an image');
fname=strcat(path, fname);
I=imread(fname);
%imshow(I);
J = imnoise(I,'salt & pepper',0.02);
figure
%imshow(J)
Kaverage = filter2(fspecial('average',3),J)/255;
figure
imshow(Kaverage)
Kmedian = medfilt2(J);
figure
imshowpair(Kaverage,Kmedian,'montage')