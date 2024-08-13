# Streamlit Docker Project

This project sets up a Streamlit application using Docker and Docker Compose.

## Prerequisites

- Docker
- Docker Compose

## Project Structure

```
.
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── app.py
└── README.md
```

## Setup and Running Locally

1. Clone the repository:
   ```
   git clone <repository-url>
   cd <project-directory>
   ```

2. Create a `.env` file in the project root and add your LLMLITE API key:
   ```
   LLMLITE_BASE_URL=the_llm_lite_url
   LLMLITE_API_KEY=your_api_key_here
   ```

3. Build and run the Docker container using Docker Compose:
   ```
   docker-compose up --build
   ```

4. Access the Streamlit application at `http://localhost:8501`

## Dockerfile Explanation

The Dockerfile sets up a Python 3.12.4 environment, installs necessary dependencies, creates a non-root user, and sets up the Streamlit application.

## Docker Compose Configuration

The `docker-compose.yml` file defines the service for the Streamlit application, mapping port 8501 and setting the necessary environment variables.

## Pushing the Built Image to DockerHub

1. Build the Docker image:
   ```
   docker build -t your-dockerhub-username/your-demo-app:latest .
   ```

2. Tag the built image:
   ```
   docker tag your-dockerhub-username/your-demo-app:latest
   ```

3. Log in to DockerHub:
   ```
   docker login
   ```

4. Push the image to DockerHub:
   ```
   docker push your-dockerhub-username/your-demo-app:latest
   ```

Replace `your-dockerhub-username` with your actual DockerHub username.
Replace `your-demo-app` with your actual demo app name.

## Notes

- The application runs on port 8501 inside the container, which is mapped to the host's port 8501.
- The `LLMLITE_API_KEY` and `LLMLITE_BASE_URL` is passed as an environment variable from the `.env` file. Get both the env from launch team.
- A health check is configured to ensure the application is running correctly.

## Troubleshooting

If you encounter any issues, please check the following:
- Ensure Docker and Docker Compose are installed and up to date.
- Verify that the required ports are not in use by other applications.
- Check that the `.env` file is properly configured with the correct API key.

For any other problems, please open an issue in the project repository.