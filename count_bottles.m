function bottle_count = count_bottles(image_path)
    % Read the image
    image = imread(image_path);
    
    % Apply Gaussian blur
    gauss = imgaussfilt(image, 2);
    
    % Edge detection
    edges = edge(gauss, 'sobel');
    
    % Detect smaller circles (bottle caps)
    [centers, radii, ~] = imfindcircles(edges, [18, 23], 'Sensitivity', 0.929);
    
    % Initialize bottle count
    bottle_count = 0;
    
    figure
    imshow(image); % Show blank image, then draw circles on it
    
    % Loop through detected circles
    for i = 1:length(radii)
        center = centers(i,:);
        radius = radii(i);
        % Draw the circle
        viscircles(center,radius,'Color','blue','LineWidth',4);
        % Increment bottle count
        bottle_count = bottle_count + 1;
    end

    % Detect bigger circles (bottoms of bottles)
    [centers, radii, ~] = imfindcircles(edges, [34, 40], 'Sensitivity', 0.9264);

        % Loop through detected circles
    for i = 1:length(radii)
        center = centers(i,:);
        radius = radii(i);
        % Draw the circle
        viscircles(center,radius,'Color','green','LineWidth',4);
        % Increment bottle count
        bottle_count = bottle_count + 1;
    end

s = regionprops(edges,'centroid','BoundingBox','Area','Perimeter');
hold on
for i= 1:length(s)
    centroid = s(i).Centroid;
    if(s(i).Area > 150 && s(i).Area < 220 && (s(i).Perimeter < 180 || (s(i).Perimeter > 480 && s(i).BoundingBox(3) > 100)))
        plot(centroid(1),centroid(2),'rO', 'LineWidth',15);
        bottle_count = bottle_count + 1;
    end
end
hold off


    % Display bottle count in Command Window
    return;
end

% Sources are cited in count_call.m