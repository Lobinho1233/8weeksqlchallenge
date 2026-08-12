
#%%
import os 
import sqlalchemy

engine = sqlalchemy.create_engine("sqlite:///data.db")

files = [i for i in os.listdir("./data") if i.endswith(".csv")]



#%%

import pandas as pd

for file in files:
    df = pd.read_csv(f"./data/{file}", sep=",")
    table_name = file.split(".")[0]  
    df.to_sql(table_name, engine, if_exists="replace", index=False)