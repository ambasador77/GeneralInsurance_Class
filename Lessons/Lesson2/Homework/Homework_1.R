# Find out, which __year__ was the __most terrific__ for portfolio you have identified as __most profitable__ during the lesson and 
# show it on the chart using `ggplot2` package. Write an explanation about your findings into the code as comment.
# __Commit__ it to your repository into `Lessons/Lesson2/Homework`.

## Code
# nacitame balicky
library(dplyr)
library(ggplot2)

# nacitanie dat
setwd("C:/Users/Zuzana Jankechová/Documents/GeneralInsurance_Class/Data")
dt_KPI <- read.csv("lesson2_KPI.csv")

# zaporne premium nahradime nulou
dt_KPI %>% mutate(Premium = ifelse(Premium < 0, 0, Premium))

dt_KPI %>% group_by(Unit) %>% mutate(Profit=Premium-Expenses-Losses) %>% 
        summarize(Profit = sum(Profit, na.rm = TRUE)) %>% arrange(desc(Profit))

dt_KPI %>% filter(Unit == "Unit7")  %>% mutate(Profit=Premium-Expenses-Losses) %>% group_by(Year) %>% 
        summarize(Profit=sum(Profit, na.rm = TRUE)) %>% arrange(Profit)

# vykreslenie grafu
dt_KPI %>% filter(Unit == "Unit7")  %>% mutate(Profit=Premium-Expenses-Losses) %>% group_by(Year) %>%
        summarize(Profit=sum(Profit, na.rm = TRUE)) %>% ggplot(aes(x = Year, y = Profit)) + geom_col()

# 




# Your Explanation about analysis:
# nacitali sme si balicky a data
# ocistili sme si data od zaporneho poistneho (Premium)
# zgrupili sme data podla Unit, vytvorili sme novu premennu Profit a pre každú unit sme vyrátali Profit=Premium-Expenses-Losses
# kedze nas zaujima najlepsie portfolio, zoradili sme profity od najlepsieho
# zistili sme ze najlepsie je portfolio Unit 7, preto sme si tieto data odfiltrovali a teraz sme ich zoradili podla rokov
# ako najlepsi rok vysiel 2013, najhorsi rok vysiel 2014
# pre najlepsie portfolio (Unit 7) sme spravili ggplot vsetkych rokov a vidime ze najlepsi je rok 2013 a najhorsi je rok 2014 
# 

