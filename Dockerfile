# Используем официальный базовый образ Python
FROM python:3.11-slim

# Отключаем создание .pyc файлов и буферизацию stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем только файлы зависимостей (для кэширования слоёв)
COPY requirements.txt .

# Устанавливаем pip и зависимости через uv (быстро и эффективно)
RUN python -m pip install uv && \
    uv pip install --system -r requirements.txt

# Копируем остальные файлы проекта
COPY . .

# Открываем порт, на котором будет работать Flask
EXPOSE 5000

# Запускаем приложение
CMD ["python3", "run.py"]