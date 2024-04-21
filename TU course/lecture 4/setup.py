from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension
from Cython.Distutils import build_ext
 
setup(
  name = "hello",
  cmdclass = {"build_ext": build_ext},
  ext_modules =
  [
    Extension("hello",
              ["hello.pyx"],
              extra_compile_args = ["-O0", "-fopenmp"],
              extra_link_args=['-fopenmp']
              )
  ]
)
