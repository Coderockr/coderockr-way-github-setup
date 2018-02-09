Coderockr Way Github Setup
--------------------------
Using this script your project will be bootstraped with the basic labels needed to control your issues according with the *Coderockr Way* methodology

You can take a look here: https://github.com/coderockr/coderockr-way-github-setup/labels

We now support setting up projects on [GitHub](#github) and [GitLab](#gitlab), click in the links to see more.

How to use
----------

### GitHub

This repository has a script named [`coderockr-way-github-setup.bash`](coderockr-way-github-setup.bash) there are two ways to use it.

 1) You could just call it direct from GitHub using cURL, and it will ask you the info to updated your repository:

```bash
$ bash -c "$(curl -sL https://raw.githubusercontent.com/coderockr/coderockr-way-github-setup/master/coderockr-way-github-setup.bash)"
Type your Github repository name (owner/repo_name): lucassabreu/coderockr-way-github-setup
Type your Github username: lucassabreu
Type your Github password (won't be shown):
```

 2) Or you [install into your machine](#install) and run it directly setting parameters (or not and it will be asked as shown before):

Usage: `coderockr-way-github-setup -u githubUser -p githubPassword owner/repo`

```
    --user, -u      GitHub username
    --password, -p  GitHub password
    --verbose, -v   Details process
```

#### Using Github Token

If you're using github token you must set the environment variable `GITHUB_TOKEN`, then the script will ignore and won't ask for your username and password

### GitLab

Much like the GitHub script, this repository has a script named [`coderockr-way-gitlab-setup.bash`](coderockr-way-gitlab-setup.bash) and there are two ways to use it.

 1) Just run it directly from GitHub using cURL, a GitLab [personal token](https://docs.gitlab.com/ee/api/README.html#personal-access-tokens) and projects name (owner/project) will be asked:

```bash
$ bash -c "$(curl -sL https://raw.githubusercontent.com/coderockr/coderockr-way-gitlab-setup/master/coderockr-way-gitlab-setup.bash)"
Type your GitLab repository name (owner/repo_name): coderockr/awesome-project
Type your GitLab Private-token: <private-token>
```

 2) Or, after [installing it](#gitlab-setup), you can run it directly with parameters (or not and they will be asked as if you were running from GitHub)

Usage: `./coderockr-way-gitlab-setup.bash --token gitlab-private-token [-u http://gitlab.example.com] owner/repo`

```
    --help, -h    Show this help
    --token, -t   GitLab Private-Token (defaults to $GITLAB_TOKEN)
    --url, -u     GitLab base URL (defaults to $GITLAB_URL or https://gitlab.com)
    --verbose, -v Details process
```

Install
-------

To install into your machine just run the commands bellow, and then use the command `coderockr-way-github-setup` or `coderockr-way-gitlab-setup`.

#### GitHub Setup

```sh
curl -sL "https://raw.githubusercontent.com/coderockr/coderockr-way-github-setup/master/coderockr-way-github-setup.bash" -o "/usr/local/bin/coderockr-way-github-setup"
chmod a+x /usr/local/bin/coderockr-way-github-setup
```

#### GitLab Setup

```sh
curl -sL "https://raw.githubusercontent.com/coderockr/coderockr-way-github-setup/master/coderockr-way-gitlab-setup.bash" -o "/usr/local/bin/coderockr-way-gitlab-setup"
chmod a+x /usr/local/bin/coderockr-way-gitlab-setup
```
