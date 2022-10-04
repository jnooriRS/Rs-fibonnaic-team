# syntax=docker/dockerfile:1
# directive instructs the Docker builder what syntax to use when parsing the Dockerfile.
# Python base image.
FROM python:3.7
# Create and set the work directory inside the image named 'app'
#This instructs Docker to use this path as the default location for all subsequent commands.
#By doing this, we do not have to type out full file paths but can use relative paths based
#on the working directory.
WORKDIR /app
# Execute a pip install command using the list 'requirements.txt'
# COPY command below does this- Select file and then put into /app
#Esentially copy requirments.txt and put into the app directroy and place there app/requirements
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# Copy the app file into the image working directory
COPY . .
# State the listening port for the container.
# The app's code does not actually specify the port, so it would be useful to include here.
EXPOSE 5000
# Run 'python app.py' on container start-up. This is the main process.
ENTRYPOINT ["python", "app.py"]
#ENTRYPOINT ["flask", "run"]

# Make sure Dockerfile and app.py are in the same directory, then run with build command
#docker build -t janda .

# Map the appropriate ports
#docker run -d -p 5000:5000 --name janda janda

#https://docs.docker.com/language/python/build-images/
