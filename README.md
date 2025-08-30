# GitHub Repository Migration Tool

A bash script to migrate repositories from one GitHub account to another using GitHub CLI.

## Overview

This tool automates the process of transferring repositories between GitHub accounts. It uses the GitHub CLI (`gh`) to clone repositories from a source account and push them to a target account while preserving all history, branches, and tags.

## Features

- 🔄 **Mirror cloning**: Preserves complete repository history including all branches and tags
- 🔐 **Private repository support**: Creates private repositories on the target account
- 📊 **Logging**: Tracks successful migrations and failures
- ⚡ **Batch processing**: Handles multiple repositories in sequence
- 🔍 **Duplicate detection**: Skips repositories that already exist on the target account

## Prerequisites

- [GitHub CLI](https://cli.github.com/) installed and authenticated
- Access to both source and target GitHub accounts
- Git installed on your system

## Installation

1. Clone this repository:
```bash
git clone git@github.com:auspicious27/Github-repo-Clone.git
cd Github-repo-Clone
```

2. Make the script executable:
```bash
chmod +x migrate.sh
```

## Configuration

Edit the `migrate.sh` script to set your source and target accounts:

```bash
SOURCE_USER="your-source-username"
TARGET_USER="your-target-username"
```

## Usage

1. Ensure you're authenticated with the target account:
```bash
gh auth switch -u your-target-username
```

2. Run the migration script:
```bash
./migrate.sh
```

## How it Works

1. **Authentication**: Switches to the target GitHub account
2. **Repository Discovery**: Lists all repositories from the source account
3. **Mirror Cloning**: Creates a mirror clone of each repository
4. **Repository Creation**: Creates a new private repository on the target account (if it doesn't exist)
5. **Mirror Push**: Pushes all branches, tags, and history to the target repository
6. **Cleanup**: Removes temporary clone directories
7. **Logging**: Records success/failure status for each repository

## Logs

The script creates a `logs` directory with:
- `success.log`: Successfully migrated repositories
- `failed.log`: Failed migrations with error details

## Example Output

```
🚀 Migrating my-project ...
✅ Created repo: target-user/my-project
✅ Migrated successfully: my-project

🚀 Migrating another-repo ...
ℹ️ Repo already exists: target-user/another-repo (will push updates)
✅ Migrated successfully: another-repo
```

## Security Notes

- The script creates private repositories by default
- Temporary clone directories are automatically cleaned up
- No sensitive data is stored in the logs

## Troubleshooting

### Authentication Issues
```bash
gh auth login
gh auth switch -u your-username
```

### Permission Errors
Ensure you have:
- Read access to source repositories
- Write access to target account
- Proper GitHub CLI authentication

### Clone Failures
- Check network connectivity
- Verify repository names are correct
- Ensure source repositories are accessible

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

If you encounter any issues, please check the logs in the `logs/` directory for detailed error messages.
