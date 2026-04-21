# Base image with Python 3.11
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV TF_ENABLE_ONEDNN_OPTS=0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopencv-dev \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    wget \
    curl \
    git \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first (for caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy GazeTracking module
COPY gaze_tracking ./gaze_tracking

# Copy models folder
COPY models ./models

# Copy rest of the project
COPY . .

# Download yolov3 weights if not present
RUN if [ ! -f "models/yolov3.weights" ]; then \
    echo "Downloading yolov3.weights..."; \
    wget -q -O models/yolov3.weights https://pjreddie.com/media/files/yolov3.weights; \
    fi

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]