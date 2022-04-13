va <- 1
va <- 2
va = 3
4 -> va
cat('결과는',va)
print(va)
a<-2
b<-3

# 데이터 유형
kbs<-9 # Scalar는 지원 X, 기본 Vector
object.size(kbs)
typeof(kbs)
typeof(3)
typeof(3.14)
is(kbs) # 데이터 유형 출력
mbc <- as.integer(kbs) # 형 변환
is(kbs)
typeof(kbs)
mbc<-9L
is(mbc)


ss <- '홍길동'
typeof(ss)
is(ss)
ss[0]

b <- TRUE
is(b)
b <- T # Overriding

# Vector가 기본값:character, logical, numeric(integer)

typeof(NA)
aa <- NA # 결측데이터(값이 입력되지 않은 상태)
aa
is(aa)

sum(2,3)
sum(2,3,NA) # 결측값(NA)이 있으면 전체가 NA 된다.
sum(2,3,NA, na.rm = T)

typeof(NULL) # 데이터값이 없음. 값으로 인식되지 않는다.
sum(2,3,NULL)

typeof(NaN) # 수학적으로 정의되어있지 않지만 값으로 인식된다.
sum(2,3,NaN)

typeof(Inf) # 무한대
0 / 0
0 * Inf
Inf - Inf

length(NA)
length(NaN)
length(NULL)

z <- 5.3 -3i # 복소수
z
is(z)

f <- function(){
  return('good')
}
f()
is(f)
typeof(f)

#x <- 123.4
x <- "123" # character
x <- FALSE # logical
cat(mode(x), class(x), typeof(x)) # 성격, 자료구조, 자료형

ls() # 현재 사용중인 객체의 목록을 확인할수가 있다.
ls.str() # 자세히
rm(aa) # 지우다.
rm(list=ls()) # 사용중인 모든 객체 삭제
gc() # 사용이 종료된 객체의 메모리를 해제

# ---------------------------------------------------------
# package : 데이터 + 함수 + 알고리즘 꾸러미
available.packages()
dim(available.packages())

install.packages("plyr")
library(plyr)
ls("package:plyr")
data(package="plyr")
baseball

remove.packages("plyr")

# 기본 dataset : 연습용 dataset이 제공
data()

Nile
head(Nile) #  앞에 6개
tail(Nile, 3)

hist (Nile, freq = F)
lines(density(Nile))# 밀도

help("hist")
? hist

? mean
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

getwd()

head(iris, 3)

# mnist - 이미지 분류