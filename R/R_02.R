#csv파일 로드
df = read.csv("example.csv")
df

#상위 6개 출력
head(df)

#하위 6개 출력
tail(df)

#뷰어창에 데이터프레임 확인
View(df)

#데이터 프레임 크기를 출력하는 함수
dim(df)

#데이터프레임 기초 통계정보 출력
summary(df)

#데이터 프레임 정보를 출력
str(df)

library(dplyr)

#컬러므이 이름 변경
rename(df, '이름' = Name) -> df

df = read.csv('csv_exam.csv')
df

#새로운 파생변수 하나 생성
#전체 점수의 합계(total_score)
#전체 점수의 평균

df$total_socore = df$math + df$english + df$science
df
df$mean_score = df$total_socore / 3
df


test_df = data.frame(matrix(1:4, nrow = 2))
test_df

#평균 점수가 60점 이상이면 pass, 아니면  fail
#res 컬럼을 생성
#ifelse(조건신, 참인경우 값, 거짓인 경우 값)
df$res = ifelse(df$mean_score >= 60, 'pass','fail')
df

#1학년 중에 평균 점수가 가장 높은 사람의 정보를 출력
df2 = df[df$class == 1,]
df2[order(-df2$mean_score),]


#dplyr 패키지를 사용
df = read.csv('csv_exam.csv')
df

#filter
df %>%  filter(class == 1)


# 오름차순 정렬
df %>%  arrange(math)
# 내림차순 정렬
df %>%  arrange(-math)

#정렬의 기준이 여러개인 경우
df %>%  arrange(math, english)

#class를 기준으로 내림차순 정렬, math 를 기준으로 는 오름차순
df %>% arrange(-class,math)


#특정 컬럼만 출력
df %>%  select(math)

df %>%  arrange(desc(class)) %>% select(math,english)

#특정 컬럼만 삭제
df %>% select(-id)

#파생변수 생성
df %>%  mutate(total_score = math  + english + science, mean_score = (math  + english + science)/3 ) -> df


df %>%  filter(class == 1) %>%  arrange(desc(mean_score)) %>% head(1)

df %>%  group_by(class) %>% 
  summarise(mean_math = mean(math),
            mean_english = mean(english)) %>%  
  arrange(-mean_math) %>% 
  head(1)

#join 
df1 = data.frame(id = 1:5,
                 score = c(80,70,40,60,50))
df2 = data.frame(id = 1:5,
                 weight = c(80,65,70,55,90))
df3 = data.frame(id = 1:3,
                 class = c(1,1,2))
inner_join(df1, df2, by = 'id')


