\name{rps}
\alias{rps}
\alias{rock-paper-scissors}
\docType{data}
\title{A matrix showing who wins in rock-paper-scissors (RPS)}
\description{
  A matrix showing the outcome of \acronym{RPS}.  Each row shows the
  winner of a single round of RPS between the non-\code{NA} choices.
}
\usage{data(rps)}
\details{
The venerable game of rock-paper-scissors is the archetypal intransitive
relationship.  Rock beats (smashes) scissors; scissors beat (cut) paper;
paper beats (wraps up) rock.
}
\references{
  \itemize{
    \item \url{http://en.wikipedia.org/wiki/Rock_paper_scissors}
    }
}
\examples{
data(rps)
allboards(rps)  # just two (of course!)

allboards(rps*3)  # four now.
}
\keyword{datasets}
