# gh-add-users-org

## Introduction

This GitHub CLI extension is designed to automate the process of adding all enterprise members who are not already part of a predefined organization, and skipping those who are. It leverages the GitHub GraphQL API to fetch the list of enterprise members and then iterates over each member to ensure they are added to the specified organization if they are not already a member.

## Installation and Usage

To use this extension, you must have the GitHub CLI installed on your machine. Once you have the GitHub CLI installed, follow these steps:

1. gh extension install 

### Required Parameters

- `ORG_NAME`: The name of the organization you want to add members to.
- `ENTERPRISE_NAME`: The name of your enterprise.

### Command

To add all enterprise members not already in the predefined organization, execute the following command:

```bash
gh add-users-to-org -o ORG_NAME -e ENTERPRISE_NAME
```

Ensure you have set the required parameters in the script before running it.

## Dependencies

Please refer to the `requirements.txt` file for a list of dependencies required to run this extension.

## Note

This extension is intended for use with GitHub Enterprise accounts. Ensure you have the necessary permissions to add members to the organization and access enterprise member information.
