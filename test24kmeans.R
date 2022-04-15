# 비계층적(분할적) 분석 - K-means
# 계층적 군집분석에 비해 큰 dataset에 효과적이며,
# 관측치가 군집에 영구히 할당되는것이
# 최정결과를 개선시키는 방향으로 군집이 형성됨

data <- read.csv("testdata/exam.csv", sep=' ', header = T)
head(data, 3)

d_data <- dist(data, method = 'euclidean')
d_data

gra_data <- cmdscale(d_data)
gra_data
plot(gra_data, type="n")
text(gra_data)

data$avg <- apply(data[, 2:5],1,mean)
head(data, 3)

# K-Means : K 갯수?
# 계층적 군집분석으로 K 갯수를 얻을수있다. 또는 팔꿈치기법:nbClust를 사용할수도 있다.
install.packages("NbClust")
library(NbClust)
?scale
data_s <- scale(data[2:5]) # '군집화' 할때는 '정규화' 또는 '표준화'를 선행한다.
head(data, 3)
head(data_s, 3)

# best 군집수 얻기
nc <- NbClust::NbClust(data_s, min.nc = 2, max.nc = 5, method = 'kmeans')
nc
plot(table(nc$Best.nc[1,]))

model <- kmeans(data[, c("bun","avg")], 4)
model

table(model$cluster)

cluster <- model$cluster
cluster

kmeans_df <- cbind(cluster,data[, c("bun","avg")])
kmeans_df
