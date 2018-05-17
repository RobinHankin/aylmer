\name{gear}
\alias{gear}
\docType{data}
\title{Dataset of subjective judgement of gear teeth}
\description{
A gear (cog wheel) with seven teeth is taken out of service and 
teeth examined for wear.  Only adjacent pairs of teeth may be compared,
but any given pair may be compared by a number of people, each of whom
indicates which tooth they believe to be more worn.

The dataset is of the form of a seven-by-seven matrix, one column for
each tooth.  Each row consists of precisely two non-\code{NA} entries,
say in columns A and B.  The entries indicate the number of times an
observer \dQuote{prefers} (that is, judges to be more worn) tooth A and
tooth B.

The board has a single degree of freedom.
}
\details{

  The null hypothesis is that there exist
\eqn{p_1,\ldots,p_7}{p_1,...,p_ 7} with \eqn{\sum p_i=1}{sum(p_i)=1}
such that the probability of preferring tooth \eqn{i} to tooth \eqn{j}
is \eqn{p_i/(p_i+p_j)}.  Alternative hypotheses might be that the
comparison has some sort of handedness in the sense that the clockwise
tooth might be preferred more frequently than might be expected by
chance.

  }
\usage{data(gear)}
\source{
  Data kindly supplied by A. G. S. Hankin
}
\examples{
data(gear)
is.1dof(gear)
aylmer.test(gear)
aylmer.test(gear,alternative="less")
}
\keyword{datasets}
