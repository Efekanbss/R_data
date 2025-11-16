

  #------------------------ Merhaba Yazılım -------------------------------#

  #----------------------- Hasan Can Demirci ------------------------------#


#Basit data manipülasyonu nedir | c(), [], $, @ düzencelerinin kullanımı | 
#Kolon ismi değiştirme - names(), colnames() fonksiyonları 

library(readxl)

bilgiler <- read_xlsx("ad_cinsiyet_okulnu.xlsx")

class(bilgiler)


ad_soyad_column <-(bilgiler$`Ad-Soyad`) # burada gelen verileri value şeklindedir direkt o colmn içindeki verileri getirir

ad_soyad_column_2 <- bilgiler[1] # burada gelen veriler ise direkt table colmnu ayrı bir dataframe olarak getirir


ad_soyad_column_3 <- bilgiler[1,1:3]
#[row,column]
# ilk rowdaki veriyi(1) ve o rowdan kaç column istediğin [1den 3 e kadar] 

new_data <- bilgiler[1:3,1:3]
new_data2 <- bilgiler[c(1,3),c(1,2,3)]

View(new_data)
View(new_data2)


list_bilgiler <- as.list(bilgiler)
list_bilgiler
#kolon ismi değiştirme
names(bilgiler)[1] <- "Name_surname"

names(bilgiler)[2:3] <- c("b","c")
