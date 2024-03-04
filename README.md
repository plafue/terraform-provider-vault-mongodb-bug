```shell
docker compose up -d

export VAULT_ADDR=http://127.0.0.1:8200 && \
  vault login vault-plaintext-root-token

terraform init && terraform apply
```

Running `terraform plan` after the first `apply` shows how the plan always diverges from the state.