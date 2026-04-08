# (1) 베이스 이미지
FROM ubuntu:22.04

# (2) 커스텀 포인트 1: Nginx, Curl 설치 (중간에 확인 창이 뜨지 않게 -y 옵션 사용)
RUN apt-get update && apt-get install -y \
nginx \
curl

# (2) 커스텀 포인트 2: 환경 변수 설정
ENV MY_NAME="Yeji"

# (2) 커스텀 포인트 3: Nginx가 보여줄 기본 페이지 수정
# RUN echo "<h1>Hello from Yeji's Nginx Server!</h1><p>My name is $MY_NAME</p>" > /var/www/html/index.html
COPY src/ /var/www/html/
# src/  출발지: 내가 만든 폴더
# /var/www/html/ : 도착지. Nginx라는 프로그램이 미리 정해둔 규칙
# (3) Nginx 실행
CMD ["nginx", "-g", "daemon off;"]