import three;
import graph;

// Define a structure for a body (sphere)
struct Body3d {
  triple position;  // Center of the sphere
  real radius;  // Radius of the sphere


  void operator init(triple position, real r) {
    this.position=position;
    radius=r;
  }

  //void addForce(name, magnitude
}

// Define a structure for a body (sphere)
struct Body2d {
  pair position;  // Center of the circle
  real radius;  // Radius of the circle / size of the square

  void operator init(pair position, real r) {
    this.position=position;
    radius=r;
  }

  //void addForce(name, magnitude
}

void drawCoordinates2d(int scale) {
  // Draw coordinate axes
  xaxis("$x$", -scale, scale);
  yaxis("$y$", -scale, scale);
}

void drawCoordinates3d(int scale) {
  // Draw coordinate axes
  draw(O--(scale,0,0), arrow=Arrow3(size=2), L=Label("$x$", 1), blue);
  draw(O--(0,scale,0), arrow=Arrow3(size=2), L=Label("$y$", 1), red);
  draw(O--(0,0,scale), arrow=Arrow3(size=2), L=Label("$z$", 1), black);
}

// Function to draw a sphere at a specified body location
void drawCircle(Body2d body, pen surfaceColor=currentpen, string name, pair nameOffset=(0,0), pen fillColor=white) {
  if (fillColor != white) {
    fill(circle(body.position, body.radius), fillColor);
  } else {
    draw(circle(body.position, body.radius), surfaceColor);
  }
  if (nameOffset==(0,0)) {
    nameOffset=(body.radius, body.radius)+body.position;
  }
  label(name, nameOffset);
}

// Function to draw a sphere at a specified body location
void drawSquare(Body2d body, pen surfaceColor=currentpen, string name, pair nameOffset=(0,0)) {
  pair bottomLeft = body.position;
  pair bottomRight = body.position + (body.radius, 0);
  pair topLeft = body.position + (0, body.radius);
  pair topRight = body.position + (body.radius, body.radius);

  // Draw the rectangle by connecting the corners
  draw(bottomLeft -- bottomRight -- topRight -- topLeft -- cycle, currentpen);
  if (nameOffset==(0,0)) {
    nameOffset=(body.radius, body.radius)+body.position;
  }
  label(name, nameOffset);
}

// Function to draw a sphere at a specified body location
void drawSphere(Body3d body, pen surfaceColor=currentpen, string name, pair namePos=NW, triple nameOffset=(0,0,0)) {
  draw(shift(body.position)*scale3(body.radius)*unitsphere, surfacepen=surfaceColor);
  if (nameOffset==(0,0,0)) {
    nameOffset=(body.radius, body.radius, body.radius)+body.position;
  }
  label(name, nameOffset, namePos);
}

  // Function to draw a sphere at a specified body location
Body3d draw3PointLoc(Body3d origin, triple loc, string name, pen pointColor=blue, real magnitude=0, string vectorName="") {
  Body3d body = Body3d(loc, .05);
  drawSphere(body, surfaceColor=pointColor, name);

  // Define a vector from the origin to (1, 1, 1)
  triple vector = loc;

  // Draw the vector with a dotted line
  draw(origin.position--vector, dotted+pointColor+1bp);

  // Draw the vector with a dotted line
  draw(origin.position--vector/2, pointColor+1bp, Arrow3(size=5bp));

  if (magnitude != 0 && vectorName == "") {
    label(string(magnitude), vector/2);
  } else {
    label(vectorName, vector/2);
  }

  return body;
}


  // Function to draw a sphere at a specified body location
Body2d draw2PointLoc(Body2d origin, pair loc, string name, pen pointColor=blue, real magnitude=0, string vectorName="") {
  Body2d body = Body2d(loc, .05);
  drawCircle(body, surfaceColor=pointColor, name);

  // Define a vector from the origin to loc
  pair vector = loc;

  // Draw the vector with a dotted line
  draw(origin.position--vector, dotted+pointColor+1bp);

  // Draw the vector with a dotted line
  draw(origin.position--vector/2, pointColor+1bp, Arrow(size=5bp));

  if (vectorName=="" && magnitude != 0) {
    label(string(magnitude),vector/2);
  } else {
    label(vectorName, vector/2);
  }

  return body;
}

// Function to draw a sphere at a specified body location. Theta and pi are in degrees
Body3d draw3PointAngle(Body3d origin, real theta, real phi, string name, pen pointColor=blue, real magnitude, string vectorName="") {

  // Convert angles from degrees to radians since trigonometric functions use radians
  real thetaRad = theta * pi / 180;
  real phiRad = phi * pi / 180;

  // Calculate Cartesian coordinates
  real x = magnitude * sin(thetaRad) * cos(phiRad);
  real y = magnitude * sin(thetaRad) * sin(phiRad);
  real z = magnitude * cos(thetaRad);

  triple loc = (x, y, z)*magnitude;
  
  return draw3PointLoc(origin, loc, name, pointColor, magnitude, vectorName);
}


// Function to draw a sphere at a specified body location. Theta and pi are in degrees
Body2d draw2PointAngle(Body2d origin, real theta, real phi, string name, pen pointColor=blue, real magnitude, string vectorName="") {

  // Convert angles from degrees to radians since trigonometric functions use radians
  real thetaRad = theta * pi / 180;
  real phiRad = phi * pi / 180;

  // Calculate Cartesian coordinates
  real x = magnitude * sin(thetaRad) * cos(phiRad);
  real y = magnitude * sin(thetaRad) * sin(phiRad);
  real z = magnitude * cos(thetaRad);

  pair loc = (x, y)*magnitude;
  
  return draw2PointLoc(origin, loc, name, pointColor, magnitude, vectorName);
}


// Function to draw a cube at a specified body location
void drawCube(Body3d body, pen surfaceColor=currentpen, string name, pair namePos=NW, triple nameOffset=(0,0,0)) {
  draw(shift(body.position)*scale3(2*body.radius)*unitcube, surfacepen=surfaceColor);
  if (nameOffset==(0,0,0)) {
    nameOffset=(body.radius, body.radius, body.radius)+body.position;
  }
  label(name,nameOffset,namePos);
}

// Function to draw a vector between two bodies, or a vector with a specified length and direction
void drawForceVector3d(Body3d body1, pen p=currentpen, arrowbar3 arrowType=Arrow3(), Body3d body2=null, triple direction=(0,0,0), real length=0, string name, pair namePos=N, triple nameOffset=(0,0,0)) {
    triple startVector, endVector;

    if (body2 != null) {
      // Case 1: Vector between two bodies
      // Calculate the direction of the force vector
      triple forceDirection = body2.position - body1.position;
      forceDirection /= length(forceDirection);  // Normalize the direction

      // Calculate the start and end points for the vector (just outside the spheres)
      startVector = body1.position + body1.radius * forceDirection;
      endVector = body2.position - body2.radius * forceDirection;

    } else {
        // Case 2: Vector with specified direction and length (not ending at another body)
        direction /= length(direction);  // Normalize the direction
        startVector = body1.position + body1.radius * direction;  // Start just outside the first body
        endVector = startVector + length * direction;  // Calculate the endpoint based on the length and direction
    }

    // Draw the vector with an arrowhead in 3D
    draw(startVector -- endVector, p=p, arrow=arrowType);
    triple midpoint = (startVector + endVector)/2;
    nameOffset = midpoint+nameOffset;

}

Body2d setupFor2Freebody(int scale, string bodyname) {

  drawCoordinates2d(scale);
  
  pen thickp=linewidth(0.5mm);
  Body2d origin = Body2d((0,0), .01*scale);
  drawCircle(origin, name=bodyname, surfaceColor=blue, fillColor=blue);

  return origin;
}


Body3d setupFor3Freebody(int scale, string bodyname) {

  // Draw the xz-plane (y = 0)
  surface xz_plane = surface((scale,0,scale)--(scale,0,0)--(0,0,0)--(0,0,scale)--cycle);
  draw(xz_plane, lightblue+opacity(0.5)); // Light gray and partially transparent

  // Draw the yz-plane (x = 0)
  surface yz_plane = surface((0,scale,scale)--(0,scale,0)--(0,0,0)--(0,0,scale)--cycle);
  draw(yz_plane, lightred+opacity(0.5)); // Light blue and partially transparent

  // Draw the xy-plane (z = 0)
  surface xy_plane = surface((scale,scale,0)--(scale,0,0)--(0,0,0)--(0,scale,0)--cycle);
  draw(xy_plane, lightgrey+opacity(0.5)); // Light green and partially transparent

  drawCoordinates3d(scale);
  
  Body3d origin = Body3d((0,0,0), .1*scale);
  drawSphere(origin, name=bodyname, surfaceColor=lightgreen);
  // Set the viewing angle
  currentprojection = perspective(3, 2, 1);
  // set the pen width
  pen thickp=linewidth(0.5mm);
  return origin;
}
