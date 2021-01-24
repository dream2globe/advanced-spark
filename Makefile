jupyterlab:
	bash ./scripts/pyspark-with-dfs.sh

hdfs-stop:
	$(HADOOP_HOME)/sbin/stop-dfs.sh
	$(HADOOP_HOME)/sbin/stop-yarn.sh
	$(SPARK_HOME)/sbin/stop-history-server.sh
	docker-compose -f docker-compose-mariadb.yml down

docker-run:
	docker-compose up -d

docker-stop:
	docker-compose down

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name __pycache__ | xargs rm -fr {}

.PHONY: jupyterlab hdfs-stop docker-run docker-stop clean
