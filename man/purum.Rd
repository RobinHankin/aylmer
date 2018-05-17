\name{purum}
\alias{purum}
\alias{Purum}
\alias{khulen}
\alias{Khulen}
\docType{data}
\title{Classification of Purum marriages}
\description{
  Data for 128 Purum marriages from a  census (\code{purum})
  and 30 marriages from Khulen village.
}
\usage{data(purum)}
\details{
  The Purums are an isolated tribe in the interior of India, divided
  into five \dQuote{sibs}:  Marrim, Makan, Parpa, Thao, and the Kheyang.

  Marriages between persons of the same sib are forbidden, as are
  persons from certain pairs of sibs; note the lack of symmetry in the
  structural zeros implying a gender asymmetry (the single
  Kheyang-Kheyang marriage has special dispensation).

}
\source{
  \itemize{
    \item White HC 1963.  \emph{An anatomy of kinship}, Englewood
    Cliffs, N.J. Prentice-Hall; Figure 3.12, p136 for \code{khulen} and
    Table 3.2, p138 for \code{purum}
    \item Das 1945.  \emph{The Purums: an old Kuki tribe of Manipur}.
    Calcutta, University of Calcutta
    \item Bishop WMV, Fienberg SE, and Holland PW 1975. \emph{Discrete
      multivariate analysis}.  MIT Press
  }
}
\examples{
data(purum)
aylmer.test(purum , simulate.p.value=TRUE , B=100)

aylmer.test(khulen)
aylmer.test(khulen , alternative=function(x){max(abs(x-t(x)),na.rm=TRUE)})

}
\keyword{datasets}
