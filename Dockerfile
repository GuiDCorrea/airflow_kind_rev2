# Use a imagem base do Apache Airflow
FROM apache/airflow:2.7.0


WORKDIR /opt/airflow


COPY requirements.txt .


ENV AIRFLOW_HOME=/opt/airflow


RUN mkdir -p /opt/airflow/dags


COPY dags /opt/airflow/dags


WORKDIR /opt/airflow


