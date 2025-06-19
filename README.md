# 🐳 Flask Kube App

Flask-приложение, развёрнутое в Kubernetes с помощью Minikube и Docker.

## 📁 Структура проекта

```
flask-kube-app/
├── app.py                  # Flask-приложение
├── Dockerfile              # Docker-образ
├── requirements.txt        # Зависимости Python
├── k8s/
│   ├── deployment.yaml     # Kubernetes Deployment
│   └── service.yaml        # Kubernetes Service
├── deploy.sh               # Скрипт сборки и деплоя
├── .github/
│   └── workflows/
│       └── ci.yml          # CI: сборка Docker, pytest и flake8
├── .dockerignore
├── .gitignore
├── LICENSE
└── README.md
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
Hello, Kubernetes!
```

## 📜 Установка зависимостей вручную (альтернатива)
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python app.py
```

## 📄 Лицензия

Проект распространяется под лицензией MIT.
