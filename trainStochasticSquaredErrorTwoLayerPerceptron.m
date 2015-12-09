function [hiddenWeights, outputWeights] = trainStochasticSquaredErrorTwoLayerPerceptron(activationFunction, dActivationFunction, numberOfHiddenUnits, inputValues,targetValues, epochs, batchSize, learningRate)
% trainStochasticSquaredErrorTwoLayerPerceptron Creates a two-layer perceptron
% and trains it on the MNIST dataset.
%
% INPUT:
% activationFunction             : Activation function used in both layers.
% dActivationFunction            : Derivative of the activation
% function used in both layers.
% numberOfHiddenUnits            : Number of hidden units.
% inputValues                    : Input values for training (784 x 10)
% targetValues                   : Target values for training (784 x10)
% epochs                         : Number of epochs to train.
% batchSize                      : Plot error after batchSize images.
% learningRate                   : Learning rate to apply.
%
% OUTPUT:
% hiddenWeights                  : Weights of the hidden layer.
% outputWeights                  : Weights of the output layer.
% 
    %disp(size(inputValues,1));
    %disp(size(inputValues,2));
    % The number of training vectors.
    trainingSetSize = size(inputValues, 2);%10
    
    % Input vector has 784 dimensions.
    inputDimensions = size(inputValues, 1);%784
    % We have to distinguish 10 digits.
    outputDimensions = size(targetValues, 1);%784
  
    
    % Initialize the weights for the hidden layer and the output layer.
    hiddenWeights = rand(numberOfHiddenUnits, inputDimensions);%300*784
    %disp(size(hiddenWeights ,1));
    %disp(size(hiddenWeights ,2));
    outputWeights = rand(outputDimensions, numberOfHiddenUnits);%784*300
    %disp(size(outputWeights ,1));
    %disp(size(outputWeights ,2));
    hiddenWeights = hiddenWeights./size(hiddenWeights, 2);
    outputWeights = outputWeights./size(outputWeights, 2);
    
    
    figure; hold on;

    for k = 1: epochs
       % Select which input vector to train on.
       n = floor(max(rand(1)*trainingSetSize - batchSize, 1));
       
            
       % Propagate the input vector through the network.
       inputVector = inputValues(:, n: n + batchSize );%784*2
       targetVector=targetValues(:, n: n + batchSize );%784*2
       hiddenActualInput =double( hiddenWeights)*double(inputVector) ;%300*2
       hiddenOutputVector = activationFunction(hiddenActualInput) ;
       outputActualInput = double(outputWeights)*double(hiddenOutputVector) ; %784*2
       outputVector = activationFunction(outputActualInput);
       
            
       % Backpropagate the errors.
       outputDelta = dActivationFunction(outputActualInput).*(double(outputVector) - double(targetVector)); 
       hiddenDelta = dActivationFunction(hiddenActualInput).*(double(outputWeights')*double(outputDelta)); 
            
       outputWeights = double(outputWeights) - learningRate.*double(outputDelta)*double(hiddenOutputVector' )/ batchSize;
       hiddenWeights = double(hiddenWeights) - learningRate.*double(hiddenDelta)*double(inputVector') / batchSize; 
      
 if mod(k,15000)==0
          result = activationFunction(double(outputWeights)*activationFunction(double(hiddenWeights)*double(inputVector))) - double(targetVector);
          disp(outputWeights);
          
       end
       if mod(k, 100) == 0
          result = activationFunction(double(outputWeights)*activationFunction(double(hiddenWeights)*double(inputVector))) - double(targetVector);
         
          %disp(size(result,1));
          %disp(size(result,2));
          %for i = 1: size(result,2)
           %   error =error+norm(result(:,i), 2);
          %end;
          %error = error / batchSize;
         % plot(k/100, error,'*');
     
    end
       
    end
