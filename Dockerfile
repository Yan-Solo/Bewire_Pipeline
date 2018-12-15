FROM bitnami/jenkins:latest

RUN apt-get update && apt-get install -y wget maven

COPY to_copy/sonar-runner /opt/sonar-runner
COPY to_copy/jenkins_plugins_installer.sh /opt/jenkins_plugins_installer.sh
COPY to_copy/jenkins-cli.jar /opt/jenkins-cli.jar

ENV SONAR_RUNNER_HOME="/opt/sonar-runner/"
ENV PATH="/opt/sonar-runner/bin:$PATH"
