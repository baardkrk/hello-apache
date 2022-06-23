pid_file = "./pidfile"

vault {
  address = "http://vault-dev:8200"
  retry {
    num_retries = 5
  }
}

auto_auth {
  method {
    type = "approle"

    config = {
      // role_id_file_path = "./vault-agent/python-app-role_id"
      // secret_id_file_path = "./vault-agent/python-app-secret_id"
      role_id_file_path = "./vault-agent/super-role_id"
      secret_id_file_path = "./vault-agent/super-secret_id"
      remove_secret_id_file_after_reading = false
    }

    sink {
      type = "file"
      config = {
        path = "./vault-agent/token"
      }
    }
  }
}

cache {
  user_auto_auth_token = true
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = true
}

# Python application secrets
template {
  source = "/app-conf/pyvars.env.tpl"
  destination = "/app-conf/pyvars.env"
}

template {
  source = "/app-conf/pyconf.json.tpl"
  destination = "/app-conf/pyconf.json"
}

# Website secrets
template {
  source = "/my-website/diary-credentials.html.tpl"
  destination = "/my-website/public-html/diary-credentials.html"
}
