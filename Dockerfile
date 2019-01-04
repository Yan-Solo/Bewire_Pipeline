FROM jenkins/jenkins:latest

COPY to_copy/sonar-runner /opt/sonar-runner
COPY to_copy/usercreation.groovy /usr/share/jenkins/ref/init.groovy.d/usercreation.groovy
COPY to_copy/plugins.txt /usr/share/jenkins/ref/plugins.txt

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
    PATH="/opt/sonar-runner/bin:/opt/java/bin:/opt/git/bin:$PATH"

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
