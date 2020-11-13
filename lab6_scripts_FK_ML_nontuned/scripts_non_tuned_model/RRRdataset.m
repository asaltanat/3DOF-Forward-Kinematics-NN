% input - length of dataset or length of feature-label pairs

function [feature, label] = RRRdataset(data_size)

code1;

% just take a random value of q --> feature
% calculate the FK --> label
% return


rng(0,'twister');

% q1
q_min = -114;
q_max = 114;
q1 = (q_max-q_min).*rand(data_size,1) + q_min;

% q2
q_min = -60;
q_max = 60;
q2 = (q_max-q_min).*rand(data_size,1) + q_min;

% q3
q_min = -100;
q_max = 100;
q3 = (q_max-q_min).*rand(data_size,1) + q_min;

% 
q = [q1, q2, q3]*deg;
pose_robot = zeros(data_size,3);


for i=1:data_size
   
    pose_end = PlanarRob.fkine(q(i, :));
    xyz = transl(pose_end);
    
    % also more labels can be added
    pose_robot(i, :) =  xyz;
    
end
    
 feature = q;
 Xq = reshape(q', [1, 1, size(q,2),size(q,1)]);
 size(Xq);
 label = pose_robot;
    
end