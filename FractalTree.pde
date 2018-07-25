void setup(){
  
  background(0);
  stroke(255);
  size(800,800,P2D);
  
}

void draw(){
  
  float branchLength = 200;
  float branchAngle = 4;
  
  //Wipe the screen every frame, so the re-drawn trees don't get drawn all over each other
  
  background(0);
  
  //Instructions
  textSize(20);
  fill(0, 102, 153);
  text("Move the mouse to right to change the angle", 10, 30); 
  text("Move the mouse down to add branches", 10, 60);

  //Translate moves the grid. 0,0 coordinates are NOT in the top left corner anymore.
  //They get "Translated" so x is in the middle of the screen (width/2) and y = 0 is at the bottom of the screen (height)
  translate (width /2, height);  
  branch(branchLength, branchAngle);
  
}

void branch(float branchLength, float branchAngle){
  
  //Modifies the number of branches according to the mouse Y axis
  float branchModifier = map(mouseY, 0, height, 0.1, 0.75);
  
  //Modifies the angle of branches according to the mouse X axis
  branchAngle = map(mouseX, 0, width, 1, 5);
  
  if(branchLength > 3){
    
    //First branch
    line(0,0,0,-branchLength);
    
    //The new X and Y Zero is at the top of the last branch
    translate (0,-branchLength);
    
    //Draw the right branch
  
    //First we push the state to the matrix, so we don't ruin the left branch
    pushMatrix();
    
    //Rotate the grid by 45 degrees
    rotate(PI / branchAngle);
    
    //Call the branch function (itself) again, with a smaller branch length
    branch(branchLength * branchModifier, branchAngle);
    
    popMatrix();
    
    //Draw the left branch
  
    pushMatrix();
    
    //Rotate the grid by 45 degrees
    rotate(PI / - branchAngle);
    
    //Call the branch function (itself) again, with a smaller branch length
    branch(branchLength * branchModifier, branchAngle);
    
    popMatrix();
 
  }
}
