# Maven ansible role


[![Build Status](https://travis-ci.org/tecris/ansible-maven.svg?branch=master)](https://travis-ci.org/tecris/ansible-maven)


Role Variables
--------------

[defaults/main.yml](defaults/main.yml)

|*Variable*  | *Description* |
| ------------- | ------------- |
| maven_major | MAJOR version as defined in [semver](http://semver.org/) |
| maven_version | Semantic version|
| maven_home_parent_directory | MAVEN_HOME parent directory|

Installation
------------

 `$ ansible-galaxy install tecris.maven`

Example Playbook
----------------
```
 - hosts: all
   roles:
     - { role: tecris.maven, maven_major: 3, maven_release: 3.3.9, maven_home_parent_directory: /opt }
```
Tests
-----
References:
 - [Ansible role testing](http://www.jeffgeerling.com/blog/testing-ansible-roles-travis-ci-github)
 - [Ansible apache role](https://github.com/geerlingguy/ansible-role-apache)
