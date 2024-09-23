# Freebody 

Freebody is a library that works with asmyptote

It is designed to radically simplify the process of creating freebody diagrams according to the rules that are typically required in a physics class such as statics

## Usage
To run it, you need to have freebody.asy in your path and import it (see test_freebody.asy as an example)

A freebody diagram script begins with imports

```asymptote
import three;
import math;
import freebody
```

then the work area is set up (a size needs to be specified, which impacts the resolution)

```asmyptote
size(200);
```

Other details depend on whether the body is in 2d or 3d

## Assumptions

Freebody currently supports the creation of freebody diagrams that are designed to show forces between an origin object and points around the origin. It has some built in assumptions that will need to be expanded upon, specificalyl that vectors always go from the source object to the new point (not the other direction)

These are loose assumptions in the sense that there are a bunch of helper functions that do not make these assumptions that could be used directly.

## 3d Freebody Support
A freebody diagram script begins with imports

```asymptote
import three;
import math;
import freebody
```

then the work area is set up (a size needs to be specified, which impacts the resolution)

```asmyptote
size(200);
```

Next, the user decides on the scale of the axis and the name of the origin object

```asmyptote
Body3d origin = setupFor3Freebody(scale=3, bodyname="origin");
```

After this, the user can add new points by specifying the object the point should be connected to (i.e. there is a force from a source object to the new point), the location of the point in 3d, a name for the point, and possibly other factors

```asymptote
Body3d point1 = draw3PointLoc(origin, (1,1,1), "point1");
```

Alternatively, the user can specify an angle and magnitude 

```asymptote
Body3d point3 = draw3PointAngle(origin, 45,0, "point3", magnitude=2);
```

## 2d Freebody Support
The user first decides on the scale of the axis and the name of the origin object

```asmyptote
Body2d origin = setupFor2Freebody(scale=2, bodyname="origin");
```

After this, the user can add new points by specifying the object the point should be connected to (i.e. there is a force from a source object to the new point), the location of the point in 3d, a name for the point, and possibly other factors. The user can label the new point (as in "F" below) and optionally also the vector ("beta")

```asymptote
Body2d F = draw2PointLoc(origin, (-1,-.5), "F", vectorName="beta");
```

drawing based on an angle is also possible in 2d.


