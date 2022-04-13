# DataFrame : 데이터베이스의 테이블과 유사한 구조. 열단위로 타입이 다를수있다.

#1) Vector로 data.frame
no <- c(1,2,3)
name <- c('hong', 'lee', 'kim')
#df <- data.frame(no, name)
df <- data.frame(bunho=no, irum=name)
df
typeof(df)
df$bunho
df$irum

df <- data.frame(irum=c('james','oscar','tom'), nai=c(27, 25, 34),
                 row.names = c('one','two','three'))
df
head(df, 2)
tail(df, 2)
nrow(df)
ncol(df)
str(df)
summary(df) # 요약, 통계량
names(df) # 칼럼명

#2) matrix로 data.frame
m <- matrix(c(1,'이승준', 170, 2, '조은서', 189, 3, '난이똥', 50), 3, by=T) #3행 2열
m
mdf <- data.frame(m)
mdf

m <- matrix(1:6, nrow = 3)
mdf <- data.frame(m)
mdf
colnames(mdf) <- c("c1","c2")
mdf

mdf$c1 # vector
mdf['c1'] # list
mdf[1]
mdf[-1]
mdf[1, 2]
mdf[1:2,1:2]
mdf[1:2,c(1,2)]

mdf
mdf[mdf$c1 == 2, ]
subset(mdf, c1 == 2)
? subset

mdf[mdf$c1 == 2 & mdf$c2 == 5, ]
subset(mdf, c1 == 2 & c2 == 5)

mdf[mdf$c1 == 2, c(1,2)]
subset(mdf, c1 == 2, select = c(1, 2))
# subset(mdf, select = c(2)) - 열 선택

mdf
mdf$c2 <- ifelse(mdf$c2 == 4, NA, mdf$c2)
mdf

summary(mdf)

mean(mdf$c2) # NA가 껴있을땐 error 발생
mean(mdf$c2, na.rm=T) #NA 값을 제외하고 평균을 구해

# 행 또는 열 추가
mdf
mdfr <- rbind(mdf, c(10,11)) # 행이 추가되었다.
mdfr
mdfc <- cbind(mdf, c3 = c("a","b","c"), c4 = c("a1","a2","a3")) # 열이 추가되었다.
mdfc

mdfc[, 'c3'] <- NULL
mdfc

mdfr <- mdfr[-1, ]
mdfr

# 기본 데이터 세트 읽기
data('iris', package = 'datasets')
head(iris)
typeof(iris)
is(iris)

# merge : 데이터프레임 병합
height <- data.frame(id=c(1,2,2), h=c(180,175,178))
weight <- data.frame(id=c(1,2,3), w=c(80,75,88))
height
weight
merge(height,weight, by.x="id", by.y="id") # id 를 기준으로 병합

sid <- c(100, 110, 120, 130)
score <- c(90,85,70,65)
gender <- c("M","F","M","F")
major <- c("경영","기계","컴퓨터","사회")
student <- data.frame(sid, score, gender, major)
student

str(student)
plot(student$score)

#조건에 맞는 부분 자료 얻기
subset(student, score >= 70)
subset(student, subset=(score >= 70))
subset(student, score >= 70 & gender == 'M')
subset(student, select=c(sid, gender))
subset(student, select=c(-sid, -gender))
subset(student, select=c(sid, gender), score <= 80)


