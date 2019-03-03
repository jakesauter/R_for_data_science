# install.packages("tidyverse")

# we will first use the mpg data set that comes with ggplot2; in order
# to learn more about this data, we can use the following line

?ggplot2::mpg

# now we will produce a plot of mpg vs engine displacement size

ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y=hwy))

# there seems to be a few outliers, so we will identify each point also
# by the categorical vehicle class type it belongs to ; in the following 
# line the first operand creates the empty graph and the following operand
# overlays the points. geom_point allows for these points to be placed with 
# the mapping characteristic set. aes here stands for aesthetic, as we are
# defining aesthetic properties

ggplot(data = mpg) + geom_point(mapping = aes(x=displ, y=hwy, color=class))

# from this new way of vieweing the data, we see that 2 seater sports cars
# get better mileage than we would expect of a vehicle with its engine size
# as sports cars tend to have larger engines in much smaller form factors 
# than they normally reside

# in order to get a better idea of the dimensionality of the data, we can 
# use the following functions

# number of rows in the data
nrow(mpg)

# number of cols in the data
ncol(mpg)

# both number of rows and cols in the data 
dim(mpg)


