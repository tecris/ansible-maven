"""Role testing files using testinfra."""

def test_distribution(host):
    """Validate distribution release."""
    f = host.file("/etc/os-release")

    assert f.contains("ID=debian")
    assert f.contains("VERSION_ID=\"9\"")

