import three;

// Define a structure for a body (sphere)
struct Body {
  triple position;  // Center of the sphere
  real radius;  // Radius of the sphere


  void operator init(triple position, real r) {
    this.position=position;
    radius=r;
  }

  //void addForce(name, magnitude
}

void drawCoordinates() {
  // Draw coordinate axes
  draw(O--(2,0,0), arrow=Arrow3(size=2), L=Label("$x$", 1), blue);
  draw(O--(0,2,0), arrow=Arrow3(size=2), L=Label("$y$", 1), red);
  draw(O--(0,0,2), arrow=Arrow3(size=2), L=Label("$z$", 1), black);
  // Set the viewing angle
  currentprojection = perspective(3, 2, 1);

}

// Function to draw a sphere at a specified body location
void drawSphere(Body body, pen surfaceColor=currentpen, string name, pair labelPos=NW, triple labelOffset=(0,0,0)) {
  draw(shift(body.position)*scale3(body.radius)*unitsphere, surfacepen=surfaceColor);
  if (labelOffset==(0,0,0)) {
    labelOffset=(body.radius, body.radius, body.radius)+body.position;
  }
  label(name,labelOffset,labelPos);
}

// Function to draw a cube at a specified body location
void drawCube(Body body, pen surfaceColor=currentpen, string name, pair labelPos=NW, triple labelOffset=(0,0,0)) {
  draw(shift(body.position)*scale3(2*body.radius)*unitcube, surfacepen=surfaceColor);
  if (labelOffset==(0,0,0)) {
    labelOffset=(body.radius, body.radius, body.radius)+body.position;
  }
  label(name,labelOffset,labelPos);
}

// Function to draw a vector between two bodies, or a vector with a specified length and direction
void drawForceVector(Body body1, pen p=currentpen, arrowbar3 arrowType=Arrow3(), Body body2=null, triple direction=(0,0,0), real length=0) {
    triple startVector, endVector;

    if (body2 != null) {
      // Case 1: Vector between two bodies
      // Calculate the direction of the force vector
      triple forceDirection = body2.position - body1.position;
      forceDirection /= length(forceDirection);  // Normalize the direction
      //write("ForceDirection");
      //write(forceDirection);

      // Calculate the start and end points for the vector (just outside the spheres)
      startVector = body1.position + body1.radius * forceDirection;
      //write("StartVector");
      //write(startVector);
      endVector = body2.position - body2.radius * forceDirection;
      //write("EndVector");
      //write(endVector);

    } else {
        // Case 2: Vector with specified direction and length (not ending at another body)
        direction /= length(direction);  // Normalize the direction
        startVector = body1.position + body1.radius * direction;  // Start just outside the first body
        endVector = startVector + length * direction;  // Calculate the endpoint based on the length and direction
    }

    // Draw the vector with an arrowhead in 3D
    draw(startVector -- endVector, p=p, arrow=arrowType);
}
