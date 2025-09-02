# GitHub Repository Migration Tool

A comprehensive set of bash scripts to migrate, deploy, and manage repositories between GitHub accounts using GitHub CLI.

## Overview

This tool suite automates the process of transferring repositories between GitHub accounts. It includes scripts for migration, deployment tracking, and repository updates. The tools use the GitHub CLI (`gh`) to clone repositories from a source account and push them to a target account while preserving all history, branches, and tags.

## Features

- 🔄 **Mirror cloning**: Preserves complete repository history including all branches and tags
- 🔐 **Private repository support**: Creates private repositories on the target account
- 📊 **Logging**: Tracks successful migrations and failures
- ⚡ **Batch processing**: Handles multiple repositories in sequence
- 🔍 **Duplicate detection**: Skips repositories that already exist on the target account
- 🚀 **Deployment tracking**: Monitors and logs deployed projects
- 🔄 **Repository updates**: Automated repository synchronization

## Scripts Overview

### 1. `migrate.sh` - Main Migration Script
The primary script for migrating repositories from one GitHub account to another.

### 2. `deploy-all.sh` - Deployment Script
Script for deploying all migrated repositories with additional configuration.

### 3. `update_repos.sh` - Repository Update Script
Script for updating existing repositories with latest changes from source.

### 4. `deployed_projects.txt` - Deployment Log
Text file tracking all successfully deployed projects.

## Prerequisites

- [GitHub CLI](https://cli.github.com/) installed and authenticated
- Access to both source and target GitHub accounts
- Git installed on your system
- Bash shell environment

## Installation

1. Clone this repository:
```bash
git clone git@github.com:auspicious27/Github-repo-Clone.git
cd Github-repo-Clone
```

2. Make all scripts executable:
```bash
chmod +x migrate.sh deploy-all.sh update_repos.sh
```

## Configuration

Edit the scripts to set your source and target accounts:

### migrate.sh
```bash
SOURCE_USER="your-source-username"
TARGET_USER="your-target-username"
```

### deploy-all.sh
```bash
# Configure deployment settings
SOURCE_USER="your-source-username"
TARGET_USER="your-target-username"
```

### update_repos.sh
```bash
# Configure update settings
SOURCE_USER="your-source-username"
TARGET_USER="your-target-username"
```

## Usage

### 1. Initial Migration
1. Ensure you're authenticated with the target account:
```bash
gh auth switch -u your-target-username
```

2. Run the migration script:
```bash
./migrate.sh
```

### 2. Deploy All Projects
After migration, deploy all projects:
```bash
./deploy-all.sh
```

### 3. Update Existing Repositories
To update repositories with latest changes:
```bash
./update_repos.sh
```

## How it Works

### Migration Process (`migrate.sh`)
1. **Authentication**: Switches to the target GitHub account
2. **Repository Discovery**: Lists all repositories from the source account
3. **Mirror Cloning**: Creates a mirror clone of each repository
4. **Repository Creation**: Creates a new private repository on the target account (if it doesn't exist)
5. **Mirror Push**: Pushes all branches, tags, and history to the target repository
6. **Cleanup**: Removes temporary clone directories
7. **Logging**: Records success/failure status for each repository

### Deployment Process (`deploy-all.sh`)
1. **Reads deployed projects**: Loads list of successfully migrated repositories
2. **Deployment execution**: Runs deployment commands for each project
3. **Status tracking**: Updates deployment status and logs

### Update Process (`update_repos.sh`)
1. **Repository synchronization**: Updates existing repositories with latest changes
2. **Conflict resolution**: Handles merge conflicts and updates
3. **Status verification**: Ensures updates are successful

## Logs and Tracking

The scripts create comprehensive logging:

### migrate.sh
- `logs/success.log`: Successfully migrated repositories
- `logs/failed.log`: Failed migrations with error details

### deploy-all.sh
- `deployed_projects.txt`: List of successfully deployed projects
- Deployment status logs

### update_repos.sh
- Update status logs
- Conflict resolution logs

## Example Output

### Migration
```
🚀 Migrating my-project ...
✅ Created repo: target-user/my-project
✅ Migrated successfully: my-project

🚀 Migrating another-repo ...
ℹ️ Repo already exists: target-user/another-repo (will push updates)
✅ Migrated successfully: another-repo
```

### Deployment
```
🚀 Deploying project: my-project
✅ Deployment successful: my-project
📝 Added to deployed_projects.txt
```

### Updates
```
🔄 Updating repository: my-project
✅ Update successful: my-project
```

## Security Notes

- The scripts create private repositories by default
- Temporary clone directories are automatically cleaned up
- No sensitive data is stored in the logs
- Authentication tokens are handled securely through GitHub CLI

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

### Deployment Issues
- Check deployment configuration
- Verify target environment setup
- Review deployment logs

## File Structure

```
Github-repo-Clone/
├── migrate.sh              # Main migration script
├── deploy-all.sh           # Deployment script
├── update_repos.sh         # Repository update script
├── deployed_projects.txt   # Deployment tracking file
├── README.md              # This documentation
└── logs/                  # Migration logs directory
    ├── success.log        # Successful migrations
    └── failed.log         # Failed migrations
```

## Contributing

Feel free to submit issues and enhancement requests! 

### Development Guidelines
- Test scripts in a safe environment first
- Update documentation when adding new features
- Follow bash scripting best practices
- Add proper error handling and logging

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

If you encounter any issues:
1. Check the logs in the `logs/` directory for detailed error messages
2. Verify your GitHub CLI authentication
3. Ensure you have proper permissions on both source and target accounts
4. Review the troubleshooting section above

## Recent Updates

- Added comprehensive deployment tracking
- Implemented repository update functionality
- Enhanced logging and error handling
- Improved documentation and usage examples
