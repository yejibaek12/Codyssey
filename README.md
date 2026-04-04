# 1. 실행 환경
- OS: MacOS 15.7.4
- Shell: zsh 5.9
- Git: 2.53
<br>
<br>
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
<br>
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

## (6) 이름 변경
```bash
$ mv 02_yeji.md 02_yeji_d.md
```
## (7) 파일 삭제
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
