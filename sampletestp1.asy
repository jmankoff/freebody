import three;
import math;
import freebody;

// Example: Usage of the function

size(200);

Body2d origin = setupFor2Freebody(scale=3, bodyname="origin");

Body2d point1 = draw2PointLoc(origin, (0,1), "F_N");
Body2d point2 = draw2PointLoc(origin, (2,-2), "T", magnitude=1);
Body2d point3 = draw2PointLoc(origin, (-2,-2), "F", magnitude=1);
