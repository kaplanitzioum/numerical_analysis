%% Exercise 6
rgbGH = imread('GraceHopper.jpg');
figure();
image(rgbGH);       %plot color image

bwGH = rgb2gray(rgbGH);     %convert to grey scale
imGH = double(bwGH);        %convert from unsigned integers to double for calculations

%plot grayscale image
figure()
colormap(gray(256)); 
image(imGH);
daspect([1 1 1]);       %this preserves aspect ratio
title('original');

%compute singular value decomposition
[U S V] = svd(imGH);

%plot singular values on semilog scale 
%notice how quickly the magnitude drops, 
% S contains the singular values which are the eigenvalues of hermitian matrix A^+*A
figure;
semilogy(diag(S))
ylabel('singular values')
xlabel('n')     %position of singular values in the S matrix


%pick number of singular values to use for reconstructing image
Nsvals = [200, 100, 50, 25, 10];

%plot compressed images by only including the largest ns singular values
for jj = 1:length(Nsvals)
    ns = Nsvals(jj);

    imNs = U(:,1:ns)*S(1:ns, 1:ns)*V(:,1:ns)';

    figure();
    colormap(gray(256));
    image(imNs);
    daspect([1 1 1]);
    title([num2str(ns)  ' singular values']);
end
