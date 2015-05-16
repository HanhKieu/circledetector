function [centers ] = detectCircles( im, r, useGradient )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

im = rgb2gray(im);
edgeImg = edge(im);

rows = size(im,1);
columns = size(im,2);
H = zeros(rows,columns);
[edgex,edgey] = find(edgeImg == 1); %allocate memory

if useGradient == 0
    
    %[myGradx,myGrady] = imgradientxy(im2double(im));
    %arctotan(myGradx)

    %gradImg = sqrt((myGradx.^2) + (myGrady.^2));

    



    for i=1:1:size(edgex,1)
        for theta=1:1:360
            a = edgex(i) - (r * cosd(theta));
            b = edgey(i) + (r * sind(theta));
            a = round(a);
            b = round(b);
            if ((a > 0) && (b > 0) && ((a <= rows) && (b <= columns))) 
                H(a,b) = H(a,b) +  1;
            end
        end
    end



else

    
%     
% [~, angle] = imgradient(edgeImg);
[myGradx,myGrady] = gradient(im2double(im));
% convX = conv2(myGradx,[-1/2 0 1/2])
% 
% convY = conv2(myGrady,[-1/2 0 1/2])

angle = atan2(myGradx,myGrady);

 for i=1:1:size(edgex,1)
            oldtheta = angle(edgex(i),edgey(i));
            for theta=0:.01:(oldtheta * oldtheta)
                a = edgex(i) - (r * cos(theta));
                a2 = edgex(i) - (r * cos(theta * (-1)));
                b = edgey(i) + (r * sin(theta));
                b2 = edgey(i) + (r * sin(theta * (-1)));
                a = round(a);
                b = round(b);
                a2 = round(a2);
                b2 = round(b2);
                if ((a > 0) && (b > 0) && ((a <= rows) && (b <= columns))) 
                    H(a,b) = H(a,b) +  1;
                end
                if ((a2 > 0) && (b2 > 0) && ((a2 <= rows) && (b2 <= columns))) 
                    H(a2,b2) = H(a2,b2) +  1;
                end
            end
            
 end

% 

 
 
end








%-----UNDER HERE IS KMEANS FOR ACCUMULATOR ----
% k = 200;
% my = reshape(H,rows * columns,1);
% [idx,centerMatrix] = kmeans(double(my),k);
% 
% idx = reshape(idx,rows,columns);
% 
% 
% for i=1:1:k
%     [x,y] = find(idx == i);
%     for j=1:1:size(x,1)
%         H(x(j,1),y(j,1)) = centerMatrix(i,1); %R
%     end
% end

%END KMEANS--------------------------------


Hnorm = (H ./ max(max(H)));
[mx,my] = find(Hnorm > .98); %MY THRESHOLD

centers = horzcat(mx,my);
% centers

    

Column1 = centers(:,1);
Column2 = centers(:,2);
centers = horzcat(Column2,Column1);

%centers = houghpeaks(H,20);

% figure
% imagesc(H);
% title('GRAD: 0, RADIUS: 5, HOUGHPEAKS N = 20')
%  
 


end

