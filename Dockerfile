FROM bitnami/jenkins:latest

COPY to_copy/sonar-runner /opt/sonar-runner
COPY to_copy/plugins.txt /opt/plugins.txt

ENV BITNAMI_APP_NAME="jenkins" \
    BITNAMI_IMAGE_VERSION="2.150.1-debian-9-r7" \
    DISABLE_JENKINS_INITIALIZATION="no" \
    JAVA_OPTS="" \
    JENKINS_HOME="/opt/bitnami/jenkins/jenkins_home" \
    JENKINS_PASSWORD="bewire " \
    JENKINS_USERNAME="iop123!" \
    PATH="/opt/sonar-runner/bin:/opt/bitnami/java/bin:/opt/bitnami/git/bin:$PATH"

RUN /usr/local/bin/install-plugins.sh < /opt/plugins.txt
