{{- define "sampleapi.fullname" -}}
{{- if .Values.nameOverride }}{{ .Values.nameOverride }}
{{- else }}{{ include "sampleapi.chartname" . }}
{{- end -}}
{{- end -}}

{{- define "sampleapi.chartname" -}}
{{- default .Chart.Name .Values.chartNameOverride }}
{{- end -}}