
import pandas as pd

from mlxtend.frequent_patterns import apriori, association_rules
import matplotlib.pyplot as plt

dataset = pd.read_csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Association rule\\Datasets\\my_movies.csv")
dataset= dataset.rename(columns={'V1':'V1', 'V2':'V2','V3':'V3','V4':'V4','V5':'V5'})

dataset1 =  dataset.drop(['V1','V2','V3','V4','V5'], axis=1)

frequent_itemsets = apriori(dataset1, min_support = 0.002, max_len = 3, use_colnames = True)

# Most Frequent item sets based on support 
frequent_itemsets.sort_values('support', ascending = False, inplace = True)

plt.bar(x = list(range(0, 11)), height = frequent_itemsets.support[0:11], color ='rgmyk')
plt.xticks(list(range(0, 11)), frequent_itemsets.itemsets[0:11], rotation=75)
plt.xlabel('item-sets')
plt.ylabel('support')
plt.show()

rules = association_rules(frequent_itemsets, metric = "lift", min_threshold = 1)
rules.head(20)
rules.sort_values('lift', ascending = False).head(10)

################################# Estore_datatra part ###################################
def to_list(i):
    return (sorted(list(i)))

ma_store_data = rules.antecedents.apply(to_list) + rules.consequents.apply(to_list)

ma_store_data = ma_store_data.apply(sorted)

rules_sets = list(ma_store_data)

unique_rules_sets = [list(m) for m in set(tuple(i) for i in rules_sets)]

index_rules=[]

for i in unique_rules_sets:
    index_rules.append(rules_sets.index(i))

# getting rules without any redudancy 
rules_no_redudancy = rules.iloc[index_rules, :]

# Sorting them with respect to list and getting top 10 rules 
rules = rules_no_redudancy.sort_values('lift', ascending = False).head(10)
     