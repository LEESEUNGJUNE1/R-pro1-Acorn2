# 데이터 입.출력
n <- scan() # 키보드로 자료 입력
sum(1:n)

ss <- scan(what = "") # 문자열 입력
ss

df <- data.frame()
df <- edit(df)
df

# 파 일 읽 기
student <- read.table("testdata/student.txt")
student
is(student)

student2 <- read.table("testdata/student2.txt", sep = ";", header=TRUE, skip = 2)
student2

student3 <- read.table("testdata/student3.txt", sep = " ", header=TRUE, na.strings = '-')
student3

student4 <- read.table("testdata/student4.txt", sep = ",", header=TRUE, na.strings = '-')
student4

student5 <- read.csv("testdata/student4.txt", header=TRUE, na.strings = '-')
student5

install.packages("xlsx")
library(xlsx)
student6 <- read.xlsx(file="testdata/student.xlsx", sheetIndex = 1, encoding='UTF-8')
student6

#-------------------------------------------------------------
# 데이터 출력
x <- 10; y <- 20; z <- x*y
cat("결과는 ", z, '입니다')
print("결과는 ", z, '입니다')
print(z)

cat(x,y,z) # x,y,z 모두 출력
print(x,y,z) # 하나만 출력

# 파일로 출력
name <- c("동탁","여포","초선")
age <- c(35, 33, 25)
gender <- c("남","남","여")
myframe <- data.frame(name, age, gender)
myframe

write.table(myframe,"output/my1.txt", fileEncoding = "UTF-8")
write.table(myframe,"output/my2.txt", row.names = TRUE, fileEncoding = "UTF-8")
write.table(myframe,"output/my3.txt", row.names = FALSE, fileEncoding = "UTF-8")
write.table(myframe,"output/my4.txt", row.names = FALSE, quote = F, fileEncoding = "UTF-8")

write.csv(myframe,"output/my5.csv", qoute = F, row.names = FALSE, fileEncoding = "UTF-8")

write.xlsx(myframe,"output/my6.xlsx", sheetName = 'sheet1')

#-------------------------------------------------------------
# 도수분포표
df <- read.csv("testdata/ex_studentlist.csv")
df
str(df)
summary(df)

# 명목형 자료로 도수분포표 : gender, bloodtype
#freq <- table(df$gender, df$bloodtype)
freq <- table(df$bloodtype)
freq

rfreq <- prop.table(freq) # 상대(비율)도수구하기
rfreq

rtable <- rbind(freq,rfreq)
rtable

rtable <- addmargins(rtable, margin = 1) # 1=열의 합, 2=행의 합, 안주면 행,열 모두 합
rtable

