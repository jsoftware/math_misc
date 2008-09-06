NB. math/misc/det
NB. definitions for determinants
NB. version: 1.0.0
NB.
NB. det        built-in verb
NB. detm       defined verb
NB.
NB. The determinant verb u . v calculates determinants
NB. by recursive expansion of minors, but is only
NB. efficient for small matrices.
NB.
NB. The defined verb detm is efficient for larger matrices.

require 'math/misc/linear'

det=: -/ .*       NB. standard definition

NB. =========================================================
NB. detm
NB. determinant of square matrix
detm=: 3 : 0
'm p s'=. gauss_elimination y
(*/ diag m) * _1 ^ #s
)
