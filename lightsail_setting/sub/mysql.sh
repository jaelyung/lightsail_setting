# MYSQL 10.3 레포지토리 등록 (Ubuntu 16.04용 명령어)
sudo apt-get install -y software-properties-common gnupg-curl
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,i386,ppc64el] https://ftp.harukasan.org/mariadb/repo/10.3/ubuntu xenial main'

# MYSQL 설치
sudo apt update
sudo apt-get install mysql-server

# MYSQL 원격접속 허용 (bind-address = 127.0.0.1 주석처리)
sudo sed 's/^bind-address/#bind-address/g' /etc/mysql/my.cnf > ./my.cnf
sudo mv ./my.cnf /etc/mysql/my.cnf

#외부 접속 기능 설정 (포트 3306 오픈)
sudo ufw allow mysql

#MYSQL 실행
sudo systemctl start mysql

#우분투 서버 재시작시 MYSQL 자동 재시작
sudo systemctl enable mysql

# MYSQL 설정 파일 적용
sudo service mysql restart

