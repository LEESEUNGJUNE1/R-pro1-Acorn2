# 단순선형회귀 모델 연습 - 독립변수:종속변수가 각 1개
head(women,3) # 키로 몸무게를 예측

cor(women$weight, women$height) # 0.9954948 양의상관관계가 강하다.
plot(weight~height, data=women)

mfit <- lm(weight ~ height,data=women)
mfit
abline(mfit, col = 'red')
# y = 3.45 * x + -87.52 라는 수식이 완성

print(3.45 * 58 + -87.52) #112.58
predict(mfit, data.frame(height=c(58))) # 112.5833

summary(mfit) # mfit의 요약통계량 구하기, mfit 정보

cor.test(women$weight, women$height) # 상관계수 분석

#회귀분석모형의 적절성을 위한 조건 : 아래의 조건 위배 시에는 변수 제거나 조정을 신중히 고려해야 함.
#1) 정규성 : 독립변수들의 잔차항이 정규분포를 따라야 한다.
#2) 독립성 : 독립변수들 간의 값이 서로 관련성이 없어야 한다.
#3) 선형성 : 독립변수의 변화에 따라 종속변수도 변화하나 일정한 패턴을 가지면 좋지 않다.
#4) 등분산성 : 독립변수들의 오차(잔차)의 분산은 일정해야 한다. 특정한 패턴 없이 고르게 분포되어야 한다.
#5) 다중공선성 : 독립변수들 간에 강한 상관관계로 인한 문제가 발생하지 않아야 한다.

# 그래프로 확인
plot(mfit)
par(mfrow=c(2,2))
plot(mfit)

# 위의 그래프를 통해 선형성을 만족하지 못함
# 이런 경우 비선형 회귀 모델을 작성(polynomial Regression) : 다항회귀
mfit2 <- lm(weight ~ height + I(height ^ 2), data = women)
summary(mfit2) # R-squared:  0.9995

predict(mfit2, data.frame(height = c(59, 58, 44, 63)))
# 117.47311 115.10294  99.36403 128.61506 