#!/bin/bash

# Настройка строгой обработки ошибок:
# -e: остановить при ошибке
# -u: остановить при использовании неинициализированной переменной
# -o pipefail: ошибка в любой части пайпа завершает весь пайп
set -euo pipefail

# ✅ Проверяем, запущен ли Minikube. Если нет — запускаем.
if ! minikube status | grep -q "host: Running"; then
  echo "🚀 Minikube не запущен. Запускаем..."
  minikube start --driver=docker
fi

# Имена образа, деплоймента и сервиса
APP_NAME="flask-kube-app"
IMAGE_NAME="$APP_NAME:latest"
SERVICE_NAME="flask-kube-service"

# ⚖️ 1. Собираем образ внутри Docker окружения Minikube
# Переключаем docker на демон внутри Minikube
echo "🔧 Building Docker image..."
eval $(minikube docker-env)
# Собираем образ с тегом flask-kube-app:latest
docker build -t $IMAGE_NAME .

# 🚀 2. Применяем Kubernetes-манифесты
# Создаём (или обновляем) deployment и service в кластере
echo "🚀 Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# ⌛ 3. Ждём, пока поды будут в статусе "Готовы"
# Альтернатива rollout — можно использовать ожидание готовности подов через label
# kubectl wait --for=condition=ready pod -l app=$APP_NAME --timeout=90s
kubectl rollout status deployment/$APP_NAME

# 🌐 4. Открываем веб-сервис в браузере (через NodePort)
minikube service $SERVICE_NAME
