# **프로젝트 개요** 
**Terminal**, **Docker**, **Git/GitHub**를 활용하여 어디서든 동일하게 작동하는 **AI/SW 개발 워크스테이션** 구축을 목표로 한다. <br>

**주요 수행 내용**
- **Terminal**: 효율적인 작업 디렉토리 체계 구축, 파일 권한 설정을 통해 시스템 제어 기반 마련
- **Docker**: 독립된 컨테이너 환경을 실행 및 관리, 직접 작성한 Dockerfile을 이용해 웹 서버 컨테이너화
- **네트워크 및 서비스 접속**: 포트 매핑을 통해 호스트와 컨테이너를 연결하고, 브라우저 및 curl 응답으로 서비스 접속을 확인
- **실시간 변경 및 데이터 관리**: 바인드 마운트로 실시간 코드 변경 사항을 반영하고, Docker 볼륨을 활용해 컨테이너 삭제 후에도 데이터가 유지되는 영속성을 검증
- **버전 관리 및 협업**: Git으로 로컬 소스코드를 관리하고 GitHub 원격 저장소와 연동하여 협업 가능한 개발 기반을 마련

<br>

# 1. 실행 환경
- OS: MacOS 15.7.4
- Shell: zsh 5.9
- terminal: VS Code Intergrated Terminal (1.112.0)
- Docker: 28.5.2
- Git: 2.53

<br>

# 2. 수행 체크리스트
- [X] 터미널 기본 조작 및 폴더 구성
- [X] 권한 변경 실습
- [X] Docker 설치/점검
- [X] hello-world 실행
- [X] Dockerfile 빌드/실행
- [X] 포트 매핑 접속
- [X] 바인드 마운트 반영
- [X] 볼륨 영속성
- [X] Git 설정 + VSCode GitHub 연동

<br>

# 3. 터미널 조작 로그 기록
## (1) 현재 위치 확인
```bash
$ pwd
/Users/byjol4324/Desktop
```
## (2) 목록 확인(숨김 파일 포함)
```bash
$ ls -la
total 16
drwx------+  4 byjol4324  byjol4324   128 Apr  4 15:18 .
drwxr-x---+ 20 byjol4324  byjol4324   640 Apr  4 15:19 ..
-rw-r--r--@  1 byjol4324  byjol4324  6148 Apr  4 15:18 .DS_Store
-rw-r--r--   1 byjol4324  byjol4324     0 Apr  4 15:18 README.md
```

## (3) 폴더 생성 및 이동
```bash
$ mkdir yejibaek 
$ cd yejibaek
```

## (4) 빈 파일 생성 및 파일 내용 확인
```bash
$ touch 01_yeji.md
$ cat 01_yeji.md
```

## (5) 파일 복사
```bash
$ cp 01_yeji.md 02_yeji.md
```

## (6) 이름 변경 및 파일 위치 이동
```bash
$ mv 02_yeji.md 02_yeji_d.md
$ mv 02_yeji_d.md ~/Desktop
```
## (7) 파일 및 폴더 삭제
```bash
# 파일 삭제
$ rm 02_yeji_d.md
# 폴더 삭제
$ rm -rf 폴더명
```
## (8) 위치 이동 
```bash
# 절대 경로를 이용해 배경화면으로 이동
$ cd ~/Desktop
# 상대 경로를 이용해 상위 폴더로 이동 
$ cd ..
```
### 💡 **절대경로 / 상대경로 구분**
> 
> | 구분 | 절대경로 | 싱대경로 |
> | :--- | :--- | :--- |
> | 작성 방식 | 전체 주소 | 현재 작업 중인 파일의 위치 기준 |
> | 예시 | C:\Users\Documents\test.py | `.` : 현재 내가 있는 폴더 <br> ./images/logo.png <br><br> `..` : 바로 위의 상위 폴더 <br> ../index.html |
> | 이식성 | 낮음(내 컴퓨터에서만 작동) | 높음(다른 사람의 컴퓨터에서도 작동) |
> | 사용 예시 | 프로젝트 내부 파일 연결| 외부 리소스(URL 등) 연결

<br>

# 4. 권한 변경 실습
## (1) 파일 권한 체계 분석
### 1. 권한 기호 의미
| 권한 기호 | 의미 | 숫자 값 |
| :---: | :--- | :---: |
| **r** | 읽기 (Read) | **4** |
| **w** | 쓰기 (Write) | **2** |
| **x** | 실행 (Execute) | **1** |
### 2. 자릿수 순서의 의미
| 자릿수 | 대상 | 해석 예시 (755) |
| :---: | :---: | :--- |
| **첫 번째** | **소유자 (나)** | **7** (4+2+1): 모든 권한 허용 |
| **두 번째** | **그룹 (팀원)** | **5** (4+0+1): 읽기 및 실행만 허용 |
| **세 번째** | **기타 (나머지)** | **5** (4+0+1): 읽기 및 실행만 허용 |

## (2)  파일 권한 변경 실습
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

## (3) 디렉토리 권한 변경 실습
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

### 💡 **ls 명령어 옵션 정리**
> | 명령어 | 내용 | 주요 용도 |
> | :-- | :-- | :-- |
> ls -l | 현재 파일/폴더의 상세 정보 | 권한, 용량, 수정 날짜 등 확인 |
> ls -ld |현재 디렉토리 자체의 정보 | 지금 내가 있는 폴더의 권한 확인 |
> ls -la | 숨김 파일을 포함한 상세 정보 | 권한, 소유자, 크기, 날짜, 파일명 등 |
> ls -a | 숨김 파일을 포함한 모든 파일 | 파일명 및 숨김 파일명만 빠르게 확인 |
> ls -R | 현재 위치한 폴더뿐만 아니라 하위 폴더와 파일 | 전체적인 폴더 구조를 한눈에 파악

<br>

# 5. 컨테이너 실행 실습
### 💡 용어 정리
> | 용어 | 정의 | 비유 |
> | :--- | :--- | :--- |
> | **Linux** | 프로그램이 실행되는 기본 운영체제(OS) | 요리를 할 수 있는 주방 |
> | **Ubuntu** | 리눅스에서 가장 즐겨 쓰는 환경 세팅 | 특정 요리에 최적화된 주방 세팅 |
> | **Docker** | 프로그램들을 독립된 상자에 담아 실행하는 시스템 | 도시락 배달 서비스(음식이 섞이지 않게 상자에 담아 관리) |
> | **Dockerfile** | 이미지를 어떻게 만들지 적어둔 메모장 | 도시락 주문서/레시피(재료와 조리법이 적힌 종이) |
> | **Images** | 실행만 하면 바로 프로그램이 나오는 저장 상태 | 냉동 밀키트(뜯어서 데우기만 하면 됨) |
> | **Container** | 이미지를 실제로 실행해서 쓰고 있는 상태 | 실제로 손님 앞에 놓여서 먹을 수 있는 상태 |

## (1) Docker 설치 및 상태 점검
### 1. 버전 확인
```bash
$ docker --version
Docker version 28.5.2, build ecc6942
```
### 2. Docker 데몬 동작 여부 확인
```bash
$ docker info
Version: 28.5.2
Containers: 6 
Operating System: OrbStack
<중략>
```

## (2) Docker 이미지 및 컨테이너 조작
### 1. 이미지 다운로드 및 목록 확인
```bash
$ docker pull hello-world 
$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
hello-world   latest    e2ac70e7319a   11 days ago   10.1kB
```
### 2. 컨테이너 실행 
```bash
$ docker run --name my-hello-world hello-world
Hello from Docker!
This message shows that your installation appears to be working correctly.
```
### 3. 실행 목록 확인
```bash
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

> **`$ docker attach my-ubuntu`로 재접속한 뒤, <br> ** `$ exit` 하는 경우에는 실행이 완전히 종료된다.

### 💡  **컨테이너 종료 방식 비교 (exit vs stop vs kill)**
> 1. `exit` 
> - `docker attach` 나 `exec` 로 들어간 터미널에서 입력할 때
> - 실행 중인 메인 프로세스가 종료되면서 컨테이너도 안전하게 멈춤
> 2. `docker stop` 
> - 외부(호스트 터미널)에서 실행 중인 컨테이너를 멈추고 싶을 때
> - `SIGTERM` 신호를 보내 데이터 저장 등 마무리 작업을 할 시간을 준 뒤, 응답이 없으면 종료
> 3. `docker kill` 
> - 컨테이너가 응답하지 않거나 즉시 강제로 종료해야할 때
> - `SIGKILL` 신호를 보내 어떤 마무리 작업도 허용하지 않고 즉각 프로세스를 파괴함. 데이터 손실 위험 있음

<br>

# 6. 기존 Dockerfile 기반 커스텀 이미지 제작
## (1) 웹 서버 소스코드
```bash
$ mkdir src/
$ cd src/
$ touch index.html
```
> **웹 서버 소스코드란?** <br>
> - 웹 사이트를 만들기 위해 작성한 설계도와 재료들을 통칭
> - 보통 실제 웹 화면을 구성하는 원본(Source) 데이터 파일은 `src/`에, 실행 가능한 앱 설정 및 라이브러리 파일은`app/`에 담음 <br>
>
> | 폴더명 | 주요 포함 파일 (예시) | 설명 | 
> | :--- | :--- | :--- | 
> | **`src/`** (Source) | index.html, style.css, main.js | 사용자의 눈에 보이는 **웹 페이지의 뼈대, 디자인, 동작**을 담당하는 원본 소스 | 
> | **`app/`** (Application) | server.js, app.py, config.json | 주로 웹 서버를 구동하기 위한 **백엔드 로직이나 설정 파일** |


## (2) Dockerfile 작성
### 1. 베이스 이미지
```bash 
FROM ubuntu:22.04
```
### 2. 커스텀 포인트
#### ① Nginx, Curl 설치
```bash
$ RUN apt-get update && apt-get install -y \
nginx \
curl
# apt-get: 'Advanced Package Tool'의 약자로, 소프트웨어를 설치, 삭제, 업데이트하는 패키지 관리 도구
# update: 어떤 프로그램의 최신 버전이 어디에 있는지 적힌 목록을 최신 상태로 업데이트하라는 뜻
# /: 줄 바꿈
```
> - Nginx(웹 서버): 컨테이너 내부에 있는 웹 페이지를 외부 사용자가 브라우저를 통해 볼 수 있도록 중간에서 연결하고 전달하는 역할
> - Curl(네트워크 확인 도구): 설치된 웹 서버가 컨테이너 내부에서 정상적으로 작동하고 있는지 확인하기 위한 테스트 도구

#### ② 환경 변수로 이름 등록
```bash
ENV MY_NAME="Yeji"
```
> **환경 변수(ENV) 설정 이유**
> - 목적 : 컨테이너가 기억해야 할 정보를 미리 등록하기 위함.
> - 활용: 웹사이트 소스코드를 일일이 수정하지 않고, 이 설정값만 변경해서 문구를 한번에 변경 가능

#### ③ Nginx가 보여줄 기본 페이지 수정
```bash
# RUN echo "<h1>Hello from Yeji's Nginx Server!</h1><p>My name is $MY_NAME</p>" > /var/www/html/index.html <-- 이걸 아래로 대체
$ COPY src/ /var/www/html/
```
> `h1`: 큰 제목 글씨체 <br>
> `p`: 일반 본문 글씨체 <br>
> `/var/www/html/index.html`: 이 경로에 해당 내용을 저장

#### ④ 메인 프로세스 설정
```bash
# 나중에 이 이미지로 컨테이너를 만들었을 때 어떤 명령어를 자동으로 실행할지 예약해두는 것
CMD ["nginx", "-g", "daemon off;"] 
```
> 도커 컨테이너는 내부에 실행 중인 메인 프로세스가 종료되면 컨테이너 자체도 함께 종료됨. `Nginx`는 기본적으로 백그라운드에서 실행되는 '데몬' 방식이지만, 이를 포그라운드(`daemon off;`)에서 실행하도록 설정하여 웹 서버 컨테이너가 의도치 않게 종료되지 않고, 안정적으로 유지되도록 함. 

## (3) 빌드 
```bash
$ docker build -t my-nginx-ubuntu .
[+] Building 31.2s (7/7) FINISHED                                                                                                  docker:orbstack
 => [internal] load build definition from dockerfile                                                                                          0.1s
 => => transferring dockerfile: 601B                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/ubuntu:22.04                                                                               0.0s
 => [internal] load .dockerignore                                                                                                             0.1s
 => => transferring context: 2B                                                                                                               0.0s
 => CACHED [1/3] FROM docker.io/library/ubuntu:22.04                                                                                          0.0s
 => [2/3] RUN apt-get update && apt-get install -y nginx curl                                                                                29.4s
 => [3/3] RUN echo "<h1>Hello from Yeji's Nginx Server!</h1><p>My name is Yeji</p>" > /var/www/html/index.html                                0.5s 
 => exporting to image                                                                                                                        0.8s 
 => => exporting layers                                                                                                                       0.7s 
 => => writing image sha256:39b9298cc07020c6901f6d43367be0eadde0400866dc2a6ceff76f255255f5c3                                                  0.0s 
 => => naming to docker.io/library/my-nginx-ubuntu                                              
```

## (4) 실행 및 커스텀 확인 결과 
```bash
$ docker exec -it yeji-web bash
$ echo $MY_NAME
Yeji

$ docker run -d -p 8080:80 --name yeji-web my-nginx-ubuntu
$ curl http://localhost:80
<h1>Hello from Yeji's Nginx Server!</h1><p>My name is Yeji</p>
```

### ⚠️ **트러블 슈팅**
> 1. 문제 상황
> - `docker exec -it` 명령어를 통해 컨테이너 내부로 진입 <br>
> `docker run -it -p 8080:80 --name yeji-web my-nginx-ubuntu`, <br>
`docker run -d -p 8080:80 --name yeji-web my-nginx-ubuntu`: bash: docker: command not found 에러 발생 <br>
> - `$ curl http://localhost:8080`: Connection refused 에러 발생
> 2. 원인 분석 <br>
> - 환경 격리: `docker` 명령어는 호스트 머신에 설치된 도구이며, 베이스 이미지(`ubuntu:22.04`)로 생성된 컨테이너 내부에는 도커가 설치되어 있지 않음
> - 네트워크 격리: 포트 매핑(`-p 8080:80`)은 호스트(맥북)의 8080 포트를 컨테이너의 80 포트로 연결한 것임. 컨테이너 내부의 `localhost`에는 8080 포트가 존재하지 않으며, 실제 서버는 80 포트에서 동작 중임
> 3. 해결 방법 <br>
> 컨테이너에서 `exit`으로 빠져나와 호스트 터미널에서 `curl http://localhost:8080`을 수행하거나, 컨테이너 내부에서는 `curl http://localhost:80`으로 포트를 수정하여 접속 확인

<br>

# 7. 포트 매핑
## (1) 컨테이너 생성 및 포트 연결
```bash
# 둘 중 하나 실행
$ docker run -it -p 8080:80 --name yeji-web my-nginx-ubuntu
$ docker run -d -p 8080:80 --name yeji-web my-nginx-ubuntu
```
| 구분 | `-it` (Interactive + TTY) | `-d` (Detached) |
| :--- | :--- | :--- |
| **명칭** | 대화형 전면 실행(Foreground) | 백그라운드 실행(Background) |
| **주요 특징** | 현재 터미널과 컨테이너가 직접 연결됨 | 컨테이너가 뒤에서 독립적으로 실행됨 | 
| **로그 확인** | 실시간으로 화면에 출력됨 | `docker logs` 명령어로 별도 확인 필요 | 
| **터미널 상태** | 컨테이너에 점유되어 다른 입력 불가 | 명령어 실행 후 바로 다음 입력 가능 |
| **종료 영향** | `Ctrl + C` 입력 시 컨테이너 종료됨 | 터미널을 닫아도 컨테이너는 계속 유지됨 |
| **주요 용도** | 디버깅, 초기 설정 테스트, 쉘 접속 | 웹 서버, DB 등 상시 가동 서비스 |

## (2) 최종 결과 확인
**접속 주소:** http://localhost:8080

![Nginx 서버 접속 결과](screenshot/result.png)

<br>

# 8. 바인드 마운트
## (1) 실행 중인 컨테이너 확인
```bash
$ docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED       STATUS       PORTS                                     NAMES
589d52cc7d82   my-nginx-ubuntu   "nginx -g 'daemon of…"   2 hours ago   Up 2 hours   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   yeji-web
12b9e6096f02   ubuntu            "/bin/bash"              4 hours ago   Up 2 hours                                             my-ubuntu
```

## (2) 기존 컨테이너 정리하기
```bash
$ docker stop yeji-web
$ docker rm yeji-web
```
> 
> *이미지 삭제 명령어 `rmi`

> **기존 컨테이너 정리 이유**
> 1. 네트워크 충돌 방지: 호스트의 특정포트(예: 8080)는 한 번에 하나의 프로세스만 점유할 수 있음. 기존 컨테이너가 8080 포트를 사용 중이면, 동일한 포트를 사용하는 새 컨테이너 실행할 때 에러가 발생함. 
> 2. 컨테이너 이름 중복 방지: 동일한 이름을 가진 컨테이너가 존재할 경우, 같은 이름으로 새 컨테이너 생성 불가능. 
> 3. 런타임 설정 갱신: 실행 중인 컨테이너에 실시간으로 새로운 옵션을 추가할 수 없기 때문에 변경 사항을 적용하려면 반드시 기존 컨테이너를 파기하고 새로 생성해야 함.  

## (3) 바인드 마운트로 다시 실행하기(실시간 수정 확인)
### 기존 화면
![before: 한글 깨짐 현상](screenshot/before.png)
```bash 
$ docker run -d -p 8080:80 --name yeji-bind-test -v $(pwd)/src:/var/www/html my-nginx-ubuntu
  # `:` 를 기준으로 [내 컴퓨터 주소] : [컨테이너 주소] 
  ```
### ⚠️ **트러블 슈팅** 
![before: 한글 깨짐 현상](screenshot/trouble.png) <br>
> 1. 문제 상황: 바인드 마운트를 통해 호스트의 `index.html`을 서빙한 결과, 브라우저 화면에서 한글 메시지가 정상적으로 출력되지 않고 깨진 문자로 나타남.
> 2. 원인 분석: **문자 인코딩 미지정**
> - 웹 브라우저가 HTML 파일을 읽을 때 어떤 문자 집합(Character Set)을 사용해야 하는지 명시되지 않음. 
> - 기본 인코딩 설정이 한글을 지원하지 않는 방식으로 해석될 경우, 2바이트 이상인 한글 데이터가 손실되어 깨짐 현상이 발생함.
> 3. 해결 방법: HTML 소스코드의 `<head>` 섹션 내부에 문서 인코딩 형식을 정의하는 메타 태그를 추가함. <br> `meta charset="UTF-8"`

![after: 한글 깨짐 현상 해결](screenshot/after.png)

### 💡 호스트 포트 중복되는 경우
> 1. 오류 메시지를 통해 어떤 호스트 포트가 충돌을 일으켰는지 파악 
> 2. 어떤 프로그램 혹은 서비스가 해당 포트를 쓰고 있는지 확인
> `lsof -i :<포트번호>` 또는 `netstat -ano | grep <포트번호>`
> 3. 기존 컨테이너 중복 확인
> `docker ps`로 실행 중인 컨테이너 목록 확인, `docker ps -a`로 중지된 컨테이너 중 포트 점유 확인
> 4. 충돌하는 프로세스를 종료할 수 없는 경우, 포트 매핑 설정(호스트 포트 번호)을 변경


## 9. Docker 볼륨
## (1) 볼륨 생성 및 확인
```bash
$ docker volume create my-db-data
$ docker volume ls
RIVER    VOLUME NAME
local     my-db-data
```

## (2) 볼륨 연결해서 컨테이너 실행
```bash
docker run -d -p 8081:80 --name yeji-vol-test -v my-db-data:/var/www/html my-nginx-ubuntu
```
## (3) 검증 및 삭제 전/후 비교 실습
### 1. 컨테이너 내부에 접속해서 테스트 파일 생성
```bash
$ docker exec -it yeji-vol-test bash
$ echo "Volume is safe!" > /var/www/html/test.txt
$ exit
```
> `localhost:8081/test.txt` 접속 후 확인 
>
> ![사이트 접속 후 확인](screenshot/8081.png)

### 2. 컨테이너 삭제
```bash
$ docker rm -f yeji-vol-test 
```
### 3. 새로운 컨테이너를 동일한 볼륨에 연결하여 실행
```bash
$ docker run -d -p 8082:80 --name yeji-new-server -v my-db-data:/var/www/html   my-nginx-ubuntu
```
> `localhost:8082/test.txt` 접속 후 확인
>
> ![사이트 접속 후 확인](screenshot/8082.png)

<br>

# 10. Git 설정 및 GitHub 연동
## (1) Git 사용자 정보 설정
### 1. 사용자 이름 밒 이메일 설정
```bash
$ git config --global user.name "yejibaek12"
$ git config --global user.email "byjol@naver.com"
```
### 2. 설정 결과 확인
```bash
$ git config --list | grep user
user.name=yejibaek12
user.email=byjol@naver.com
```
## (2) GitHub 연동
### 1. 현재 폴더를 Git 저장소로 초기화
```bash
$ git init
```
### 2. GitHub 원격 저장소 연동 (최초 연결)
```bash
$ git remote add origin https://github.com/yejibaek12/Codyssey.git
```
### 3. 연동 상태 확인
```bash
$ git remote -v
origin  https://github.com/yejibaek12/Codyssey.git (fetch)
origin  https://github.com/yejibaek12/Codyssey.git (push)
```
## (3) GitHub로 파일 업로드
### 1. 모든 파일 스테이징
```bash
$ git add .
```
### 2. 커밋 생성
```bash
$ git commit -m "Add Docker volume test results"
```
### 3. 원격 저장소로 업로드
```bash
$ git push -u origin main
```
> 최초 실행 시에만 -u 옵션을 사용하여 원격 브랜치와 연결 <br>
> 이후로는 간단히 git push 만으로 업로드 가능

## 💡 마지막 커밋 수정하기
```bash
# 1. 수정 사항 스테이징
git add .
# 2. 마지막 커밋에 덮어쓰기 
git commit --amend --no-edit 
# 3. 원격 저장소에 강제 업데이트
git push origin master --force
``` 

## 💡 한 번에 변경사항 반영하기
```bash
# 1. 파일 이름 변경 (동시에 스테이징)
git mv [기존 파일명] [변경할 파일명]
# 2. 변경 사항 확정
git commit -, "커밋 이름"
# 3. 깃허브로 업로드
git push 
``` 

## 💡 깃허브에 불필요한 시스템 파일 제외 설정
```bash
# 1. 깃허브에서 삭제하기 (내 컴퓨터 파일은 유지)
$ git rm --cached .DS_Store
# 2. .gitignore 파일 생성 및 설정 등록
$ touch .gitignore
$ echo ".DS_Store" >> .gitignore
# 3. 커밋하고 푸시
$ git add .gitignore
$ git commit -m "chore: .DS_Store 제외 설정"
$ git push
``` 