from fastapi import FastAPI
from routes.sentiment import router as sentiment_router
from routes.extract import router as extract_router
from routes.keywords import router as keyword_router
from routes.ner import router as ner_router
from routes.summarize import router as summarize_router
from routes.analyze import router as analyze_router
from fastapi.middleware.cors import CORSMiddleware
from routes.chat import router as chat_router

app = FastAPI(
    title="AI News Analyzer",
    version="1.0"
)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],   # Development only
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(
    extract_router,
    prefix="/extract",
    tags=["News Extraction"],
)
app.include_router(
    sentiment_router,
    prefix="/sentiment",
    tags=["Sentiment Analysis"],
)
app.include_router(
    keyword_router,
    prefix="/keywords",
    tags=["Keyword Extraction"],
)
app.include_router(
    ner_router,
    prefix="/ner",
    tags=["Named Entity Recognition"],
)
app.include_router(
    summarize_router,
    prefix="/summarize",
    tags=["AI Summarization"],
)
app.include_router(
    analyze_router,
    prefix="/analyze",
    tags=["Complete AI Analysis"],
)
app.include_router(
    chat_router,
    prefix="/chat",
    tags=["AI Chat"],
)



@app.get("/")
def home():
    return {
        "status": "running",
        "message": "AI News Analyzer Backend"
    }