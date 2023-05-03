
# Use Alpine Linux as base image
FROM alpine:latest

# Install Python, Pip, NodeJS, Pipenv, and Lynx
RUN apk add --update --no-cache python3 py3-pip nodejs npm lynx
RUN pip3 install pipenv

# Create a working directory
WORKDIR /app

# Copy requirements.txt and Pipfile into the working directory
COPY requirements.txt Pipfile ./

# Install dependencies
RUN pipenv install --system --deploy

# Copy the brain.py file into the working directory
COPY brain.py .

# Create the /dev folder
RUN mkdir /dev

# Expose a port for the app to run on
EXPOSE 8080

# Start the brain.py script in the background
CMD ["sh", "-c", "python3 brain.py &"]
