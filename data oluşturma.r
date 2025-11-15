
#data oluşturma save etme 
setwd("Desktop/RStudio")
library(readxl) # her ayrı scripte kütüphaneler tekrar yüklenmeki çalıştırılmalı 
dog <- read_xlsx("dog.xlsx")

View(dog)
