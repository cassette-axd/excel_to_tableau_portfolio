import pandas as pd
import instaloader
import re
import time

# Load CSV (replace with your actual CSV path)
df = pd.read_csv("data/instagram_data_united-states.csv")

# Instantiate Instaloader
L = instaloader.Instaloader()
L.load_session_from_file("ig_username")

# Clean username from NAME column using regex
def extract_username(name_str):
    match = re.search(r'@([A-Za-z0-9_.]+)', name_str)
    return match.group(1) if match else None

# Extract usernames
df["actual_username"] = df["NAME"].apply(extract_username)

# New columns
df["follower_count_api"] = None
df["post_count_api"] = None

for i, row in df.iterrows():
    username = row["actual_username"]
    if not username:
        continue
    try:
        profile = instaloader.Profile.from_username(L.context, username)
        df.at[i, "follower_count_api"] = profile.followers
        df.at[i, "post_count_api"] = profile.mediacount
    except Exception as e:
        print(f"Failed to fetch {username}: {e}")
    time.sleep(10)  # Be respectful, avoid rate limits

# Save updated DataFrame
df.to_csv("data/updated_instagram_data_united-states.csv", index=False)
