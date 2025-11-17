# veri import 




data2 <- read.csv("Global_AI_Content_Impact_Dataset.csv")


#analiz kolonları seçimi

test_data <- data2[c(1,3,9)]


#1. analiz: ülkelerde en çok hangi alanda yapay zeka var

library(dplyr)

data_analiz_1 <- data2%>%
  group_by(Industry)%>%
  summarize(count = n())

# 2. analiz : en çok hangi yapay zeka modeli kullanılıyor

data_analiz_2 <- data2 %>%
  group_by(data2$Top.AI.Tools.Used) %>%
  summarize( count = n())



#3 veri görselleştirme : en çok kullanılan yapay zeka alanlarına göre görselleştir



library(ggplot2)


data_analiz_3 <- test_data[c(2,3)]

data_analiz_3$Count <- ifelse(data_analiz_3$Top.AI.Tools.Used == "ChatGPT",31,"")
data_analiz_3$Count <- ifelse(data_analiz_3$Top.AI.Tools.Used == "Midjourney",37,"")
data_analiz_3$Count <- ifelse(data_analiz_3$Top.AI.Tools.Used == "Claude",31,"")
data_analiz_3$Count <- ifelse(data_analiz_3$Top.AI.Tools.Used == "Stable Diffusion",27,"")
data_analiz_3$Count <- ifelse(data_analiz_3$Top.AI.Tools.Used == "DALL-E",26,"")
data_analiz_3$Count <- ifelse(data_analiz_3$Top.AI.Tools.Used == "Bard",24,"")
data_analiz_3$Count <- ifelse(data_analiz_3$Top.AI.Tools.Used == "Synthesia",24,"")


data_analiz_3$Count <- recode(data_analiz_3$Top.AI.Tools.Used,
                        "ChatGPT" = 31,
                        "Bard" = 24,
                        "Claude" = 31,
                        "DALL-E" = 26,
                        "Midjourney" = 37,
                        "Stable Diffusion" =27,
                        "Synthesia" = 24)



ggplot(data_analiz_3, aes(x = Top.AI.Tools.Used, y = Count),group_by = Industry)+
  geom_bar(stat = "identity", position = "stack", aes(fill = Industry))



       