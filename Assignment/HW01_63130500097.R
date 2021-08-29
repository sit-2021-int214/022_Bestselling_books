  #Ex1

Ex1 <- c(10.4, 5.6, 3.1, 6.4, 21.7)

sum(Ex1) #Sum = 41.2

mean(Ex1) #Average = 9.44

median(Ex1) #Median = 6.40

sd(Ex1) #SD = 7.33846

var(Ex1) #Variance = 47.2

summary(Ex1)


  #Ex2

names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)


marvel_movies <- list(Movie = names, Year = years)
dataFrame = data.frame(marvel_movies)

View(dataFrame)

length(names) #number of movies = 27
names[19] # 19th movies name = Infinity War
#2017 and 2021 is most year of movie released



Mode(years)

