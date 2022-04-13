# 선형회귀분석 모델 만들기
# y = wx + b 일차방정식을 작성하는데 이것이 곧 선형회귀모델이다.
# w(기울기:slope), b(절편, bias)는 최소제곱법을 통해 얻을수있다.
# x(독립변수), y(종속변수) : x와 y는 원인과 결과의 관계를 갖는변수이여야한다.

# 부모의 IQ : 110,120,130,140,150
# 자식의 IQ : 100,105,128,115,142

x <- c(110,120,130,140,150)
y <- c(100,105,128,115,142)
cor(x,y) # 0.8660744 양의 상관관계가 매우 강하다. 원인과 결과 관계? 있다라고 하면 선형회귀 분석에 들어간다.
plot(x,y)
# 모델 작성 방법1 : 직접 최소제곱법 수식을 사용
x_dev <- x - mean(x) # 편차
y_dev <- y - mean(y)
dev_mul <- (x - mean(x)) * (y - mean(y))
square <- x_dev ** 2
df <- data.frame(x,y,x_dev,y_dev,dev_mul,square)
df            
mean(df$x) # 130
mean(df$y) # 118
sum(df$dev_mul) # 940 전체 합
sum(df$square) # 1000
# y = wx + b
w = 940 / 1000
w # 기울기 = 0.94
b = 118 - (130 * 0.94) # b=mean(y)-(mean(x)*w)
b # 절편 -4.2

y = 0.94 * x + -4.2 # 선형회귀 모델 수식 완성
y = 0.94 * 110 + -4.2 # 부모 IQ가 110일때 자식은? 99.2
y
print(0.94 * 120 + -4.2) # 부모 IQ가 120일때 자식은? 108.6
print(0.94 * 130 + -4.2) # 부모 IQ가 130일때 자식은? 118
# 내가 알고싶은 값
print(0.94 * 80 + -4.2) # 부모 IQ가 80일때 자식은? 71
print(0.94 * 152 + -4.2) # 부모 IQ가 152일때 자식은? 138.68

# 모델 작성 방법2 : 제공되는 수식을 사용
x <- c(110,120,130,140,150)
y <- c(100,105,128,115,142)

model <- lm(formula = y ~ x) # 내부적으로 최소제곱법을 사용해 w(기울기),b(절편)을 구함
model
predict(model)
abline(model, col ='blue')

predict(model, data.frame(x=c(80,152)))

# 선형회귀
#변수간의 함수관계를 파악하는 방법중 하나로
#독립변수가 종속변수에 미치는 영향을 파악하고
#이를 통해 독립변수의 일정한 값에 대응하는 종속변수 값을
#예측(경향, 추론, 추측)하는 모형산출 알고리즘 이다.
#-----------------------------------------------------------
df2 <- data.frame(workhour = 1:7, totalpay = seq(10000,70000,by=10000))
df2 # 시간당 급여액에 대한 회귀 분석
cor(df2$workhour, df2$totalpay)

plot(totalpay ~ workhour, data = df2, col='red', pch=20)

model2 <- lm(formula = totalpay ~ workhour, data=df2)
model2
predict(model2) # y 값을 예측한다(x값이 모두 참여)

grid()
abline(model2, col='blue',lwd=1)

#미지의 시간당 급여액은?
predict(model2, data.frame(workhour = c(3.2, 8.8, 9)))
