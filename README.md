# CryptoIntel
A program witten in bash script which scrapes coinmarktetcap.com and compiles the data into a csv file, then uploads the data to a mysql database. Future updates will bring about automation and cryptocoin trend analysis.

To install set .sh files in crawlers to executable, as well as CryptIntel and csvGen.sh

To run
'''
./CryptIntel 

To edit crontab:
'''
sudo vim /etc/crontab

TODO:
-Garbage collector.
-FIX price bug.
-Create page and script to query database.
-Create method to calculate % change from one entry to the next.
