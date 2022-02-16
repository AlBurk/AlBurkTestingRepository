#!/bin/bash

terraform init
terraform apply 


IP=$(./getip.sh pass_app)

curl -X POST http://"$IP":5000/p -H 'Content-Type: application/json' -d '{ "letters":"yes", "digits":"yes", "specialcharacter":"yes", "length":"10", "passwords":""}'
