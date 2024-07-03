FROM envoyproxy/envoy:v1.27.1

ARG OTEL_HOST
ARG OTEL_AUTH

ENV OTEL_HOST=$OTEL_HOST
ENV OTEL_AUTH=$OTEL_AUTH

RUN echo ${OTEL_HOST}
RUN echo ${OTEL_AUTH}

COPY envoy.yaml.tmpl /etc/envoy/envoy.yaml

RUN apt-get update && apt-get install gettext-base && envsubst < /etc/envoy/envoy.yaml > /etc/envoy/envoy.yaml

RUN cat /etc/envoy/envoy.yaml

RUN chmod go+r /etc/envoy/envoy.yaml
