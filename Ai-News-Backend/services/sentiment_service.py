from transformers import pipeline

classifier = pipeline("sentiment-analysis")

def analyze_sentiment(text):
    result = classifier(text[:512])[0]

    return {
        "label": result["label"],
        "confidence": round(float(result["score"]), 4)
    }