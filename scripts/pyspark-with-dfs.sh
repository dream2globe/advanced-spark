export PYSPARK_PYTHON=/home/shyeon/.pyenv/versions/3.8.6/envs/analytics/bin/python

/home/hadoop/hadoop/sbin/start-dfs.sh
/home/hadoop/hadoop/sbin/start-yarn.sh
/home/spark/spark/sbin/start-history-server.sh
docker-compose -f docker-compose-mariadb.yml up -d
nohup /home/hive/hive/bin/start-metastore 1> /dev/null 2>&1 &
source ~/.pyenv/versions/3.8.6/envs/analytics/bin/activate && jupyter lab
