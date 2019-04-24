[fname path]=uigetfile('*.jpg','select an image');
fname=strcat(path, fname);
im=imread(fname);
imshow(im);
%title('color image');
for(i=1:3)
im2(:,:,i)=imnoise(im(:,:,i),'salt & paper',.2);
end
figure
imshow(im2);