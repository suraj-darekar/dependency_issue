FROM tabulario/spark-iceberg

USER root

# Install required Hadoop AWS and Iceberg dependencies
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar /opt/spark/jars/
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.901/aws-java-sdk-bundle-1.11.901.jar /opt/spark/jars/
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.2/hadoop-common-3.3.2.jar /opt/spark/jars/

# Set correct permissions (from chatgpt)
RUN chmod 644 /opt/spark/jars/hadoop-*.jar /opt/spark/jars/aws-java-sdk-bundle-1.11.901.jar

# Install pip and increase the timeout
RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install --default-timeout=100 -r /home/iceberg/requirements.txt

# Install Jupyter Notebook (if not already installed)
RUN pip3 install notebook

# Expose necessary ports
EXPOSE 8888 8080 10000 10001

# entrypoint for Jupyter
ENTRYPOINT ["/opt/conda/bin/jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/home/iceberg/notebooks"]
