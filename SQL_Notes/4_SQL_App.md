# SQL
### This Page Of Notes Covers The Following:
    - Introducing Node.js
    - Building a Web App
    - Database Triggers

***********************************************

## Node.js

****************************************************

### [MySQL & Other Languages](http://webdev.slides.com/coltsteele/mysql-105#/)

***MySQL works with the following***
    - [PHP](https://www.php.net)
    - [Node](https://nodejs.org/en/)
    - [Ruby](https://www.ruby-lang.org/en/)
    - [C#](https://docs.microsoft.com/en-us/dotnet/csharp/)
    - [C++](http://www.cplusplus.com)
    - [Java](https://www.java.com/en/)
    - [Python](https://www.python.org)

***How does Node talk with MySQL***
    - When navigating to a website
    - A request is made through NodeJS, PHP, etc
    - The code then communicates with the MySQL DB
    - A result then comes back to the programming language
    - The programming language then complies the information in the form of a website and sends back to the client

****************************************************

### What about PHP

***Why using NodeJS instead of PHP***
    - [StackOverflow Developer Survey](https://insights.stackoverflow.com/survey/2019)

****************************************************

### Introduction to JOIN US app

- Startup Mailing List Application

****************************************************

### Setting up AWS Node environment

- Opened Cloud9 console in AWS
- Created new environment
- Install [Node into AWS](https://medium.com/@nishankjaintdk/setting-up-a-node-js-app-on-a-linux-ami-on-an-aws-ec2-instance-with-nginx-59cbc1bcc68c)
- Install [MySQL into AWS](https://support.rackspace.com/how-to/installing-mysql-server-on-ubuntu/)

--------------------------------------------

    ubuntu:~/environment (master) $ npm init
    This utility will walk you through creating a package.json file.
    It only covers the most common items, and tries to guess sensible defaults.

    See `npm help json` for definitive documentation on these fields
    and exactly what they do.

    Use `npm install <pkg>` afterwards to install a package and
    save it as a dependency in the package.json file.

    Press ^C at any time to quit.
    package name: (environment) 
    version: (1.0.0) 
    description: NodeJS & MySQL
    entry point: (app.js) 
    test command: 
    git repository: 
    keywords: 
    author: Kristofer Fonagy
    license: (ISC) 
    About to write to /home/ubuntu/environment/package.json:

    {
      "name": "environment",
      "version": "1.0.0",
      "description": "NodeJS & MySQL",
      "main": "app.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "Kristofer Fonagy",
      "license": "ISC"
    }


    Is this OK? (yes) 

    ubuntu:~/environment (master) $ node --version
    v12.0.0

    ubuntu:~/environment (master) $ nvm install node
    Downloading https://nodejs.org/dist/v12.0.0/node-v12.0.0-linux-x64.tar.xz...
    ################################################################################################################################################################## 100.0%
    Now using node v12.0.0 (npm v6.9.0)

    ubuntu:~/environment (master) $ sudo apt-get update
    Hit:1 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic InRelease
    Get:2 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]   
    Get:3 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB] 
    Get:4 https://download.docker.com/linux/ubuntu bionic InRelease [64.4 kB]                                           
    Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]                                         
    Get:6 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [592 kB]
    Get:7 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/main Translation-en [218 kB]            
    Get:8 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [863 kB]                       
    Get:9 http://us-east-2.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe Translation-en [262 kB]             
    Get:10 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [325 kB]                                  
    Get:11 http://security.ubuntu.com/ubuntu bionic-security/main Translation-en [117 kB]
    Get:12 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [241 kB]
    Get:13 http://security.ubuntu.com/ubuntu bionic-security/universe Translation-en [138 kB]
    Fetched 3072 kB in 2s (1922 kB/s)       
    Reading package lists... Done

    ubuntu:~/environment (master) $ sudo apt-get install mysql-server
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    mysql-server is already the newest version (5.7.25-0ubuntu0.18.04.2).
    The following packages were automatically installed and are no longer required:
      gyp javascript-common libc-ares2 libhttp-parser2.7.1 libjs-async libjs-inherits libjs-jquery libjs-node-uuid libjs-underscore libuv1-dev node-abbrev node-ansi
      node-ansi-color-table node-archy node-async node-balanced-match node-block-stream node-brace-expansion node-builtin-modules node-combined-stream node-concat-map
      node-cookie-jar node-delayed-stream node-forever-agent node-form-data node-fs.realpath node-fstream node-fstream-ignore node-github-url-from-git node-glob
      node-graceful-fs node-hosted-git-info node-inflight node-inherits node-ini node-is-builtin-module node-isexe node-json-stringify-safe node-lockfile node-lru-cache
      node-mime node-minimatch node-mkdirp node-mute-stream node-node-uuid node-nopt node-normalize-package-data node-npmlog node-once node-osenv node-path-is-absolute
      node-pseudomap node-qs node-read node-read-package-json node-request node-retry node-rimraf node-semver node-sha node-slide node-spdx-correct
      node-spdx-expression-parse node-spdx-license-ids node-tar node-tunnel-agent node-underscore node-validate-npm-package-license node-which node-wrappy node-yallist
      nodejs nodejs-doc
    Use 'sudo apt autoremove' to remove them.
    0 upgraded, 0 newly installed, 0 to remove and 27 not upgraded.

    ubuntu:~/environment (master) $ mysql --version
    mysql  Ver 14.14 Distrib 5.7.25, for Linux (x86_64) using  EditLine wrapper

***************************************************

### Faker Install

- Steps to install [Faker](https://github.com/marak/Faker.js/) npm


-------------------------------------

    ubuntu:~/environment (master) $ npm install faker
    npm notice created a lockfile as package-lock.json. You should commit this file.
    npm WARN environment@1.0.0 No repository field.

    + faker@4.1.0
    added 1 package from 1 contributor and audited 1 package in 0.972s
    found 0 vulnerabilities

*******************************************

### MySQL Package

- [MySQL Node Package Github Repo](https://github.com/mysqljs/mysql)

-----------------------------------------

    ubuntu:~/environment (master) $ npm install mysql
    npm WARN environment@1.0.0 No repository field.

    + mysql@2.17.1
    added 9 packages from 14 contributors and audited 136 packages in 6.088s
    found 0 vulnerabilities

    ubuntu:~/environment (master) $ npm install mysqljs/mysql
    npm WARN environment@1.0.0 No repository field.

    + mysql@2.17.1
    updated 1 package and audited 136 packages in 2.714s
    found 0 vulnerabilities

    ubuntu:~/environment (master) $ sudo systemctl start mysql
    ubuntu:~/environment (master) $ sudo systemctl enable mysql
    Synchronizing state of mysql.service with SysV service script with /lib/systemd/systemd-sysv-install.
    Executing: /lib/systemd/systemd-sysv-install enable mysql
    ubuntu:~/environment (master) $ sudo /usr/bin/mysql -u root -p
    Enter password: 
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2
    Server version: 5.7.25-0ubuntu0.18.04.2 (Ubuntu)

    Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql> 

********************************************



