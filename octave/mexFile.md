# Mex File pour Octave

Octave est capable de gérer les fichier .mex au sens de Matlab.

Sot le fichier `mex` suivant :
```c
#include "mex.h"

void
mexFunction (int nlhs, mxArray *plhs[],
             int nrhs, const mxArray *prhs[])
{
  mexPrintf ("Hello, World!\n");

  mexPrintf ("I have %d inputs and %d outputs\n", nrhs, nlhs);
}
```
Ce programme (!!) rangé dans un fichier de nom `test.c` peut se compiler sous octave grâce à la commande suivante :
```
mkoctfile --mex test.c
```
On obtient alors un "exécutable" de nom `test.mex` qui peut s'utiliser de la manière suivante :
```
test(1, 2, 3)
```
qui retourne le résultat suivant :
```
Hello, World!
I have 3 inputs and 0 outputs
```
En résumé :
```
octave:1> mkoctfile --mex test.c
octave:2> test(1,2,3)
Hello, World!
I have 3 inputs and 0 outputs
```
