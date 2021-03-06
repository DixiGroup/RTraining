# Змінні в R створюється при присвоєнні значень
# Присвоєння значень здійснюється оператором "<-"
# Скорочений шлях - Alt + -
one <- 1
two <- 2

# Вектори - основні типи даних R. Вектор - це послідовність значень одного типу
# Наші змінні one і two - це числові вектори із довжиною 1
print(length(one))

# Довші вектори  створюються функцією с(). Від concatenate - поєднати.
three <- c(one, two)

# Або ж за допомогою крапки з комою
print(1:10)

# Елементи одного вектору можуть бути лише одного типу
# Якщо спробувати додати елемент іншого типу, всі елементи будуть одного типу
four <- c(three, "four")

# Із числовими векторами можна проводити арифметичні операції.
# Вони діють на всі елементи вектору
five <- three * 100
print(five)

# Вектори також можуть бути аргументами функції
print(sum(five))
print(min(five))
print(max(five))
print(mean(five))

# Якщо складати або множити вектори між собою, це також діє на всі елементи вектору
print(five + three)
print(five * three)

# До конкретного елементу вектору можна отримати доступ через індекс у квадратних дужках
# Оскільки індекс - це також вектор, то можна отримати доступ до більш ніж одного елементу
print(four[3])
print(four[1:2])

# Ще один спосіб - через вектор елементів булевого типу
print(four)
print(four[c(FALSE, TRUE, TRUE)])

# Вектор булевого типу створюється в результаті логічних операцій
# Значок дорівнює повинен бути подвійним
print(2 < 3)
print(c(2 < 3, 3 > 2, 2 > 3, 0 == 0))

# Окрім основних логічних операцій порівняння (<, >, ==, <=, >=),
# важливі також операції "та" (&), "або" (|), "не" (!)
print(TRUE & FALSE)
print(2 > 1 & 100 < 99)
print(TRUE | FALSE)
print(2 > 1 | 100 < 99)
print(!2 * 2 == 4)

# Логічні операції можна застосовувати також до векторів. 
# Як і арифметичні операції, вони діють поелементно.
print(five > 100)

# Відповідно, аби відібрати сукупність елементів вектора,
# які відповідають якийсь умові, потрібно застосовувати такий синтаксис
five_filtered <- five[five > 100]
print(five_filtered)

# Тип даних, що зберігає сукупність векторів - список
# Його можна створити за допомогою функції list()
first_list <- list(digits = c(1,2,3), letters = c("a", "b", "c", "d", "e"))
print(first_list)

# Отримати доступ до елементу списку можна як за номером, так і за назвою
print(first_list[1])
print(first_list['digits'])

# Одинарні квадратні дужки у випадку із списками повертають список
# Для того, аби отримати вектор, потрібно використовувати подвійні дужки
print(first_list[[1]])
print(first_list[['digits']])

# Ще один спосіб отримати доступ до елементу списку - через знак долара
# В цьому випадку повертається вектор
print(first_list$digits)

# Якщо всі вектори однакової довжини, то зі списку можна утворити датафрейм
# Датафрейм - це звичайна таблиця. З ними в основному ми і будемо працювати
dixi_nerds <- data.frame(name = c("Andriy", "Roma", "Liosha", "Nastya"), 
                         gender = c("M", "M", "M", "F"),
                         hair_color = c("dark", "grey", "blonde", "blonde"),
                         height = c(177, 200, 175, 180))
print(dixi_nerds)
View(dixi_nerds)

# До елементів датафрейму звертаються через квадратні дужки
# Це працює так само, як із вектором, але оскільки таблиця 
# квадратна, нам можна фільтрувати окремо стовпці і рядки.
# До них звертаються через коми. Спочатку йдуть рядки, потім стовпці.
# Наприклад, аби вивести перший рядок і перший стовпчик:
print(dixi_nerds[1,2])

# І рядки, і стовпчики мають номери і назви. Але найчастіше звертаються
# за назвами до стовчиків, а до рядків - за номерами чи булевими векторами
print(dixi_nerds[1:2, c("name", "gender")])
print(dixi_nerds[dixi_nerds$name == "Roma",])

# У датафреймі можна створювати нові стовпці
dixi_nerds$height_doubled <- dixi_nerds$height * 2

# Найчастіше датафрейми не створюють у коді, а завантажуть.
# Це можна робити функцією read.csv, але для кращого контролю
# над кодуванням можна використовувати read_csv з бібліотеки readr
library(readr)
coal_reserves_stations <- read_csv("Lesson 1/coal_reserves_stations.csv")

# Зручні функції для дослідження датафреймів
# names(), summary(), unique()
names(coal_reserves_stations)
summary(coal_reserves_stations)
unique(coal_reserves_stations$station)

# Наприклад, отримавши в останній команді перелік усіх станцій,
# ми хочемо отримати описову статистику з Придніпровської ТЕС
prydniprovska <- coal_reserves_stations[coal_reserves_stations$station == "Придніпровська ТЕС",]
summary(prydniprovska)
