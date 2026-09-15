# 📰 AI News Analyzer

AI News Analyzer is a full-stack application that uses Artificial Intelligence to analyze news articles and provide meaningful insights from the content.

The project consists of a **Flutter frontend** and a **Python backend**.

---

## 🚀 Features

- 📰 Analyze news articles
- 🤖 AI-powered news analysis
- 📊 Get meaningful insights from news
- 🔍 News search and analysis
- 📱 Cross-platform Flutter application
- ⚡ Python-based backend API
- 🔐 Secure API configuration using environment variables
- 📡 REST API communication between frontend and backend

---

## 🛠️ Tech Stack

### Frontend

- Flutter
- Dart
- Material UI
- REST API

### Backend

- Python
- FastAPI
- Transformers
- Google Gemini API
- REST API

### Tools

- Git & GitHub
- VS Code
- Android Studio

---

## 📁 Project Structure

```text
AI-News-Analyzer/
│
├── ai_news_analyzer/          # Flutter Frontend
│   ├── lib/
│   ├── assets/
│   ├── android/
│   ├── ios/
│   ├── pubspec.yaml
│   └── ...
│
├── Ai-News-Backend/            # Python Backend
│   ├── models/
│   ├── routes/
│   ├── services/
│   ├── utils/
│   ├── app.py
│   ├── config.py
│   ├── requirements.txt
│   └── ...
│
├── .gitignore
└── README.md
```

---

## ⚙️ Requirements

Before running the project, install the following:

- Python 3.11+
- Flutter SDK
- Dart SDK
- Git
- Android Studio or VS Code
- Android Emulator or physical Android device

---

## 🔧 Backend Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yo-harshit-05/Ai_News_Analyzer.git
```

Go inside the project:

```bash
cd Ai_News_Analyzer
```

### 2. Open Backend Folder

```bash
cd Ai-News-Backend
```

### 3. Create Virtual Environment

```bash
python -m venv venv
```

#### Windows

```bash
venv\Scripts\activate
```

#### macOS / Linux

```bash
source venv/bin/activate
```

### 4. Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 🔑 Environment Variables

The `.env` file is **not included in this repository** for security reasons.

Create a new file named:

```text
.env
```

inside the `Ai-News-Backend` folder.

Add the required API keys/configuration:

```env
GOOGLE_API_KEY=your_google_api_key
```

Replace the value with your own API key.

> ⚠️ **Never upload your real API keys or passwords to GitHub.**

---

## ▶️ Run the Backend

From the `Ai-News-Backend` directory:

```bash
python app.py
```

If your project uses Uvicorn, use:

```bash
uvicorn app:app --reload
```

The backend will normally run on:

```text
http://127.0.0.1:8000
```

---

## 📱 Flutter Frontend Setup

Open a new terminal and go to the Flutter project:

```bash
cd ai_news_analyzer
```

Install Flutter dependencies:

```bash
flutter pub get
```

Check connected devices:

```bash
flutter devices
```

Run the application:

```bash
flutter run
```

---

## 🔗 Frontend–Backend Connection

The Flutter application communicates with the Python backend using REST APIs.

Make sure the backend is running before using features that require AI/news analysis.

For local development:

```text
Flutter App
     │
     │ REST API
     ▼
Python Backend
     │
     ▼
AI / News Services
```

### Android Emulator

If the backend is running on your computer and the Flutter app is running on the Android Emulator, you may need to use:

```text
http://10.0.2.2:8000
```

instead of:

```text
http://127.0.0.1:8000
```

---

## 🧪 Testing

To run Flutter tests:

```bash
flutter test
```

To check the Flutter project:

```bash
flutter doctor
```

---

## 📦 Important Notes

The following files/folders are intentionally **not included in GitHub**:

```text
venv/
.env
__pycache__/
.dart_tool/
build/
```

These files are either generated automatically or contain sensitive information.

After cloning the repository, dependencies can be recreated using:

```bash
pip install -r requirements.txt
```

and:

```bash
flutter pub get
```

---

## 🔒 Security

Do not commit sensitive information such as:

- API keys
- Passwords
- Authentication tokens
- Private credentials
- Secret configuration files

Use environment variables through `.env` instead.

---

## 🖥️ Running the Complete Project

### Terminal 1 — Backend

```bash
cd Ai-News-Backend
venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

### Terminal 2 — Flutter

```bash
cd ai_news_analyzer
flutter pub get
flutter run
```

---

## 🤝 Contributing

Contributions are welcome!

### 1. Fork the repository

### 2. Create a new branch

```bash
git checkout -b feature/new-feature
```

### 3. Make your changes

### 4. Commit your changes

```bash
git add .
git commit -m "Add new feature"
```

### 5. Push the branch

```bash
git push origin feature/new-feature
```

### 6. Create a Pull Request

---

## 👨‍💻 Author

**Harshit Kumar**

B.Tech – Artificial Intelligence & Machine Learning

---

## ⭐ Support

If you find this project useful, consider giving the repository a ⭐ on GitHub.
