# syntax=docker/dockerfile:1
FROM python:3.10-bullseye

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=0 \
    POETRY_VIRTUALENVS_IN_PROJECT=false \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1 

RUN apt-get update && apt-get install -y \
    libpq-dev \
    bash-completion \
    git \
    vim

WORKDIR /workspace/app
COPY app/pyproject.toml app/poetry.lock ./

RUN pip install -U pip \
    && pip install 'poetry>=1.0.0' \
    && poetry install --no-interaction --no-ansi

VOLUME /workspace