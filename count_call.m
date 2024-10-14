% Path to folder of images
path_directory = 'images';

% Loop through each image in the directory
files = dir([path_directory, '/*.png']);
for i = 1:length(files) % change back to 1:length(files)
    % Get the full path of the image
    image = [path_directory '/' files(i).name];
    % Count bottles in the image and display the amount
    bottle_count = count_bottles(image);
    disp([files(i).name, ': ', num2str(bottle_count), ' bottles']);
end

% Dean Johnson
% 4200067
% djohnson@uef.fi
% Machine Vision Spring 2024 (3621518)

% Sources
% imfindcircles function usage https://se.mathworks.com/help/images/ref/imfindcircles.html
% Guassian filtering https://se.mathworks.com/help/images/ref/imgaussfilt.html
% Sobel edge detection https://se.mathworks.com/help/images/edge-detection.html
% viscircles function usage https://se.mathworks.com/help/images/ref/viscircles.html
% file directory https://se.mathworks.com/matlabcentral/answers/411500-how-do-i-read-all-the-files-in-a-folder
% regionprops, Centroid usage https://se.mathworks.com/help/images/ref/regionprops.html#buorh5j-1
% Centroid, BoundingBox metric usage https://se.mathworks.com/matlabcentral/answers/110855-how-to-detect-the-shape-in-matlab