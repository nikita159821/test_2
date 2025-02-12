FROM python:3.12

WORKDIR /app

# Устанавливаем git
RUN apt-get update && apt-get install -y git

# Клонируем репозиторий
RUN git clone https://github.com/nikita159821/test_2 .

# Устанавливаем зависимости, включая pytest
RUN pip install -r requirements.txt

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

RUN apt-get update && apt-get install -y google-chrome-stable

# Устанавливаем pytest глобально (если необходимо)
RUN pip install pytest

# Запускаем pytest
CMD ["python", "-m", "pytest", "test.py"]