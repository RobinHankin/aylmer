\name{randomprobs}
\alias{randomprobs}
\alias{randomboards}
\alias{candidate}
\title{Probabilities of random boards}
\description{
Probabilities of a random Markov chain of boards, chosen by the
Metropolis-Hastings algorithm
}
\usage{
randomprobs(x, B=2000, n=100, burnin = 0,  use.brob=FALSE, func=NULL)
randomboards(x, B=2000, n=100, burnin=0)
candidate(x, n = 100, give = FALSE)
}
\arguments{
  \item{x}{Matrix, coerced to class \code{board}: the start point}
  \item{B}{Number of samples to take}
  \item{burnin}{Number of samples to discard at the beginning}
  \item{use.brob}{Boolean, with default \code{FALSE} meaning to use IEEE
    arithmetic and \code{TRUE} meaning to use Brobdingnagian arithmetic}
  \item{n}{The number of times to try to
    find a candidate board with no non-negative entries; special
    value \eqn{0} means to search until one is found}
  \item{func}{In function \code{randomprobs()}, the statistic to
    return; default of \code{NULL} interpreted as \code{prob()}}
  \item{give}{In function \code{candidate()}, Boolean with default
    \code{FALSE} meaning to return a permissible board, and \code{TRUE}
    meaning to return instead the number of attempts made to find a
    permissible board (zero meaning no board was found).  See details
    section below}
}
\value{

  Function \code{randomprobs()} returns a vector of length \code{B} with
  entries corresponding to the probabilities of the boards encountered.

  Function \code{randomboards()} returns an array with slices being
  successive boards
  
}
\references{
  \itemize{
    \item N. A. Metropolis and others 1953.  \emph{Equation of State
      Calculations by Fast Computing Machines}. Journal of Chemical
    Physics, 21:1087--1092
  }
}
\author{Robin K. S. Hankin (\R); Luke J. West (C++)}
\note{
  Argument \code{n} of function \code{candidate()} specifies how many
  times to search for a board with no non-negative entries.  The special
  value \code{n=0} means to search until one is found.

  Boards with a large number of zeros may require more than the default
  100 attempts to find a permissible board.  Set the \code{give} flag to
  see how many candidates are generated before a permissible one is found.

  \strong{Warning:} a board with at most one entry greater than zero is
  the unique permissible board and the algorithm will not terminate if
  \code{n=0}

  A board that requires more than 100 attempts is probably well-suited
  to the exact test as permissible boards will likely be enumerable
  using \code{allboards()}.

  To find the permissible board that maximizes some objective function,
  use \code{best()}, which applies the bespoke optimization routines of
  \code{optim()}
  
}  
\seealso{\code{\link{aylmer.test}},\code{\link{best}}}
\examples{
data(chess)
aylmer.test(chess)

a <- matrix(1,9,9)    # See Sloane's A110058
plot(randomprobs(a,1000),type="b",main="Importance of burn-in")

set.seed(0)
b <- diag(rep(6,6))
plot(randomprobs(b,B=1000,n=1000), type="b",main="Importance of burn-in, part II")


data(purum)
randomboards(purum,10)

}

\keyword{ array }
