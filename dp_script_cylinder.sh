#!/bin/bash

#rm new.geo
# Read in the required numbers 
echo "Cylinder Details: "
echo -n "Enter P1 (x1 y1 z1): " 
read p1x p1y p1z
p1=($p1x $p1y $p1z)
#echo ${p1[1]}
echo -n "Enter P2 (x2 y2 z2): " 
read p2x p2y p2z
echo -n "Enter Radius: "
read radius
p2=($p2x $p2y $p2z)

# Calculate the coordinates of the remaining points 
# Point for the first circle
x1=`echo $p1x + $radius | bc`
x2=`echo $p2x + $radius | bc`
#echo $x1

# Points for circle
# First circle
pc1=($x1 $p1y $p1z)
pc2=($x2 $p2y $p2z)

echo "p1 = newp; Point(p1) = {$p1x, $p1y, $p1z, 1.0};" >> new.geo
echo "p2 = newp; Point(p2) = {$x1, $p1y, $p1z, 1.0};" >> new.geo
echo "pc1 = newp; Point(pc1) = {$x1, $p1y, $p1z, 1.0};" >> new.geo
echo "pc2 = newp; Point(pc2) = {$x2, $p2y, $p2z, 1.0};" >> new.geo

echo "c1 = newl; Circle(c1) = {p2, p1, p2};" >> new.geo 

echo "P1 = newp; Point(P1) = {$p2x, $p2y, $p2z, 1.0};" >> new.geo
echo "P2 = newp; Point(P2) = {$x2, $p2y, $p2z, 1.0};" >> new.geo
echo "c1 = newl; Circle(c1) = {P2, P1, P2};" >> new.geo 

#echo "l1 = newl; Line(l1) = {p1, P1};" >> new.geo 
echo "l2 = newl; Line(l2) = {pc1, pc2};" >> new.geo 
#echo "l3 = newl; Line(l1) = {p1, P2};" >> new.geo 
#echo "l4 = newl; Line(l2) = {P1, P2};" >> new.geo 
