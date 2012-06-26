NB. math/misc/cheby
NB. Chebyshev approximation
NB. version: 1.0.0

NB. chebft           Calculate Chebyshev coefficients
NB. chebev           Evaluate Chebyshev approximation
NB.
NB. e.g.
NB.    6 {. 30 (^ chebft) _1 1
NB. 2.53213 1.13032 0.271495 0.0443368 0.00547424 0.000542926
NB.
NB.   (2.53213 1.13032 0.271495 0.0443368 0.00547424 0.000542926;_1 1) chebev 0
NB. 1.00004
NB. These routines follow the algorithms from Numerical Recipes in C 1/e

NB.*chebft a Chebyshev coefficients
NB. u is the verb to be approximated; x is the number of coefficients to calculate;
NB. y is the range over which the function is to be approximated (low,high)
NB. You should calculate the coefficients to considerably higher degree than you
NB. plan to use (30 to 50, say), and then truncate the resulting series
NB. ex: 6 {. 30 (^ chebft) _1 1
chebft =: adverb define
:
f =. u 0.5 * (+/y) - (-/y) * 2 o. o. (0.5 + i. x) % x
(2 % x) * +/ f * 2 o. o. (0.5 + i. x) *"0 1 (i. x) % x
)



NB.*chebev v Evaluate Chebyshev approximation
NB. x is (chebyshev coeffs;(low,high used to calculate them)
NB. y is the point
NB. ex: (2.53213 1.13032 0.271495 0.0443368 0.00547424 0.000542926;_1 1) chebev 0.5
NB. The result is sigma(xi*Ti(y)) - (x0%2) where the sum is taken over all coeffs
NB. but the first, and Ti is the ith Chebyshev polynomial.  In this verb the summation
NB. is made using Clenshaw's recurrence.
chebev =: 4 : 0"1 _
'coeffs minmax' =. x
mapy2 =. _1 ,.~ +: mapy =. (+: y) ((- +/) % -~/@]) minmax
sumpoly =. ((+  +/"1@(mapy2&*)) ,. {."1@])/ 1 |.!.0 coeffs  NB. result is d,dd
(mapy(,"1)_1 0.5) +/@:*"1 sumpoly,"1{.coeffs
)


