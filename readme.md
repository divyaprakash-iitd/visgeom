# Geometry Generator Scripts

A collection of Bash scripts developed during my Masters studies as a learning exercise in shell scripting and OpenFOAM preprocessing. These scripts generate geometric configurations using GMSH, allowing users to create multiple boxes and cylinders in 3D space through an interactive command-line interface. While primarily created for learning purposes, they demonstrate basic shell scripting concepts and automation of GMSH geometry generation.

## Features

- Interactive geometry creation through command-line prompts
- Support for multiple geometric primitives:
  - 3D boxes defined by two corner points
  - Cylinders defined by axis points and radius
- Automatic GMSH (.geo) file generation
- Batch processing capability for multiple geometries
- Integration with GMSH for immediate visualization

## Prerequisites

- Bash shell environment
- GMSH (Geometry and mesh generation software)
- Basic command-line knowledge

## Installation

1. Clone this repository:
```bash
git clone [your-repository-url]
cd [repository-name]
```

2. Make the scripts executable:
```bash
chmod +x *.sh
```

## Usage

### Sample Run

Here's an example of creating a box and a cylinder:

```bash
$ ./run_all.sh
Enter Number of boxes: 
1
Enter Number of cylinders: 
1
Box Details
Enter P1 (x1 y1 z1): 0 0 0
Enter P2 (x2 y2 z2): 1 1 1
Cylinder Details: 
Enter P1 (x1 y1 z1): 0.5 0.5 0
Enter P2 (x2 y2 z2): 0.5 0.5 1
Enter Radius: 0.4
```

This creates:
1. A unit cube with corners at (0,0,0) and (1,1,1)
2. A vertical cylinder with radius 0.4, centered at (0.5,0.5) extending from z=0 to z=1

The script will:
1. Generate a GMSH file (new.geo) containing both geometries
2. Automatically open GMSH for visualization

### Individual Scripts

#### Box Generation (dp_script_box.sh)
```bash
./dp_script_box.sh
```
- Requires input of two 3D points (P1 and P2) defining opposite corners of the box
- Automatically calculates remaining corner points
- Generates corresponding GMSH geometry commands

#### Cylinder Generation (dp_script_cylinder.sh)
```bash
./dp_script_cylinder.sh
```
- Requires input of:
  - Two 3D points defining the cylinder axis
  - Radius of the cylinder
- Creates circular cross-sections and connecting lines
- Generates corresponding GMSH geometry commands

## File Structure

- `run_all.sh`: Main script orchestrating the geometry creation process
- `dp_script_box.sh`: Script for generating box geometries
- `dp_script_cylinder.sh`: Script for generating cylinder geometries
- `new.geo`: Generated GMSH geometry file (created during execution)

## Output

The scripts generate a GMSH geometry file (`new.geo`) containing:
- Point definitions with coordinates
- Line and circle definitions
- Surface definitions (where applicable)

## Use Cases

- Creating test geometries for OpenFOAM simulations
- Quick prototyping of 3D configurations
- Educational purposes in learning GMSH scripting
- Batch generation of multiple geometric primitives

## Limitations

- Basic geometric primitives only (boxes and cylinders)
- Sequential geometry generation
- No error handling for invalid inputs
- Overwrites previous geometry file without warning

## Future Improvements

- Add input validation
- Better error handling

## Contributing

Feel free to fork this repository and submit pull requests. You can also open issues for bugs or feature requests.

## Author

Divyaprakash

