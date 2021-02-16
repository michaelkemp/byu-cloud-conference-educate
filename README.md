# Cloud Conference - AWS Educate Accounts

- Logging in
- Creating infrastructure
    - Console
    - Command Line
        - [Python/Boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)
        - [AWS CLI](https://aws.amazon.com/cli/)
        - [Terraform](https://www.terraform.io/)
- Saving money by shutting down EC2 and RDS - [calculator.aws](https://calculator.aws/)
- Saving money by deleting infrastructure
- [Supported Services](https://awseducate-starter-account-services.s3.amazonaws.com/AWS_Educate_Starter_Account_Services_Supported.pdf)
- Limitations - no *Cost Explorer*


## Enable Command Line Connections to your Educate Account

- Log in to [https://www.awseducate.com](https://www.awseducate.com)
    - ![Log in to AWS Educate](images/educate-01.png?raw=true "Log in to AWS Educate")
- Enter your login details
    - ![Enter Login Details](images/educate-02.png?raw=true "Enter Login Details")
- Click the *My Classrooms* link at the top of the page
    - ![Click My Classrooms](images/educate-03.png?raw=true "Click My Classrooms")
- Click the *Go to classroom* button alongside your desired classroom - Click *Continue*
    - ![Click Go to classroom](images/educate-04.png?raw=true "Click Go to classroom")
    - ![Click Continue](images/educate-05.png?raw=true "Click Continue")
- Under the *Your AWS Account Status* area, click the *Account Details* button
    - ![Click Account Details](images/educate-06.png?raw=true "Click Account Details")
- Show the *AWS CLI* information - copy this into your *~/.aws/credentials* file
    - ![Click Show](images/educate-07.png?raw=true "Click Show")
    - ![Copy/Paste](images/educate-08.png?raw=true "Copy/Paste")

## Login to the AWS Console of your Educate Account

- Log in to [https://www.awseducate.com](https://www.awseducate.com)
    - ![Log in to AWS Educate](images/educate-01.png?raw=true "Log in to AWS Educate")
- Enter your login details
    - ![Enter Login Details](images/educate-02.png?raw=true "Enter Login Details")
- Click the *My Classrooms* link at the top of the page
    - ![Click My Classrooms](images/educate-03.png?raw=true "Click My Classrooms")
- Click the *Go to classroom* button alongside your desired classroom - Click *Continue*
    - ![Click Go to classroom](images/educate-04.png?raw=true "Click Go to classroom")
    - ![Click Continue](images/educate-05.png?raw=true "Click Continue")
- Under the *Your AWS Account Status* area, click the *AWS Console* button
    - ![Click AWS Console](images/educate-06a.png?raw=true "Click AWS Console")
- Ensure the *N. Virginia* region (US-East-1) is selected in the top right
    - ![N. Virginia Region](images/educate-09.png?raw=true "N. Virginia Region")


## Command Line Infrastructure - Linux, Mac, Windows (via WSL)

- If you run MS Windows, follow the instuctions below to install WSL
- Terraform is an Infrastructure as Code (IaC) language that allows easy, repeatable creation of infrastructure.
- The terraform scripts in this repo create:
    - Linux EC2 Instances in each US-East-1 Subnet
    - A Key Pair for SSH Access
    - MySQL RDS Instances in each US-East-1 Subnet
    - A Random Password for MySQL Access
    - A Security Group that allows SSH access to the EC2 Instances from Local IP
- Python script to stop/start EC2 and RDS instances via the commandline

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
```
vim .bashrc
    if [ -d "$HOME/.local/bin" ] ; then
        PATH="$HOME/.local/bin:$PATH"
    fi
source .bashrc
```
- Install [Terraform](https://www.terraform.io/downloads.html)
    - ```curl "https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip" -o "terraform.zip"```
    - ```unzip terraform.zip```
    - ```mkdir -p ~/.local/bin```
    - ```mv terraform ~/.local/bin/terraform```
    - ```terraform --version```
