NB. math/misc/matutil
NB. matrix utilities
NB. version: 1.0.0
NB.
NB. band          b band M = zero all but b band of M
NB. cond          condition number of matrix
NB. diag          diagonal of matrix
NB. invsut        invert square upper-triangular matrix
NB. minors        minors of matrix
NB.
NB. pivot         (r,c) pivot M       - pivot at row, column
NB. ppivot        (r,c) ppivot M      - partial pivot at row, column
NB.
NB. coldrop       cols coldrop M      - drop cols from M
NB. coltake       cols coltake M      - take cols from M
NB. rowdrop       rows rowdrop M      - drop rows from M
NB. rowdrop       rows rowtake M      - take rows from M
NB.
NB. rowswap       (i,j) rowswap M     - swap rows i and j
NB. rowscale      (i,n) rowscale M    - multiply row i by n
NB. rowshear      (i,j,n) rowshear M  - multiply row j by n and add to row i

require 'math/misc/mathutil'
require 'math/misc/makemat'

diag=: (<0 1)&|:
invsut=: 128!:1
minors=: 1&(|:\.)"2^:2	

NB. =========================================================
NB. band    b band M  - zero all but b band of M, e.g.
NB.     0 1 band 3 3$5
NB.  5 5 0
NB.  0 5 5
NB.  0 0 5
band=: ] * +./@((,@[ +"0 1 i.@#@]) =/ i.@#@])

NB. =========================================================
NB. cond          condition number of matrix
NB. large when matrix is ill-conditioned, e.g.
NB.     cond hilbertmat 5
NB.  480849
cond=: *&(+/&.(*:"_)@,) %.

NB. =========================================================
NB. pivot  (row,col) pivot M
pivot=: 4 : 0
'r c'=. x
col=. c{"1 y
y - (col-r=i.#y) */ (r{y)%r{col
)

NB. =========================================================
NB. ppivot  (row,col) ppivot M   - partial pivot
NB.
NB. differences from pivot:
NB.   - the pivot element is left unchanged (pivot sets it to 1)
NB.   - only columns below the pivot element are modifed
ppivot=: 4 : 0
'r c'=. x
r1=. >:r
col=. c{"1 y
(r1{.y),(r1}.y)-(r1}.col) */ (r{y)%r{col
)

NB. =========================================================
NB. coldrop       cols coldrop M      - drop cols from M
NB. coltake       cols coltake M      - take cols from M
NB. rowdrop       rows rowdrop M      - drop rows from M
NB. rowdrop       rows rowtake M      - take rows from M

coldrop=: <@<@<@[ {"1 ]
coltake=: {"1
rowdrop=: <@<@<@[ { ]
rowtake=: {

NB. =========================================================
NB. rowswap
rowswap=: <@[ C. ]

NB. =========================================================
NB. rowscale
NB. or: ({:@[ * {.@[ { ])`({.@[)`]}
rowscale=: 4 : 0
'i n'=. x
(n * i{y) i } y
)

NB. =========================================================
NB. rowshear
NB. or: (+/@(1&,@{:@[ * (}:@[) { ]))`({.@[)`]}
rowshear=: 4 : 0
'i j n'=. x
((i{y) + n * j{y) i } y
)
