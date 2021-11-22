FROM docker.io/matrixdotorg/synapse

COPY /etc/homeserver.yaml /data/homeserver.yaml


VOLUME ["/data"]

RUN chown 991:991 /data \
        && mkdir /data/media_store \
        && chown 991:991 /data/media_store

EXPOSE 8008/tcp 8009/tcp 8448/tcp

ENTRYPOINT ["/start.py"]

HEALTHCHECK --start-period=5s --interval=15s --timeout=5s \
    CMD curl -fSs http://localhost:8008/health || exit 1
