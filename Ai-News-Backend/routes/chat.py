from fastapi import APIRouter
from pydantic import BaseModel

from services.chat_service import ask_ai

router = APIRouter()

class ChatRequest(BaseModel):
    article: str
    question: str


@router.post("/")
def chat(request: ChatRequest):

    answer = ask_ai(
        request.article,
        request.question,
    )

    return {
        "answer": answer
    }