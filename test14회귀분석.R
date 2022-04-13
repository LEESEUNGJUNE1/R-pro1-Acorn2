# cars dataset으로 단순회귀 분석 :
head(cars, 3)
dim(cars) # 50:2 = 자동차의 속도:제동거리. 속도로 인한 제동거리 예측 모델 작성

cor(cars$speed, cars$dist) # 0.8068949
plot(cars$speed, cars$dist)
m <- lm(formula = dist ~ speed, data = cars)
names(m)
coef(m) # -17.579095    3.932409  회기계수값을 볼수잇다.

summary(m) # p-value: 1.49e-12 < 0.05 유의한 모델. R-squared:  0.6511
summary(m)$r.squared # R-squared 값만 보기
anova(m)
confint(m) # 신뢰구간