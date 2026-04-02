{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "app.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "app.labels" -}}
app: {{ include "app.fullname" . }}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: frontend
{{- end }}

{{/*
Selector labels
*/}}
{{- define "app.selectorLabels" -}}
app: {{ include "app.fullname" . }}
{{- end }}

{{/*
Service account name
*/}}
{{- define "app.serviceAccountName" -}}
{{ include "app.fullname" . }}
{{- end }}

{{/*
Database fullname — references the sibling db subchart
*/}}
{{- define "app.dbFullname" -}}
{{- printf "%s-db" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
