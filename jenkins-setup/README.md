# Jenkins Setup Notes

# Server Profile

```
Linux/Unix
26 blueprints

Ubuntu
20.04 LTS

$3.50 USD
512 MB
1 vCPU
20 GB SSD
1 TB

Identify your instance
Ubuntu-2 

Key-only tags
jenkins-server
```

create swap drive first! Otherwise, it's going to be problems. 
https://gist.github.com/stancsz/13546aebcfdbd19e1756939333097ffb


# Jenkins Setup

SSH

```
sudo apt update
sudo apt search openjdk
sudo apt install openjdk-8-jdk

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins

sudo systemctl start jenkins
sudo systemctl status jenkins
sudo vi /var/lib/jenkins/secrets/initialAdminPassword
```

slow performance issue

```
sudo vi /etc/default/jenkins
# then uncomment
JAVA_ARGS="-Xmx256m"
```


login to <server-ip>: 8080, 

create admin user,

Instance configuration. Jenkins URL: 

```
http://54.185.156.100:8080/
```

Jenkins is ready.



# Create Credential

Jenkins, manage jenkins, manage credentials

```
Jenkins
Credentials
System
Global credentials (unrestricted)

```



```
Kind	
	Username with password
Scope	
	Global (Jenkins, nodes, items, all child items, etc)
Username	
	gh-username
Password	
	••••••••••••••••••••••••••••••••••••••••
ID	
Description	
	github-pat
```





# GitHub Generate PAT

if not available, make sure to install plugin `GitHub Authentication`

```
GitHub
Settings/Developer settings
Personal access tokens


New personal access token
Personal access tokens function like ordinary OAuth access tokens. They can be used instead of a password for Git over HTTPS, or can be used to authenticate to the API over Basic Authentication.

Note
cloudJenkins
What’s this token for?

Select scopes
Scopes define the access for personal tokens. Read more about OAuth scopes.
 x repo Full control of private repositories
     x repo:status Access commit status
     x repo_deployment Access deployment status
     x public_repo Access public repositories
     x repo:invite Access repository invitations
	 x security_events Read and write security events
 x workflow Update github action workflows
```





# Create Job

```
Create a job to start building your software project.

Freestyle project
	This is the central feature of Jenkins. Jenkins will build your project, combining any SCM with any build system, and this can be even used for something other than software build.
```

##### name

```
Enter an item name
	toolshop_staging
» Required field
```

##### Source Code Management

```
Source Code Management
None	
Git	
Repositories	
Repository URL	
	https://github.com/stancsz/ensf607_608_project_fall2020.git
Credentials	
	stancsz/****** (github-pat)

Branches to build	
Branch Specifier (blank for 'any')	
	*/staging

Repository browser	
	(Auto)
Additional Behaviours	
```



# Build Execute shell

before running ci/cd server, make sure maven is installed through ssh

```
sudo apt install maven
```



```
Build Execute shell
Command	

​```
mvn -v
echo "building maven package"
mvn package
echo "initing server"
java -cp target/toolshop-server-1.0-SNAPSHOT.jar server.controller.ServerController 
​```


See the list of available environment variables
```



---

# Extra Notes

> ##### Setup Note
>
> Go to port after install
>
> ```
> http://localhost:8080/
> ```
>
> 
>
> #### Connect to GitHub
>
> ##### GitHub Personal Access Tokens
>
> Generate a token under:
>
> ```
> Settings / Developer settings / Personal access token / New personal access token
> ```
>
> the generated token looks like a hash string, store this safely. example:
>
> ```
> 263604fcf22eb870452d1ddafc072cefd5841d37
> ```
>
> ##### Setup token in Jenkins
>
> Go to `Jenkins`
>
> - Go to `credentials` > `System` > `Global credentials` > `Add credentials` a page will open.
> - In **Kind** drop-down select **Username and password**.
> - In User put a non-existing username like `jenkins-user` or `user`.
> - Add `Personal Access Token` in the password field
>
> extras
>
> - [source](https://stackoverflow.com/questions/61105368/how-to-use-github-personal-access-token-in-jenkins)
>
> - [alternative method](https://plugins.jenkins.io/github/)
>
> - [github jenkins plugin](https://plugins.jenkins.io/github-oauth/)
>
> note: when adding repo url, it has to be the **git https url** i.e. [(ref)](https://dzone.com/articles/deploying-machine-learning-workflows-on-lke-with-k)
>
> ```
> https://github.com/stancsz/ensf607_608_project_fall2020.git
> ```
>
> 
>
> ##### Extra setup guide
>
> [guru99 source