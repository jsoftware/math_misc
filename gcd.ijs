NB. math/misc/gcd
NB. calculate GCD
NB. version: 1.0.0
NB.
NB. J has a built-in gcd function: +.
NB.
NB. This script defines another gcd that returns both the
NB. gcd of a numeric list, and the coefficents where:
NB.
NB.    gcd = +/ numeric_list * coefficients

NB. =========================================================
NB. gcd
NB.
NB. form: gcd numeric_list
NB.
NB. returns 2 elements:   gcd;coefficients

gcd=: 3 : 0
x=. (x: y) ,. =/~ i.#y
f=. {: <.@%&{. {.
b=. #~ 0: ~: {."1
while. 1 < #x do.
  x=. x /: | {."1 x
  x0=. {.x
  x=. x0, b (}.x) -"1 x0 * f x
end.
({. ; }.) (* *@{.) ,x
)
