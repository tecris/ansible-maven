# Maven ansible role

Changes related to new https://galaxy.ansible.com (Nov.2023)
--------
Out of my control, with the import of `v3.9.6` role name has changed (from `tecris.maven` to `tecris.ansible-maven`) as https://galaxy.ansible.com reincarnated

Installation
------------

 `$ ansible-galaxy install tecris.ansible-maven             # latest version`
 
 `$ ansible-galaxy install tecris.ansible-maven,17.10.28    # specific version`

Example Playbook
----------------
```
 - hosts: all
   roles:
     - { role: tecris.ansible-maven, maven_major: 3, maven_version: 3.9.6, maven_home_parent_directory: /opt }
```

Role Variables
--------------

[defaults/main.yml](defaults/main.yml)

|*Variable*  | *Default Value* |*Description* |
| --- | --- | --- |
| maven_major | 3 | MAJOR [version](http://semver.org/) |
| maven_version | 3.9.6 | Version number|
| maven_home_parent_directory | /opt | MAVEN_HOME parent directory|
| maven_download_url |http://www.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz| If using mirror/proxy (see [ansible.builtin.get_url](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html)) |
|maven_download_username||see [url_username](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html#parameter-url_username) parameter|
|maven_download_password||see [url_password](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html#parameter-url_password) parameter|


Tests
-----
* See [molecule](./molecule)
* How to
  * Preliminary tasks
    * Buid molecule docker image
      ```
      # git clone https://github.com/tecris/dockerfiles
      # cd dockerfiles/molecule/6
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
    # TAG=23.08.04 molecule test -s debian_10
    ```

Housekeeping
-----
* ```
  ansible-galaxy role import --token=the_token tecris ansible-maven
  ```

* https://ansible.readthedocs.io/projects/galaxy-ng/en/latest/community/userguide/#importing-roles
* https://forum.ansible.com/t/not-being-able-to-upload-new-versions-of-role-galaxy-new-feature-or-bug/2087/3
