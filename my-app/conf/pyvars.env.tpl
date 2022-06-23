{{ with secret "kv/app/deployment/python-demo/env" -}}
SECRET_USER={{ .Data.data.SECRET_USER }}
SECRET_TOKEN={{ .Data.data.SECRET_TOKEN }}
{{- end }}
