# We need to set a default otherwise Docker build complains
ARG IMAGE_ID=python:3.8-slim
FROM ${IMAGE_ID} AS base

# Copy requirements
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run tests, eventually we want ARGs to be passed in
# If this runs with the default base image, pytest will fail
# as it needs at least one test to exit with 0
CMD ["pytest"]
