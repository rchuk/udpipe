FROM tensorflow/tensorflow:2.15.0-gpu

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    --mount=type=bind,source=wembedding_service/requirements.txt,target=wembedding_service/requirements.txt \
    python -m pip install -r requirements.txt -r wembedding_service/requirements.txt

RUN mkdir "cache"

RUN chown -R appuser:appuser "cache"

USER appuser

COPY . .

ENV TRANSFORMERS_CACHE="/app/cache"

ENTRYPOINT ./run_server.sh ${UDPIPE_PORT} /models
