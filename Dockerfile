FROM python:3.8-slim-buster
LABEL maintainer="merenlin -- follow me on medium https://medium.com/@merenlin"

RUN apt-get update && apt-get install -y python3-dev build-essential

RUN mkdir -p /usr/src/strs
WORKDIR /usr/src/strs

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

CMD uvicorn strAPI.main:app --host=0.0.0.0 --port=${PORT:-5000}


