{{/*
Expand the name of the chart.
*/}}
{{- define "zora-saas.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "zora-saas.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "zora-saas.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "zora-saas.labels" -}}
helm.sh/chart: {{ include "zora-saas.chart" . }}
{{ include "zora-saas.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "zora-saas.selectorLabels" -}}
app.kubernetes.io/name: {{ include "zora-saas.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
UI Selector labels
*/}}
{{- define "zora-saas.uiSelectorLabels" -}}
app.kubernetes.io/name: {{ include "zora-saas.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: ui
{{- end }}

{{/*
Admin Selector labels
*/}}
{{- define "zora-saas.adminSelectorLabels" -}}
app.kubernetes.io/name: {{ include "zora-saas.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: admin
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "zora-saas.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "zora-saas.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
