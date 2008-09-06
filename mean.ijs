NB. math/misc/mean
NB. various means
NB. version: 1.0.0
NB.
NB. arithmean   arithmetic mean
NB. geomean     geometric mean
NB. harmean     harmonic mean
NB. commonmean  common mean

arithmean=: +/ % #
geomean=: # %: */
harmean=: arithmean &. (%"_)
commonmean=: {. @ ((geomean,arithmean) ^: _)
