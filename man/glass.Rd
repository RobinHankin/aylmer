\name{glass}
\alias{glass}
\alias{Glass}
\alias{glass.all}
\alias{Glass.all}
\docType{data}
\title{British social mobility data}
\description{
Classification of son-father status
}
\usage{data(glass)}
\details{
Data collected by Glass: social status of son cross-classified with
status of father.

Dataset \code{glass.al} includes all the original data; dataset
\code{glass} has the diagonal set to \code{NA}, thus restricting the
sample to those pairs where the father's status is different from that
of the son's.

This dataset has ordered factors: social status is ordered from 1
(highest) to 5 (lowest).

An example of a test only possible where the factors are ordered is
given below.  The alternative is a function, \code{f()}, that sums the
counts in the lower triangular region of the matrix: the son has higher
status than the father.  If \code{f(glass)} is large, then this suggests
that upward social mobility occurs more often than downward mobility.

Note that, because the test is conditioned on the marginal totals, a
significant result would imply that downward mobility, when it occurs,
involves a more extreme fall than the (more common) upwardly mobile
case.

}
\source{
  \itemize{
    \item Bishop WMV, Fienberg SE, and Holland PW 1975. \emph{Discrete
      multivariate analysis}.  MIT Press
  }
}
\examples{

f <- function(x){sum(x[lower.tri(x)])}


# First a toy example:
a <- matrix(0,5,5)
diag(a) <- NA
a[cbind(c(2:5,1),1:5)] <- 3

# Thus 'a' has 12 social climbers and 3 fallers.  Chance?

aylmer.test(a , alternative=f)

# No!


# Now the real dataset:
data(glass)
aylmer.test(glass , alternative=f, simulate.p.value=TRUE , B=100)

# p-value of about 0.975 means that most boards have f(random.board) >
# f(observed.board).  In this case, f() is the number of climbers.  The
# test shows that the number of climbers is less than expected: those
# who do climb, climb further than the fallers fall.

# See how one needs to be careful about one-sided and two-sided tests.
}
\keyword{datasets}
