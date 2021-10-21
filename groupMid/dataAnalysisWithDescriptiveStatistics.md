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

สรุป
หนังสือประเภท Non Fiction มีจำนวนรางวัล Best Seller ที่มากกว่า Fiction
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

สรุป
หนังสือประเภท Fiction มีค่าเฉลียเรตติ้งที่มากกว่า NonFiction
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

สรุป
ค่าเฉลี่ย ราคาต่อเรตติ้ง ของหนังสือประเภท Fiction ถือว่าดีกว่า
เนื่องจากยิ่งค่าน้อย ยิ่งหมายถึงว่าอัตราส่วนราคาต่อเรตติ้งน้อยกว่า
```

## ภาพรวมจากการวิเคราะห์สามข้อนี้
 - ถึงแม้ว่าหนังสือประเภท Non Fiction จะมีค่าเฉลี่ยเรตติ้งที่ต่ำกว่า แต่นั่นก็เป็นค่าที่ต่างกันเพียงเล็กน้อยเท่านั้น (เพียงประมาณ 0.007)

 - ถึงแม้ว่าหนังสือประเภท Non Fiction จะมีค่าเฉลี่ยราคาต่อเรตติ้งที่แย่กว่า แต่ยังไม่สามารถเป็นตัววัดได้อย่างแท้จริง ว่าหนังสือประเภท Non Fiction นั้นไม่คุ้มกับคุณภาพ เนื่องจากหนังสือบางเล่มมีราคาที่แพงกว่าเล่มอื่นเป็นอย่างมาก แต่เรตติ้งยังออกมาดีในค่าเฉลี่ยที่ใกล้เคียงกัน

 - อีกทั้งหนังสือทั้งสองประเภทนั้นมีอัตราส่วนการติด Best Seller ในจำนวนใกล้เคียงกัน จึงขอสรุปตามมุมมองของพวกเราได้ว่า หนังสือทั้งสองประเภทนั้นได้รับความนิยมพอๆกัน และ คู่ควรแก่รางวัล Best Seller อย่างยิ่ง



