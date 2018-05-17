\name{aylmer-package}
\alias{aylmer-package}
\alias{aylmer}
\docType{package}
\title{A Generalization of Fisher's exact test}
\description{
  A Generalization of Fisher's exact test
}
\details{
\tabular{ll}{
Package: \tab aylmer\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2007-10-11\cr
License: \tab GPL-2
}
}
\author{
Robin K. S. Hankin (\R) and Luke G. West (C++)

Maintainer: <hankin.robin@gmai.com>
}
\references{
  \itemize{
    \item Ronald Aylmer Fisher 1955.  \emph{Statistical methods for
      research workers}, Oliver and Boyd
    \item G. H. Freeman and J. H. Halton 1951. \emph{Note on an Exact
      Treatment of Contingency, Goodness of Fit and Other Problems of
      Significance}.  Biometrika, 38(1-2):141-149
    \item A. W. Ghent 1972. \emph{A Method for Exact Testing of
      \eqn{2\times 2}, \eqn{2\times 3},
      \eqn{3\times 3}, and Other Contingency Tables, Employing Binomial
      Coefficients}.  American Midland Naturalist, 88(1):15-27
    \item R. K. S. Hankin 2007. \emph{Very Large Numbers in \R:
      Introducing Package Brobdingnag}.  \R News 3(3):15-16
  }
}
\keyword{ package }
\examples{
data(chess)
aylmer.test(chess)
}
