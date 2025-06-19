#!/bin/bash

mkdir -p app; touch "$_"/{__init__.py,routes.py,models.py,config.py,extensions.py}

mv app.py run.py 2>/dev/null || echo "app.py не найден, пропускаем перемещение."

cat << EOF > app/__init__.py
from flask import Flask
from .routes import main_blueprint
from .config import Config

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    app.register_blueprint(main_blueprint)
    return app
EOF

cat << EOF > app/routes.py
from flask import Blueprint

main_blueprint = Blueprint('main', __name__)

@main_blueprint.route('/')
def home():
    return 'Hello from Flask app!'
EOF

cat << EOF > app/config.py
class Config:
    DEBUG = True
EOF

cat << EOF > run.py
from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)
EOF

echo "✅ Структура Flask-приложения успешно создана!"