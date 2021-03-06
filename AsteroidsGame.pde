//your variable declarations here
SpaceShip pan = new SpaceShip();
//Bullet pewpew = new Bullet(pan);
ArrayList <Bullet> pewpew;
Stars [] moon;
ArrayList <Asteroids> clone;

public void setup() 
{
  size(500, 500);
  moon = new Stars[100];
  for(int i = 0; i < moon.length; i++){
    moon[i] = new Stars();
  }  
  clone = new ArrayList <Asteroids>();
  for(int i = 0; i < 7; i++){
    clone.add(new Asteroids());
  }
  pewpew = new ArrayList<Bullet>();
  for(int i = 0; i < 7; i++){
    pewpew.add(new Bullet());
  }
}
public void draw() 
{
  background(0);
  pan.show();
  pan.move();
  for(int i = 0; i < clone.size(); i++){
    clone.get(i).show();
    clone.get(i).move();
  
    if(dist(clone.get(i).getX(),clone.get(i).getY(),pan.getX(),pan.getY()) < 20){
      clone.remove(i);
    }
  }
  for(int j = 0; j < clone.size(); j++){
    for(int i = 0; i < pewpew.size(); i++){
      pewpew.get(i).show();
      pewpew.get(i).move();
  
      if(dist(clone.get(j).getX(),clone.get(j).getY(),pewpew.get(i).getX(),pewpew.get(i).getY()) < 20){
        clone.remove(j);
        pewpew.remove(i);
        break;
      }
    }
  }
  
  for(int i = 0; i < moon.length; i++){
    moon[i].show();
  }
  //your code here
}

public void keyPressed(){

if(key == '+'){
  pan.setDirectionX(0);
  pan.setDirectionY(0);
}
if(key == '.'){
  pewpew.add(new Bullet());
}
if(key == '8'){

  pan.accelerate(0.2);
}
if(key == '5'){

  pan.accelerate(-0.2);
}
if(key == '6'){

  pan.rotate(5);
}
if(key == '4'){

  pan.rotate(-5);
}
if(key == '0'){

  pan.setX((int)(Math.random()*500));
  pan.setY((int)(Math.random()*500));
  pan.setDirectionX(0);
  pan.setDirectionY(0);
  pan.setPointDirection((int)(Math.random()*360));
}

}
class Stars{
  private int myX, myY;
  public Stars(){
    fill(200);
    stroke(200);
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show(){
    point(myX, myY);
  }
}
class SpaceShip extends Floater  
{   
  SpaceShip(){

      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      xCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -16;
      yCorners[3] = 0;

      myColor = 197;
      myCenterY = 250;
      myCenterX = 250;
      myDirectionY = 0;
      myDirectionX = 0;
      myPointDirection = 0;

    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int) myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int) myCenterY;}
    public void setDirectionX(double x){myDirectionX = x; }
    public double getDirectionX(){return (double) myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y; }
    public double getDirectionY(){return (double) myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return (double) myPointDirection;}
    
    
    //your code here
}
class Bullet extends Floater{
      
  double dRadians, myCenterX, myCenterY, myPointDirection, myDirectionX, myDirectionY;
  
  public Bullet(){
    
    myCenterX = pan.getX();
    myCenterY = pan.getY();
    myPointDirection = pan.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5*Math.cos(dRadians) + pan.getDirectionX();
    myDirectionY = 5*Math.sin(dRadians) + pan.getDirectionY();
    
}
    
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int) myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int) myCenterY;}
    public void setDirectionX(double x){myDirectionX = x; }
    public double getDirectionX(){return (double) myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y; }
    public double getDirectionY(){return (double) myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return (double) myPointDirection;}  
    
    public void show(){
      fill(50, 50, 50);
      ellipse((float)myCenterX, (float)myCenterY, (float) 5, (float) 5);
    }
    public void move(){
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY;       
    }
    
}
class Asteroids extends Floater
{
  private int rotspd;
  public Asteroids(){
    
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      xCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = 0;
      yCorners[3] = 16;

      myColor = 197;
      myCenterY = Math.random()*500;
      myCenterX = Math.random()*500;
      myDirectionX = Math.random()*3-1;
      myDirectionY = Math.random()*3-1;
      myPointDirection = Math.random()*3*PI;
      rotspd = (int)(Math.random()*10 - 5);
  }
      
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int) myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int) myCenterY;}
    public void setDirectionX(double x){myDirectionX = x; }
    public double getDirectionX(){return (double) myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y; }
    public double getDirectionY(){return (double) myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return (double) myPointDirection;}  
    
    public void move(){
    rotate(rotspd);
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
    }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 