int scl = 10;
int cols, rows;
boolean debug = false;
boolean run = false;
boolean save = false;
Particles p1,p2;
Flowfield f1,f2;

color bgcolor = color(0);

void setup()
{
  //size(640,480,P2D);
  //size(720,540,P2D);
  //size(displayWidth,displayHeight,P2D);
  size(960,720,P2D);
  cols = width/scl;
  rows = height/scl;
  f1 = new Flowfield(color(0,0,255),1);
  p1 = new Particles(color(0,191,255,1));
  
  f2 = new Flowfield(color(255,255,0),2);
  p2 = new Particles(color(138,43,226,1));
  
  background(bgcolor);
}

void draw()
{
  if(run)
  {
    if(debug)background(255);
    f1.run();
    p1.run(f1);
    
    f2.run();
    p2.run(f2);
    
    if(save)saveFrame("line-############.png");
    
  }
  
}

void keyPressed()
{
  if(key == 'r' || key == 'R')run = true;
  if(key == 'c' || key == 'C')save = true;
}
