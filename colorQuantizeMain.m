myImg = imread ('fish.jpg');

[RGB5, meanColors] = quantizeRGB(myImg,5); %quantize my image with k = 5 then plot
figure
subplot(2,2,1)
imshow(RGB5)
title('quantizeRGB k = 5')

[RGB25, meanColors] = quantizeRGB(myImg,25);
subplot(2,2,2);
imshow(RGB25);
title('quantizeRGB k = 25')

[HSV5, meanHues] = quantizeHSV(myImg, 5);
subplot(2,2,3)
imshow(HSV5);
title('quantizeHSV k = 5')

[HSV25, meanHues] = quantizeHSV(myImg, 25);
subplot(2,2,4)
imshow(HSV25);
title('quantizeHSV k = 25')

ErrorRGB = computeQuantizationError(myImg, RGB5);
ErrorRGB
ErrorHSV = computeQuantizationError(myImg, HSV5);
ErrorHSV
ErrorRGB25 = computeQuantizationError(myImg, RGB25);
ErrorRGB25
ErrorHSV25 = computeQuantizationError(myImg, HSV25);
ErrorHSV25

[Equal, Clustered] = getHueHists(myImg, 5)
[Equal25, Clustered25] = getHueHists(myImg, 25)




