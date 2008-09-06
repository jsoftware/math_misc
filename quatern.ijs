NB. math/misc/quatern
NB. definitions for quaternions
NB. version: 1.0.0
NB.
NB. real quaternions:
NB.  - stored as real arrays with last dimension of length 4
NB.
NB. Main definitions:
NB.   qncon      conjugate
NB.   qndivl     division (left quotient)
NB.   qndivr     division (right quotient)
NB.   qnmul      multiplication
NB.   qnrec      reciprocal
NB.
NB.   qnpolar    convert to/from polar form
NB.
NB. Other:
NB.   qndivml    division (using matrix divide, left quotient)
NB.   qndivmr    division (using matrix divide, right quotient)

NB. e.g.
NB.      2 3 5 7 qnmul 1 2 3 4
NB.   _47 6 13 14
NB.
NB.      (1 2 3 4 qndivl 2 3 5 7) qnmul 2 3 5 7
NB.   1 2 3 4
NB.
NB.      2 3 5 7 qnmul (1 2 3 4 qndivr 2 3 5 7)
NB.   1 2 3 4

mp=. +/ . *

j=. ,: =i.4
j=. j, 0 1 0 0, _1 0 0 0, 0 0 0 _1,: 0 0 1 0
j=. j, 0 0 1 0, 0 0 0 1, _1 0 0 0,: 0 _1 0 0
j=. j, 0 0 0 1, 0 0 _1 0, 0 1 0 0 ,: _1 0 0 0
qnmat=. mp & j

qncon=: 1 _1 _1 _1 & * "1
qnmul=: (mp qnmat) f. "1
qnrec=: (1 _1 _1 _1 & * % +/ @: *:) "1
qndivl=: (qnmul qnrec) f. "1
qndivr=: (qnmul~ qnrec) f. "1

qndivml=: {."1 @ %. & (|: @ qnmat) f. "1
qndivmr=: {. @ %. & qnmat f. "1

NB. =========================================================
NB. qnpolar
NB.
NB. x = 0   convert to polar form (default)
NB.    = 1   convert from polar to standard form
NB.
NB. polar form has 3 elements: h (modulus)
NB.                            t (theta)
NB.                            u (unit quaternion)

qnpolar=: 3 : 0 "1
0 qnpolar y
:
if. x=0 do.
  h=. %: +/ *: y
  t=. _2 o. ({.y) % h
  u=. j % %: +/ *: j=. 0 1 1 1 * y
  h;t;u
else.
  'h t u'=. y
  h * (4 {. cos t) + u * sin t
end.
)
