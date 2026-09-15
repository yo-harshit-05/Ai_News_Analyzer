from pydantic import BaseModel


class URLRequest(BaseModel):
    url: str


class ArticleRequest(BaseModel):
    article: str