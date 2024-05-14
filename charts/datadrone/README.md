# datadrone

![Version: 0.2.12](https://img.shields.io/badge/Version-0.2.12-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.1.3](https://img.shields.io/badge/AppVersion-2.1.3-informational?style=flat-square)

A Helm chart for datadrone application

# Datadrone deployment helm chart

## Installation

1. Create values-files

~~~

~~~

~~~
helm repo add zzOzz https://zzozz.github.io/helm-charts
helm repo update
helm upgrade --install datadrone-test zzOzz/datadrone --values ./test-values.yaml
~~~

## Values

<table height="400px" >
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td id="affinity"><a href="./values.yaml#L6">affinity</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>containers affinity</td>
		</tr>
		<tr>
			<td id="containers"><a href="./values.yaml#L9">containers</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "configMap": {
      "files": [
        {
          "content": "events {\n}\nhttp {\n  server_tokens off;\n  sendfile on;\n  tcp_nopush on;\n  tcp_nodelay on;\n  keepalive_timeout 15;\n  types_hash_max_size 2048;\n  include /etc/nginx/mime.types;\n  default_type application/octet-stream;\n  access_log off;\n  error_log off;\n  gzip on;\n  gzip_disable \"msie6\";\n  include /etc/nginx/conf.d/*.conf;\n  include /etc/nginx/sites-enabled/*;\n  open_file_cache max=100;\n  server {\n    listen 80 default_server;\n    listen [::]:80 default_server;\n    # Set nginx to serve files from the shared volume!\n    root /var/www/html/public;\n    index index.php index.html;\n    server_name _;\n    location / {\n      try_files $uri /index.php$is_args$args;\n      client_max_body_size 10M;\n    }\n    location ~ ^/index\\.php(/|$) {\n      fastcgi_pass 127.0.0.1:9000;\n      fastcgi_split_path_info ^(.+\\.php)(/.*)$;\n      include fastcgi_params;\n      fastcgi_read_timeout 600;\n      client_max_body_size 10M;\n      fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;\n      fastcgi_param DOCUMENT_ROOT $realpath_root;\n      #internal;\n    }\n    location ~ \\.php$ {\n      return 404;\n    }\n  }\n}\n",
          "name": "nginx.conf"
        }
      ],
      "mountPath": "/config"
    },
    "image": {
      "pullPolicy": "Always",
      "repository": "nginx",
      "tag": "latest"
    },
    "lifecycle": {
      "postStart": {
        "exec": {
          "command": [
            "/bin/sh",
            "-c",
            "cat /config/nginx.conf \u003e /etc/nginx/nginx.conf; nginx -s reload"
          ]
        }
      }
    },
    "name": "nginx",
    "resources": {},
    "securityContext": {
      "capabilities": {
        "add": [
          "SYS_ADMIN"
        ]
      },
      "privileged": true,
      "procMount": "Default"
    },
    "service": {
      "port": 80
    }
  },
  {
    "args": [
      "user@sftp.server.fr:/ac/lse/projets/datadrone/"
    ],
    "configMap": {
      "environment": [
        {
          "key": "DB_HOST",
          "value": "none"
        }
      ]
    },
    "image": {
      "pullPolicy": "Always",
      "repository": "registry.msh-lse.fr/php/datadrone",
      "tag": "5f52b036fde6c8c752b66c66fee71622f24a67aa"
    },
    "lifecycle": {
      "postStart": {
        "exec": {
          "command": [
            "/bin/sh",
            "-c",
            "cp -r /app/. /var/www/html;rm -fr /var/www/html/var;chown www-data:www-data /var/www/html/public"
          ]
        }
      }
    },
    "name": "app",
    "resources": {},
    "secrets": {
      "environment": [
        {
          "key": "APP_SECRET",
          "value": "very_secret_token"
        },
        {
          "key": "DATABASE_URL",
          "value": "pgsql://datadrone_user:datadrone_password@postgres-postgresql.postgres/datadrone"
        },
        {
          "key": "IMPORT_DIR",
          "value": "/srv/rsync-datadrone/Data-drone/PhotosAeriennes/"
        },
        {
          "key": "UPLOAD_DIR",
          "value": "/srv/uploads"
        },
        {
          "key": "DRONE_IMPORT_DIR",
          "value": "/srv/rsync-datadrone/Data-drone/DonneesDrone/"
        },
        {
          "key": "GEOSERVER_URL",
          "value": "https://datadrone.dev.msh-lse.fr/geoserver/csw/"
        },
        {
          "key": "GEOSERVER_ACCESS_TOKEN_SESSION_DURATION",
          "value": "300"
        },
        {
          "key": "GEOSERVER_ACCESS_TOKEN",
          "value": "even_more_very_secret_token"
        },
        {
          "key": "GEOSERVER_LICENCE_NAME",
          "value": "CRAIG"
        },
        {
          "key": "HUMANUM_DRONE_DATA_FOLDER",
          "value": "/srv/rsync-datadrone/Data-drone/DonneesDrone/"
        },
        {
          "key": "DRONE_DATA_DOWNLOAD_EXPIRATION",
          "value": "1"
        },
        {
          "key": "DRONE_DATA_DOWNLOADS_DIR",
          "value": "/tmp/zip/"
        }
      ],
      "files": [
        {
          "content": "httpuser:httppassword",
          "name": "auth"
        },
        {
          "content": "-----BEGIN OPENSSH PRIVATE KEY-----\n-----END OPENSSH PRIVATE KEY-----\n",
          "name": "id_ed25519"
        }
      ],
      "mountPath": "/config",
      "name": "datadrone-secret"
    },
    "securityContext": {
      "capabilities": {
        "add": [
          "SYS_ADMIN"
        ]
      },
      "privileged": true,
      "procMount": "Default"
    },
    "volumeMounts": [
      {
        "hostSubPath": "data",
        "mountPath": "/app/uploads"
      }
    ]
  }
]
</pre>
</div>
			</td>
			<td>list of affinitcontainers</td>
		</tr>
		<tr>
			<td id="containers[1]--args[0]"><a href="./values.yaml#L82">containers[1].args[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"user@sftp.server.fr:/ac/lse/projets/datadrone/"
</pre>
</div>
			</td>
			<td>stfp user mount location</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L146">fullnameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"datadrone"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L148">ingress.annotations</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--enabled"><a href="./values.yaml#L149">ingress.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--hosts[0]--host"><a href="./values.yaml#L151">ingress.hosts[0].host</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"datadrone.dev.msh-lse.fr"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--hosts[0]--paths[0]"><a href="./values.yaml#L153">ingress.hosts[0].paths[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--tls[0]--hosts[0]"><a href="./values.yaml#L156">ingress.tls[0].hosts[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"datadrone.dev.msh-lse.fr"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="ingress--tls[0]--secretName"><a href="./values.yaml#L157">ingress.tls[0].secretName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https-certificate"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L158">nameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"datadrone"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="namespaceOverride"><a href="./values.yaml#L159">namespaceOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"datadrone"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="nodeSelector"><a href="./values.yaml#L160">nodeSelector</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L161">replicaCount</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="secrets--dockerConfig"><a href="./values.yaml#L163">secrets.dockerConfig</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"{\"registry.msh-lse.fr\":{\"username\":\"registry_login\",\"password\":\"registry_password\",\"email\":\"super_user@wtf.com\"}}\n"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="secrets--registrationToken"><a href="./values.yaml#L165">secrets.registrationToken</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"xxxxxxxxx"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="secrets--tlsCrt"><a href="./values.yaml#L166">secrets.tlsCrt</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-----BEGIN CERTIFICATE-----\n-----END CERTIFICATE-----\n"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="secrets--tlsKey"><a href="./values.yaml#L169">secrets.tlsKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-----BEGIN PRIVATE KEY-----\n-----END PRIVATE KEY-----\n"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="storage--enabled"><a href="./values.yaml#L173">storage.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="storage--localStoragePath"><a href="./values.yaml#L174">storage.localStoragePath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/opt/local-path-provisioner/datadrone"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="storage--node"><a href="./values.yaml#L175">storage.node</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cluster-node_name"
</pre>
</div>
			</td>
			<td></td>
		</tr>
	</tbody>
</table>

