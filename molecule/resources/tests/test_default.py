"""Role testing files using testinfra."""


def test_maven_path(host):
    """Validate maven path."""
    f = host.file("/etc/profile.d/maven.sh")

    assert f.contains("M2_HOME=/opt/apache-maven-3.9.0")
    assert f.contains("PATH=$PATH:$M2_HOME/bin")
