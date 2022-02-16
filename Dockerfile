FROM python:3-alpine

WORKDIR /app

COPY python/requirements.txt .

COPY python/receiveRandompass.py .

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python3", "receiveRandompass.py"]

