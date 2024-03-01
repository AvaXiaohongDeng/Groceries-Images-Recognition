import os
import serpapi
import pandas as pd

from dotenv import load_dotenv
load_dotenv()

api_key = os.getenv('SERPAPI_KEY')
client = serpapi.Client(api_key = api_key)

start = 1
input_product = "bell pepper"
q_inf = input_product + "grocery store"

results = client.search({
    'engine': 'google_shopping',
    'q': q_inf,
    'google_domain':'google.ca',
    'gl': 'ca',
    'num': 20,
    'start': start            
})

# Creating lists to store data
titles = []
prices = []
websites = []

for product in results['shopping_results']:
    titles.append(product['title'])
    prices.append(product['price'])
    websites.append(product['link'])

# Create a DataFrame
df = pd.DataFrame({
    'Title': titles,
    'Price': prices,
    'Website': websites
})

# Sort the DataFrame by price in ascending order
df['Price'] = df['Price'].str.replace(',', '').str.replace('$', '').astype(float)
df = df.sort_values(by='Price', ascending=True).reset_index(drop=True)

# Select the top 3 cheapest prices with title, price, and website
top_cheapest = df.head(3)

# Save the top 3 cheapest prices to a CSV file
top_cheapest.to_csv('top_cheapest_prices.csv', index=False)

# Display the top 3 cheapest prices
print("Top 3 Cheapest Prices:")
print(top_cheapest)