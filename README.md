tecris.maven
=========

Maven ansible role

Role Variables
--------------

Defined in defaults/main.yml

|**Variable**  | *Description* |
| ------------- | ------------- |
| maven_major | MAJOR version as defined in [semver](http://semver.org/) |
| maven_version | Semantic version|

Installation
------------

 `$ ansible-galaxy install tecris.maven`

Example Playbook
----------------
```
 - hosts: all
   roles:
     - { role: tecris.maven, maven_major: 3, maven_release: 3.3.9 }
``` 
