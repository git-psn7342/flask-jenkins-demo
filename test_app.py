from app import app

def test_index():
    response = app.test_client().get('/')
    assert response.status_code == 200
    assert b"Hello from Jenkins1" in response.data
