Perceptron brain;

// A list of points used to "train" perceptron
Point[] points = new Point[100];

// Train the perceptron with one "Point" at a time
int trainingIndex = 0;

public void settings() {
  size(800, 800);
}

void setup(){
  settings();
  brain = new Perceptron();
  for (int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
  float[] inputs = {-1, 0.5};
  int guess = brain.guess(inputs);
  println(guess);
 }

void draw(){
  background(255);
  stroke(0);
  line(9, 0, width, height);
  for (Point pt : points){
    pt.show();
  }
  
  for (Point pt : points){
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    int guess = brain.guess(inputs);
    if (guess == target){
      fill(0,255,0);
    } else {
      fill(255,0,0);
    }
    noStroke();
    ellipse(pt.x, pt.y, 16, 16);
  }
  
  // Train the Perceptron with one "training" point at a time
  Point training = points[trainingIndex];
  float[] inputs = {training.x, training.y};
  int target = training.label;
  brain.train(inputs, target);
  trainingIndex++;
  if (trainingIndex == points.length){
    trainingIndex = 0;
  }
}
  
void mousePressed(){
   for (Point pt : points){
   
 }
}
