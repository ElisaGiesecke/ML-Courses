cimport cython
import numpy as np
cimport openmp
from cython.parallel cimport prange

@cython.boundscheck(False)
@cython.wraparound(False)

cpdef dot(float[:,:] X, float[:,:] Y): 
    cdef:
        int n,i,j,k
        float[:,:] Z
    n = X.shape[0]
    Z = np.zeros((n,n), dtype = 'float')
    n = len(X)
    for i in prange(n, nogil = True):
        for j in range(n):
            for k in range(n):
                Z[i,j] += X[i, k] * Y[k, j]
    return Z
