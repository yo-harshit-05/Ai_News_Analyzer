from fastapi import APIRouter

from schemas import ArticleRequest
from services.summarizer_service import summarize_article

router = APIRouter()


@router.post("/")
def summarize(data: ArticleRequest):

    summary = summarize_article(data.article)

    return {
        "summary": summary
    }