#!/bin/bash

# This script adds all enterprise members not already in a predefined organization using GitHub CLI and GraphQL API

# Define variables
ORG_NAME="predefined_organization"
ENTERPRISE_NAME="your_enterprise"
GITHUB_TOKEN="your_github_token"

# Fetch all enterprise members
MEMBERS=$(gh api graphql -f query='
  query($enterprise: String!) {
    enterprise(slug: $enterprise) {
      members(first: 100) {
        nodes {
          login
        }
      }
    }
  }' --paginate -f enterprise="$ENTERPRISE_NAME" -H "Authorization: bearer $GITHUB_TOKEN" | jq -r '.data.enterprise.members.nodes[].login')

# Loop through each member
for MEMBER in $MEMBERS; do
  # Check if the member is already part of the organization
  if gh api orgs/$ORG_NAME/members/$MEMBER -H "Authorization: bearer $GITHUB_TOKEN" >/dev/null 2>&1; then
    echo "$MEMBER is already a member of $ORG_NAME."
  else
    # Add member to the organization
    gh api -X PUT orgs/$ORG_NAME/memberships/$MEMBER -f role="member" -H "Authorization: bearer $GITHUB_TOKEN"
    if [ $? -eq 0 ]; then
      echo "$MEMBER added to $ORG_NAME successfully."
    else
      echo "Failed to add $MEMBER to $ORG_NAME."
    fi
  fi
done
