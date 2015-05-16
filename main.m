myImg = imread('fish.jpg');

% [outputImgRGB, meanColors] = quantizeRGB(myImg,4);
% 
% [outputImgHSV,meanHues] = quantizeHSV(myImg,8);
% imshow(outputImgHSV)
% % 
% % 
% error = computeQuantizationError(myImg,outputImgRGB);
% error
% 
% error
% [histEqual,histClustered] = getHueHists(myImg,8);
% convert to hsv , get size of img
% reshape hsv image , reshape only hue,

% % 
im = imread('jupiter.jpg');
useGradient = 1;
r = 50;
centers = detectCircles(im,r,useGradient);

Radii = zeros(size(centers,1),1);
Radii(find(Radii == 0)) = r;
figure
imshow(im)
hold on
viscircles(centers,Radii,'EdgeColor','b');
% %title('GRAD: 0, RADIUS: 75, THRESHOLD > .98')
% title('GRAD: 1, RADIUS: 75, HOUGHPEAKS N = 20')
