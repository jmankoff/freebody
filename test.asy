import three;
import math;
import freebody;

// Example: Usage of the function

size(200);

// set the pen width
pen thickp=linewidth(0.5mm);

drawCoordinates();

real radius1 = 0.2;
real radius2 = 0.1;
real len=1;

// Define two bodies (spheres)
Body body1 = Body((0, 0, 0), radius1);  // Body at (0, 0, 0) with radius 1
Body body2 = Body((3, 1, 0), radius2);  // Body at (3, 1, 0) with radius 0.5

drawSphere(body1, surfaceColor=red, name="body1");
drawCube(body2, surfaceColor=green, name="body2");

// Use the function to draw a vector between two bodies
drawForceVector(body1, blue, Arrow3(size=2), body2);

// Use the function to draw a free vector from a body with a given direction and length
drawForceVector(body1, red, Arrow3(size=2), null, (1, 1, 1), len);  // Vector in the (1, 1, 1) direction, length len

