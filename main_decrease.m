clc 
clear all
%%
I = im2double(imread('4.jpg'));
no_rows =90;
no_cols = 150;
I1=I;
I_O=I;

%%
for k = 1:no_rows
    seam_horizontal = horizontal_seam_detection(I);
    I = remove_horizontal_seam(I,seam_horizontal);
end
I_HOR=I;
I = permute(I,[2 1 3]);
for k = 1:no_cols
    I = remove_horizontal_seam(I,horizontal_seam_detection(I));
end
J = permute(I,[2 1 3]);

figure(1)
subplot(1,2,1),imshow(I_O)
subplot(1,2,2),imshow(J)


