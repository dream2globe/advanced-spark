# Advanced analytics with spark
The Example Codes in "Advanced analytics with spark"

## Install
- 책의 실습 예제를 편하게 구동할 수 있도록 Spark와 Jupyter Notebook이 설치된 docker를 사용합니다.
- 아래의 프로그램을 설치합니다.(OS별 설치법 참고)
    - docker : https://docs.docker.com/engine/install/
    - docker-compose : https://docs.docker.com/compose/
    - git : https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- 윈도우는 아래 링크를 참고하여 WSL로 리눅스를 설치하신 후에 진행하시면 편리합니다.
    1. [WSL를 활용하여 윈도우에서 우분투 설치하기](https://docs.microsoft.com/ko-kr/windows/wsl/install-win10)
    2. [Docker Desktop 설치하기](https://docs.microsoft.com/ko-kr/windows/wsl/tutorials/wsl-containers)
    3. [WSL과 windows 폴더 mount 정보 (Optional)](https://docs.microsoft.com/ko-kr/windows/wsl/faq)

## Clone the repository 
아래 명령어로 repository 를 clone 한 후, 생성된 폴더로 이동합니다.
```shell
git clone https://github.com/dream2globe/advanced-spark.git
cd advanced-spark
```
책 예제를 다운하기 원하신다면 추가로 아래 명령어를 실행합니다.
```shell
git submodule update --init --recursive
```


## Run docker-compose

#### 실행 전 개인 개발환경으로 설정 변경  
- docker-compose.yml 파일 내용 중 volumns의 ":" 앞쪽 path를 본인의 PC 환경을 고려하여 수정합니다
- "db"와 "spark"를 원하는 위치에 만든 후에 docker-compose.yml에 반영합니다
-  volumes은 원하는 위치에 만든 후에 docker-compose.yml에 반영합니다
```shell
    db:
        volumes:
            - /var/lib/mysql:/var/lib/mysql  # mariadb 파일의 저장 장소
        
    spark:
        volumes:
            - ~/workspace/apaches-project/advanced-spark:/home/jovyan/work  # workspace
```

#### docker 실행
- 아래의 명령어로 도커를 실행합니다. \-d 옵션은 Background 실행을 의미합니다.
```shell
    docker-compose up -d 혹은 docker-compose up --build  # 변경사항 감지하면 새롭게 빌딩 시작
```
- 웹 브라우저에서 [localhost:8889](localhost:8889) 에 접속합니다. Jupyter Notebook이 실행되며, password는 `mysparklab` 입니다.
- 아래의 명령으로 도커를 중지할 수 있습니다.
```shell
    docker-compose down
```
