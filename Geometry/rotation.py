import numpy as np
from numpy import linalg as la


###script that generates the rotation matrix that aligns a to b (a moves to align with b)
b=np.mat([1,0,1])/np.sqrt(2)
a=np.mat([ 0 ,  0 , 1])
a=a/np.sqrt(np.dot(a,a.T))
c=np.dot(a,b.T)
v=np.cross(a,b)[0]
s=np.sqrt(np.dot(v,v.T))
y = np.mat([[0, -v[2], v[1]], [v[2], 0, -v[0]], [-v[1], v[0], 0]])

Rot=np.mat(np.diag([1,1,1]))+y+np.dot(y,y)*(((1-c)/s**2)[0,0])

print(Rot, la.det(Rot))
