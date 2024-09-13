# API Testing with Robot Framework

This project contains test cases for testing an API that adds two numbers using Robot Framework and the `RequestsLibrary`.

## Prerequisites

- [Robot Framework](https://robotframework.org/)
- [RequestsLibrary](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

## Installation

1. Install Robot Framework:

```bash
pip install robotframework
```

1. Install the RequestsLibrary:

```bash
pip install robotframework-requests
```

## Test Cases

1. ### Add Two Numbers
This test case sends a GET request to the endpoint /plus/5/6 and verifies that the response status is 200 and the result of the addition is 11.

1. ### Invalid Parameters Should Return Error
This test case sends a GET request to the endpoint /plus/foo/bar with invalid parameters and verifies that the response status is 400 and the error message indicates that the parameters are not numbers.

## Running the Tests
To run the tests, use the following command:

```bash
robot test-api.robot
```

## Configuration
- BASE_URL: The base URL for the API. The default value is http://localhost:8080. You can modify this variable in the *** Variables *** section of the test file if needed.