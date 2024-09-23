import three;
import math;
import freebody;
size(200);
Body2d origin = setupFor2Freebody(2, "A");

// Define the bodies 
Body2d FN = draw2PointLoc(origin, (0, 1), "FN");
Body2d T = draw2PointLoc(origin, (1, -1), "T", vectorName="alpha+beta");
Body2d F = draw2PointLoc(origin, (-1,-.5), "F", vectorName="beta");
