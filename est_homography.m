function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
A = zeros(8,9);
counter = 1;
for i = 1:4 
    x = video_pts(i,1);
    y = video_pts(i,2);
    x2 = logo_pts(i,1);
    y2 = logo_pts(i,2);
    ax = [-x -y -1 0 0 0 x*x2 y*x2 x2];
    ay = [0 0 0 -x -y -1 x*y2 y*y2 y2];
    A(counter,:) = ax;
    A(counter + 1,:) = ay;
    counter = counter + 2;
end

[U, S, V] = svd(A);
h = V(:,end); 
H = [h(1) h(2) h(3); h(4) h(5) h(6); h(7) h(8) h(9)];


