from pydantic import BaseModel


class ArticleRequest(BaseModel):
    article: str


class UrlRequest(BaseModel):
    url: str


class AskRequest(BaseModel):
    article: str
    question: str