#!/bin/bash
export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="root"

# Write policies
vault policy write python-app ./.policies/app.hcl
vault policy write diary ./.policies/diary.hcl
vault policy write super ./.policies/super.hcl

# Enable kv engine and create secrets
vault secrets enable -version=2 kv
vault kv put kv/web/deployments/diary-creds username="personal-user" password="SuP3rs3cRe7"

vault kv put kv/app/deployment/python-demo/env SECRET_USER="my-python-app" SECRET_TOKEN="12345678910og1112"
vault kv put kv/app/deployment/python-demo/config @./.scripts/config.json

