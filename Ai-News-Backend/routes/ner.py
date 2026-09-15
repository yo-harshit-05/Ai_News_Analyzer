from fastapi import APIRouter

from schemas import ArticleRequest
from services.ner_service import extract_entities

router = APIRouter()


@router.post("/")
def ner(data: ArticleRequest):

    entities = extract_entities(data.article)

    return {
        "entities": entities
    }