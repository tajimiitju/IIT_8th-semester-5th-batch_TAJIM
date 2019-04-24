row=512;  col=512;
fin=fopen('CT.raw','r');
I=fread(fin, [col row],'uint16=>uint16'); 
Z=I';
k=imshow(Z)