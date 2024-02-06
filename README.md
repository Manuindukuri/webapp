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

## Project Overview
This project is designed to revolutionize the way software applications are managed and deployed, focusing on continuous deployment to AWS without disrupting the currently running application. It harnesses a suite of technologies including Packer for virtual machine image creation, GitHub Actions for CI/CD pipelines, FastAPI for building performant APIs, PostgreSQL for database management, and AWS for cloud infrastructure, alongside integration and unit testing to ensure a robust development lifecycle of an enterprise application.

## Objective
Our primary aim is to demonstrate the efficacy of distributed systems across major cloud network providers such as AWS, GCP, and Azure, ensuring the application's ability to handle millions of concurrent requests—evidenced by our tests of 20 lakh API requests in under 5 minutes using FastAPI.

![webapp](https://github.com/Manuindukuri/webapp/assets/114769115/40a7b076-c0ec-4c93-b2ca-ad7da6a42cf6)

This is a Fast API based web application for managing user data in ```Asynchronous Mode```. This application is tighly coupled with [Infrastructure as code](https://github.com/Manuindukuri/InfrastructureCode-Pulumi)  


## Continuous Deployment and Scalability
By leveraging GitHub for version control and GitHub Actions for CI/CD, we ensure efficient, secure software delivery. The process starts when a pull request is raised; a Debian-based machine image is automatically created and stored in AWS. This facilitates an instance refresh that seamlessly migrates incoming traffic to the updated application version, ensuring zero downtime.

## Technologies and Skills
**GitHub & GitHub Actions:** Utilized for version control and to automate the CI/CD pipeline, enhancing software delivery and facilitating early bug detection.

**Packer:** Employs Packer for creating immutable virtual machine images, simplifying deployments and updates on AWS.

**FastAPI:** Chosen for its ability to handle asynchronous tasks and manage millions of concurrent requests, proving critical for enterprise-level applications.

**PostgreSQL:** Offers robust data management capabilities, ensuring data integrity and performance.

**AWS:** Provides a scalable and reliable cloud platform, essential for deploying and managing our application across global regions.

**Integration and Unit Testing:** Ensures the application's reliability and performance through comprehensive testing strategies.

## Deployment Process
The deployment process is meticulously designed to minimize disruptions. When a pull request is initiated, it triggers the CI/CD pipeline. A new machine image is created using Packer, reflecting the latest application version. This image is then deployed to AWS, where an instance refresh strategy is implemented to smoothly transition traffic to the new version, ensuring continuous availability.

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
5. Export the database configurations to the environment.
```bash
export DATABASE_URL=postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}
```
> **_NOTE:_**  replace the POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_PORT, POSTGRES_DB with your database configurations.


### Run FastAPI server

     make runserver

### Running tests with pytest

     pytest


### Usage

You can test the API's using any REST client such as Postman.

## Conclusion
Our project stands as a testament to the capabilities of modern DevOps practices, demonstrating how cloud technologies can be leveraged to achieve high availability, scalability, and efficient software delivery. It's a hands-on exploration into managing software applications through continuous deployment, leveraging the best practices in software development and cloud infrastructure management.


## License
This project is licensed under the MIT License.
