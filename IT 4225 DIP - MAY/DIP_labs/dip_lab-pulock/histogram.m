I=rgb2gray(imread('peppers.png'));
if (isa(I,'uint8'))
  I=double(I)/255;
end
if (size(I,3)==3)
  I=(I(:,:,1)+I(:,:,2)+I(:,:,3))/3; % average the RGB channels
end
windowsize=17;
% Create an empty array
Ieq = zeros(size(I,1),size(I,2));
% Apply this over a NxN region around each pixel (N is odd)
n = floor(windowsize/2); % <-- N is the half size of the region ie. [-N:N,-N:N]
for r=1+n:size(I,1)-n
  for c=1+n:size(I,2)-n
    % -- INSERT YOUR CODE BELOW ------------------------------------------
    % NOTE: For pixels near the boundary, ensure the NxN neighbourhood is still
    % inside the image (this means for pixels near the boundary the pixel may
    % not be at the centre of the NxN neighbourhood).
      if r-n <=1
      fromrow=1;
      torow=r+n;
      else
          fromrow=abs(r-n);
          if n+r >= size(I,1)
              torow=size(I,1);
          else
              torow=r+n;
          end
      end
      if c-n <= 1
          fromcol=1;
          tocol=c+n;
      else
          fromcol=abs(c-n);
          if c+n > size(I,2);
              tocol=size(I,2);
          else
              tocol=c+n;
          end
      end
      neighbour = I(fromrow:torow,fromcol:tocol);
      lessoreq=neighbour(neighbour<=I(r,c));
      sumofval=sum(lessoreq);
      pixval=sumofval/(size(neighbour,1)*size(neighbour,2));
      Ieq(r,c)=pixval;
      % -- INSERT YOUR CODE ABOVE ------------------------------------------
    end
  end
  imshow(Ieq);