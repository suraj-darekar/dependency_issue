FROM tabulario/iceberg-rest

ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar /app/libs/
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.901/aws-java-sdk-bundle-1.11.901.jar /app/libs/
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.2/hadoop-common-3.3.2.jar /app/libs/

USER root
RUN chmod 644 /app/libs/*.jar
USER iceberg
