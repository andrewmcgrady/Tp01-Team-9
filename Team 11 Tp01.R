#Team 11 
#Chapter 12-10

#a).
set.seed(1)

x <- matrix ( rnorm (50 * 3 *20), ncol = 50) #creating a two dimensional matrix with 60 rows, 50 columns and three classes
x[1:20, ] <- x[1:20, ] + 3 #first class is mean shifted by adding three
x[21:40, ] <- x[21:40, ] - 4 #second class is mean shifted by subtracting four
x[41:60, ] <- x[41:60, ] + 7 #third class is mean shifted by adding seven 

#b).
pcr.out <- prcomp(x) #performing PCA on the created x matrix 
plot(pcr.out$x[,1:2], col = 1:3, xlab = 'Z1', ylab = 'Z2', 
     main = 'First Two Principal Component', pch = 19)

#c). 
labels <- c(rep(1, 20), rep(2, 20), rep(3, 20)) #creating arbitrary labels 
km.out <- kmeans(x, 3, nstart = 20) #kmeans clustering with three classes
table(labels, km.out$cluster) #showing a table

#d).
km.out <- kmeans(x, 2, nstart = 20)
table(labels, km.out$cluster)

#e).
km.out <- kmeans(x, 4, nstart = 20)
table(labels, km.out$cluster)

#f).
km.out <- kmeans(pcr.out$x[,1:2], 3, nstart=20)
table(labels, km.out$cluster)

#g).
km.out <- kmeans(scale(x), 3, nstart = 20)
table(labels, km.out$cluster)
#discuss why the labels are not perfect due to a lack of supervision labels are not definition
#look into how k-means clusters 
