# iris dataset으로 선형 회귀 분석 : 상관관계와 회귀모델의 적합성

head(iris, 3)
cor(iris[, 1:4]) #[, 1:4] 모든행의 1열부터 4열까지
cor(iris[, -5]) 

# 연습1 : 상관관계가 약한 변수로 모델 작성
cor(iris$Sepal.Length, iris$Sepal.Width) # 음의 상관관계가 너무 약하다 -0.1175698
model1 <- lm(formula = Sepal.Length ~ Sepal.Width, data=iris)
summary(model1) # p-value: 0.1519 > 0.05 이므로 적합한 모델이 아님 R-squared: 0.01382

# 연습2 : 상관관계가 강한 변수로 모델 작성
cor(iris$Sepal.Length, iris$Petal.Length) # 양의 상관관계가 강하다 0.8717538
plot(iris$Sepal.Length, iris$Petal.Length)

model2 <- lm(formula = Sepal.Length ~ Petal.Length, data=iris)
summary(model2) # p-value: < 2.2e-16 < 0.05 이므로 적합한 모델이다. 의미가 있다. R-squared:0.76

# 회귀분석모형의 적절성을 위한 조건을 충족해야한다.
# ...