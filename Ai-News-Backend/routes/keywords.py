from fastapi import APIRouter

from schemas import ArticleRequest
from services.keyword_service import extract_keywords

router = APIRouter()


@router.post("/")
def keywords(data: ArticleRequest):

    result = extract_keywords(data.article)

    return {
        "keywords": result
    }