# install.packages("tidyverse")

library(tidyverse)

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

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))

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

# ggplot can also use size as an aesthetic, though it isnt
# generally regarded as useful for unordered variables

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, size = class))

# ggplot can also use shape to differentiate data types, though
# will only use 6 differenct shapes by default

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, shape=class))


# one other distinction that can be made is the transparency
# of the data point which can be set with the alpha parameter

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# another useful feature of ggplot to help convey insight 
# about the data is facets. Facets can be used to seperate
# the data into distinct subsets and produce the geom_point
# data for each distinct class

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_wrap(~class, nrow=2)
    
# facet_wrap() will facet the data on the basis of one variable
# though we can also facet the data with two variables in a 
# grid like pattern using facet_grid()

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(drv ~ cyl) 

# interestingly if you would like to facet by a grid but
# only in one variable, the other variable can be replaced
# by a (.). A (.) in the first positon means hold off on 
# faceting by row and a (.) in the second position means
# hold off faceting by column

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_grid(. ~ cyl)
    
# this seems to have the same effect as facet_grid(~cyl)

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_wrap(~year)


# in the following graph we can see that this method can also
# be a tool to see how many data points we have in a subset
# of the data, such as how many vehicles we have that have 
# various combinations of drive types and cylinder counts

ggplot(data = mpg) + 
+     geom_point(mapping = aes(x = drv, y = cyl)) + 
+     facet_grid(drv ~ cyl)

# other geoms can also be used and might describe the data
# better. We can use bar geoms, line geoms, boxplot geoms, 
# point geoms or smooth geoms (more may be available); here
# we will demonstrate a smooth geom vs its scatter plot made
# with point geom

ggplot(data = mpg) + 
     geom_point(mapping = aes(x = displ, y = hwy)) 

ggplot(data = mpg) + 
     geom_smooth(mapping = aes(x = displ, y = hwy)) 

# Every geom function in ggplot2 takes a mapping argument. 
# However, not every aesthetic works with every geom. 

# to display multiple geoms in the same graph we can just
# add them as usual 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
  

# because ggplot is smart, we can also use this
# syntax as to not repeat code

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()


# then if we want specific aesthetic mappings for specific
# geoms, we can still add them as usual 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()


# in R we can get subsets of the data very easily with
# the filter function

filter(mpg, class == "subcompact")

# and this function can be used to apply different geoms
# to specific classes of data in our plots

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
  
  
# some examples from the exercises

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point() + 
    geom_smooth(mapping = aes(group = drv), se=F)


ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) + 
    geom_point() + 
    geom_smooth(se=F)
    

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point(mapping = aes(color=drv)) + 
    geom_smooth(mapping = aes(linetype = drv), se=F)


##########################################
# Statistical Transformations
##########################################

# We will be using the ggplot2:diamonds data set

?ggplot2::diamonds

# Bar Chart

ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut))

# notice that count (the y axis) is not a variable in 
# the graph, but rather was a statistic calculated from
# the data set


# bar charts, histograms, and frequency polygons bin your data 
# and then plot bin counts, the number of points that fall in 
# each bin.

# smoothers fit a model to your data and then plot predictions 
# from the model.

# boxplots compute a robust summary of the distribution and 
# then display a specially formatted box.


# interestingly, geom_bar is the has the same effect as 
# stat_count in the ggplot2 library ; this works because 
# ever stat_??? function in ggplot2 has a default 
# geom_??? function 

ggplot(data = diamonds) + 
    stat_count(mapping = aes(x = cut))















