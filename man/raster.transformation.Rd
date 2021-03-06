% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/raster.transformations.R
\name{raster.transformation}
\alias{raster.transformation}
\title{Statistical transformation for rasters}
\usage{
raster.transformation(x, trans = "norm", smin = 0, smax = 255)
}
\arguments{
\item{x}{raster class object}

\item{trans}{Transformation method: "norm", "rstd", "std", "stretch", "nl", "slog", "sr" (please see notes)}

\item{smin}{Minimum value for stretch}

\item{smax}{Maxmum value for stretch}
}
\value{
raster class object of transformation
}
\description{
Transforms raster to a specified stastical transformation
}
\note{
("norm") Normalization [0-1]: if min(x) < 0 ( x - min(x) ) / ( max(x) - min(x) )
 ("rstd") Row standardize [0-1]: if min(x) >= 0 x / max(x) This normalizes data with negative distributions
 ("std") Standardize: (x - mean(x)) / sdv(x)
 ("stretch") Stretch: ((x - min(x)) * max.stretch / (max(x) - min(x)) + min.stretch) This will stretch values to the specified minimum and maximum values (eg., 0-255 for 8-bit)
 ("nl") Natural logarithms: if min(x) > 0 log(x)
 ("slog") Signed log 10 (for skewed data): if min(x) >= 0 ifelse(abs(x) <= 1, 0, sign(x)*log10(abs(x))) 
 ("sr") Square-root: if min(x) >= 0 sqrt(x)
}
\examples{
  library(raster)
  r <- raster(nrows=100, ncols=100, xmn=571823, xmx=616763, 
              ymn=4423540, ymx=4453690)
    r[] <- runif(ncell(r), 1000, 2500)

 # Postive values so, can apply any transformation    
for( i in c("norm", "rstd", "std", "stretch", "nl", "slog", "sr")) {
  print( raster.transformation(r, trans = i) ) 
   }

 # Negative values so, can't transform using "nl", "slog" or "sr"
r[] <- runif(ncell(r), -1, 1)
   for( i in c("norm", "rstd", "std", "stretch", "nl", "slog", "sr")) {
  try( print( raster.transformation(r, trans = i) ) ) 
   }

}
\author{
Jeffrey S. Evans  <jeffrey_evans@tnc.org>
}
