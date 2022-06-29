#!/bin/bash -x


# Run nexus
grep nexus.onboarding.enabled=false app/etc/nexus.properties || echo nexus.onboarding.enabled=false >> app/etc/nexus.properties
docker run  --name nexus  -d --rm  -p 8081:8081 -v '/Users/nsalman/dev-devops/terraform-backend-test/app:/nexus-data'  sonatype/nexus3:3.33.0

until curl -k --fail -s http://localhost:8081 > /dev/null; do echo -n .; sleep 3; done

# Init password & repository
cat /Users/nsalman/dev-devops/terraform-backend-test/init-artifactory/init.sh  | docker exec  -i  nexus  bash  -

HOST_IP=$(ipconfig getifaddr en0)

# Terraform test
docker run --name terragrunt --add-host=nexus:$HOST_IP -v '/Users/nsalman/dev-devops/terraform-backend-test/terraform-code:/apps' alpine/terragrunt:1.1.2 /apps/init-backend.sh
