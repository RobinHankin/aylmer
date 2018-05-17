\name{aylmer.test}
\alias{aylmer.test}
\alias{aylmer.function}
\alias{pval.1dof}
\alias{prob}
\title{A Generalization of Fisher's exact test}
\description{
A generalization of Fisher's exact test; much of the documentation and
\R code is inspired by \code{fisher.test()}
}
\usage{
aylmer.test(x, alternative = "two.sided", simulate.p.value = FALSE,
n = 1e5, B = 2000, burnin = 100, use.brob = FALSE)
aylmer.function(x, func, simulate.p.value = FALSE, n = 1e5, B = 2000,
burnin=100, use.brob=FALSE, DNAME=NULL) 
prob(x, give.log=TRUE, use.brob = FALSE)
}
\arguments{
  \item{x}{A matrix, possibly with some \code{NA} entries, coerced
    to integer (an object of class \code{board})}
  \item{alternative}{Indicates the alternative hypothesis.  If not a
    function, it must be one of \dQuote{two.sided}, \dQuote{greater} or
    \dQuote{less}.  You may specify just the initial letter.  Only used
    in cases with one degree of freedom.  If a function, then control is
    passed to \code{aylmer.function()}, for which \code{aylmer.test()}
    is a wrapper}
  \item{simulate.p.value}{Boolean, with default \code{FALSE} meaning to
    return the results of an exact (combinatorial) test, and \code{TRUE}
    meaning to compute p-values by Monte Carlo simulation}
  \item{n}{Integer specifying the maximum number of boards to list if
    \code{simulate.p.value} is \code{FALSE}; passed to \code{allprobs()}
    and thence \code{no.of.boards()}.  This argument has a finite
    default value to prevent infinite looping}
  \item{B}{Integer specifying the number of replicates used in the
    Monte Carlo version of the test}
  \item{burnin}{Integer specifying the length of burn in.  See details
    section}
  \item{use.brob}{Boolean, with default \code{FALSE} meaning to use
    \acronym{IEEE} 
    arithmetic and \code{TRUE} meaning to use Brobdingnagian arithmetic}
  \item{give.log}{In function \code{prob()}, Boolean with default \code{TRUE}
    meaning to return the logarithm of the answer and \code{FALSE}
    meaning to return the value}
  \item{func}{In function \code{aylmer.function()}, the test function
    used.  The p-value returned is the probability that a random
    permissible board has a test function less than that of argument
    \code{x}}
  \item{DNAME}{In function \code{aylmer.function()}, the name of the
    dataset to be specified; default value of \code{NULL} means to use
    standard construction}
}
\details{
  If \code{simulate.p.value} is \code{TRUE}, a vector of random
  probabilities is used instead of the full enumeration.  A total of
  \code{B+burnin} boards are generated of which the first \code{burnin}
  are discarded.
}
\value{
An object of class \dQuote{\code{htest}}
}
\references{
  \itemize{
    \item Ronald Aylmer Fisher 1955.  \emph{Statistical methods for
      research workers}, Oliver and Boyd
    \item G. H. Freeman and J. H. Halton 1951. \emph{Note on an Exact
      Treatment of Contingency, Goodness of Fit and Other Problems of
      Significance}.  Biometrika, 38(1-2):141-149
    \item A. W. Ghent 1972. \emph{A Method for Exact Testing of 2x2, 2x3,
      3x3, and Other Contingency Tables, Employing Binomial
      Coefficients}.  American Midland Naturalist, 88(1):15-27
    \item R. K. S. Hankin 2007. \emph{Very Large Numbers in \R:
      Introducing Package Brobdingnag}, R news 3(3):15-16
    \item M. J. Silvapulle and P. K. Sen 2005. \emph{Constrained
      statistical inference}.  Wiley (page 326 for a special case of
    the tests performed by \code{aylmer.function()})
  }
}
\author{Robin K. S. Hankin (\R); Luke J. West (C++); an anonymous
  \acronym{JSS} referee who suggested the approach used in
  \code{aylmer.function()}}
\note{
  Function \code{prob()} gives a number that is proportional to the
  probability of observing a board.

  The probability of observing a board \eqn{B} with no \code{NA}s,
  conditional on its being permissible is, obvious notation,

\deqn{
p(B)=
\sum_{\begin{array}{c}\mbox{permissable}\\\ \mbox{boards}\end{array}}
\frac{\left.
  \prod_{i=1}^{r}n_{i \cdot}!\cdot
  \prod_{j=1}^{c}n_{\cdot j}!\right/
   N!
      }{
\prod_{i=1}^{r}\prod_{j=1}^{c}\left(n_{ij}\right)!
}}{ommitted; see pdf}

The numerator is the same for any permissable board so is not
calculated.

If \code{simulate.p.value} is \code{TRUE}, the default value for
\code{B} of 2000 is likely to be low, especially for large tables, or
tables with large entries.  Bear in mind that the Markov chain has high
sequential correlation.

If \code{simulate.p.value} is \code{FALSE}, enumerative techniques are
used.  In this case, the default value for \code{n} (\eqn{10^5}) is also
likely to be low: a p-value of 1 is returned because the first few
boards all have a probability much much smaller than that of the data.
}
\seealso{\code{\link{fisher.test}}, \code{\link{randomprobs}}}
\examples{
data(iqd)

aylmer.test(iqd)

\dontrun{aylmer.test(iqd,simulate.p.value=TRUE)}

data(frogs)
prob(frogs)
prob(frogs,use.brob=TRUE)

}
\keyword{ array }
