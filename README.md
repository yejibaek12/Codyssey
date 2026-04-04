# 1. 실행 환경

- OS: MacOS 15.7.4
- Shell: zsh 5.9
- Git: 2.53

# 2. 수행 체크리스트

- [] 터미널 기본 조작 및 폴더 구성
- [] 권한 변경 실습
- [] Docker 설치/점검
- [] hello-world 실행
- [] Dockerfile 빌드/실행
- [] 포트 매핑 접속(2회)
- [] 바인드 마운트 반영
- [] 볼륨 영속성
- [] Git 설정 + VSCode GitHub 연동

# 3. 터미널 조작 로그 기록

## 1. 현재 위치 확인
```bash
$ pwd
/Users/byjol4324/Desktop
```
## 2. 목록 확인(숨김 파일 포함)
```bash
$ ls -la
total 16
drwx------+  4 byjol4324  byjol4324   128 Apr  4 15:18 .
drwxr-x---+ 20 byjol4324  byjol4324   640 Apr  4 15:19 ..
-rw-r--r--@  1 byjol4324  byjol4324  6148 Apr  4 15:18 .DS_Store
-rw-r--r--   1 byjol4324  byjol4324     0 Apr  4 15:18 README.md
```

## 3. 폴더 생성 및 이동
```bash
$ mkdir yejibaek 
$ cd yejibaek
```

## 4. 빈 파일 생성 및 파일 내용 확인
```bash
$ touch 01_yeji.md
$ cat 01_yeji.md
```

## 5. 파일 복사
```bash
$ cp 01_yeji.md 02_yeji.md
```

## 6. 이름 변경
```bash
$ mv 02_yeji.md 02_yeji_d.md
```
## 7. 파일 삭제
```bash
$ rm 02_yeji_d.md
```
<br>

# 4. 권한 실습
## (1)  파일 권한 변경 실습
### 1. 파일 생성 및 초기 권한 확인
```bash
$ touch test_file.txt
$ ls -l test_file.txt
-rw-r--r--  1 byjol4324  byjol4324  0 Apr  4 15:56 test_file.txt
```
### 2. 권한 변경 및 권한 확인
```bash
$ chmod 777 test_file.txt
$ ls -l test_file.txt
-rwxrwxrwx  1 byjol4324  byjol4324  0 Apr  4 15:56 test_file.txt
```

## (2) 디렉토리 권한 변경 실습
### 1. 디렉토리 생성 및 초기 권한 확인
```bash
$ mkdir yejibaek
$ ls -ld yejibaek
drwxr-xr-x  4 byjol4324  byjol4324  128 Apr  4 15:56 yejibaek
```
### 2. 권한 변경 및 권한 확인
```bash
$ chmod 700 yejibaek
$ ls -ld
drwx------+ 5 byjol4324  byjol4324  160 Apr  4 15:37 .
```

# 5. 컨테이너 실행 실습
## (1) Docker 설치 및 상태 점검
### 1. 버전 확인
```bash
$ docker --version
Docker version 28.5.2, build ecc6942
```
### 2. Docker 데몬 동작 여부 확인
```bash
$ docker info
```

## (2) Docker 이미지 및 컨테이너 조작
### 1. 이미지 다운로드 및 목록 확인
```bash
$ docker pull hello-world 
$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
hello-world   latest    e2ac70e7319a   11 days ago   10.1kB
```
### 2. 컨테이너 실행 및 목록 확인
```bash
$ docker run --name my-hello-world hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.

$ docker ps -a
CONTAINER ID   IMAGE         COMMAND    CREATED         STATUS                     PORTS     NAMES
0745191144d5   hello-world   "/hello"   7 seconds ago   Exited (0) 5 seconds ago             my-hello-world
```

## (3) Docker 운영 및 리소스 확인
### 1. 컨테이너 로그 확인 
```bash
$ docker logs my-hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.
```
### 2. 리소스 사용량 확인
```bash
$ docker stats --no-stream
CONTAINER ID   NAME      CPU %     MEM USAGE / LIMIT   MEM %     NET I/O   BLOCK I/O   PIDS
```

## (4) Ubuntu 컨테이너 실행 
### 1. 우분투 생성 및 확인
```bash
$ docker run -it --name my-ubuntu ubuntu /bin/bash
Unable to find image 'ubuntu:latest' locally
latest: Pulling from library/ubuntu
817807f3c64e: Pull complete 
Digest: sha256:186072bba1b2f436cbb91ef2567abca677337cfc786c86e107d25b7072feef0c
Status: Downloaded newer image for ubuntu:lates
root@c62fc68e0a62:/# 

$ ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var

$ echo "test success"
test success
```

### 2. 컨테이너 종료 및 확인
```bash
$ exit
byjol4324@c4r6s7 Desktop % 

$ docker ps -a
CONTAINER ID   IMAGE         COMMAND       CREATED          STATUS                      PORTS     NAMES
c62fc68e0a62   ubuntu        "/bin/bash"   12 minutes ago   Exited (0) 2 seconds ago              my-ubuntu
0745191144d5   hello-world   "/hello"      29 minutes ago   Exited (0) 29 minutes ago             my-hello-world
```
### 3. 컨테이너 유지 및 확인
#### ① 컨테이너 재실행
```bash
$ docker start my-ubuntu
```
#### ② 컨테이너 진입
```bash
$ docker exec -it my-ubuntu /bin/bash
```
#### ③ 종료 및 확인
```bash
$ exit

$ docker ps -a
CONTAINER ID   IMAGE         COMMAND       CREATED          STATUS                      PORTS     NAMES
c62fc68e0a62   ubuntu        "/bin/bash"   20 minutes ago   Up 3 minutes                          my-ubuntu
0745191144d5   hello-world   "/hello"      37 minutes ago   Exited (0) 37 minutes ago             my-hello-world
````
