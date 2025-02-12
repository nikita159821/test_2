   FROM python:3.12

   WORKDIR /app
   RUN apt-get update && apt-get install -y git

   RUN git clone https://github.com/nikita159821/test_2 .
   RUN pip install -r requirements.txt

   CMD ["pytest"]

