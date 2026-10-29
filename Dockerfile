FROM ubuntu:latest

ADD https://example.com/install.sh /tmp/install.sh

RUN apt-get update && apt-get install -y curl sudo

COPY app /app

EXPOSE 22

CMD ["python3", "/app/views.py"]
