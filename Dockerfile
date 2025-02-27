# Установите необходимые утилиты, включая git
RUN apt-get update && apt-get install -y git wget

# Создайте директорию для проекта
RUN mkdir /app
WORKDIR /app

# Клонируйте репозиторий в созданную директорию
RUN git clone https://github.com/nikita159821/test_2 .

# Установите зависимости
COPY requirements.txt .
RUN pip install -r requirements.txt

# Установите Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update && apt-get install -y google-chrome-stable

# Создайте директорию для результатов
RUN mkdir allure-results

# Задайте команду для запуска тестов и сохранения результатов
CMD ["pytest", "test_main.py", "--alluredir=allure-results"]

# (При необходимости) Вы можете добавить команду для генерации отчета
# CMD ["bash", "-c", "pytest test_main.py --alluredir=allure-results && allure generate allure-results -o allure-report"]
