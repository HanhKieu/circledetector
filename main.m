myImg = imread('myImg.jpg');

outputImgRGB = quantizeRGB(myImg,8);
imshow(outputImgRGB);

outputImgHSV = quantizeHSV(myImg,8);
imshow(outputImgHSV)

error = computeQuantizationError(myImg,outputImgRGB);