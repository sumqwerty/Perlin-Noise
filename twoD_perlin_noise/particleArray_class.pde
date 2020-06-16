class Particles
{
  ArrayList<Particle> particles;
  
  Particles(color col)
  {
    particles = new ArrayList<Particle>();
    for(int i=0; i<2000; ++i)
    {
      Particle p = new Particle(col);
      particles.add(p);
    }
  }
  
  void run(Flowfield f)
  {
    for(int i=0; i<particles.size(); ++i)
    {
      particles.get(i).edges();
      particles.get(i).follow(f.flowfields);
      particles.get(i).update();
      particles.get(i).show();
    }
  }
}
