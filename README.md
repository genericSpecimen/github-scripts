# github-scripts

My experiments with the GitHub API to avoid opening the GitHub website to perform simple tasks.

Note: These scripts may not be the best possible solution for your use case. They have been curated for my own personal needs.

## Authentication
All scripts make use of a [personal access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line). You need to create one if you intend to use these scripts. Treat the personal access token like a password, don't share it with anyone.
Since the history of commands executed on the command line are stored, our personal access token gets exposed. To avoid this, all the scripts take the authentication token as user input, interactively.

I always use SSH URLs, so if you intend to use this with HTTPS URLs, you may need to make some tweaks in some scripts.

## The scripts
1. [create-repo](./create-repo.sh): This script will create a new repository (handles both local and remote repository creation).
2. [clone-all-repos](./clone-all-repos.sh): This script will clone all the user's public and private repositories. Make sure your personal access token has the `repo` scope in order to clone private repositories too.
3. [delete-repo](./delete-repo.sh): *WARNING*: This is a dangerous script. It deletes a single repository. It will delete both your local AND remote copies. Use at your own risk. Make sure your personal access token has the `delete_repo` scope.

## Running

Simply make the script executable, using
`chmod +x script.sh`
You can place it wherever you like. If the script is in the current working directory, run it using:
`./script.sh`
