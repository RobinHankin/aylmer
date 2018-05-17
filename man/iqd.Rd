\name{iqd}
\alias{iqd}
\alias{Industrial}
\alias{industrial}
\alias{shifts}
\docType{data}
\title{Industrial quality control dataset}
\description{
  A factory has four machines A, B, C, D.  The quality control process
  identifies defects from each machine.

  The \code{iqd} dataset has four columns, one per machine; entries
  correspond to the numbers of defects produced by each machine.  The
  \code{NA} entries in a row indicate that a particular machine is
  switched off.

  The null hypothesis would be that there exist four non-negative
  numbers \eqn{p_1,p_2,p_3,p_4} with sum 1 such that the probability of
  a defect arising from machine \eqn{i} is proportional to \eqn{p_i} if
  it is switched on, and zero otherwise.

  It is suspected that machine D is causing some sort of interference
  with machine A; machine A produces very few defects when D is switched
  off.

  The \code{shifts} dataset includes only three machines, A, B, C.
  There are three columns, one per machine; and three rows, one per
  operator (S1, S2, S3).  On S1's shift, machine C was out of
  commission.  
}
\usage{data(iqd)}
\source{
  Data kindly supplied by Acme Corporation (widget division)
}
\examples{
data(iqd)

aylmer.test(iqd)
aylmer.test(shifts)

}
\keyword{datasets}
