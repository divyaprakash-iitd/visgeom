#!/bin/bash

#rm new.geo
# Read in the required numbers 
echo "Box Details"
echo -n "Enter P1 (x1 y1 z1): " 
read p1x p1y p1z
p1=($p1x $p1y $p1z)
#echo ${p1[1]}
echo -n "Enter P2 (x2 y2 z2): " 
read p7x p7y p7z
p7=($p7x $p7y $p7z)

# Calculate the coordinates of the remaining points 
x=`echo $p7x - $p1x | bc`
y=`echo $p7y - $p1y | bc`
z=`echo $p7z - $p1z | bc`

p2x=`echo $p1x + $x | bc`
p2y=$p1y
p2z=$p1z

p2=($p2x $p2y $p2z)

#echo ${p2[0]} ${p2[1]} ${p2[2]}

p3x=$p2x
p3y=`echo $p2y + $y | bc`
p3z=$p2z

p3=($p3x $p3y $p3z)

p4x=$p1x
p4y=`echo $p1y + $y | bc` 
p4z=$p1z

p4=($p4x $p4y $p4z)

p5x=$p1x
p5y=$p1y
p5z=`echo $p1z + $z | bc`

p5=($p5x $p5y $p5z)

p6x=`echo $p5x + $x | bc`
p6y=$p5y
p6z=$p5z

p6=($p6x $p6y $p6z)

p8x=$p5x
p8y=`echo $p5y + $y | bc`
p8z=$p5z

p8=($p8x $p8y $p8z)

points=($p1 $p2 $p3 $p4 $p5 $p6 $p7 $p8)


echo "p1 = newp; Point(p1) = {${p1[0]}, ${p1[1]}, ${p1[2]}, 1.0};" >> new.geo
echo "p2 = newp; Point(p2) = {${p2[0]}, ${p2[1]}, ${p2[2]}, 1.0};" >> new.geo
echo "p3 = newp; Point(p3) = {${p3[0]}, ${p3[1]}, ${p3[2]}, 1.0};" >> new.geo
echo "p4 = newp; Point(p4) = {${p4[0]}, ${p4[1]}, ${p4[2]}, 1.0};" >> new.geo
echo "p5 = newp; Point(p5) = {${p5[0]}, ${p5[1]}, ${p5[2]}, 1.0};" >> new.geo
echo "p6 = newp; Point(p6) = {${p6[0]}, ${p6[1]}, ${p6[2]}, 1.0};" >> new.geo
echo "p7 = newp; Point(p7) = {${p7[0]}, ${p7[1]}, ${p7[2]}, 1.0};" >> new.geo
echo "p8 = newp; Point(p8) = {${p8[0]}, ${p8[1]}, ${p8[2]}, 1.0};" >> new.geo

echo "l1 = newreg; Line(l1) = {p1, p2};" >> new.geo
echo "l2 = newreg; Line(l2) = {p2, p3};" >> new.geo
echo "l3 = newreg; Line(l3) = {p3, p4};" >> new.geo
echo "l4 = newreg; Line(l4) = {p4, p1};" >> new.geo
echo "l5 = newreg; Line(l5) = {p5, p6};" >> new.geo
echo "l6 = newreg; Line(l6) = {p6, p7};" >> new.geo
echo "l7 = newreg; Line(l7) = {p7, p8};" >> new.geo
echo "l8 = newreg; Line(l8) = {p8, p5};" >> new.geo
echo "l9 = newreg; Line(l9) = {p1, p5};" >> new.geo
echo "l10 = newreg; Line(l10) = {p2, p6};" >> new.geo
echo "l11 = newreg; Line(l11) = {p3, p7};" >> new.geo
echo "l12 = newreg; Line(l12) = {p4, p8};" >> new.geo 
