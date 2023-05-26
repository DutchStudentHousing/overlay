# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

RUN apt-get update -y
RUN apt-get install git -y

# Add the current directory contents into the container at /app
RUN git clone https://github.com/DutchStudentHousing/DSH-Json.git .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run main.py when the container launches
CMD ["python", "./main.py"]