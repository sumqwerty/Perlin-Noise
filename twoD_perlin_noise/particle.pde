class Particle
{
  PVector pos;
  PVector vel;
  PVector acc;
  PVector prevPos;
  float maxSpeed = 2;
  int colindex;
  Particle(color col)
  {
    colindex = col;
    pos = new PVector(random(width),random(height));
    prevPos = pos.copy();
    vel = PVector.random2D();//new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void applyForce(PVector force)
  {
    acc.add(force);
  }
  
  void updatePrev()
  {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }
  
  void update()
  {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void edges()
  {
    if(pos.x >= width)
    {
      pos.x = 1;
      //updatePrev();
    }
    else if(pos.x <= 0)
    {
      pos.x = width-1;
      //updatePrev();
    }
    if(pos.y >= height)
    {
      pos.y = 1;
      //updatePrev();
    }
    if(pos.y <= 0)
    {
      pos.y = height-1;
      //updatePrev();
    }
  }
  
  void follow(PVector[] vectors)
  {
    int x = (int)pos.x / scl;
    int y = (int)pos.y / scl;
    int index = x + y * cols;
    //if(index > 400)println(x,y,pos);
    //if(index >= 400)index = 0;
    applyForce(vectors[index]);
  }
  
  void show()
  {
    if(debug)
    {
      stroke(255,0,0);
      strokeWeight(3);
    }
    else
    {
      
      stroke(colindex);
      
      //if(colindex == 0)stroke(random(150),random(10),random(250),2);
      //if(colindex == 1)stroke(random(250),random(10),random(150),2);
      //if(colindex == 2)stroke(random(10),random(250),random(150),2);
      //if(colindex == 3)stroke(random(150),random(250),random(10),2);
      strokeWeight(2);
    }
    point(pos.x,pos.y);
    //line(pos.x, pos.y, prevPos.x,prevPos.y);
    
  }
  
  
  
}
