hesap_makinesi <- function(){
  
  x <- as.numeric(readline("Bir Sayı giriniz: "))
  y <- as.numeric(readline("Bir sayı daha giriniz: "))
  
  istenilen_islem <- readline("Yapmak istediğiniz işlemi giriniz: ")
  
  
  if( istenilen_islem == "Toplama"){
    print(x+y)
  }
  else if (istenilen_islem == "Çarpma"){
    print(x*y)
  }
  else if (istenilen_islem == "Çıkartma "){
    if(x>y){
      print(x-y)
    }
    else{
      print(y-x)
    }
  }
  else if(istenilen_islem == "Bölme"){
    if(x>y){
      print(x/y)
    }
    else{
      print(y/x)
    }
  }
  else{
    print("Geçersiz işlem")
  }
  
}

hesap_makinesi()

