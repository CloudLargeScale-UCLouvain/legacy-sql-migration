FROM python:3.7-slim
WORKDIR /app
RUN apt-get update \
&& apt-get install -y gcc wget curl nano  \
&& apt-get clean
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["python"]