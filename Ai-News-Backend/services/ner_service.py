import spacy
from collections import defaultdict

nlp = spacy.load("en_core_web_sm")


def extract_entities(text):
    doc = nlp(text)

    entities = defaultdict(list)

    for ent in doc.ents:
        if ent.text not in entities[ent.label_]:
            entities[ent.label_].append(ent.text)

    return dict(entities)