# 내장함수와 사용자 정의 함수
# 주요 내장 함수
seq(0, 5, by=1.5)
set.seed(123) # 난수값을 고정
rnorm(10, mean = 0, sd = 1) #정규분포를 따르는 난수(난수의 갯수 지정, 평균, 표준편차)
hist(rnorm(10000, mean = 0, sd = 1))

set.seed(1)
runif(10, min=0, max=100) # 균등분포를 따르는 난수
hist(runif(50000, min=0, max=100))

sample(0:100, 10)

vec <- 1:10
min(vec) #최소
max(vec) #최대
mean(vec) #평균
median(vec) #중간값
var(vec) #분산

sum((vec-mean(vec)) ** 2) / (length(vec)-1)
sd(vec) #표준편차

sqrt(sum((vec-mean(vec)) ** 2) / (length(vec)-1))
sd(vec) / mean(vec) #변동계수

prod(vec)
factorial(10)

table(vec) #빈도수
abs(-3) #절대값

getwd() #내장함수

mean(iris$Sepal.Length)
sd(iris$Sepal.Length)

# ...

# 사용자 정의 함수
func1 <- function(){
  print("사용자 정의 함수")
}

func1()

#매개변수 만들기
func2 <- function(arg1){
  print(arg1)
  return(arg1 + 100)
}

func2(10)

# 윤년체크
yun_func <- function(y){
  if(y %% 4 == 0 & y %% 100 != 0 | y %% 400 == 0){
    paste(y, '년은 윤년')
  }else{
    paste(y, '년은 평년')
  }
}
yun_func(2022)
yun_func(2020)

