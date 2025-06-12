{{- define "sampleapi.fullname" -}}
{{- if .Values.global.nameOverride }}{{ .Values.global.nameOverride }}
{{- else }}{{ include "sampleapi.chartname" . }}
{{- end -}}
{{- end -}}

{{- define "sampleapi.chartname" -}}
{{- default .Chart.Name .Values.global.chartNameOverride }}
{{- end -}}