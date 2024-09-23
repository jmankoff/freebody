import three;
import math;
import freebody;

// Example: Usage of the function

size(200);

Body3d origin = setupFor3Freebody(scale=10, loc=(0,0,5.6), bodyname="A");
Body3d point1 = draw3PointLoc(origin, (0,-4.2,-0), "B", vectorName="T-AB");
Body3d point2 = draw3PointLoc(origin, (4.2,2.4,0), "C", vectorName="T-AC");
Body3d point2 = draw3PointLoc(origin, (-3.3,0,0), "C", vectorName="T-AC");
// Body3d point3 = draw3PointAngle(origin, (45,0, "point3", magnitude=2);
