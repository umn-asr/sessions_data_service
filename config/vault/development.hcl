
auto_auth {

  method {
    type = "token_file"

    config {
      token_file_path = "/home/vault/.vault-token"
    }
  }
}

exit_after_auth = true

vault {
  address = "$VAULT_ADDR"
  namespace = "$VAULT_NAMESPACE"
  retry {
    num_retries = 1
  }
}

template_config {
  exit_on_retry_failure = true
}

template {
  source      = "config/database.development.yml.ctmpl"
  destination = "config/database.yml"
  error_on_missing_key = true
}
