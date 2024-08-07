FROM envoyproxy/envoy:v1.28.0

ARG OTEL_HOST
ARG OTEL_AUTH

ENV OTEL_HOST=$OTEL_HOST
ENV OTEL_AUTH=$OTEL_AUTH

RUN echo ${OTEL_HOST}
RUN echo ${OTEL_AUTH}

WORKDIR /app

COPY envoy.yaml.tmpl ./

RUN apt-get update && apt-get install gettext-base && envsubst < /app/envoy.yaml.tmpl > /etc/envoy/envoy.yaml

RUN chmod go+r /etc/envoy/envoy.yaml
