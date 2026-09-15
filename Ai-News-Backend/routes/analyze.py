from fastapi import APIRouter, HTTPException

from models.schemas import URLRequest, ArticleRequest
from services.extractor_service import extract_article
from services.summarizer_service import summarize_article
from services.sentiment_service import analyze_sentiment
from services.keyword_service import extract_keywords
from services.ner_service import extract_entities

router = APIRouter(tags=["Analyze"])    

# Analyze from URL
@router.post("/")
def analyze_news(request: URLRequest):
    try:
        article = extract_article(request.url)

        return {
            "article": article,
            "summary": summarize_article(article),
            "sentiment": analyze_sentiment(article),
            "keywords": extract_keywords(article),
            "entities": extract_entities(article),
        }

    except Exception as e:
        raise HTTPException(
            status_code=400,
            detail={
                "message": "Unable to analyze article.",
                "reason": str(e),
                "suggestion": "Try another news website or paste the article text."
            }
        )


# Analyze pasted article text
@router.post("/text")
def analyze_text(request: ArticleRequest):
    try:
        article = request.article

        return {
            "article": article,
            "summary": summarize_article(article),
            "sentiment": analyze_sentiment(article),
            "keywords": extract_keywords(article),
            "entities": extract_entities(article),
        }

    except Exception as e:
        raise HTTPException(
            status_code=400,
            detail=str(e)
        )