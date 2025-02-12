FROM python:3.12

WORKDIR /app

# Устанавливаем git
RUN apt-get update && apt-get install -y git

# Клонируем репозиторий
RUN git clone https://github.com/nikita159821/test_2 .

# Устанавливаем зависимости, включая pytest
RUN pip install -r requirements.txt

# Устанавливаем pytest глобально (если необходимо)
RUN pip install pytest

# Запускаем pytest
CMD ["python", "-m", "pytest", "test.py"]