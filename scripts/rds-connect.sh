#!/bin/bash

# via https://reifyhealth.atlassian.net/wiki/spaces/SRE/pages/1551204368/RDS+via+EC2-Connect

set -euxo pipefail

export AWS_PAGER=""
export REGION=us-east-1
export DB_IDENTIFIER=bengal-site-us-east-1-testing
export BASTION=$(aws ec2 describe-instances --region $REGION --filters Name=tag:Name,Values=reify-engineering-bastion | jq -r ".Reservations[0].Instances[0]")
export DB_URL=$(aws rds describe-db-instances --region $REGION --db-instance-identifier $DB_IDENTIFIER | jq -r ".DBInstances[0].Endpoint.Address")
echo -e 'y\n' | ssh-keygen -t rsa -f /tmp/temp -N '' -oAddKeysToAgent=no >/dev/null 2>&1
aws ec2-instance-connect send-ssh-public-key \
    --instance-id "$(echo "$BASTION" | jq -r .InstanceId)" \
    --region "$REGION" \
    --availability-zone "$(echo "$BASTION" | jq -r .Placement.AvailabilityZone)" \
    --instance-os-user ubuntu \
    --ssh-public-key file:///tmp/temp.pub
ssh -L 5432:"$DB_URL":5432 -Nf -i /tmp/temp ubuntu@"$(echo "$BASTION" | jq -r .PublicIpAddress)"

