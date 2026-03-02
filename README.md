# AI-Based Exam Proctoring System

An intelligent online examination monitoring system that uses AI and computer vision to ensure exam integrity by detecting suspicious activities in real-time.

## Overview

This project provides an automated proctoring solution for online exams. It monitors students through their webcam and detects various violations like multiple faces, phone usage, tab switching, and looking away from the screen.

## Features

- **Face Detection**: Continuously monitors if the student's face is visible
- **Multiple Person Detection**: Alerts if more than one person appears on camera
- **Eye Tracking**: Detects if student is looking away from screen
- **Mobile Phone Detection**: Identifies phones in the camera frame
- **Tab Switching Detection**: Monitors browser activity
- **Audio Monitoring**: Detects background conversations
- **Session Recording**: Records the entire exam session
- **Real-time Alerts**: Instant notifications for violations
- **Report Generation**: Detailed exam reports with violation summary

## Technology Stack

- **Backend**: Python, Flask/Django
- **Computer Vision**: OpenCV, TensorFlow/PyTorch
- **Face Detection**: Dlib, MediaPipe
- **Object Detection**: YOLO
- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Database**: MySQL/PostgreSQL/SQLite
- **Real-time Communication**: WebRTC, Socket.IO

## Installation

### Prerequisites
- Python 3.8+
- Webcam and Microphone
- Modern web browser

### Setup Steps

1. Clone the repository
```bash
git clone https://github.com/Codeabhi096/AI-Based_Exam_Proctoring_System.git
cd AI-Based_Exam_Proctoring_System
```

2. Create virtual environment
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies
```bash
pip install -r requirements.txt
```

4. Setup database
```bash
python manage.py migrate
python create_admin.py
```

5. Download AI models
```bash
python download_models.py
```

6. Run the application
```bash
python app.py
```

Access at `http://localhost:5000`

## Usage

### For Admin
1. Login to admin panel
2. Create exam with details
3. Add students
4. Monitor live exams
5. Generate reports after exam

### For Students
1. Register and login
2. Complete system check (camera, mic)
3. Start exam after face verification
4. Follow exam rules
5. Submit when completed

## Project Structure

```
AI-Based_Exam_Proctoring_System/
├── backend/              # Backend logic
├── frontend/             # UI files
├── proctoring/           # AI detection modules
├── models/               # Trained AI models
├── database/             # Database files
├── logs/                 # Activity logs
├── recordings/           # Exam recordings
├── requirements.txt      # Dependencies
└── README.md
```

## Exam Rules

**Students Must:**
- Sit alone in a well-lit room
- Keep face visible at all times
- Look at the screen
- Stay in full-screen mode

**Students Must Not:**
- Switch tabs or windows
- Use mobile phone
- Talk to others
- Use unauthorized materials

## Violations Detected

| Violation | Severity | Action |
|-----------|----------|--------|
| No face detected | High | Alert + Pause |
| Multiple faces | High | Alert + Screenshot |
| Mobile phone | High | Alert + Flag |
| Tab switch | Medium | Warning |
| Looking away | Medium | Warning |
| Audio detected | Medium | Alert |

## Configuration

Edit `config.py` for custom settings:
```python
FACE_DETECTION_CONFIDENCE = 0.6
VIOLATION_THRESHOLD = 3
ENABLE_RECORDING = True
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request



## Developer

**Abhishek**  
GitHub: [@Codeabhi096](https://github.com/Codeabhi096)

## Support

For issues or questions, create an issue on GitHub or contact via email.

---

⭐ Star this repo if you find it helpful!
