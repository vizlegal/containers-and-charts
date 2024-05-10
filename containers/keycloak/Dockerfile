FROM docker.io/bitnami/keycloak:18

ENV KEYCLOAK_HOME=/opt/bitnami/keycloak
USER 1001

# ADD https://repo1.maven.org/maven2/org/mindrot/jbcrypt/0.4/jbcrypt-0.4.jar /tmp
# RUN /opt/bitnami/keycloak/bin/jboss-cli.sh --command="module add --name=org.mindrot.jbcrypt --resources=/tmp/jbcrypt-0.4.jar"

# NOTE: 1.6 is already available for KC 22
ADD --chown=1001 https://github.com/leroyguillaume/keycloak-bcrypt/releases/download/1.5.3/keycloak-bcrypt-1.5.3.jar $KEYCLOAK_HOME/standalone/deployments/keycloak-bcrypt-1.5.3.jar
