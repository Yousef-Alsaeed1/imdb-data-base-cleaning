import pandas as pd

titles = pd.read_csv('title.basics.tsv.gz', sep='\t', na_values='\\N', low_memory=False)

valid_types = ["movie", "tvSeries", "tvMiniSeries", "tvEpisode"]
filtered_titles = titles[titles["titleType"].isin(valid_types)]

print(filtered_titles["titleType"].value_counts())


    
columns_needed = ["tconst", "titleType", "primaryTitle", "originalTitle", "startYear", "endYear", "genres"]

filtered_titles = filtered_titles[columns_needed]



filtered_titles = filtered_titles.dropna(subset=["primaryTitle", "startYear"])

filtered_titles["genres"] = filtered_titles["genres"].fillna("Unknown")


filtered_titles["startYear"] = pd.to_numeric(filtered_titles["startYear"], errors="coerce").astype("Int64")
filtered_titles["endYear"] = pd.to_numeric(filtered_titles["endYear"], errors="coerce").astype("Int64")


title_genres = filtered_titles.assign(genre=filtered_titles["genres"].str.split(",")).explode("genre")

title_genres = title_genres[title_genres["genre"] != "Unknown"]

print(title_genres.head())

filtered_titles.to_csv("titles_clean.csv", index=False, encoding="utf-8")

title_genres.to_csv("title_genres_clean.csv", index=False, encoding="utf-8")




