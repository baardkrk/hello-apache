#!/bin/bash

export VAULT_ADDR="http://localhost:8200"
export VAULT_TOKEN="root"

vault auth enable approle
# vault write auth/approle/role/python-app token_policies="python-app"
# vault write auth/approle/role/diary token_policies="diary"
vault write auth/approle/role/super token_policies="super"

# Grant the vault agent the python-app role
# vault read -format=json auth/approle/role/python-app/role-id \
#     | jq -r '.data.role_id' > ./vault-agent/python-app-role_id
# vault write -format=json -f auth/approle/role/python-app/secret-id \
#     | jq -r '.data.secret_id' > ./vault-agent/python-app-secret_id

# Grant the vault agent the superrole
vault read -format=json auth/approle/role/super/role-id \
    | jq -r '.data.role_id' > ./vault-agent/super-role_id
vault write -format=json -f auth/approle/role/super/secret-id \
    | jq -r '.data.secret_id' > ./vault-agent/super-secret_id
