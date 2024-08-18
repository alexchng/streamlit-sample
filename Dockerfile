# FROM python:3.12.4-slim
# updated to address potential Docker ratelimit for local builds
FROM public.ecr.aws/docker/library/python:3.12.4-slim
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# creates a non root user
RUN useradd -m -d /app streamlit
# set as user
USER streamlit
# Add the user home as part of the path
ENV PATH="/app/.local/bin:${PATH}"
# This sets the /app directory as the working directory for any RUN, CMD, ENTRYPOINT, or COPY instructions that follow.
WORKDIR /app
COPY requirements.txt ./requirements.txt
RUN pip3 install --user -r requirements.txt
COPY . .

EXPOSE 8501
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "app.py", "--browser.gatherUsageStats=false", "--server.headless=true"]
