clc 
clear all
%%
I = im2double(imread('book.jpg'));
I_O = I;
no_rows =243;
no_cols =100;


for k = 1:no_rows
    E = imenergy( I );


% for i=130:380
%     for j =246:346-k
%         E(i,j) = -10*j;
%     end
% end
if k<114
for i=1:530
    for j =359:472-k
        E(i,j) = -100*j;
    end
end
end
if k>113
for i=1:530
    for j =1176:1306-(k-113)
        E(i,j) = -100*j;
    end
end    
end
    E = permute(E,[2 1]);
    
    seam_horizontal = horizontal_seam_detection3(E);
    E = permute(E,[2 1]);
    I = permute(I,[2 1 3]);
    I = remove_horizontal_seam(I,seam_horizontal);
    I = permute(I,[2 1 3]);
    
end



figure(1)
subplot(1,2,1),imshow(I_O)
subplot(1,2,2),imshow(I)