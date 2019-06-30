# github-scripts

My experiments with the GitHub API to avoid opening the GitHub website, and try to access it from the command line.
Note: These scripts may not work for your use case. They have been curated for my own personal needs.

## Authentication
All scripts make use of a [personal access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line). You need to create one if you intend to use these scripts. Treat the personal access token like a password, don't share it with anyone.
Since the history of commands executed on the command line are stored, our personal access token gets exposed. To avoid this, all the scripts take the authentication token as user input, interactively.

## The scripts
1. [create-repo](./create-repo): This script will create a new repository (handles both local and remote repository creation).
2. [clone-all-repos](./clone-all-repos): This script will clone all the user's public and private repositories.
