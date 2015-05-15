% myImg = imread('myImg.jpg');
% 
% outputImgRGB = quantizeRGB(myImg,4);
% % imshow(outputImgRGB);
% 
% outputImgHSV = quantizeHSV(myImg,8);
% 
% 
% error = computeQuantizationError(myImg,outputImgRGB);



% convert to hsv , get size of img
% reshape hsv image , reshape only hue,


im = imread('jupiter.jpg');
im = rgb2gray(im);
edgeImg = edge(im);

rows = size(im,1);
columns = size(im,2);


[myGradx,myGrady] = imgradientxy(im2double(im));
%arctotan(myGradx)

%gradImg = sqrt((myGradx.^2) + (myGrady.^2));

r = 50;
H = zeros(rows,columns);
for x=1:1:rows
    for y=1:1:columns
        if(edgeImg(x,y) == 1)
            for theta=1:1:360
                a = x - (r * cosd(theta));
                b = y + (r * sind(theta));
                a = round(a);
                b = round(b);
                if ((a > 0) && (b > 0) && ((a <= rows) && (b <= columns))) 
                    H(a,b) = H(a,b) +  1;
                end
            end
        end
    end
end
 
houghpeaks(H,3)
imagesc(H)





  