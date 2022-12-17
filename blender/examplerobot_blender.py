# This script was written by chatGPT guided by TH, 2022-12-17
import bpy
import math
from mathutils import Matrix

# Clear the default scene
bpy.ops.object.select_all(action='SELECT')
bpy.ops.object.delete(use_global=False)

# Set the scene origin to the center of the grid
bpy.context.scene.cursor.location = (0,0,0)
bpy.ops.object.origin_set(type='ORIGIN_CURSOR')

# Define the Denavit-Hartenberg parameters for each link
# The DH parameters should be a 2D array where each row represents a joint of the robot
# Each row should contain the following values: theta, alpha, a, d, offset
DH_params = [
    [0, math.pi/2, 0, 0, 0],
    [0, 0, 0, 1, 0],
    [0, 0, 1, 0, 0],
    [0, math.pi/2, 0, 1, 0],
    [0, -math.pi/2, 0, 0, 0],
    [0, 0, 0, 0, 0],
]

# Load the STL files for each link
for i in range(len(DH_params)):
    filepath="/home/thill/Documents/docker_ws/src/examplerobot_ros/examplerobot_description/meshes/link"+str(i)+".stl"
    bpy.ops.import_mesh.stl(filepath=filepath)

# Calculate the transformation matrix for each link and apply it to the corresponding object
for i, params in enumerate(DH_params):
    # Extract the Denavit-Hartenberg parameters from the current row
    theta, alpha, a, d, offset = params

    # Calculate the transformation matrix
    T = Matrix((
        (math.cos(theta), -math.sin(theta)*math.cos(alpha), math.sin(theta)*math.sin(alpha), a*math.cos(theta)),
        (math.sin(theta), math.cos(theta)*math.cos(alpha), -math.cos(theta)*math.sin(alpha), a*math.sin(theta)),
        (0, math.sin(alpha), math.cos(alpha), d),
        (0, 0, 0, 1)
    ))

    # Apply the transformation matrix to the corresponding object
    obj = bpy.data.objects[i]
    obj.matrix_world = T
