# For more information, please refer to https://aka.ms/vscode-docker-python
# FROM python:2.7
FROM ubuntu:18.04

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

RUN apt -y update
RUN apt -y install software-properties-common curl
RUN apt -y update
RUN add-apt-repository universe
# RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
RUN apt -y install python-openssl librsync-dev build-essential libssl-dev libffi-dev python-dev gir1.2-signon-1.0 libsignon-glib1 adium-theme-ubuntu unity-lens-photos duplicity python-gi python-gi-cairo gir1.2-gtk-2.0
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
RUN python get-pip.py
# RUN apt -y install python-tk


# Install pip requirements
# COPY requirements.txt .
# RUN python -m pip install -r requirements.txt

# WORKDIR /app
COPY . .

# # Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
# USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["bash"]
# docker run -it --rm grover:0.1