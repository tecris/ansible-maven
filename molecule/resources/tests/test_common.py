"""Role testing files using testinfra."""

import os
import testinfra
import unittest

class Test(unittest.TestCase):

    @classmethod
    def setUpClass(cls):

        container_name = os.environ.get('MOLECULE_SCENARIO_NAME')
        cls.host = testinfra.get_host('docker://' + container_name)

    def test_maven_path(self):
        """Validate maven profile file."""
        f = self.host.file("/etc/profile.d/maven.sh")

        self.assertTrue(f.exists, msg="maven profile file missing")

        self.assertEqual(f.user, "root", msg="maven profile file, incorrect user")
        self.assertEqual(f.group, "root", msg="maven profile file, incorrect group")
        self.assertEqual(f.mode, 0o644, msg="maven profile file, incorrect mode")

        self.assertTrue(f.contains("M2_HOME=/opt/apache-maven-3.9.4"))

        self.assertTrue( f.contains("PATH=$PATH:$M2_HOME/bin"))

    def test_maven_installed(self):
        """Validate maven installation."""
        cmd = self.host.run(". /etc/profile.d/java.sh && . /etc/profile.d/maven.sh && mvn --version")

        self.assertTrue(cmd.succeeded)
        # https://maven.apache.org/install.html
        self.assertEqual(self.host.check_output(". /etc/profile.d/java.sh && . /etc/profile.d/maven.sh && mvn --version | grep Apache"), 'Apache Maven 3.9.4 (dfbb324ad4a7c8fb0bf182e6d91b0ae20e3d2dd9)')
