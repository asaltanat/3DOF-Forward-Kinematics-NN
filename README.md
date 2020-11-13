# 3DOF-Forward-Kinematics-NN
Use Neural Network to compute Forward Kinematics of 3DOF Planar Robot

# Neural Network for obtaining Forward Kinematics of RRR Robot

Requirements
* Matlab
* Robotics Toolbox from Peter Corke's website
* Deep Learning Toolbox

## 5-DOF Manipulator:
* create_dataset_fk.m
* planarrobot_student.m
* train_fk.m
* demo_fk.m

##  3-DOF Manipulator:

* RRRdataset.m
* RRRtrain.m
* RRRtest.m
* code1.m



## Increase Accuracy of a model:

For this task updates are made in train_fk.m/RRRtrain.m:

| Hidden layers| Activation function | Error Mean |
| -------------| -------------       |------------|
| 1 layer (512) | Relu  | 0.2887 |
| 1 layer (512) | tanh | 0.1163 |
| 5 layers (512:1024:2048:1024:512)| Relu| 0.1008|
| 5 layers (256:512:1024:512:256)| Relu| 0.0659|
| 3 layers(512:1024:512)| Relu| 0.0614|
| 3 layers (256:512:256)| leakyRelu| 0.0644|
| 3 layers (512:1024:512)| sigmoid| 0.3084|
| 3 layers (512:1024:512)| leakyRelu | 0.059|
| 3 layers (512:1024:512)| tanh | 0.1163|

So 3 fully connected layers with 512:1024:512  neurons and leakyRelu activation function were chosen.
In order to decrease the error, 'maxEpochs' parameter in options was changed:

*Finally Error = 0.0446*

```

maxEpochs = 20;
miniBatchSize = 100;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'GradientThreshold',1, ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest', ...
    'Shuffle','never', ...
    'Verbose',0, ...
    'Plots','training-progress');
```
5 DOF  Forward Kinematics NN
![Image 1](final5DOF.PNG)

3DOF Forward Kinematics NN
![Image 1](final3DOF.PNG)
 mean error = 0.0393
