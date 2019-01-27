// The activation function
int sign(float n){
    if (n >= 0){
      return 1;
    } else {
      return -1;
    }
  }


class Perceptron {
  float[] weights = new float[2]; // Array of weights for inputs
  float lr = 0.1; // Learning Rate
  
  // Constructor
  Perceptron() {
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
  
}
