# Cloud Conference - AWS Educate Accounts


## Logging in to AWS Educate Console

- Log in to [https://www.awseducate.com](https://www.awseducate.com)
- Click the *My Classrooms* link at the top of the page
- Click the *Go to classroom* button alongside your desired classroom - Click *Continue*
- Under the *Your AWS Account Status* area, click the *AWS Console* button to log into the console.
    - At the top right; ensure the region you are in is *N. Virginia*


## Enable Command Line Connections to your Educate Account

- Log in to [https://www.awseducate.com](https://www.awseducate.com)
- Click the *My Classrooms* link at the top of the page
- Click the *Go to classroom* button alongside your desired classroom - Click *Continue*
- Under the *Your AWS Account Status* area, click the *Account Details* button
- Show the *AWS CLI* information - copy this into your *~/.aws/credentials* file
    - Open the terminal in Mac/Linux or open WSL in MS Windows 
    - ```mkdir ~/.aws```
    - ```vim ~/.aws/credentials```
        - ```
            [default]
            aws_access_key_id=QWERTYUIOPASDFGHJKL
            aws_secret_access_key=tHisIsnOtanActUal/Key
            aws_session_token=Vy0suaL4NT1PrSLaPLZAT8fgbNpwhw07ByUvBZ6F0BSITkbUyrIOFUdQu6HDYVhskoQt4OGvTzi0PdLQwvI8FNnMrkESlFxeLSxVy0suaL4NT1PrSLaPLZAT8fgbNpwhw07ByUvBZ6F0BSITkbUyrIOFUdQu6HDYVhskoQt4OGvTzi0PdLQwvI8FNnMrkESlFxeLSxVy0suaL4NT1PrSLaPLZAT8fgbNpwhw07ByUvBZ6F0BSITkbUyrIOFUdQu6HDYVhskoQt4OGvTzi0PdLQwvI8FNnMrkESlFxeLSx

## Linux, Mac, Windows (via WSL)

- If you run MS Windows, follow the instuctions below to install WSL
- Terraform is an Infrastructure as Code (IaC) language that allows easy, repeatable creation of infrastructure.
- The terraform scripts in this repo create:
    - A Linux Instance in the Private Subnet
    - An RDS Database
    - The security groups

## Setting Up Windows with Windows Subsystem for Linux (WSL)

- Enable [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- Install *Ubuntu 18.04 LTS* from the Microsoft Store
    - You will be asked for a Username and Password; this does not need to be the same as your Windows username/password

## Install AWS Command Line Tool and Terraform

- Open (WSL) Ubuntu - or your command prompt on Linux/Mac
- Add unzip
    - ```sudo apt install unzip -y```
- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
    - ```curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"```
    - ```unzip awscliv2.zip```
    - ```sudo ./aws/install```
    - ```aws --version```
- Add $HOME/.local/bin to path
    - ```
        vim .bashrc
            if [ -d "$HOME/.local/bin" ] ; then
                PATH="$HOME/.local/bin:$PATH"
            fi
        source .bashrc
- Install [Terraform](https://www.terraform.io/downloads.html)
    - ```curl "https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip" -o "terraform.zip"```
    - ```unzip terraform.zip```
    - ```mkdir -p ~/.local/bin```
    - ```mv terraform ~/.local/bin/terraform```
    - ```terraform --version```
