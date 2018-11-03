\name{counterstrike}
\alias{counterstrike}
\alias{counterstrike_kills}
\docType{data}
\title{Counterstrike}
\description{
  A \eqn{10\times 10}{10*10} matrix with entry \eqn{[i,j]} meaning the
  number of times player \eqn{i} has killed player \eqn{j}.  \code{NA}
  entries correspond to player and victim being on the same team.

}
\usage{data(counterstrike)}
\details{

The data is taken from an influential match between \dQuote{FaZe Clan}
and \dQuote{Cloud9}, two of the most successful E-sports syndicates of
all time, when they competed at Boston 2018.  More background
information on the dataset and its source is given at
\code{counterstrike.Rd} of the \code{hyper2} package.
}
\examples{
data(counterstrike)
aylmer.test(counterstrike_kills,sim=TRUE,B=100)

}
\keyword{datasets}
