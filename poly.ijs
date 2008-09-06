NB. math/misc/poly
NB. polynomial functions
NB. version: 1.0.0
NB.
NB. chebyshev_tp      - explicit form of chebyshev T polynomial
NB. chebyshev_up      - explicit form of chebyshev U polynomial
NB.
NB. chebyshev_tpc     - coefficients of chebyshev T polynomial
NB. chebyshev_upc     - coefficients of chebyshev U polynomial
NB.
NB. legendre_pc       - coefficients of legendre polynomial

require 'trig'

NB. =========================================================
NB. n chebyshev_tp x   - chebyshev T polynomial of order n at x
NB. n chebyshev_up x   - chebyshev U polynomial of order n at x
chebyshev_tp=: cos @ (*arccos)
chebyshev_up=: ((*>:)~ %&sin ]) arccos

NB. =========================================================
NB. chebyshev_tpc
NB. returns coefficients of chebyshev T polynomial of order n
NB.
NB. e.g. (chebyshev_tpc 8)&p.  =  chebyshev T polynomial of order 8
NB.
NB. or list coefficients to order n+1:
NB.  T=. , <@(+:@(0&,)@>@{: - >@(_2&{) , 0 0"_)
NB.  T ^: n [ 1;0 1
chebyshev_tpc=: 3 : 0
r=. 1 if. y=0 do. r return. end.
s=. 0 1 if. y=1 do. s return. end.
while. y=. <:y do.
  p=. r
  r=. s
  s=. (+:0,r) - p,0 0
end.
)

NB. =========================================================
NB. chebyshev_upc
NB. returns coefficients of chebyshev U polynomial of order n
NB.
NB. e.g. (chebyshev_upc 8)&p.  =  chebyshev U polynomial of order 8
chebyshev_upc=: 3 : 0
r=. 1 if. y=0 do. r return. end.
c=. 0 2 if. y=1 do. c return. end.
s=. 0 1
while. y=. <:y do.
  p=. r
  r=. s
  s=. (+:0,r) - p,0 0
  c=. s + 0,c
end.
)

NB. =========================================================
NB. legendre_pc
NB. returns coefficients of legendre polynomial of order n
NB.
NB. e.g. (legendre_pc 8)&p.  =  legendre polynomial or order 8
NB.
NB. or list coefficients to order n+1:
NB.  T=. , <@(+:@(0&,)@>@{: - >@(_2&{) , 0 0"_)
NB.  T ^: n [ 1;0 1
legendre_pc=: 3 : 0
r=. 1 if. y=0 do. r return. end.
s=. 0 1 if. y=1 do. s return. end.
i=. 1
while. y >: i=. >:i do.
  p=. r
  r=. s
  s=. (((<:+:i)*0,r) - (<:i)*p,0 0 ) % i
end.
)
