# CryptoIntel
A program witten in bash script which scrapes coinmarktetcap.com and compiles the data into a csv file, then uploads the data to a mysql database. I have just implemented a few python queries to allow for fetching price, volume, and market capitalization data. Future updates will bring about automation and cryptocoin trend analysis. **STAY TUNED!** :shipit:

## Installation

Ensure that the following scripts have execution permissions:
- crawlers/coinScrape.sh
- crawlers/NameScrape.sh
- crawlers/PriceScrape.sh
- crawlers/VolScrape.sh
- crawlers/CapScrape.sh
- CryptIntel
- csvGen.sh
- uploadQuery.php

## Execution
```
./CryptIntel 
```
## Editting crontab:
```
sudo vim /etc/crontab
```

## Query Database
```
python priceQ.py <coin_name>
python volQ.py <coin_name>
python capQ.py <coin_name>
```
## TODO:
- Create method to calculate % change from one entry to the next.
- Improve current trend analysis using numpy module.
