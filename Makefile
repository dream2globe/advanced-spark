hdfs-run:
	#source ~/.pyenv/versions/3.8.6/envs/analytics/bin/activate
	$(HADOOP_HOME)/sbin/start-dfs.sh
	$(HADOOP_HOME)/sbin/start-yarn.sh
	$(SPARK_HOME)/sbin/start-history-server.sh
	docker-compose -f docker-compose-mariadb.yml up -d
	$(HIVE_HOME)/bin/start-metastore

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

.PHONY: hdfs-run hdfs-stop docker-run docker-stop clean
