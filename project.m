clear;
clc;
obj=imread('E:\MUET\Semester#5\Analogue and Digital Signal Processing (ADSP)\ADSP Project\title3.jpg');
imshow(obj)
%segment image
%divide image "obj" into ites respective RGB intensities
red=obj(:,:,1);
green=obj(:,:,2);
blue=obj(:,:,3);
figure(1)
subplot(2,2,1);imshow(obj);title('original image');
subplot(2,2,2);imshow(red);title('red plane');
subplot(2,2,3);imshow(green);title('blue plane');
subplot(2,2,4);imshow(blue);title('green plane');
%threshold the blue plane
figure(2)
level=0.37;
bw2=im2bw(blue,level);
subplot(2,2,1); imshow(bw2); title('Blue Plane Thresholded');
%%remove noisse
%fill any holes
fill=imfill(bw2,'Holes');
subplot(2,2,2); imshow(fill); title('Holes filled');
%remove any blobs on the border of image
clear =imclearborder(fill);
subplot(2,2,3);imshow(clear);title('Remove blobs on border');
%Remove blobs that are smaller than 7 pixels
se=strel('disk',7);
open=imopen(fill,se);
subplot(2,2,4);imshow(obj);title('Remove smaller blobs');
%%measure object diameter
diameter = regionprops(open,'MajorAxisLength');
%show result
figure(3)
imshow(obj)
%include a line to physically measure the ball 
d=imdistline;