# Maven ansible role


Installation
------------

 `$ ansible-galaxy install tecris.maven             # latest version`
 
 `$ ansible-galaxy install tecris.maven,17.10.28    # specific version`

Example Playbook
----------------
```
 - hosts: all
   roles:
     - { role: tecris.maven, maven_major: 3, maven_version: 3.9.2, maven_home_parent_directory: /opt }
```

Role Variables
--------------

[defaults/main.yml](defaults/main.yml)

|*Variable*  | *Default Value* |*Description* |
| --- | --- | --- |
| maven_major | 3 | MAJOR [version](http://semver.org/) |
| maven_version | 3.9.2 | Version number|
| maven_home_parent_directory | /opt | MAVEN_HOME parent directory|
| maven_download_url |http://www.apache.org/dist/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz| If using mirror/proxy (see ansible [get_url](http://docs.ansible.com/ansible/latest/get_url_module.html)) |
|maven_download_username||see ansible [get_url](http://docs.ansible.com/ansible/latest/get_url_module.html) url_username option|
|maven_download_password||see ansible [get_url](http://docs.ansible.com/ansible/latest/get_url_module.html) url_password option|


Tests
-----
* See [molecule](./molecule)
* How to
  * Preliminary tasks
    * Buid molecule docker image
      ```
      # git clone https://github.com/tecris/dockerfiles
      # cd dockerfiles/molecule
      # ./build_image.sh
      ```
    * Build test image (example for `debian 10`)
      * Step 1
        ```   
        # git clone https://github.com/tecris/dockerfiles
        # cd dockerfiles/systemd
        # ./build_image.sh debian 10
        ```
      * Step 2 (add jdk to test image)
        ```   
        # git clone https://github.com/tecris/ansible-maven
        # cd ansible-maven/dockerfiles
        # ./build_image.sh debian 10
        ```
  * Run molecule test
    ```   
    # git clone https://github.com/tecris/ansible-maven
    # cd ansible-maven
    # ./run_molecule.sh
    # TAG=23.05.16 molecule test -s debian_10
    ```
