# CryptoIntel
A program witten in bash script which scrapes coinmarktetcap.com and compiles the data into a csv file, then uploads the data to a mysql database. You will also be able to use the python module matplotlib to plot the data from your database using the scripts in the analysis directory. Future updates will bring about automation and cryptocoin trend analysis. **STAY TUNED!** :shipit:

![csv](/assets/csv.png)

Import into csv file.

![csv](/assets/db.png)

Configure with mysql database.

![csv](/assets/plot.png)

Plot data from database with python matplotlib.

## Installation

1. Ensure that the following scripts have execution permissions:
- crawlers/coinScrape.sh
- crawlers/NameScrape.sh
- crawlers/PriceScrape.sh
- crawlers/VolScrape.sh
- crawlers/CapScrape.sh
- CryptIntel
- csvGen.sh

2. Most machines have wget installed, you will need this in case you do not currently have it.

3. (optional) Plotting data requires both a database and the latest version of python3 as well as the latest version of matplotlib.

3. (optional) Make sure that you have the latest version of PHP installed on your machine, if you would like to sync with a database.

## Execution
```
// Gathers name, price, market cap, 24-hour volume, and date/time
// for top 100 coins on www.coinmarketcap.com
// Then creates a csv file containing this information.


./CryptIntel 
```
## Syncing with mysql database:
1. First you will have to set up a mysql user, password, database, and table. https://dev.mysql.com/doc/mysql-getting-started/en/

2. Next you will have to modify the file uploadQuery.php. Instructions are included in the file.

3. You can automate this script using the crontab as explained below. 

## Automate using crontab:
Modify to the frequency you would like and specify the absolute path to the executable script CryptIntel and uploadQuery.php for database automation.
```
sudo vim /etc/crontab
```
Use the following format in crontab, with the specific frequency.
```
M H D W M Y
0 * * * * * <username> <command>
```

## Query Database
```
// When in the CryptoIntel directory

python ./analysis/priceQ.py <coin_name>
python ./analysis/volQ.py <coin_name>
python ./analysis/capQ.py <coin_name>
```
## TODO:
- Create method to calculate % change from one entry to the next.
- Improve current trend analysis using numpy module.
- Caluculate and graph RSI for a given coin, allow for multiple coins at once.
- Implement a more user friendly support for setting up automation. (crontab and export path)
- Create report of top price changes 24-h and volume changes 24-h.
