# (1) 베이스 이미지
FROM ubuntu:22.04

# (2) 커스텀 포인트 1: Nginx 및 필요한 도구 설치
RUN apt-get update && apt-get install -y nginx curl

# (2) 커스텀 포인트 2: 환경 변수 설정
ENV MY_NAME="Yeji"

# (2) 커스텀 포인트 3: Nginx가 보여줄 기본 페이지 수정 (글자수 안 세도 됨!)
RUN echo "<h1>Hello from Yeji's Nginx Server!</h1><p>My name is $MY_NAME</p>" > /var/www/html/index.html

# Nginx를 백그라운드가 아닌 포그라운드에서 실행 (컨테이너 유지용)
CMD ["nginx", "-g", "daemon off;"]