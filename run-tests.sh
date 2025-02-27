   #!/bin/bash

   # Параметры
   REPO_URL="https://github.com/nikita159821/test_2.git"  # Укажите актуальный URL вашего репозитория
   BRANCH="main"                                         # Укажите нужную ветку
   IMAGE_NAME="my-python-tests"                          # Имя вашего Docker образа
   TEMP_DIR="./temp_repo"                                # Временная директория для клонирования репозитория

   # Удаляем старую папку, если она существует
   if [ -d "$TEMP_DIR" ]; then
       rm -rf "$TEMP_DIR"
   fi

   # Клонирование репозитория
   git clone -b $BRANCH $REPO_URL $TEMP_DIR

   # Переходим в папку с клонированным репозиторием
   cd $TEMP_DIR

   # Собираем Docker образ
   docker build -t $IMAGE_NAME .

   # Запускаем тесты
   docker run --rm $IMAGE_NAME

   # Удаляем временную папку
   cd ..
   rm -rf "$TEMP_DIR"
