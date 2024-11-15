% Load the images
front_image = imread('front_image.jpg'); % Replace with your front image filename
side_image = imread('side_image.jpg');   % Replace with your side image filename

% Display the front image and select points
figure;
imshow(front_image);
title('Select key points on the front image');
[front_x, front_y] = getpts(); % Use getpts to manually select points
hold on;
plot(front_x, front_y, 'ro'); % Visualize selected points

% Initialize loop for side image selection
retry = true;

while retry
    % Display the side image and select points
    figure;
    imshow(side_image);
    title('Select key points on the side image');
    [side_x, side_y] = getpts(); % Use getpts to manually select points
    hold on;
    plot(side_x, side_y, 'ro'); % Visualize selected points

    % Check for matching number of points
    if length(front_x) ~= length(side_x)
        fprintf('Number of points mismatch:\n');
        fprintf('Points in front image: %d\n', length(front_x));
        fprintf('Points in side image: %d\n', length(side_x));
        disp('Please reselect points for the side image.');
    else
        retry = false; % Exit loop if the number of points match
    end
end

% Combine key points into 3D
z_coords = side_x; % Use the side_x points as the depth (z-coordinates)

% Create a 3D matrix of points
points_3D = [front_x, front_y, z_coords];

% Visualize the 3D points
figure;
scatter3(points_3D(:,1), points_3D(:,2), points_3D(:,3), 'filled');
grid on;
xlabel('X (width)');
ylabel('Y (height)');
zlabel('Z (depth)');
title('3D Key Points');

% Create a grid for interpolation
[xq, yq] = meshgrid(min(front_x):1:max(front_x), min(front_y):1:max(front_y));

% Interpolate z-values using splines
zq = griddata(front_x, front_y, z_coords, xq, yq, 'cubic');

% Plot the 3D surface
figure;
surf(xq, yq, zq, 'EdgeColor', 'none'); % Smooth 3D surface
colormap jet;
xlabel('X (width)');
ylabel('Y (height)');
zlabel('Z (depth)');
title('3D Face Model');

% Save the 3D model (optional)
save('3D_face_model.mat', 'xq', 'yq', 'zq');
