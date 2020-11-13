%create the 3 DOF robot arm model (Peter Corke's Toolbox)
code1
% load the "trained" network that predicts the pose of the arm  
load net_fk

% total number of different coordinates of the robot end-effector pose
test_size = 1000;

% randomly set different n=test_size joint angles of every joint q1 to q5
% q1
q_min = -114;
q_max = 114;
q1 = (q_max-q_min)*rand(test_size,1) + q_min;

% q2
q_min = -60;
q_max = 60;
q2 = (q_max-q_min)*rand(test_size,1) + q_min;

% q3
q_min = -100;
q_max = 100;
q3 = (q_max-q_min)*rand(test_size,1) + q_min;

%form the input vector of joint angles
forh = [q1 q2 q3]*deg; %for ground-truth values
feed = [q1 q2 q3]*deg; %for prediction with our trained model

% get the Eucldedian distance errors between the ground-truth and the
% predicted values
error = [];
for i=1:test_size
    pose_end = PlanarRob.fkine(forh(i, :));
    xyz = transl(pose_end);
    sample = ones(1,1,3);
    sample(1,:) = feed(i, :);
    pr_xyz = predict(net_fk, sample);
    error = [error, sqrt((xyz(1)-pr_xyz(1))^2 + (xyz(2)-pr_xyz(2))^2 + (xyz(3)-pr_xyz(3))^2)];
end

a = mean(error);
forh(test_size, :);
feed(test_size, :);
% real Pose 
xyz
% predicted Pose
pr_xyz
%mean error
a