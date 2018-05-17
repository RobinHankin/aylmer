\name{best}
\alias{best}
\title{Optimize a board using simulated annealing}
\description{
Uses simulated annealing to find the `best' permissible board, using any
objective function
}
\usage{
best(x, func = NULL, n = 100, ...)
}
\arguments{
  \item{x}{A board}
  \item{func}{The objective function, with default \code{NULL} meaning
    to use \code{-prob(x)}}
  \item{n}{Maximum number of attempts (passed to \code{candidate()})}
  \item{\dots}{Further arguments passed to \code{optim()}}
}
\details{
  The help page for \code{optim()} gives an example of simulated
  annealing being used to solve the travelling salesman problem and
  \code{best()} uses the same technique in which the \code{gr} argument
  specifies a function used to generate a new candidate point
  (\code{candidate()}).
  }
\author{Robin K. S. Hankin}
\note{
  
  Function \code{randomprobs()} also takes a \code{func} argument and
  can be used to find an optimal board, by generating random permissible
  boards and finding the best one.  But these two functions are very
  different: \code{best()} uses \code{optim()} which incorporates highly
  specific optimization algorithms to find a global maximum, while
  \code{randomprobs()} creates a Markov chain and reports the board with
  the most desirable objective function.
  
}
\seealso{\code{\link{optim}},\code{\link{prob}}}
\examples{
 a <- matrix(0,5,5)
 diag(a) <- NA
 a[cbind(1:5 , c(2:5,1))] <- 4
\dontrun{
 best(a,control=list(maxit=10))   ## Answer should be all ones except the diagonal
}

# Now a non-default function; SANN should be able to get func(x) down to
#  zero pretty quickly:
\dontrun{
 best(a,func=function(x){x[1,2]},control=list(maxit=100))
}
# The 'dontrun' is needed because sometimes the method needs a bigger n

}
