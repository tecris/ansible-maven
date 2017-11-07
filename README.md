# Maven ansible role


[![Build Status](https://travis-ci.org/tecris/ansible-maven.svg?branch=master)](https://travis-ci.org/tecris/ansible-maven)


Role Variables
--------------

[defaults/main.yml](defaults/main.yml)

|*Variable*  | *Default Value* |*Description* |
| --- | --- | --- |
| maven_major | 3 | MAJOR [version](http://semver.org/) |
| maven_version | 3.5.2 | Version number|
| maven_home_parent_directory | /opt | MAVEN_HOME parent directory|
| maven_download_url |http://www.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz| |
|maven_download_username||proxy/mirror username|
|maven_download_password||proxy/mirror password|

Installation
------------

 `$ ansible-galaxy install tecris.maven             # latest version`
 
 `$ ansible-galaxy install tecris.maven,17.10.28    # specific version`

Example Playbook
----------------
```
 - hosts: all
   roles:
     - { role: tecris.maven, maven_major: 3, maven_release: 3.5.2, maven_home_parent_directory: /opt }
```
Tests
-----
References:
 - [Ansible role testing](http://www.jeffgeerling.com/blog/testing-ansible-roles-travis-ci-github)
 - [Ansible apache role](https://github.com/geerlingguy/ansible-role-apache)
 - [Testing on different OSs with Docker](https://www.jeffgeerling.com/blog/2016/how-i-test-ansible-configuration-on-7-different-oses-docker)
