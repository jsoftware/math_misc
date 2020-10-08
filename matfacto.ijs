NB. math/misc/matfacto
NB. Matrix factorization
NB. version: 1.0.0

NB. choleski        Choleski decomposition
NB. lud             LU decomposition of matrix
NB. qrd             QR decomposition of matrix

require 'math/misc/linear'

NB. =========================================================
NB.*choleski v Choleski decomposition of matrix y
NB. given L =. choleski A
NB.       A -: L mp h L  (mp is matrix product and h is conjugate transpose)
choleski=: 3 : 0
mp=. +/ .*            NB. matrix product
h=. +@|:              NB. conjugate transpose
r=. #A=. y
if. 1>:r do.
  assert. (A=|A)>0=A  NB. check positive definite
  %:A
else.
  'X Y t Z'=. , (;~ r $ (>. -:r){.1) <;.1 A
  L0=. choleski X
  L1=. choleski Z-(T=. (h Y) mp %.X) mp Y
  L0,(T mp L0),.L1
end.
)

NB. =========================================================
NB.*lud v LU decomposition of matrix y
NB. returns 3 elements: L U P where
NB.   L is lower triangular
NB.   U is upper triangular
NB.   P is a permutation of the identity matrix,
NB.     that gives the pivoting used.
NB. The original matrix is: (L mp U) %. P
lud=: 3 : 0
r=. #y
ir=. idmat r
'A b'=. 2 {. gauss_elimination y,.ir
U=. clean (r,r){.A
f=. (0,r)}.A
L=. clean b{%.f
P=. b{ir
L;U;P
)

NB. =========================================================
NB.*qrd v QR decomposition of matrix y
NB. result has 2 elements: Hermitian matrix;square upper triangular matrix
qrd=: 128!:0
