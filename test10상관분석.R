#친밀도, 적절성, 만족도 변수로 상관분석
result <- read.csv("testdata/drinking_water.csv", fileEncoding = "UTF-8")
head(result)
summary(result)

#공분산
cov(result$친밀도, result$적절성)
cov(result)

#상관계수
?cor
cor(result$친밀도, result$적절성, method="pearson") # 수치형
cor(result) #겹칠땐 1

cor(result$친밀도 + result$적절성, result$만족도)

#시각화
symnum(cor(result))

install.packages("corrgram")
library(corrgram)
corrgram(result)
corrgram(result, upper.panel = panel.conf)
corrgram(result, lower.panel = panel.conf)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

chart.Correlation(result, histogram = , pch = '+')

#--------------------------------------------------------------
cor(result, method = 'spearman')
cor(result, method = 'kendall')
