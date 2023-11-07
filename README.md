# Cloud

This is a Fast API for managing user data. It includes APIs for health check.


### Requirements
- Python 3.x
- Fast API

### Installation
1. Clone the repository to your local machine and cd into cloud.
2. Create a virtual environment in the project directory.
3. Activate the virtual environment.
4. Install the required packages using the following command:
```bash
make install
```
5. Export the database configurations to the environment. ..
```bash
export DATABASE_URL=postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
```
> **_NOTE:_**  replace the POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_PORT, POSTGRES_DB with your database configurations.


### Run FastAPI server
- Run server

     $ make runserver

### Running tests with pytest

    $ pytest


### Usage

You can test the API using any REST client such as Postman.


### License
This project is licensed under the MIT License.
