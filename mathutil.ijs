NB. math/misc/mathutil
NB. math utilities
NB. version: 1.0.0
NB.
NB. det           determinant of matrix
NB. mp            M mp N  = matrix product of M and N
NB. powermod      x (n powermod) y computes n|x^y
NB. randomint     random integer in range 0, <: 10^y
NB. randomintd    random integer with y digits
NB. timesmod      x (n timesmod) y computes n|x*y

require 'numeric'

det=: -/ .*
mp=: +/ .*
powermod=: 1 : 'x&|@^'
randomint=: 3 : '10 #. ? y $ 10x'
randomintd=: 3 : '10 #. (y{.1) + ? 10x - y{.1'
timesmod=: 1 : 'x&|@*'

