# Prometheus

## Adding services to be scraped
Any service can be scraped by prometheus by adding some labels and a network:

```
labels:
  prometheus.scrape: true
networks:
- prometheus
```

The scrape config can be customized by setting the following labels:

```
labels:
  prometheus.address: serverurl.whatever
  prometheus.path: /mertricseverywhere
  prometheus.port: 8080
```
