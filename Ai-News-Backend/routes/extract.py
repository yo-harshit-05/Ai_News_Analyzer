from fastapi import APIRouter

from schemas import UrlRequest
from services.extractor_service import extract_article

router = APIRouter()


@router.post("/")
def extract(data: UrlRequest):

    article = extract_article(data.url)

    return article