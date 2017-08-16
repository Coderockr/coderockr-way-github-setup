Coderockr Way Github Setup
--------------------------
Using this script the GitHub project will setup it to add the basic labels needed to control your issues according with the *Coderockr Way* methodology

You can take a look here: https://github.com/coderockr/coderockr-way-github-setup/labels

How to use
----------
This repository has a script named [`coderockr-way-github-setup.bash`](coderockr-way-github-setup.bash) there are two ways to use it.

You could just call it direct from GitHub using cURL, and it will ask you the info to updated your repository:

```bash
$ bash -c "$(curl -sL https://raw.githubusercontent.com/coderockr/coderockr-way-github-setup/master/coderockr-way-github-setup.bash)"
Type your Github repository name (owner/repo_name): lucassabreu/coderockr-way-github-setup
Type your Github username: lucassabreu
Type your Github password (won't be shown):
```

Or you [install into your machine](#install) and run it directaly setting parameters (or not and it will be asked as shown before):

Usage: `coderockr-way-github-setup -u githubUser -p githubPassword owner/repo`

```
    --user, -u      GitHub username
    --password, -p  GitHub password
    --verbose, -v   Details process
```

Using Github Token
------------------
If you're using github token you must set the environment variable `GITHUB_TOKEN`, then the script will ignore and won't ask for your username and password

Install
-------

To install into your machine just run the commands bellow, and then use the command `coderockr-way-github-setup`.

```sh
curl -sL "https://raw.githubusercontent.com/coderockr/coderockr-way-github-setup/master/coderockr-way-github-setup.bash" -o "/usr/local/bin/coderockr-way-github-setup"
chmod a+x /usr/local/bin/coderockr-way-github-setup
```
