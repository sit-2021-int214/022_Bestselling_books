```{R}
bs <- read_csv("https://raw.githubusercontent.com/sit-2021-int214/022_Bestselling_books/main/Group_mid/bestsellers_with_categories.csv")
```
## วิเคราะห์ประเภทหนังสือที่ผู้คนนิยมอ่าน
  ### 1.หนังสือประเภทใดถูกจัดอยู่ใน Best Seller มากกว่ากัน (อัตราส่วนร้อยละ)
```{R}
BookCount <- count(bs$Fiction == 'Non Fiction') + count(bs$Fiction == 'Fiction')

FictionBestSeller <- count(bs$Fiction == 'Fiction') / BookCount * 100
NonFictionBestSeller <- count(bs$Fiction == 'Non Fiction') / BookCount * 100

FictionBestSeller
NonFictionBestSeller
```
Result
```{R}
FictionBestSeller = 45.98338% (หนังสือประเภท Fiction)
NonFictionBestSeller = 54.01662% (หนังสือประเภท Non Fiction)
```

### 2.ค่าเฉลี่ยเรตติ้งของหนังสือประเภทประเภทไหนดีกว่ากัน
```{R}
FicAvgRate <- bs %>% filter(Fiction == "Fiction") %>% summarise(FictionRating = mean(Rating))
NonFicAvgRate <- bs %>% filter(Fiction == "Non Fiction") %>% summarise(NonFictionRating = mean(Rating)) 

FicAvgRate
NonFicAvgRate
```

Result
```{R}
FictionRating = 4.612651 (หนังสือประเภท Fiction)
NonFictionRating = 4.605128 (หนังสือประเภท Non Fiction)
```

### 3.ค่าเฉลี่ยของ ราคาต่อเรตติ้ง หนังสือประเภทไหนดีกว่ากัน(ยิ่งน้อยยิ่งดีกว่า)
```{R}
MeanFicRatePrice <- bs %>% filter(Fiction == "Fiction") %>% summarise(mean = mean(Price / Rating))
MeanNonFicRatePrice <- bs %>% filter(Fiction == "Non Fiction") %>% summarise(mean = mean(Price / Rating))

MeanFicRatePrice
MeanNonFicRatePrice
```

Result
```{R}
MeanFicRatePrice = 2.614114 (หนังสือประเภท Fiction)
MeanNonFicRatePrice = 3.002806 (หนังสือประเภท Non Fiction)
```
