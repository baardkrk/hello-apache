{{ with secret "kv/app/deployment/python-demo/config" -}}
{{ .Data.data | toJSONPretty }}
{{- end }}
