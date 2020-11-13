data_size = 5000;
[XTrain, YTrain] = RRRdataset(data_size);

XTrain = reshape(XTrain', [1, 1, size(XTrain,2),size(XTrain,1)]);


nFeatures = 3;
numClasses = 3;


layers = [ ...
     imageInputLayer([1 1 nFeatures]);
    
    fullyConnectedLayer(512)
    reluLayer
    
    fullyConnectedLayer(1024)
    leakyReluLayer
    
    fullyConnectedLayer(512)
    leakyReluLayer
%  add more hidden layers to reduce the total mean error VARIABLE 'a' in the
%  script 'demo_fk.m'
%  you can change reluLayer to other activation functions
    fullyConnectedLayer(numClasses)  
    regressionLayer
    
    ]


maxEpochs = 10;
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


net_fk = trainNetwork(XTrain, YTrain,layers,options);


save net_fk