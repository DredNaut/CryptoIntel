import MySQLdb
import numpy as np
import sys

conn = MySQLdb.connect("localhost","dredknaut","toor","crypto")

c = conn.cursor()

c.execute("SELECT coin_volume FROM coinData WHERE coin_name REGEXP '" + sys.argv[1] + "';")


lastPrice = c.fetchall()

for eachPrice in lastPrice:
    print eachPrice
