# 제어문
# 조건판단문 if
x <- 10; y <- 5

if(x + y >= 10){
  cat("결과는", x + y)
  cat("\n참일때 수행")
}else if(x + y >= 5){
  cat("결과는", x + y)
}else{
  print("거짓일때 수행")
}
# 삼항 연산자
ifelse(x>=5, '참','거짓')

install.packages("ggplot2")
library(ggplot2)

utills::head(mpg, 2)
typeof(mpg)
is(mpg)
mpg <- as.data.frame(ggplot2::mpg) #가독성을 위해 출처를 작성해주면 좋다.
head(mpg, 2)
? mpg
summary(mpg)
str(mpg)

# 통합연비 칼럼 추가
mpg$total <- (mpg$cty + mpg$hwy) / 2 #mpg["total"]
head(mpg, 2)

if(mean(mpg$total) >= 20){
  print("우수 연비")
}else{
  print("보통 연비")
}

summary(mpg$total) # 요약만 보고싶다면
hist(mpg$total) # 히스토그램을 보고싶다면 - 정규분포:가운데를 중심으로 좌우대칭

# 중첩 if
mpg$grade <- ifelse(mpg$total >= 25, 'A',ifelse(mpg$total >= 15, 'B','c'))
head(mpg,10)

# 조건판단문 switch
#switch(비교구문, 실행1, 실행2...)
switch("age", id="hong", age=33, name="홍길동")

a <- 1 # a가 순서를 의미한다.
switch(a, mean(1:10), max(1:10))

# 조건판단문 which : Vector를 대상으로 특정 데이터를 검색
name <- c("kor","eng","mat","kor")
name
which(name=="kor") # kor이 어디있는지 알려준다.
which(name=="kr") # 없으면 0이 나온다.

#----------------------------------------------------------------
# 반복문 for, while, repeat
# 반복문 for
i <- 1:10
for(n in i){
  print(n)
}

for(su in 1:9){
  res = 2 * su
  cat(2, '*', su, '=', res, '\n')
}

# 반복문 while
i <- 0
while(i < 10){
  i = i + 1
  print(i)
}

i <- 0
while(TRUE){
  i = i + 1
  print(i)
  if (i==3) break
}

# 반복문 repeat (Java의 DO while 문)
cnt <- 1
repeat{
  print(cnt)
  cnt = cnt + 2
  if(cnt > 10) break
}

