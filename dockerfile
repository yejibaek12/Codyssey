# 1. 베이스 이미지 선택 (기존 우분투를 가져옴)
FROM ubuntu:22.04 # 2022년 4월에 출시된 버전

# 2. 패키지 설치 (커스텀 포인트: 네트워크 도구 curl 설치)
RUN apt-get update && apt-get install -y curl

# 3. 환경 변수 설정 (커스텀 포인트: 내 이름을 변수로 등록)
ENV MY_NAME="Yeji"

# 4. 시작 시 실행될 명령어
CMD ["/bin/bash"]