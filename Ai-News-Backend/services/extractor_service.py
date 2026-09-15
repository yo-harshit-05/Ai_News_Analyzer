import requests
import trafilatura
from newspaper import Article


def extract_article(url: str):
    """
    Extract article text using multiple methods.
    Priority:
    1. Trafilatura
    2. Newspaper3k
    """

    headers = {
        "User-Agent": (
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
            "AppleWebKit/537.36 (KHTML, like Gecko) "
            "Chrome/126.0.0.0 Safari/537.36"
        )
    }

    # ---------------------------
    # Method 1 : Trafilatura
    # ---------------------------
    try:
        response = requests.get(url, headers=headers, timeout=20)
        response.raise_for_status()

        article = trafilatura.extract(response.text)

        if article and len(article) > 200:
            return article

    except Exception:
        pass

    # ---------------------------
    # Method 2 : Newspaper3k
    # ---------------------------
    try:
        article = Article(url)
        article.download()
        article.parse()

        if article.text and len(article.text) > 200:
            return article.text

    except Exception:
        pass

    raise Exception(
        "Unable to extract the article. This website may block automated access. "
        "Please paste the article text instead."
    )