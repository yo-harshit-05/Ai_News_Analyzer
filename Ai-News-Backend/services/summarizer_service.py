import os
from dotenv import load_dotenv
from groq import Groq

load_dotenv()

client = Groq(
    api_key=os.getenv("GROQ_API_KEY")
)


def summarize_article(article: str):

    prompt = f"""
You are an expert news analyst.

Summarize the following article into EXACTLY five concise bullet points.

Rules:
- No title.
- No introduction.
- No conclusion.
- Maximum 20 words per bullet.
- Focus on facts.
- Mention important people, organizations, places and numbers.

Article:
{article}
"""

    try:
        response = client.chat.completions.create(
            model="llama-3.3-70b-versatile",
            messages=[
                {
                    "role": "user",
                    "content": prompt
                }
            ],
            temperature=0.3,
            max_tokens=300
        )

        return response.choices[0].message.content

    except Exception as e:
        return f"Error: {str(e)}"