# Prometheus

## Adding services to be scraped
Any service can be scraped by prometheus by adding some labels and a network:

```
labels:
  prometheus.scrape: true
  prometheus.port: <port>
networks:
- prometheus
```

The scrape config can be customized by setting the following labels:

```
labels:
  prometheus.address: serverurl.whatever
  prometheus.path: /mertricseverywhere
```

If a service exposes 2 ports for metrics on the same container the following label can be added:

```
labels:
  prometheus.port2: <port>
```
