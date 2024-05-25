# используйте образ, который скачали в прошлом уроке
# и в котором уже установлен Python
FROM python:3.11-slim

LABEL author=${AUTHOR}

# скопируйте файлы в Docker
# название директории внутри контейнера: churn_app
COPY . ./churn_app

# измените рабочую директорию Docker 
WORKDIR churn_app

# инструкция для установки библиотек
RUN pip3 install -r requirements.txt

# инструкция для открытия порта
# используйте порт, который указан в Readme
EXPOSE ${APP_PORT}

# монтируем том с моделями
VOLUME /models

# какая команда должна исполняться при старте контейнера?
CMD uvicorn app.churn_app:app --reload --port ${APP_PORT} --host 0.0.0.0