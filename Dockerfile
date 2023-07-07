FROM confluentinc/cp-kafka-connect:7.3.2

ENV CONNECT_PLUGIN_PATH: "/usr/share/java,/usr/share/confluent-hub-components"

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.7.3

WORKDIR /usr/share/java/kafka-connect-jdbc/jars

RUN wget https://repo1.maven.org/maven2/org/postgresql/postgresql/42.4.3/postgresql-42.4.3.jar

RUN wget https://packages.confluent.io/maven/io/confluent/monitoring-interceptors/7.3.2/monitoring-interceptors-7.3.2.jar