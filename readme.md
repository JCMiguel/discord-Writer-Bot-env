## Writer-Bot Development Environment

This repo contains the development environment needed to work on Writer-Bot and contribute to the project.

It uses a docker container, so you will need to make sure docker is installed on your machine before using this.

## Setup
1) Head over to the [Discord Developer](https://discord.com/developers/applications) page and create yourself an Application. I suggest calling it something like "yourusername-Writer-Bot", e.g. "CMR-Writer-Bot".
2) Once you've made an application, add a Bot to it. Uncheck the "Public Bot" box so that other people cannot add your bot to a server. 
3) Clone down this repo to your machine 
    
    `git clone https://github.com/cwarwicker/discord-Writer-Bot-env`
4) Update the submodules, to checkout the latest version of the Writer-Bot code.

    `git submodule update --init --recursive`
    
5) Go back to your Bot on your Discord Developer - Application page and copy the hidden Token.
6) Paste that token into the `"token": "YOUR-TOKEN-HERE",` section of `/templates/settings.json`      
7) Start the container by running `docker-compose up -d`. If it fails to boot up, try removing the `-d` flag to see the full output of what its doing.
8) For development, it is best to run `docker-compose up` without the `-d` flag, then you can just exit the process and run it again when you make code changes, instead of having to run commands to stop the container.

## Notes
- If a new version of the Writer-Bot app code is deployed to its repo, you can sync that into your
development environment by running `git submodule update --remote`, this will update the code in your `/app` directory. Or alternatively just update this repo, as it should have the app update in it as well.

## Submitting Patches
If you wish to submit a patch to the Writer-Bot app code to inclusion in the codebase, create a fork of the [Writer-Bot](https://github.com/cwarwicker/discord-Writer-Bot) repo on github, then in your `/app` directory add your fork as a remote `git remote add fork https://github.com/<username>/discord-Writer-Bot` and push your changes to your forked repo, then it can be used to submit pull requests on the main repo.