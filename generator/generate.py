import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["age", "weight", "need_special_treatment", "species"]

def generate_row():

    return {
        "age": random.randint(0, 60),
        "weight": round(random.uniform(1.0, 1000.0), 2),
        "need_special_treatment": random.choice(["YES", "NO"]),
        "species": random.choice(["Zebra", "Elephant", "Parrot","Turtle"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)