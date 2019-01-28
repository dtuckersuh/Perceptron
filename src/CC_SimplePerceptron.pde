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
  brain = new Perceptron(3);
  for (int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
 }

void draw(){
  background(255);
  stroke(0);
  // line(0, height, width, 0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  line (p1.pixelX(), p1.pixelY(), p2.pixelX(), p2.pixelY());
  
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line (p3.pixelX(), p3.pixelY(), p4.pixelX(), p4.pixelY());
  
  for (Point pt : points){
    pt.show();
  }
  
  for (Point pt : points){
    float[] inputs = {pt.x, pt.y, pt.bias};
    int target = pt.label;
    int guess = brain.guess(inputs);
    if (guess == target){
      fill(0,255,0);
    } else {
      fill(255,0,0);
    }
    noStroke();
    ellipse(pt.pixelX(), pt.pixelY(), 16, 16);
  }
  
  // Train the Perceptron with one "training" point at a time
  Point training = points[trainingIndex];
  float[] inputs = {training.x, training.y, training.bias};
  int target = training.label;
  brain.train(inputs, target);
  trainingIndex++;
  if (trainingIndex == points.length){
    trainingIndex = 0;
  }
}
