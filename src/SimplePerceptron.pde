// The activation function
int sign(float n){
    if (n >= 0){
      return 1;
    } else {
      return -1;
    }
  }


class Perceptron {
  float[] weights; // Array of weights for inputs
  float lr = 0.01; // Learning Rate
  
  // Constructor
  Perceptron(int n) {
    weights = new float[n];
    // Initialize weights randomly
    for (int i = 0; i < weights.length; i++){
        weights[i] = random(-1, 1);
    }
  }
  
  int guess(float[] inputs){
    float sum = 0;
    for (int i = 0; i < weights.length; i++){
      sum += inputs[i] * weights[i];
    }
    int output = sign(sum);
    return output;
  }
  
  void train(float[] inputs, int target){
    int guess = guess(inputs);
    // Error = desired output - guessed output
    // Can only be 0, -2, or 2
    int error = target - guess;
    
    // Tune all the weights by multiplying learning rate
    for (int i = 0; i < weights.length; i++){
      weights[i] += error * inputs[i] * lr;
    }
  }
  
  float guessY(float x){
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    return -(w2/w1) - (w0/w1) * x;
  }
}
