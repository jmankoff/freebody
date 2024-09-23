import three;
import math;
import freebody;

// Example: Usage of the function

size(200);

Body3d origin = setupFor3Freebody(scale=3, bodyname="origin");
Body3d point1 = draw3PointLoc(origin, (1,1,1), "point1");
Body3d point2 = draw3PointLoc(origin, (3,2,1), "point1", magnitude=1.5);
Body3d point3 = draw3PointAngle(origin, 45,0, "point3", magnitude=2);
