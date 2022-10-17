FROM ubuntu:latest

RUN 

RUN apt-get update \
	&& apt -y upgrade \
	&& apt install -y python3-pip \
	&& apt install -y build-essential libssl-dev libffi-dev python3-dev \
	&& apt install -y python3-venv \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]