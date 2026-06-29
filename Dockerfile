FROM python:3.11-slim

# ffmpeg 설치 (핵심)
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# 작업 폴더
WORKDIR /app

# 코드 복사
COPY . /app

# Python 패키지 설치 (필요하면 requirements.txt 자동 대응)
RUN pip install --no-cache-dir -r requirements.txt || pip install flask

# Cloud Run 포트 설정
ENV PORT=8080

# 실행
CMD ["python", "main.py"]
