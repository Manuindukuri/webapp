# WebApp - Fast API's

[![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)](https://www.python.org) 
[![Packer](https://img.shields.io/badge/packer-%23E7EEF0.svg?style=for-the-badge&logo=packer&logoColor=%2302A8EF)](https://developer.hashicorp.com/packer)
[![FastAPI](https://img.shields.io/badge/fastapi-109989?style=for-the-badge&logo=FASTAPI&logoColor=white)](https://fastapi.tiangolo.com/)
[![Postgres](https://img.shields.io/badge/postgres-black.svg?style=for-the-badge&logo=postgresql&logoColor=234169E1)](https://www.postgresql.org/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)
[![GitHub Actions](https://img.shields.io/badge/Github%20Actions-282a2e?style=for-the-badge&logo=githubactions&logoColor=367cfe)](https://github.com/features/actions)
[![AWS SNS](https://img.shields.io/badge/AWS%20SNS-3670A0.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/console)
[![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com)
[![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.shellscript.sh/)



This is a Fast API for managing user data in ```Asynchronous Mode```. It includes APIs for health check.



### Requirements
- Python 3.x
- Fast API : Uvicorn

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
