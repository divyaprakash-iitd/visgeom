#!/bin/bash

rm new.geo 
echo "Enter Number of boxes: "
read nBoxes
echo "Enter Number of cylinders: "
read nCylinders

if [ $nBoxes -gt 0 ]
then
	for ((i=1; i<=nBoxes; i++))
	do
		#echo Box_$i
		./dp_script_box.sh
	done
fi

if [ $nCylinders -gt 0 ]
then
	for ((i=1; i<=nCylinders; i++))
	do
		#echo Cylinder_$i
		./dp_script_cylinder.sh
	done
fi

gmsh new.geo
