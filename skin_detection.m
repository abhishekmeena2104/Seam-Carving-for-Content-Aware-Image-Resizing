function img1 = skin_detection(im)
   
    skinprob = computeSkinProbability(im);

    subplot(1,1,1);
    image(im/255);
    title('Input Image')
    

    % show skin-likelihood image
    image(normalise(skinprob)*64);
    colormap('default');
    title(sprintf('Skin likelihood of each pixel: Min=%2.2f, Max=%2.2f', min(min(skinprob)), max(max(skinprob))));
    

    % compute and display a binary skin map using a threshold of 0
    img1=(skinprob>0)*64;
    image(img1);
    colormap('gray');
    title('Likelihood thresholded at zero');
    

    % show the original image, but replace the red band with the binary skin image
    im2=im;
    im2(:,:,1) = (skinprob>0)*255;
    image(im2/255);
    title('Overlay')
end
