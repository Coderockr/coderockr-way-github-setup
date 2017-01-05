#!/bin/bash

function getHelp {
    echo "Setup repository labels

    --help, -h      Show this help
    --user, -u      GitHub username
    --password, -p  GitHub password
    --verbose, -v   Details process

Usage:
    $0 -u githubUser -p githubPassword owner/repo
    "
}

function github_api {
    curl -u "$GITHUB_USERNAME:$GITHUB_PASSWORD" -sL "https://api.github.com/repos/$GITHUB_REPO/$1" -X "$2" -d "$3"
}

VERBOSE=0
args=("$@")
for i in "$@"
do
    if [ ! -z "$counter" ] && [[ "$counter" != "$readed_counter" ]]; then
        counter=$[$counter + 1]
        continue
    fi

    if [[ "$i" = "--help" ]] || [[ "$i" = "-h" ]]; then
       printf "$(getHelp)"
       exit 0
    elif [[ $i == '--user' ]] || [[ $i == '-u' ]]; then
        GITHUB_USERNAME=${args[$counter + 1]}
        readed_counter=$[$readed_counter + 1]
   elif [[ $i == '--password' ]] || [[ $i == '-p' ]]; then
        GITHUB_PASSWORD=${args[$counter + 1]}
        readed_counter=$[$readed_counter + 1]
    elif [[ $i == '--verbose' ]] || [[ $i == '-v' ]]; then
 	VERBOSE=1
    else
	GITHUB_REPO=$i
    fi

    readed_counter=$[$readed_counter + 1]
    counter=$[$counter + 1]
done

if [ -z "$GITHUB_REPO" ]; then
    read -p "Type your Github repository name (owner/repo_name): " GITHUB_REPO
fi

if [ -z "$GITHUB_USERNAME" ]; then
    read -p "Type your Github username: " GITHUB_USERNAME
fi

if [ -z "$GITHUB_PASSWORD" ]; then
    read -p "Type your Github password (won't be shown): " -s GITHUB_PASSWORD
    echo;
fi

if [ -z "$GITHUB_USERNAME" ] || [ -z "$GITHUB_REPO" ]; then
    >&2 echo "There are missing parameters !"
    >&2 printf "$(getHelp)"
    exit 1
fi

REMOVE_DEFAULT_LABELS='bug
duplicate
enhancement
help%20wanted
invalid
question
wontfix'

LABELS='Category: Backend,c2e0c6
Category: Business/Meetings,0e8a16
Category: DevOps,fef2c0
Category: Frontend,bfdadc
Category: Unit test,ededed
Priority: High,fef2c0
Priority: Highest,b60205
Priority: Low,d4c5f9
Priority: Lowest,ededed
Priority: Medium,d4c5f9
Stage: Analysis,e6e6e6
Stage: Backlog,ededed
Stage: In progress,fbca04
Stage: Review,0052cc
Stage: Testing,e616e6
Status: Blocked,d93f0b
Status: Duplicated,c5def5
Status: Impediment,b60205
Type: Bug,fc2929
Type: Improvement,84b6eb
Type: New feature,0052cc
Type: Sub-task,ededed'

if [[ "$VERBOSE" == 1 ]]; then 
   echo "Removing default labels"
fi

while read -r label; do
    response=$(github_api "labels/$label" DELETE)
    if [[ "$response" == *"message"* ]]; then
        if [[ ! "$response" == *"Not Found"* ]]; then
            echo "Error removing \"$label\": $response"
        fi
    elif  [[ "$VERBOSE" == 1 ]]; then 
        echo "Label \"$label\" removed"
    fi
done <<< "$REMOVE_DEFAULT_LABELS"

if [[ "$VERBOSE" == 1 ]]; then 
    echo "Creating new labels"
fi

while read -r label; do
    label_name=$(echo $label | cut -d , -f 1)
    label_color=$(echo $label | cut -d , -f 2)
    response=$(github_api labels POST "{\"name\": \"$label_name\", \"color\":\"$label_color\"}")

    if [[ "$response" == *"errors"* ]]; then
        if [[ ! "$response" == *"already_exists"* ]]; then
            >&2 echo "Error on creating: $label_name, response: $response"
        fi
    elif [[ "$VERBOSE" == 1 ]]; then 
         echo "Label \"$label_name\" created"
    fi
done <<< "$LABELS"

