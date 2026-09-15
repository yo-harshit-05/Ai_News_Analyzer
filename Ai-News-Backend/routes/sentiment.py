from fastapi import APIRouter
from schemas import ArticleRequest
from services.sentiment_service import analyze_sentiment

router = APIRouter()


@router.post("/")
def sentiment(data: ArticleRequest):

    result = analyze_sentiment(data.article)

    return result