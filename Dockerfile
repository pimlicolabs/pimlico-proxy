FROM envoyproxy/envoy:v1.27.1

ARG OTEL_HOST
ARG OTEL_AUTH

COPY envoy.yaml.tmpl /etc/envoy/envoy.yaml

RUN apt-get update && apt-get install gettext-base && envsubst < /etc/envoy/envoy.yaml > /etc/envoy/envoy.yaml

RUN chmod go+r /etc/envoy/envoy.yaml
