% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapper_new.R
\name{mapper_new}
\alias{mapper_new}
\title{mapper_new function}
\usage{
mapper_new(X, filter_values, num_intervals, percent_overlap,
  num_bins_when_clustering, ...)
}
\arguments{
\item{X}{Either a data matrix or an object of type 'dist'.}

\item{filter_values}{An n x m matrix or n-length vector real numbers.}

\item{num_intervals}{Either a positive integer or a vector of m positive integers specifying the number of intervals to cover the filter values with.}

\item{percent_overlap}{Either a number or m-length vector of values between 0 and 100 specifying how much adjacent intervals should overlap.}

\item{num_bins_when_clustering}{A positive integer that controls whether points in the same level set end up in the same cluster.}
}
\value{
An object of class \code{TDAmapper} which is a list of items named \code{adjacency} (adjacency matrix for the edges), \code{num_vertices} (integer number of vertices), \code{level_of_vertex} (vector with \code{level_of_vertex[i]} = index of the level set for vertex i), \code{points_in_vertex} (list with \code{points_in_vertex[[i]]} = vector of indices of points in vertex i), \code{points_in_level} (list with \code{points_in_level[[i]]} = vector of indices of points in level set i, and \code{vertices_in_level} (list with \code{vertices_in_level[[i]]} = vector of indices of vertices in level set i.
}
\description{
This function uses a filter function f: X -> R on a data set X that has n rows (observations) and k columns (variables).
}
\examples{
m1 <- mapper_new(
       dist_object = dist(data.frame( x=2*cos(0.5*(1:100)), y=sin(1:100) )),
       filter_values = 2*cos(0.5*(1:100)),
       num_intervals = 10,
       percent_overlap = 50,
       num_bins_when_clustering = 10)
\dontrun{
#install.packages("igraph") 
library(igraph)
g1 <- graph.adjacency(m1$adjacency, mode="undirected")
plot(g1, layout = layout.auto(g1) )
}
}
\references{
\url{https://github.com/paultpearson/TDAmapper}
}
\author{
Paul Pearson, \email{pearsonp@hope.edu}, Matt Piekenbrock, \email{piekenbrock.5@wright.edu}
}
