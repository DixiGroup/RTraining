# R - мова програмування із відкритим кодом. 
# Велика спільнота розробників пише нові пакети, які можуть бути
# призначені для виконання вузьких завдань, або ж досить суттєво змінюють синтаксис

# Більшість пакетів завантажені в репозиторії і можуть бути встановлені командою
# install.packages()
install.packages("xts")

# Аби використовувати функції пакети, треба або писати їх через ::,
# або ж використовувати команду library()
coal_reserves_stations <- readr::read_csv("Lesson 1/coal_reserves_stations.csv")
# це те саме, що 
library(readr)
coal_reserves_stations <- read_csv("Lesson 1/coal_reserves_stations.csv")

# Набір бібліотек tidyverse суттєво розширює можливості R та місцями робить
# синтаксис більш інтуїтивним. Особливо це стосується бібліотеки dplyr
library(dplyr)

# Пробіжемося по основним командам
# select() - дозволяє вибирати стовпці з таблиці
coal_stations_date_reserve <- select(coal_reserves_stations, station, date, reserve)
# filter() - відбирає рядки, які відповідають якійсь умові
coal_akhmetov <- filter(coal_reserves_stations, owner == "ДТЕК, Рінат Ахметов")
# mutate() - створює новий стовпчик
coal_incompletement <- mutate(coal_reserves_stations, incompletemnet = 100 - plan_percent)
# summarise() - підсумовує зміст таблички за допомогою обраних користувачем функцій
coal_sum <- summarise(coal_reserves_stations, max_reserve = max(reserve), 
                      min_reserve = min(reserve),
                      mean_reserve = mean(reserve),
                      median_reserve = median(reserve),
                      mean_plan_percent = mean(plan_percent, na.rm = TRUE))
# group_by() - групує рядки за значеннями одного або декількох стовпчиків
# це дозволяє застосувати інші фукції до групи
coal_grouped_summary <- summarise(group_by(coal_reserves_stations, owner), 
                                  max_reserve = max(reserve), 
                                  min_reserve = min(reserve),
                                  mean_reserve = mean(reserve),
                                  median_reserve = median(reserve),
                                  mean_plan_percent = mean(plan_percent, na.rm = TRUE))
# Синтаксис pipelines - найпотужніша перевага R
# Оператор %>% означає "зробити першим аргументом функції
# праворуч значення ліворуч"
# Наприклад, 
select(coal_reserves_stations, station, date, reserve)
# Видасть те саме, що і
coal_reserves_stations %>% select(station, date, reserve)

# Використання такого синтаксису зробить код набагато більш читабельним,
# оскільки команди записуються в тій саме послідовності, що і виконується.
# Наприклад, 
coal_stat <-
  coal_reserves_stations %>% 
  filter(date == max(date)) %>%
  group_by(owner, coal_type) %>% 
  summarise(total_reserve = sum(reserve, na.rm = TRUE),
            total_plan = sum(planned, na.rm = TRUE),
            mean_plan_percent = mean(plan_percent, na.rm = TRUE))
# Послідовність дій збігається із послідовністю написання команд:
# Ми спочатку вибираємо найбільшу (тобто найактуальнішу) дату,
# потім групуємо за власником та маркою вугілля,
# нарешті, робимо підсумок запасів на останню дату

# Для роботи із фільтрами корисно знати пару додаткових функцій
# %in% - наявність значення у векторі
stations <- c("Дарницька ТЕЦ", "Трипільська ТЕС")
coal_reserves_filtered <- coal_reserves_stations %>% 
  filter(station %in% stations)
# grepl() - пошук підрядка у рядку
tes_reserves <- coal_reserves_stations %>% 
  filter(grepl("ТЕС", station, ignore.case = FALSE))