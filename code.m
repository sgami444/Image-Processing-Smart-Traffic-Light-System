a1=imread('ref_1.png');
b1=imread('cap_1.png');
c1=imread('ref_2.png');
d1=imread('cap_2.png');
e1=imread('ref_3.png');
f1=imread('cap_3.png');
%g1=imread('ref_4.png');
%h1=imread('cap_4.png');
a2=rgb2gray(a1);
b2=rgb2gray(b1);
c2=rgb2gray(c1);
d2=rgb2gray(d1);
e2=rgb2gray(e1);
f2=rgb2gray(f1);
%g2=rgb2gray(g1);
%h2=rgb2gray(h1);
a3=imresize(a2,[700 700]);
b3=imresize(b2,[700 700]);
c3=imresize(c2,[700 700]);
d3=imresize(d2,[700 700]);
e3=imresize(e2,[700 700]);
f3=imresize(f2,[700 700]);
%g3=imresize(g2,[700 700]);
%h3=imresize(h2,[700 700]);
edge_a=edge(a3,'sobel');
edge_b=edge(b3,'sobel');
edge_c=edge(c3,'sobel');
edge_d=edge(d3,'sobel');
edge_e=edge(e3,'sobel');
edge_f=edge(f3,'sobel');
%edge_g=edge(g3,'sobel');
%edge_h=edge(h3,'sobel');
figure,imshow(edge_a);
figure,imshow(edge_b);
figure,imshow(edge_c);
figure,imshow(edge_d);
figure,imshow(edge_e);
figure,imshow(edge_f);
%figure,imshow(edge_g);
%figure,imshow(edge_h);
m=0;
wh=0;
bl=0;
for a=1:1:700
 for b=1:1:700
 if(edge_a(a,b)==1)
 wh=wh+1;
 else
 bl=bl+1;
 end
 end
end
for i=1:1:700
 for j=1:1:700
 if(edge_a(i,j)==1)&(edge_b(i,j)==1)
 m=m+1;
 else
 ;
 end
 end
end
m2=0;
wh2=0;
bl2=0;
for a=1:1:700
 for b=1:1:700
 if(edge_c(a,b)==1)
 wh2=wh2+1;
 else
 bl2=bl2+1;
 end
 end
end
for i=1:1:700
 for j=1:1:700
 if(edge_c(i,j)==1)&(edge_d(i,j)==1)
 m2=m2+1;
 else
 ;
 end
 end
end
m3=0;
wh3=0;
bl3=0;
for a=1:1:700
 for b=1:1:700
 if(edge_e(a,b)==1)
 wh3=wh3+1;
 else
 bl3=bl3+1;
 end
 end
end
for i=1:1:700
 for j=1:1:700
 if(edge_e(i,j)==1)&(edge_f(i,j)==1)
 m3=m3+1;
 else
 ;
 end
 end
end
% m4=0;
% wh4=0;
% bl4=0;
%
% for a=1:1:700
% for b=1:1:700
% if(edge_g(a,b)==1)
% wh4=wh4+1;
% else
% bl4=bl4+1;
% end
% end
% end
%
% 
%
% for i=1:1:700
% for j=1:1:700
% if(edge_g(i,j)==1)&(edge_h(i,j)==1)
% m4=m4+1;
% else
% ;
% end
% end
% end
total=wh;
total_m=(m/total)*100;
total2=wh2;
total_m2=(m2/total2)*100;
total3=wh3;
total_m3=(m3/total3)*100;
% total4=wh4;
% total_m4=(m4/total4)*100;
if(total_m<=total_m2)&(total_m<=total_m3)
 if(total_m2<=total_m3)
 ans=[1,2,3]
 else
 ans=[1,3,2]
 end
elseif(total_m2<=total_m)&(total_m2<=total_m3)
 if(total_m<=total_m3)
 ans=[2,1,3]
 else
 ans=[2,3,1]
 end
elseif(total_m3<=total_m)&(total_m3<=total_m2)
 if(total_m<=total_m2)
 ans=[3,1,2]
 else
 ans=[3,2,1]
 end
else
 ans='Nothing'
end
(OR another code which detects percentage of car space in an image)
b = imread('sample3.jpg');
a = rgb2gray(b);
b1 = imread('sampl1.jpg');
a1 = rgb2gray(b1);
% insert function of OCR before evaluating further
f1 = fspecial('average',3);
figure,imshow('sample3.jpg'); %original image
title('Sample image')
med = medfilt2(a,[39 39]); %median filter on grayscale image
i = histeq(med) %hist equilization
i1 = i>25; %threshold
c = filter2(f1,i1,'same'); %average
med2 = medfilt2(i1,[19 19]); %median filter on thresholded image
% e1 = edge(a,'prewitt');
% e2 = edge(a,'canny');
% e3 = edge(a,'sobel');
% e4 = edge(a,'roberts');
% subplot(2,3,1), imshow(a)
% subplot(2,3,2), imshow(a1)
%figure,imshow(i)%histeqalisation image
%figure,imshow(i1) %threshold>100
%figure,imshow(c) %average filtered img
%figure,imshow(med) %median filter img
figure,imshow(med2) %median filter in i1 img
title('Enhanced image')
a=0
b=0
for i = 1:2080
 for j = 1:1564
 if med2(i,j)==0
 a=a+1
 else
 b=b+1
 end
 end
end
a=a*100/(2080*1564)
b=b*100/(2080*1564)
%var a b c d for each image
%checking black percentage in the image
%prioritising variables and making a sequence 
