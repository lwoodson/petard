FROM python:2.7

RUN mkdir -p /app
COPY requirements.txt /app/requirements.txt
COPY app.py /app/app.py
RUN pip install -r /app/requirements.txt

EXPOSE 10001
CMD ["python", "/app/app.py"]
