# This policy allows the python and apache application access to the key/value secrets

path "kv/data/app/deployment/python-demo/*" 
{
  capabilities = [ "read" ]
}
