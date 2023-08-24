# ntfy

![Version: 0.2.11](https://img.shields.io/badge/Version-0.2.11-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.7.0](https://img.shields.io/badge/AppVersion-v2.7.0-informational?style=flat-square)

A self-hosted HTTP based pub sub notification service.

**Homepage:** <https://github.com/zzOzz/helm-chart>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Vincent Lombard |  |  |

## Source Code

* <https://github.com/binwiederhier/ntfy>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.repository | string | `"binwiederhier/ntfy"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `"v2.7.0"` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `80` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| resources | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| config.enabled | bool | `false` |  |
| config.data.base-url | string | `"https://example.com"` |  |
| config.data.auth-file | string | `"/var/cache/ntfy/user.db"` |  |
| config.data.auth-default-access | string | `"deny-all"` |  |
| config.data.cache-file | string | `"/var/cache/ntfy/cache.db"` |  |
| config.data.attachment-cache-dir | string | `"/var/cache/ntfy/attachments"` |  |
| config.data.behind-proxy | bool | `true` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.size | string | `"200Mi"` |  |
