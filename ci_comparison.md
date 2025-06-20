# 🐳 Flask Kube App

Flask-приложение, развёрнутое в Kubernetes с помощью Minikube и Docker.

## 📁 Структура проекта

```
flask-kube-app/
├── app/                     # Исходный код Flask
├── k8s/                     # Kubernetes YAML-файлы
├── scripts/                 # Скрипты и генераторы
├── deploy.sh               # Автоматизация деплоя в Minikube
├── Dockerfile              # Сборка образа
├── requirements.txt        # Зависимости
├── pyproject.toml          # Файл проекта
├── README.md               # Описание проекта
├── LICENSE                 # Лицензия MIT
├── .github/workflows/      # CI конфиг (GitHub Actions)
└── .gitlab-ci.yml          # Альтернатива GitLab CI
```

## 🚀 Быстрый запуск локально через Minikube

```bash
chmod +x deploy.sh
./deploy.sh
```

## 🧪 Автоматические проверки (CI)
- ✅ Тесты (pytest)
- 🧼 Линтинг (flake8)
- 🐳 Сборка Docker-образа
- Работает на GitHub Actions и GitLab CI

## 🔍 Проверка результата
После запуска:
```
minikube service flask-kube-service
```
Откроется браузер по NodePort адресу:
```
Hello, Kubernetes!
```

## 📊 Сравнение CI/CD
См. [CI_COMPARISON.md](CI_COMPARISON.md) для различий между GitHub Actions, GitLab CI и Jenkins.

## 📜 Установка зависимостей вручную
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python run.py
```

## 📄 Лицензия
Проект распространяется под лицензией MIT.
