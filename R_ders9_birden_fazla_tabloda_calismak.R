
  #------------------------ Merhaba Yazılım -------------------------------#

  #----------------------- Hasan Can Demirci ------------------------------#


#| merge () in R base  
#| Farklı kolonlardan veri almak ve bu kolanları yeni data frame altında toplamak – 
#| (rbind(), cbind(), bind_rows ()) | 
#| R içerisinde oluşturulan data tablosunu export etmek – write.csv() , write_xlsx ()

library(readxl)

## Data import

bilgiler <- read_xlsx("RStudio/ad_cinsiyet_okulnu.xlsx")

hobiler <- read_xlsx("RStudio/hobi_fobi_yemek.xlsx")

# merge işlemi 
colnames(bilgiler)
colnames(hobiler)
merged_file <- merge(bilgiler,hobiler, by.x = "Ad-Soyad", by.y = "Ad-Soyad")
View(merged_file)


#Column birleştirme (cbind)
#$ işareti kullanılırsa o column altındaki veriler alınır
# ama [] kullanılırsa direkt column çekilir column isimleri de görünür

cbind_data <- cbind(bilgiler$Cinsiyet,hobiler$Fobi)
cbind_data2 <- cbind(bilgiler[2],hobiler[3])
#cbind_data2 <- cbind(bilgiler["Cinsiyet"], hobiler]["Fobi"]) şeklinde de direkt çekebiliriz

View(cbind_data)



#row bind (rbind)

rbind_data <- rbind(bilgiler$`Okul Nu`,hobiler$Yemek)
# rbind ile çekilen rowlara isim değiştirme
colnames(rbind_data)[1:5] <- c("Ali","Yahya","Ayşe","Mustafa","Merve")
colnames(rbind_data)


#bind_rows
library(dplyr)
farklı_row <- bind_rows(bilgiler,hobiler)


#write_csv()

write.csv(farklı_row,"farklı_row.csv")



#write_table()

write.table(farklı_row, "RStudio/farklı_row.txt", row.names = F)


#write_xlsx()

library(writexl)

write_xlsx(farklı_row,"/RStudio/farklı_row.xlsx")

