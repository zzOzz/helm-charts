# restic-job-executer

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.24.1](https://img.shields.io/badge/AppVersion-1.24.1-informational?style=flat-square)

A Helm chart for restic backup CronJob

# Restic Cronjob executed inside helm release pod

## Installation

1. Create values-files

example for bitnami/wordpress chart

~~~
schedule: "31 9 * * *"
context: my-cluster
chartSelector: wordpress
chartReleaseSelector: myrelease
suspend: false
restic:
  repository: s3:https://s3.mys3repo.fr/backup/restic/wordpress
  password: secret_password_for_my_backup
  awsAccessKeyId: acccessKeyForMyS3Repo
  awsSecretAccessKey: secretAccessKeyForMyS3Repo
~~~

~~~
helm repo add zzOzz https://zzozz.github.io/helm-charts
helm repo update
helm upgrade --install myrelease-backup zzOzz/restic-job-executer --values ./backup-job-values.yaml
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
			<td id="affinity"><a href="./values.yaml#L92">affinity</a></td>
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
			<td id="afterBackupScript"><a href="./values.yaml#L48">afterBackupScript</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"rm \"/bitnami/wordpress/\"\\$DATE\".sql\""
</pre>
</div>
			</td>
			<td>script executed after backup (do not forget \ before $ if bash variables used)</td>
		</tr>
		<tr>
			<td id="beforeBackupScript"><a href="./values.yaml#L44">beforeBackupScript</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"export DATE=$(date +'%m-%d-%Y-%H_%M')\nwp db export \"/bitnami/wordpress/\"\\$DATE\".sql\""
</pre>
</div>
			</td>
			<td>script executed before backup (do not forget \ before $ if bash variables used)</td>
		</tr>
		<tr>
			<td id="chartReleaseSelector"><a href="./values.yaml#L13">chartReleaseSelector</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"my_site_release"
</pre>
</div>
			</td>
			<td>name of the chart release (used to select pod)</td>
		</tr>
		<tr>
			<td id="chartSelector"><a href="./values.yaml#L11">chartSelector</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"wordpress"
</pre>
</div>
			</td>
			<td>name of the chart (used to select pod)</td>
		</tr>
		<tr>
			<td id="context"><a href="./values.yaml#L9">context</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"context-tag"
</pre>
</div>
			</td>
			<td>Context used to set hostname for backup</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L52">fullnameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L17">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "bitnami/kubectl",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>image used for kubectl command</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L21">image.pullPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"IfNotPresent"
</pre>
</div>
			</td>
			<td>pullPolicy of image used for kubectl command</td>
		</tr>
		<tr>
			<td id="image--repository"><a href="./values.yaml#L19">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"bitnami/kubectl"
</pre>
</div>
			</td>
			<td>repo of image used for kubectl command</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L23">image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>tag of image used for kubectl command</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L50">imagePullSecrets</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L51">nameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="nodeSelector"><a href="./values.yaml#L88">nodeSelector</a></td>
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
			<td id="podAnnotations"><a href="./values.yaml#L63">podAnnotations</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L65">podSecurityContext</a></td>
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
			<td id="resources"><a href="./values.yaml#L76">resources</a></td>
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
			<td id="restic--awsAccessKeyId"><a href="./values.yaml#L35">restic.awsAccessKeyId</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"AWS_ACCESS_KEY_ID"
</pre>
</div>
			</td>
			<td>s3 config access for restic backup</td>
		</tr>
		<tr>
			<td id="restic--awsSecretAccessKey"><a href="./values.yaml#L37">restic.awsSecretAccessKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"AWS_SECRET_ACCESS_KEY"
</pre>
</div>
			</td>
			<td>s3 config access for restic backup</td>
		</tr>
		<tr>
			<td id="restic--backupOptions"><a href="./values.yaml#L41">restic.backupOptions</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"--exclude=/bitnami/wordpress/bin --exclude=/bitnami/wordpress/wp-content/updraft/ /bitnami/wordpress"
</pre>
</div>
			</td>
			<td>restic backup options</td>
		</tr>
		<tr>
			<td id="restic--bunzip2DownloadUrl"><a href="./values.yaml#L27">restic.bunzip2DownloadUrl</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https://busybox.net/downloads/binaries/1.35.0-x86_64-linux-musl/busybox_BUNZIP2"
</pre>
</div>
			</td>
			<td>bzip2 download url to extract restic binary</td>
		</tr>
		<tr>
			<td id="restic--downloadUrl"><a href="./values.yaml#L29">restic.downloadUrl</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https://github.com/restic/restic/releases/download/v0.13.1/restic_0.13.1_linux_amd64.bz2"
</pre>
</div>
			</td>
			<td>restic download url to install binary if not present</td>
		</tr>
		<tr>
			<td id="restic--forgetOptions"><a href="./values.yaml#L39">restic.forgetOptions</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"--keep-last 7 --keep-weekly 5 --prune"
</pre>
</div>
			</td>
			<td>restic forget options</td>
		</tr>
		<tr>
			<td id="restic--password"><a href="./values.yaml#L33">restic.password</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"restic-password"
</pre>
</div>
			</td>
			<td>password of restic backup</td>
		</tr>
		<tr>
			<td id="restic--repository"><a href="./values.yaml#L31">restic.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"s3:s3.amazonaws.com/bucket_name/restic"
</pre>
</div>
			</td>
			<td>repo location of restic backup</td>
		</tr>
		<tr>
			<td id="schedule"><a href="./values.yaml#L6">schedule</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"*/5 * * * *"
</pre>
</div>
			</td>
			<td>Configure the cronjob schedule</td>
		</tr>
		<tr>
			<td id="securityContext"><a href="./values.yaml#L68">securityContext</a></td>
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
			<td id="serviceAccount--annotations"><a href="./values.yaml#L58">serviceAccount.annotations</a></td>
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
			<td>Annotations to add to the service account</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L56">serviceAccount.create</a></td>
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
			<td>Specifies whether a service account should be created</td>
		</tr>
		<tr>
			<td id="serviceAccount--name"><a href="./values.yaml#L61">serviceAccount.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>The name of the service account to use. If not set and create is true, a name is generated using the fullname template</td>
		</tr>
		<tr>
			<td id="suspend"><a href="./values.yaml#L15">suspend</a></td>
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
			<td>Suspend cronjob</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L90">tolerations</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td></td>
		</tr>
	</tbody>
</table>

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
