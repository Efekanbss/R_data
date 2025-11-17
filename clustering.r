employed_pop <- read.csv(
  file = "https://statsandr.com/blog/data/Eurojobs.csv",
  sep = ",",
  dec = ".",
  header = TRUE,
  row.names = 1
)

# kmeans() with 2 groups

model <- kmeans(employed_pop, centers = 2)

model$cluster

employed_pop_cluster <- data.frame(employed_pop,
                                   cluster = as.factor(model$cluster))

head(employed_pop_cluster)

install.packages("factoextra")
library(factoextra)

fviz_cluster(model, employed_pop, ellipse.type = "norm")

#Quality of a k-means partition
# BSS and TSS stand for Between Sum of Squares and Total Sum of Squares
# respectively. The higher the percentage, the better the score 
# (and thus the quality) because it means that BSS is large and/or WSS is small.

BSS <- model$betweenss
TSS <- model$totss
BSS / TSS * 100


# kmeans() with 3 groups

model3 <- kmeans(employed_pop, centers = 3)
fviz_cluster(model3, employed_pop, ellipse.type = "norm")

BSS3 <- model3$betweenss
TSS3 <- model3$totss
BSS3 / TSS3 * 100

# Optimum number of Clusters:

# load required packages
library(factoextra)
install.packages("NbClust")
library(NbClust)

# Elbow method
fviz_nbclust(employed_pop, kmeans, method = "wss") +
  geom_vline(xintercept = 4, linetype = 2) + 
  labs(subtitle = "Elbow method") 

# Silhouette method
fviz_nbclust(employed_pop, kmeans, method = "silhouette") +
  labs(subtitle = "Silhouette method")

# Gap statistic
set.seed(42)
fviz_nbclust(employed_pop, kmeans,
             nstart = 25,
             method = "gap_stat",
             nboot = 500,
             labs(subtitle = "Gap statistic method"))

#######
######## Hierarchical clustering

#hclust() function requires a distance matrix. If your data is not already a distance matrix 
#you can transform it into a distance matrix with the dist() function.


hclust <- hclust(dist(employed_pop), method = "average") #complete 

round(hclust$height, 3)
plot(hclust)
rect.hclust(hclust,
            k = 2, # number of clusters
            border = "blue"
)

# or:
plot(hclust)
rect.hclust(hclust,
            k = 3, # number of clusters
            border = "blue"
)

#barplot(hclust$height,
#        names.arg = (nrow(employed_pop) - 1):1) # show the number of cluster below each bars

clust <- cutree(hclust,
                k = 2)
clust

emp_hclust <- cbind(employed_pop, clust)

emp_hclust
