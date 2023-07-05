# datadrone

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.1.3](https://img.shields.io/badge/AppVersion-2.1.3-informational?style=flat-square)

A Helm chart for datadrone application

# Restic Cronjob executed inside helm release pod

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
			<td id="affinity"><a href="./values.yaml#L1">affinity</a></td>
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
			<td id="containers[0]--configMap--files[0]--content"><a href="./values.yaml#L5">containers[0].configMap.files[0].content</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"events {\n}\nhttp {\n  server_tokens off;\n  sendfile on;\n  tcp_nopush on;\n  tcp_nodelay on;\n  keepalive_timeout 15;\n  types_hash_max_size 2048;\n  include /etc/nginx/mime.types;\n  default_type application/octet-stream;\n  access_log off;\n  error_log off;\n  gzip on;\n  gzip_disable \"msie6\";\n  include /etc/nginx/conf.d/*.conf;\n  include /etc/nginx/sites-enabled/*;\n  open_file_cache max=100;\n  server {\n    listen 80 default_server;\n    listen [::]:80 default_server;\n    # Set nginx to serve files from the shared volume!\n    root /var/www/html/public;\n    index index.php index.html;\n    server_name _;\n    location / {\n      try_files $uri /index.php$is_args$args;\n      client_max_body_size 10M;\n    }\n    location ~ ^/index\\.php(/|$) {\n      fastcgi_pass 127.0.0.1:9000;\n      fastcgi_split_path_info ^(.+\\.php)(/.*)$;\n      include fastcgi_params;\n      fastcgi_read_timeout 600;\n      client_max_body_size 10M;\n      fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;\n      fastcgi_param DOCUMENT_ROOT $realpath_root;\n      #internal;\n    }\n    location ~ \\.php$ {\n      return 404;\n    }\n  }\n}\n"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--configMap--files[0]--name"><a href="./values.yaml#L50">containers[0].configMap.files[0].name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"nginx.conf"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--configMap--mountPath"><a href="./values.yaml#L51">containers[0].configMap.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/config"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--image--pullPolicy"><a href="./values.yaml#L53">containers[0].image.pullPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Always"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--image--repository"><a href="./values.yaml#L54">containers[0].image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"nginx"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--image--tag"><a href="./values.yaml#L55">containers[0].image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"latest"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--lifecycle--postStart--exec--command[0]"><a href="./values.yaml#L60">containers[0].lifecycle.postStart.exec.command[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/bin/sh"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--lifecycle--postStart--exec--command[1]"><a href="./values.yaml#L61">containers[0].lifecycle.postStart.exec.command[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-c"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--lifecycle--postStart--exec--command[2]"><a href="./values.yaml#L62">containers[0].lifecycle.postStart.exec.command[2]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cat /config/nginx.conf \u003e /etc/nginx/nginx.conf; nginx -s reload"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--name"><a href="./values.yaml#L63">containers[0].name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"nginx"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--resources"><a href="./values.yaml#L64">containers[0].resources</a></td>
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
			<td id="containers[0]--securityContext--capabilities--add[0]"><a href="./values.yaml#L68">containers[0].securityContext.capabilities.add[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"SYS_ADMIN"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--securityContext--privileged"><a href="./values.yaml#L69">containers[0].securityContext.privileged</a></td>
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
			<td id="containers[0]--securityContext--procMount"><a href="./values.yaml#L70">containers[0].securityContext.procMount</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Default"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[0]--service--port"><a href="./values.yaml#L72">containers[0].service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
80
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--args[0]"><a href="./values.yaml#L74">containers[1].args[0]</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--configMap--environment[0]--key"><a href="./values.yaml#L77">containers[1].configMap.environment[0].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"DB_HOST"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--configMap--environment[0]--value"><a href="./values.yaml#L78">containers[1].configMap.environment[0].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"none"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--image--pullPolicy"><a href="./values.yaml#L80">containers[1].image.pullPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Always"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--image--repository"><a href="./values.yaml#L81">containers[1].image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"registry.msh-lse.fr/php/datadrone"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--image--tag"><a href="./values.yaml#L82">containers[1].image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"d9ed8f6f3b11e3e0eafab414bff7b251a2f0fe20"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--lifecycle--postStart--exec--command[0]"><a href="./values.yaml#L87">containers[1].lifecycle.postStart.exec.command[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/bin/sh"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--lifecycle--postStart--exec--command[1]"><a href="./values.yaml#L88">containers[1].lifecycle.postStart.exec.command[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-c"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--lifecycle--postStart--exec--command[2]"><a href="./values.yaml#L89">containers[1].lifecycle.postStart.exec.command[2]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cp -r /app/. /var/www/html;rm -fr /var/www/html/var;chown www-data:www-data /var/www/html/public"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--name"><a href="./values.yaml#L91">containers[1].name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"app"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--resources"><a href="./values.yaml#L92">containers[1].resources</a></td>
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
			<td id="containers[1]--secrets--environment[0]--key"><a href="./values.yaml#L95">containers[1].secrets.environment[0].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"APP_SECRET"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[0]--value"><a href="./values.yaml#L96">containers[1].secrets.environment[0].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"very_secret_token"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[1]--key"><a href="./values.yaml#L97">containers[1].secrets.environment[1].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"DATABASE_URL"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[1]--value"><a href="./values.yaml#L98">containers[1].secrets.environment[1].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"pgsql://datadrone_user:datadrone_password@postgres-postgresql.postgres/datadrone"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[2]--key"><a href="./values.yaml#L99">containers[1].secrets.environment[2].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"IMPORT_DIR"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[2]--value"><a href="./values.yaml#L100">containers[1].secrets.environment[2].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/srv/rsync-datadrone/Data-drone/PhotosAeriennes/"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[3]--key"><a href="./values.yaml#L101">containers[1].secrets.environment[3].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"UPLOAD_DIR"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[3]--value"><a href="./values.yaml#L102">containers[1].secrets.environment[3].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/srv/uploads"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[4]--key"><a href="./values.yaml#L103">containers[1].secrets.environment[4].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"DRONE_IMPORT_DIR"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[4]--value"><a href="./values.yaml#L104">containers[1].secrets.environment[4].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/srv/rsync-datadrone/Data-drone/DonneesDrone/"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[5]--key"><a href="./values.yaml#L105">containers[1].secrets.environment[5].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"GEOSERVER_URL"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[5]--value"><a href="./values.yaml#L106">containers[1].secrets.environment[5].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"http://datadrone.msh-lse.fr/geoserver/csw/"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[6]--key"><a href="./values.yaml#L107">containers[1].secrets.environment[6].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"GEOSERVER_ACCESS_TOKEN_SESSION_DURATION"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[6]--value"><a href="./values.yaml#L108">containers[1].secrets.environment[6].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"300"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[7]--key"><a href="./values.yaml#L109">containers[1].secrets.environment[7].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"GEOSERVER_ACCESS_TOKEN"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[7]--value"><a href="./values.yaml#L110">containers[1].secrets.environment[7].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"even_more_very_secret_token"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[8]--key"><a href="./values.yaml#L111">containers[1].secrets.environment[8].key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"GEOSERVER_LICENCE_NAME"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--environment[8]--value"><a href="./values.yaml#L112">containers[1].secrets.environment[8].value</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"CRAIG"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--files[0]--content"><a href="./values.yaml#L114">containers[1].secrets.files[0].content</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"datadrone:$apr1$Fki8ahEP$ule/QL/xAp/v41yyWTKgO."
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--files[0]--name"><a href="./values.yaml#L115">containers[1].secrets.files[0].name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"auth"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--files[1]--content"><a href="./values.yaml#L116">containers[1].secrets.files[1].content</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-----BEGIN OPENSSH PRIVATE KEY-----\n-----END OPENSSH PRIVATE KEY-----\n"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--files[1]--name"><a href="./values.yaml#L119">containers[1].secrets.files[1].name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"id_ed25519"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--secrets--mountPath"><a href="./values.yaml#L120">containers[1].secrets.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/config"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--securityContext--capabilities--add[0]"><a href="./values.yaml#L124">containers[1].securityContext.capabilities.add[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"SYS_ADMIN"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--securityContext--privileged"><a href="./values.yaml#L125">containers[1].securityContext.privileged</a></td>
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
			<td id="containers[1]--securityContext--procMount"><a href="./values.yaml#L126">containers[1].securityContext.procMount</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Default"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--volumeMounts[0]--hostSubPath"><a href="./values.yaml#L128">containers[1].volumeMounts[0].hostSubPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"data"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="containers[1]--volumeMounts[0]--mountPath"><a href="./values.yaml#L129">containers[1].volumeMounts[0].mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/app/uploads"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L130">fullnameOverride</a></td>
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
			<td id="ingress--annotations"><a href="./values.yaml#L132">ingress.annotations</a></td>
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
			<td id="ingress--enabled"><a href="./values.yaml#L133">ingress.enabled</a></td>
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
			<td id="ingress--hosts[0]--host"><a href="./values.yaml#L135">ingress.hosts[0].host</a></td>
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
			<td id="ingress--hosts[0]--paths[0]"><a href="./values.yaml#L137">ingress.hosts[0].paths[0]</a></td>
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
			<td id="ingress--tls[0]--hosts[0]"><a href="./values.yaml#L140">ingress.tls[0].hosts[0]</a></td>
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
			<td id="ingress--tls[0]--secretName"><a href="./values.yaml#L141">ingress.tls[0].secretName</a></td>
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
			<td id="nameOverride"><a href="./values.yaml#L142">nameOverride</a></td>
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
			<td id="namespaceOverride"><a href="./values.yaml#L143">namespaceOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L144">nodeSelector</a></td>
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
			<td id="replicaCount"><a href="./values.yaml#L145">replicaCount</a></td>
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
			<td id="secrets--dockerConfig"><a href="./values.yaml#L147">secrets.dockerConfig</a></td>
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
			<td id="secrets--registrationToken"><a href="./values.yaml#L149">secrets.registrationToken</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"QjN1clpKVEJxeUVFUmozLV94VVc="
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="secrets--tlsCrt"><a href="./values.yaml#L150">secrets.tlsCrt</a></td>
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
			<td id="secrets--tlsKey"><a href="./values.yaml#L153">secrets.tlsKey</a></td>
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
			<td id="storage--enable"><a href="./values.yaml#L157">storage.enable</a></td>
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
			<td id="storage--localStoragePath"><a href="./values.yaml#L158">storage.localStoragePath</a></td>
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
			<td id="storage--node"><a href="./values.yaml#L159">storage.node</a></td>
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

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
