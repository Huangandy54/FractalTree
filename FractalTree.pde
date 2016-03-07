private double fractionLength = .8; 
private int smallestBranch = 15; 
private double branchAngle = .5;  
double sway=3;
boolean swayis = true;
public void setup() 
{   
  	size(700, 500); 
} 
public void draw() 
{   
  	background(0);   
  	stroke(255);
  	line(350, 500, 350, 380);   
  	drawBranches(350, 380, 100, sway*Math.PI/2);
  	if (sway<2.75) {
  		swayis=true;
  	}
  	else if (sway>3.25) {
  	  	swayis=false;	
  	}
  	
  	if (swayis==true) {
  		sway+=.01;
  	}
  	else if (swayis==false) {
  		sway-=.01;
  	}
} 
public void drawBranches(int x, int y, double branchLength, double angle) 
{   
  	double angle1 = angle + branchAngle;
  	double angle2 = angle - branchAngle;
  	branchLength *= fractionLength;
  	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  	line(x, y, endX1, endY1);
  	line(x, y, endX2, endY2);
  
  	if (branchLength > smallestBranch)
  	{
    	drawBranches(endX1, endY1, branchLength, angle1);
    	drawBranches(endX2, endY2, branchLength, angle2);
  	}
}
