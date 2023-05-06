"""Role testing files using testinfra."""

import testinfra
import unittest

class Test(unittest.TestCase):

    @classmethod
    def setUpClass(cls):

        cls.host = testinfra.get_host('docker://debian_11')

    def test_maven_path(self):
        """Validate maven profile file."""
        f = self.host.file("/etc/profile.d/maven.sh")

        self.assertTrue(f.exists, msg="maven profile file missing")

        self.assertEqual(f.user, "root", msg="maven profile file, incorrect user")
        self.assertEqual(f.group, "root", msg="maven profile file, incorrect group")
        self.assertEqual(f.mode, 0o644, msg="maven profile file, incorrect mode")

        self.assertTrue(f.contains("M2_HOME=/opt/apache-maven-3.9.1"))
        self.assertTrue( f.contains("PATH=$PATH:$M2_HOME/bin"))

    def test_maven_installed(self):
        """Validate maven installation."""
        cmd = self.host.run(". /etc/profile.d/java.sh && . /etc/profile.d/maven.sh && mvn --version")

        self.assertTrue(cmd.succeeded)
        self.assertEqual(self.host.check_output(". /etc/profile.d/java.sh && . /etc/profile.d/maven.sh && mvn --version | grep Apache"), 'Apache Maven 3.9.1 (2e178502fcdbffc201671fb2537d0cb4b4cc58f8)')
