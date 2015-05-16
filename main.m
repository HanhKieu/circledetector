% myImg = imread('myImg.jpg');
% 
% outputImgRGB = quantizeRGB(myImg,4);
% % imshow(outputImgRGB);
% 
% outputImgHSV = quantizeHSV(myImg,8);
% 
% 
% error = computeQuantizationError(myImg,outputImgRGB);
% 
% error

% convert to hsv , get size of img
% reshape hsv image , reshape only hue,

% 
im = imread('jupiter.jpg');
useGradient = 0;
r = 50;
centers = detectCircles(im,r,useGradient);

