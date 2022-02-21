FROM python:3.10-slim-buster

WORKDIR /app

RUN pip install poetry

COPY pyproject.toml /app
COPY poetry.lock /app

RUN poetry install

COPY . /app

CMD ["sh", "entrypoint.sh"]
