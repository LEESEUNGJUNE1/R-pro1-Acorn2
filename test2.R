#R의 자료구조(객체 타입)
# Vector, Matrix, Array, List, DataFrame

#1. Vector : 1차원 배열 형태의 자료구조(동일한 타입만 들어간다.)
year <- 2022
is(year)
year <- "2022"
is(year)
year[1]
is.vector(year)

# Vector 수열
#seq(form, to, by)  seq(start, stop, step)
seq(1,5)
1:5
seq(1,10,2)
seq(1,10,length.out = 4) # 전체 수열의 갯수(알아서 증가)

rep(1:3, 3) # 1,2,3이 3번 반복
rep(seq(1,3), 3)
rep(seq(1,3), each=3)
rep(seq(1,2), each=5, times=2)

c(1,2,5,-3,-10, 10:15)
aa <- c(1:10)
aa

c(22, -5.7, '문자열')
c(1, 2.5, T, F)

age <- c(10, 20, 30)
age
age[1]
age[3]
age[4]
age <- c(age, 40)
age
age[10] <- 50
age
age <- append(age, 60, after = 6)
age
age <- NULL
age

v1 <- c(13, -5, 20:23, 12, -2:3)
v1
v1[1]
v1[1:5] 
v1[c(2,4, 4:7)] # 2번째, 4번째, 4~7까지
v1[-c(2, 3)] # -가 붙으면 여집합이된다.
# v1[1,2] - Error in v1[1, 2] : incorrect number of dimensions
13 %in% v1 # v1에 13이 있느냐? - vector에 포함된 값 유,무 확인
11 %in% v1

nrow(v1) # 건수확인 : 행렬 가능
NROW(v1) # 건수확인 : 행렬+벡터 가능

a <- 1:3
b <- 4:6
a
b
a + b
a * b
a / b
a + 10
a[4] <- 2

union(a,b) # Vector결합 : 합집합, 중복X
c(a, b) # Vector결합 : 합집합, 중복o
setdiff(a,b) # 차집합
b[4] <-2
intersect(a,b) # 교집합

# -------------------------------------------------------------
# Matrix : 2차원 배열, 행렬 구조. 현대 수학에서는 행렬이 대세
a <- 1:8
dim(a) <- c(2,4) # Matrix 생성
a
dim(a) # 구조 확인 (2행 4열)
is(a)
class(a)
mode(a)

m <- matrix(1:5)
m
dim(m)

m <- matrix(1:9, nrow = 3)
m
dim(m)

m <- matrix(1:9, nrow = 3, byrow=T)
m
dim(m)

m <- matrix(1:10, 2)
m

m <- matrix(1:10, 3) # Warning만 떨어지고 error가 되진 않는다.
m

m[1, ]
m[ , 3]
m[2, 3]
m[1,c(2:4)]
m[1:2, c(2:4)]
m[-1,]
m[,-3]
m[-1,-1]

a <- matrix(1:9, nrow=3, ncol=3)
rownames(a) <- c('r1','r2','r3')
colnames(a) <- c('one','two','three')
a
a['r1',]
ncol(a)
nrow(a)
dim(a)

a <- matrix(c(1,2,3,4),2, 2)
a
b <-matrix(5:8, 2)
b

a + b
a * b
a %*% b # 행렬 곱

diag(a) # 주대값 요소 출력
a
t(a) # 전치

x1 <-c(5, 40, 50:52)
x1
x2 <-c(30, 5, 6:8)
x2
rbind(x1, x2) #행묶음, 열묶음
cbind(x1, x2)

# 함수를 실행하는 함수
#apply(), lapply(), sapply(), sapply()
x <- matrix(1:9, 3)
x
apply(x, 1, max) # 1:행 기준
apply(x, 2, max) # 2:열 기준
apply(x, 2, mean)

func <- function(x){
  x + c(5, 10, 15)
}

apply(x, 1, func) # 사용자 정의 함수 실행

head(iris, 2)
apply(iris[, 1:4], 2, mean)

# -----------------------------------------------------------
# array : 다차원 배열 - 행, 열, 면 을 갖는 3차원 자료구조를 취할수있다.
d <- c(1:12)
is(d)
arr1 <- array(d)
arr1
dim(arr1)
is(arr1)

arr2 <- array(1:12, dim=c(6, 2))
arr2
dim(arr2)

arr3 <- array(1:12, dim=c(3, 2, 2)) # 3행, 2열, 2면
arr3
dim(arr3)

# -----------------------------------------------------------
# list : 서로 다른 타입의 데이터 자료구조. (키:값) 형태의 데이터를 담는 연관배열
li <- list("1","이승준",31, "2","조은서",25)
li
unli <- unlist(li)
unli

num <- list(c(1:5), c(6:10), c("a","b","c"))
num
num[1]
typeof(num[1])

num[[1]]
typeof(num[[1]])

num2 <- list(x=1:5, y=6:10)
num2
num2$x
num2$y