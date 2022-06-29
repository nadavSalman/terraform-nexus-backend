#!/bin/bash 
set -x
PASSWORD=$(cat /nexus-data/admin.password)
curl -k -v -u admin:$PASSWORD  -H "Content-Type: text/plain" http://localhost:8081/service/rest/v1/security/users/admin/change-password -X PUT -d'Q1w2e3r4t5y6'
curl -k -v -u admin:Q1w2e3r4t5y6 -X PUT "http://localhost:8081/service/rest/v1/security/anonymous" -d'{"enabled": true}'
curl -k -v -u admin:Q1w2e3r4t5y6 -H "Content-Type: application/json" http://localhost:8081/service/rest/v1/repositories/raw/hosted -d'
{
  "name": "terraform",
  "online": true,
  "storage": {
    "blobStoreName": "default",
    "strictContentTypeValidation": true,
    "writePolicy": "allow"
  }
}
'