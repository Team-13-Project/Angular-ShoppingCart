FROM docker pull nginx:latest
VOLUME /tap
ADD target/*.dist
