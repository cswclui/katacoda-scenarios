Define the following python flask application app.py:

<pre class="file" data-filename="app.py" data-target="replace">
import os
import socket
from flask import Flask,request,jsonify
app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome!"

@app.route('/about')
def hello():
    return 'I am '+socket.gethostname()

#TODO-add

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True, use_reloader=True)

</pre>


The CMD specifies arguments that will be fed to the ENTRYPOINT.

<pre class="file" data-filename="Dockerfile" data-target="replace">
# Use an official Python runtime as a parent image
FROM python:slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run app.py when the container launches
CMD ["python", "app.py"]
</pre>



Define the file "requirements.txt" as follows.
<pre class="file" data-filename="requirements.txt" data-target="replace">
Flask
</pre>


Wait until the above updates are saved. 

Build docker image:
`docker build -t mywebapp .`{{execute}}
