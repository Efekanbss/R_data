install.packages("cluster")
install.packages("GGally")
install.packages("tidyverse")
install.packages("factoextra")
install.packages("dplyr")
install.packages("plotly")
library("cluster")
library("dplyr")
library("factoextra")

mall <- read.csv("Mall_Customers.csv")

# Gereksiz sütunu kaldır
mall <- mall %>% select(-CustomerID)

# Cinsiyeti 0-1 sayısına dönüştürelim (erkek=0, kadın=1)
mall$Gender <- ifelse(mall$Genre == "Female", 1, 0)

# Sayısal matris
X <- mall %>% select(-Genre)

# İsteğe bağlı: Gender'ı da dahil etmek istersen
# X <- mall


X_scaled <- scale(X)



set.seed(42)

# Elbow (WSS)
wss <- sapply(1:10, function(k){
  kmeans(X_scaled, centers=k, nstart=25)$tot.withinss
})
plot(1:10, wss, type="b", pch=19, frame=FALSE,
     xlab="K (küme sayısı)", ylab="Toplam WSS", main="Elbow Method")

# Silhouette
avg_sil <- sapply(2:10, function(k){
  km <- kmeans(X_scaled, centers=k, nstart=25)
  ss <- silhouette(km$cluster, dist(X_scaled))
  mean(ss[, "sil_width"])
})
plot(2:10, avg_sil, type="b", pch=19, frame=FALSE,
     xlab="K", ylab="Ortalama Silhouette", main="Silhouette Method")
which.max(avg_sil) + 1  # önerilen K




set.seed(42)
km <- kmeans(X_scaled, centers=10, nstart=50)

# Küme boyutları
km$size

# Küme merkezleri (ölçeklenmiş)
round(km$centers, 2)

# Orijinal ölçekle özet
mall$cluster <- factor(km$cluster)
mall %>%
  group_by(cluster) %>%
  summarise(across(where(is.numeric), mean, .names="{.col}_mean"))


fviz_cluster(list(data = X_scaled, cluster = km$cluster),
             geom = "point", ellipse.type = "norm",
             main = "Mall Customers - K-means Clustering")

# Silhouette analizi
sil <- silhouette(km$cluster, dist(X_scaled))

fviz_silhouette(sil)





library(plotly)
pca <- prcomp(X_scaled)
pca_df <- as.data.frame(pca$x[,1:3])
pca_df$cluster <- mall$cluster

plot_ly(pca_df, x=~PC1, y=~PC2, z=~PC3,
        color=~cluster, colors="Set1", type="scatter3d", mode="markers")


summary(pca)





set.seed(42)
km10 <- kmeans(X_scaled, centers = 10, nstart = 100)

# Küme boyutları
km10$size



mall$cluster <- factor(km10$cluster)
head(mall)


profile <- mall %>%
  group_by(cluster) %>%
  summarise(
    avg_age = mean(Age),
    avg_income = mean(Annual.Income..k..),
    avg_spending = mean(Spending.Score..1.100.),
    .groups = 'drop'
  ) %>%
  arrange(cluster)

profile

round(km10$centers, 2)
