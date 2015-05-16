origImg = imread ('myImg.jpg');

[RGB, meanColors] = quantizeRGB(origImg,5);
figure
subplot(2,2,1)
imshow(RGB)
title('quantizeRGB k = 5')

[RGB25, meanColors] = quantizeRGB(origImg,25);
subplot(2,2,2)
imshow(RGB25)
title('quantizeRGB k = 25')

[HSV, meanHues] = quantizeHSV(origImg, 5);
subplot(2,2,3)
imshow(HSV);
title('quantizeHSV k = 5')

[HSV25, meanHues] = quantizeHSV(origImg, 25);
subplot(2,2,4)
imshow(HSV25);
title('quantizeHSV k = 25')

ErrorRGB = computeQuantizationError(origImg, RGB);
ErrorRGB
ErrorHSV = computeQuantizationError(origImg, HSV);
ErrorHSV
ErrorRGB25 = computeQuantizationError(origImg, RGB25);
ErrorRGB25
ErrorHSV25 = computeQuantizationError(origImg, HSV25);
ErrorHSV25

[E, C] = getHueHists(origImg, 5)
[E, C] = getHueHists(origImg, 25)




