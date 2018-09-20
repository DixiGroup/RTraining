# Оператори контролю виконання в R завжди відповідають двом простим правилам:
# 1) Умова береться у круглі дужки;
# 2) Сукупність операторів береться у круглі дужки

# Умовний перехід 
if (2 + 2 == 4) {
  print("Ти не з'їхав з глузду")
} else {
  print("Пора замислитися...")
} 

# Цикл for використовує ітерацію по вектору
dixi_nerds <- data.frame(name = c("Andriy", "Roma", "Liosha", "Nastya"), 
                         gender = c("M", "M", "M", "F"),
                         hair_color = c("dark", "grey", "blonde", "blonde"),
                         height = c(177, 200, 175, 180))
for (i in 1:nrow(dixi_nerds)) {
  print(i)
  print(dixi_nerds$name[i])
  print(dixi_nerds$gender[i])
  print(dixi_nerds$hair_color[i])
  print(dixi_nerds$height[i])
}

# Цикл while та оператор break
i <- 1
while (i < 5) {
  if (dixi_nerds$name[i] == "Roma") {
    print("Зустріли Рому та тікаємо")
    break
  }
  print(i)
  print(dixi_nerds$name[i])
  print(dixi_nerds$gender[i])
  print(dixi_nerds$hair_color[i])
  print(dixi_nerds$height[i])
  i <- i + 1
}

# Функції 
# Оператор return використовують лише тоді, коли хочуть зупинити виконання функції
# подібно до оператора break у циклах. Зазвичай, аби повернутися значення,
# необхідну змінну просто пишуть останньою.
degree <- function(n, d = 2) {
  res <- 1
  for (i in 1:d) {
    res <- res * n
  }
  res
}
print(degree(2,8))

