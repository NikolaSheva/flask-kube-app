# 🐳 Flask Kube App

Flask-приложение, развёрнутое в Kubernetes с помощью Minikube и Docker.

## 📁 Структура проекта

```
flask-kube-app/
├── app/                    # Основной модуль Flask-приложения
│   ├── __init__.py         # Фабрика приложения Flask
│   ├── routes.py           # Роуты приложения (Blueprint)
│   ├── models.py           # Модели (если есть)
│   ├── config.py           # Конфигурация приложения
│   └── extensions.py       # Расширения Flask (если используются)
├── run.py                  # Точка входа в приложение
├── Dockerfile              # Инструкция сборки Docker-образа
├── requirements.txt        # Зависимости проекта
├── deploy.sh               # Скрипт сборки и деплоя в Kubernetes
├── k8s/
│   ├── deployment.yaml     # Kubernetes Deployment
│   └── service.yaml        # Kubernetes Service
├── .dockerignore           # Исключения при сборке Docker-образа
├── .gitignore              # Исключения для Git
├── LICENSE                 # Лицензия проекта (MIT)
└── README.md               # Документация проекта
```

## 🚀 Запуск проекта локально через Minikube

```bash
chmod +x deploy.sh
./deploy.sh
```

## 🧪 Автоматические проверки (CI)
Настроены GitHub Actions:
- 🐳 Сборка Docker-образа
- ✅ Тесты `pytest`
- 🧼 Линтинг `flake8`

CI запускается при каждом `push` и `pull request` в ветку `main`.

## 🔍 Проверка результата

После запуска скрипта `minikube service flask-kube-service` автоматически откроет браузер. На экране:
```
Hello from Flask app!
```

## 📜 Установка зависимостей вручную (альтернатива)
```bash
python -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
python run.py
```

## 📄 Лицензия

Проект распространяется под лицензией MIT.
