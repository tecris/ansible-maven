Role Name
=========

Maven ansible role

Role Variables
--------------

Defined in defaults/main.yml

|**Variable**  | *Description* |
| ------------- | ------------- |
| maven_major | MAJOR version as defined in [semver](http://semver.org/) |
| maven_version | Semantic version|

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: ansible-maven, maven_major: 3, maven_release: 3.3.9 }
