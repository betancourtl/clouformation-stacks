#!/bin/bash

config=$(jq '.' ./config.json)
REGION=$(echo $config | jq -r '.region')
STACK_NAME=$(echo $config | jq -r '.stackName')

TEMPLATE_BODY="file://$PWD/template.yaml"
TEMPLATE_PARAMETERS="file://$PWD/parameters.json"

# Create Stack
function create_stack() {
  aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body $TEMPLATE_BODY \
    --parameters $TEMPLATE_PARAMETERS \
    --region $REGION
}

# Update Stack
function update_stack() {
  echo "Updating $STACK_NAME stack"
  aws cloudformation update-stack \
    --stack-name $STACK_NAME \
    --template-body $TEMPLATE_BODY \
    --parameters $TEMPLATE_PARAMETERS \
    --region $REGION
}

# Delete Stack
function delete_stack() {
  echo "Deleting $1 stack"
  aws cloudformation delete-stack \
    --stack-name $STACK_NAME
}

function describe_stack_events() {
  echo "Describing stack"
  aws cloudformation describe-stack-events \
    --stack-name $STACK_NAME
}

# cancels an update operation
function cancel_update() {
  aws cloudformation cancel-update-stack \
    --stack-name $STACK_NAME
}

function estimate_costs() {
  aws cloudformation estimate-template-cost \
    --template-body $TEMPLATE_BODY \
    --parameters $TEMPLATE_PARAMETERS
}

"$@"

# describe-stack-events
# describe-stacks
# list-exports
# list-imports
# list-stacks
