import pandas as pd

review = pd.read_csv('title.ratings.tsv.gz', sep='\t', na_values='\\N', low_memory=False)





print(review.head())
print(review.tail())
print(review.columns)


# didn't finish yet because of university 
