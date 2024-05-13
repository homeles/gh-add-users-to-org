# gh-add-users-org

## Introduction

This GitHub CLI extension is designed to automate the process of adding all enterprise members who are not already part of a predefined organization, and skipping those who are. It leverages the GitHub GraphQL API to fetch the list of enterprise members and then iterates over each member to ensure they are added to the specified organization if they are not already a member.

## Installation and Usage

To use this extension, you must have the GitHub CLI installed on your machine. Once you have the GitHub CLI installed, follow these steps:

1. `gh extension install homeles/gh-add-users-to-org`
2. `gh extension install https://github.com/homeles/gh-add-users-to-org`

### Required Parameters

- `ORG_NAME`: The name of the organization you want to add members to.
- `ENTERPRISE_NAME`: The name of your enterprise.
- `SKIP_PATTERN` (optional): A regex pattern to filter out users. Any user whose login matches this pattern will be skipped.

### Command

To add all enterprise members not already in the predefined organization, execute the following command:

```bash
gh add-users-to-org -o ORG_NAME -e ENTERPRISE_NAME [-s SKIP_PATTERN]
```

__Note:__ if you are using GitHub Enterprise Server, the enterprise name is `github`, otherwise use your own enterprise name

Ensure you have set the required parameters in the script before running it.

### Examples:

- Add users to innersource organization, but ignore the users that starts with `bot`
  ```
  gh add-users-to-org -o innersource -e github -s '^bot'
  ```
- Add users to onboarding organization, but ignore the users that starts with `bot` or `generic`
  ```
  gh add-users-to-org -o onboarding -e github -s '^generic|^bot'
  ```
- Add all users to onboarding organization
  ```
  gh add-users-to-org -o onboarding -e github
  ```

## Note

This extension is intended for use with GitHub Enterprise accounts. Ensure you have the necessary permissions to add members to the organization and access enterprise member information.
