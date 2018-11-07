import json
import pytest


import golden_path


@pytest.fixture
def client():
    golden_path.app.config['TESTING'] = True
    client = golden_path.app.test_client()
    yield client

def test_root_path(client):
    """Make sure the root path returns {"hello":"world"}."""
    rv = client.get('/')
    data = json.loads(rv.data)
    assert data["hello"] == "world"