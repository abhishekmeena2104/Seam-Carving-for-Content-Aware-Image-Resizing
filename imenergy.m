function [ E ] = imenergy( I )

J = rgb2gray(I);
[DX DY] = gradient(J);
X = abs(DX);
Y = abs(DY);
E1= X+Y;
E = bsxfun(@plus,X,Y);
% E = permute(E,[2 1 3]);
% imagesc(E);
% E = permute(E,[2 1 3]);
end
