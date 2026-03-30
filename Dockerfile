# Using 3.13-slim (the 2026 stable standard) removes many base-image vulnerabilities
FROM python:3.13-slim

WORKDIR /app

# Upgrade pip and install our "forced" safe requirements
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]
