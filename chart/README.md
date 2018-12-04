# Cachet Helm Chart

This chart bootstraps a [Cachet](http://cachethq.io/) deployment on a Kubernetes cluster using the Helm package manager.

## Installing the Chart

To install the chart with the release name `status`:

```bash
helm install --name status .
```

## Uninstalling the Chart

To uninstall/delete the `status` release:

```bash
helm delete status
```

## Configuration

The following table lists the configurable parameters of the Cachet chart and its default values.

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `image.repository` | Image Repository | `"cachethq/docker"` |
| `image.tag` | Image Tag | `"2.3.14"` |
| `image.pullPolicy` | Image Pull Policy | `"IfNotPresent"` |
| `appKey` | Laravel 5 Application Key | `""` |
| `postgresql.enabled` | - | `true` |
| `postgresql.postgresqlDatabase` | Database Name | `"cachethq"` |
| `postgresql.postgresqlUsername` | Database User | `"cachet"` |
| `postgresql.postgresqlPassword` | Database Password | `"cachet"` |
| `postgresql.port` | Database Port | `5432` |
| `postgresql.image.tag` | Database Image Tag | `"9.6"` |
| `postgresql.persistence.annotations.resourcePolicy` | Image Pull Policy | `"keep"` |
| `email.type` | Email Type | `"smtp"` |
| `email.host` | Email Host | `"smtp.mailserver.net"` |
| `email.port` | Email Port | `587` |
| `email.userName` | Email User | `"apikey"` |
| `email.fromName` | Email Author | `"cachethq"` |
| `email.fromEmail` | Email Origin | `"cachethq.io"` |
| `email.credentialsSecret` | Kubernetes Secret | `"secret-credentials"` |
| `replicaCount` | # App Instances | `1` |
| `service.type` | - | `"ClusterIP"` |
| `service.externalPort` | Exposed Port | `80` |
| `service.internalPort` | Pod Port | `8000` |
| `resources.limits.cpu` | - | `"400m"` |
| `resources.limits.memory` | - | `"512Mi"` |
| `resources.requests.cpu` | - | `"250m"` |
| `resources.requests.memory` | - | `"256Mi"` |
| `ingress.enabled` | - | `true` |
| `ingress.hosts` | - | `["status.cachethq.io"]` |
| `ingress.annotations.kubernetes.io/ingress.class` | - | `nginx` |
| `ingress.annotations.kubernetes.io/tls-acme` | - | `"true"` |
| `ingress.annotations.nginx.ingress.kubernetes.io/force-ssl-redirect` | - | `"true"` |
| `ingress.tls.0.secretName` | - | `status-tls` |
| `ingress.tls.0.hosts` | - | `["status.cachethq.io"]` |
