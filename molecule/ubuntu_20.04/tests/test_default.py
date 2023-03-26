"""Role testing files using testinfra."""


def test_distribution(host):
    """Validate distribution release."""
    f = host.file("/etc/lsb-release")

    assert f.contains("DISTRIB_ID=Ubuntu")
    assert f.contains("DISTRIB_RELEASE=20.04")
