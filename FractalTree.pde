void setup(){
  
  background(0);
  stroke(255);
  size(800,800,P2D);
}

void draw(){
  
  float branchLength = 200;
  float branchAngle = 4;
  
  background(0);


  
  //Translate moves the grid. 0,0 coordinates are NOT in the top left corner anymore.
  //They get "Translated" so x is in the middle of the screen (width/2) and y = 0 is at the bottom of the screen (height)
  translate (width /2, height);  
  branch(branchLength, branchAngle);
  

}

void branch(float branchLength, float branchAngle){
  
  float branchModifier = map(mouseY, 0, height, 0.5, 0.72);
  
  branchAngle = map(mouseX, 0, width, 1, 5);
  
  
  if(branchLength > 2){
    
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
