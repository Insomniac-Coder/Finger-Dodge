int num = 50;
boolean gamestop=false,change=false;
int master,slave=0;
float score=0;
int[] x = new int[num];
int[] y = new int[num];
int[] x1 = new int[num];
int[] y1 = new int[num];
int[] x2 = new int[num];
int[] y2 = new int[num];
int[] x3 = new int[num];
int[] y3 = new int[num];
int[] x4 = new int[num];
int[] y4 = new int[num];
int m1=5,n1=5,m2=-5,n2=-5,m3=5,n3=5,m4=-5,n4=-5;
int r=0,b=0,g=0,r1=0,b1=255,r2=255,b2=0,z=5;

void allocator()
{
  master=int(random(400,600));
}

void setup() { 
  size(400, 600);
  noStroke();
  smooth();
   x1[0] = 140;
  y1[0] = 305;
   x2[0] = 350;
  y2[0] = 455;
   x3[0] = 380;
  y3[0] = 195;
   x4[0] = 345;
  y4[0] =  235;
  allocator();
}

void draw() {
  if(slave==master)
  { if(change==true)
  change=false;
  else
  change=true;
    allocator();
    slave=0;
  }
  if(change==true&&r!=255)
  {
    r=r+z;
    g=g+z;
    b=b+z;
    r1=r1+z;
    b1=b1-z;
    r2=r2-z;
    b2=b2+z;
  }
  if(change==false&&r!=0)
  {
    r=r-z;
    g=g-z;
    b=b-z;
    r1=r1-z;
    b1=b1+z;
    r2=r2+z;
    b2=b2-z;
  }
  background(r,b,g);
  frameRate(60);
  score = score + 0.01667;
  // Shift the values to the right
  for (int i = num-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
     x1[i] = x1[i-1];
    y1[i] = y1[i-1];
     x2[i] = x2[i-1];
    y2[i] = y2[i-1];
     x3[i] = x3[i-1];
    y3[i] = y3[i-1];
    x4[i] = x4[i-1];
    y4[i] = y4[i-1];
  }
  // Add the new values to the beginning of the array
  x[0] = mouseX;
  y[0] = mouseY;
  x1[0] = x1[0]-m1;
  y1[0] = y1[0]-n1;
  x2[0] = x2[0]-m2;
  y2[0] = y2[0]-n2;
  x3[0] = x3[0]-m3;
  y3[0] = y3[0]-n3;
   x4[0] = x4[0]-m4;
  y4[0] = y4[0]-n4;
  
  // Draw the circles
  for (int i = 0; i < num; i++) {
    fill(r2,0,b2,100);
    ellipse(x[i], y[i], 30-i/2.0, 30-i/2.0);
    fill(r1,0,b1,100);
    ellipse(x1[i], y1[i], 30-i/2.0, 30-i/2.0);
    ellipse(x2[i], y2[i], 30-i/2.0, 30-i/2.0);
    ellipse(x3[i], y3[i], 30-i/2.0, 30-i/2.0);
    ellipse(x4[i], y4[i], 30-i/2.0, 30-i/2.0);
  }
  if(x1[0]==0||x1[0]==400)
  m1=-m1;
  if(y1[0]==0||y1[0]==600)
  n1=-n1;
  if(x2[0]==0||x2[0]==400)
  m2=-m2;
  if(y2[0]==0||y2[0]==600)
  n2=-n2;
  if(x3[0]==0||x3[0]==400)
  m3=-m3;
  if(y3[0]==0||y3[0]==600)
  n3=-n3;
  if(x4[0]==0||x4[0]==400)
  m4=-m4;
  if(y4[0]==0||y4[0]==600)
  n4=-n4;
  fill(125,0,125);
  textSize(25);
  text("Score:"+score,90,50);
  slave=slave+1;
}
