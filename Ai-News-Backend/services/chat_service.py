from groq import Groq

from config import GROQ_API_KEY

client = Groq(api_key=GROQ_API_KEY)


def ask_ai(article, question):

    prompt = f"""
You are an intelligent news assistant.

Answer ONLY using the article below.

If the answer isn't contained in the article,
say

'I couldn't find that information in the article.'

Article:

{article}

Question:

{question}
"""

    response = client.chat.completions.create(
        model="llama-3.3-70b-versatile",
        messages=[
            {
                "role": "user",
                "content": prompt,
            }
        ],
    )

    return response.choices[0].message.content