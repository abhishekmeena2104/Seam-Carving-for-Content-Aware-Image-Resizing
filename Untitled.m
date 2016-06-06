clc 
clear all
%%
I = im2double(imread('3.jpg'));
no_rows =50;
no_cols =0;
I1=I;
I_O=I;

%%
for k = 1:no_rows
    seam_horizontal = horizontal_seam_detection(I);
    seams_array(:,k)=seam_horizontal';
    I = remove_horizontal_seam(I,seam_horizontal);
end

P= add_seam(I_O,seams_array);

figure(1)
subplot(1,2,1),imshow(I_O)
subplot(1,2,2),imshow(P)

    
    
