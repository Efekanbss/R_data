dog<- read_xlsx("dog.xlsx")
#direkt dog dataframe i
class(dog) # dog table ının data türü = dataframe

class(dog$`Canis lupus`)

#dog içindeki dataframeler,n yani columnların listesi

dog_list <- as.list(dog)



dog_matrix <- as.matrix(dog)



#yeni dataframe oluşturma

x <- 1:5 #numeric
class(x)

y <- c("a","b","c","d","e") #string=character
class(y)

new_data <- data.frame(x,y) #dataframe

class(new_data)


#dataframe içersine birden farklı tipte veri alabilir
#ama matrixte tek bir tipte data olmalı yoksa eksik veri verir ya da error verir 

