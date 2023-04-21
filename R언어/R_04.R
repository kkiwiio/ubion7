library(dplyr)
library(ggplot2)

#극단치
View(mpg)

#극단치 확인(시각화)
boxplot(mpg$cty)

#극단치를 수치로 표현
boxplot(mpg$cty)$stats
#9미만 26초과이면 극단치다!

 mpg = ggplot2::mpg
 
 #이상치는 26초과 이거나 9미만안 경우 
 #이상치를 결측치로 변환
 #결측치의 개수를 확인
 ifelse(mpg$cty > 26 | mpg$cty <6, NA,mpg$cty) ->mpg$cty
 mpg
 
table(is.na(mpg$cty))

#dplyr패키지를 이용하여
#결측치를 제거하고 제조사별(manufacturer)로 그룹화를 한 다음
#도심연비의 평균을 구해보자

mpg<- na.omit(mpg)
mpg %>% group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% arrange(-mean_cty) %>% head(1)

mpg = ggplot2::mpg

#total 파생변수 생성
#total은 (cty + hwy) / 2

#test 파생변수 생성
#total이 30이상이면 'A'
#20이상이고 30미만이면 'B':
#20 미만이면'C'

mpg$total =( mpg$cty + mpg$cty) / 2
ifelse(mpg$total >= 30,'A',ifelse(mpg$total >= 20,'B','c')) -> mpg$test
mpg
qplot(mpg$test)



#midwest 데이터
midwest = ggplot2::midwest
View(midwest)

#컬럼의 이름을 변경
#rename(데이터프레임명, 새 컬럼의 이름 = 변경이 될 컬럼의 이름 )
#popasian 컬럼을 asian, poptotal 컬럼을 total 변경
#ratio 파생변수 생성 -> 전체 인구수 대비 아시아의 인구 수(백분율로)
#group 파생변수 생성 ->
#ratio 평균보다 ratio의 값이 크면 large 아니면 small

rename(midwest, c(asian = "popasian", total = "poptotal")) -> midwest

midwest$ratio = (midwest$asian / midwest$total) * 100
#midwest %>%  mutate(ratio = asian / total = 100) ->midwest

midwest$group = ifelse(mean(midwest$ratio) < midwest$ratio, 'large','small')

qplot(midwest$group)

table(midwest$group)


