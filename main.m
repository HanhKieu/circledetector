myImg = imread('myImg.jpg');

outputImg = quantizeRGB(myImg,8);
imshow(outputImg);

outputImg = quantizeHSV(myImg,8);
imshow(outputImg)