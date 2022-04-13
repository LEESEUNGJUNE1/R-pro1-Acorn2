#기술통계(descriptive statistics)란 수집한 데이터의 특성을 표현하고 요약하는 통계 기법이다.

#기술통계는 샘플(전체 자료일수도 있다)이 있으면,
#그 자료들에 대해  수치적으로 요약정보를 표현하거나, 데이터 시각화를 한다.
#즉, 자료의 특징을 파악하는 관점으로 보면 된다.
#평균, 분산, 표준편차 등이 기술통계에 속한다.

data <- read.csv("testdata/descriptive.csv")
head(data)
dim(data)
summary(data)
data <- na.omit(data) # 결측치(NA)가 있는 행은 삭제. 제거보다는 0 또는 평균 등의 값으로 채워주는 경우도 있다.
summary(data)
dim(data) #139 8

summary(data$cost) # cost (생활비 변수(칼럼)).outliers 발견
data <- subset(data, data$cost>=2 & data$cost<=10)

dim(data) #134 8
summary(data$cost)

length(data$cost)
plot(data$cost) # 시각화
boxplot(data$cost)

sd(data$cost)

table(data$cost)

data$cost2[data$cost >= 1 & data$cost < 4] <- 1
data$cost2[data$cost >= 4 & data$cost <=6] <- 2
data$cost2[data$cost >= 7] <- 3
head(data, 10)
tail(data, 5)
tail(data$cost2)

barplot(table(data$cost2))

attach(data)
#mean(data$cost)
mean(cost)
range(cost)
sort(cost)
sort(cost,decreasing = 'T')
detch(data)
#cost

head(data, 3)
summary(data$resident)
data$resident2[data$resident == 1] <-'특별시'
data$resident2[data$resident >= 2 & data$resident <= 4] <-'광역시'
data$resident2[data$resident == ㅇ] <-'시구군'

x <- table(data$resident2)
x
y <- prop.table(x)
y
round(y * 100, 20)

#위와 같은 자료를 근거로 보소거를 작성할수있다.