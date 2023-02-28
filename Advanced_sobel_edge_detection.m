clc,clear all ,close all
res = imread("cameraman.tif");
res = res(:,:,1);
dr = double(res);
gx = [-1 0 1; -2 0 2; -1 0 1];
gy = [1 2 1; 0 0 0; -1 -2 -1];
for i=1:1:size(res,1)-2
    for j=1:1:size(res,2)-2
        blok = dr(i:i+2,j:j+2);
        x(i,j) = sum(sum(blok.*gx));
        y(i,j) = sum(sum(blok.*gy));
    end
end
g = sqrt(x.^2+y.^2);
kenar = g>255;
figure,imshow(kenar,[]);

dizi = imhist(res);
for i=1:1:length(dizi)-1
    fark(i) = dizi(i)-dizi(i+1);
end
[deger,ind1] = max(fark);
[deger,ind2] = max(fark);
sb = res<= ind1 & ind2>=res;
figure,imshow(sb,[]);

pb = 5;
for i=1:1:size(res,1)-pb+1
    for j =1:1:size(res,2)-pb+1
        blok = sb(i:i+pb-1,j:j+pb-1);
        toplam = sum(blok(:));
        if toplam < pb^2 & toplam >0
            kenar(i,j) = 1;
        else
            kenar(i,j) = 0;
        end
    end
end
figure,imshow(kenar,[]);