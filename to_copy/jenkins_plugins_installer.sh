#!/bin/bash
USER='user'
PASSWORD='iop123!'
CLI='/opt/jenkins-cli.jar'
HOST='http://localhost:8080/'

java -jar $CLI -s $HOST -auth $USER:$PASSWORD install-plugin gitlab-plugin
java -jar $CLI -s $HOST -auth $USER:$PASSWORD install-plugin maven-plugin
java -jar $CLI -s $HOST -auth $USER:$PASSWORD install-plugin workflow-aggregator
java -jar $CLI -s $HOST -auth $USER:$PASSWORD install-plugin sonar

java -jar $CLI -s $HOST -auth $USER:$PASSWORD restart
