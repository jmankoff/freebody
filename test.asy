import three;
import math;
import freebody;

// Example: Usage of the function

size(200);

drawCoordinates3d(1);

real radius1 = 0.2;
real radius2 = 0.1;
real len=1;

// Define two bodies (spheres)
Body3d body1 = Body3d((0, 0, 0), radius1);  // Body at (0, 0, 0) with radius 1
Body3d body2 = Body3d((3, 1, 0), radius2);  // Body at (3, 1, 0) with radius 0.5

drawSphere(body1, pointColor=red, name="body1");
drawCube(body2, pointColor=green, name="body2");

// Use the function to draw a vector between two bodies
drawForceVector(body1, blue, Arrow3(size=2), body2, "bodyVec");

// Use the function to draw a free vector from a body with a given direction and length
drawForceVector(body1, red, Arrow3(size=2), null, (1, 1, 1), len, "normalVec");  // Vector in the (1, 1, 1) direction, length len

