"""Role testing files using testinfra."""

def test_maven_path(host):
    """Validate maven path."""
    f = host.file("/etc/profile.d/maven.sh")

    assert f.exists

    assert f.user == "root"
    assert f.group == "root"

    assert f.mode == 0o644

    assert f.contains("M2_HOME=/opt/apache-maven-3.9.1")
    assert f.contains("PATH=$PATH:$M2_HOME/bin")

def test_maven_installed(host):
    """Validate maven installation."""
    cmd = host.run(". /etc/profile.d/java.sh && . /etc/profile.d/maven.sh && mvn --version")

    assert cmd.succeeded
    assert host.check_output(". /etc/profile.d/java.sh && . /etc/profile.d/maven.sh && mvn --version | grep Apache") == 'Apache Maven 3.9.1 (2e178502fcdbffc201671fb2537d0cb4b4cc58f8)'
