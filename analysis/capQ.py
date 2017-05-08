import MySQLdb
import numpy as np
import matplotlib.pyplot as plt
import sys

# Handle no-arg exception
if len(sys.argv)<2:
    print "Usage:\tpython %s <coin_name>" % sys.argv[0]
    sys.exit()
else:
    conn = MySQLdb.connect("localhost","dredknaut","toor","crypto")

    c = conn.cursor()

    #Grab market caps and dates for graph
    c.execute("SELECT coin_marketcap FROM coinData WHERE coin_name REGEXP '" + sys.argv[1] + "';")
    caps = c.fetchall()
    c.execute("SELECT submission_date FROM coinData WHERE coin_name REGEXP '" + sys.argv[1] + "';")
    dates = c.fetchall()


    #Generate Graph using MatPlotLib
    plt.plot(dates,caps,'r', linewidth=3.0)
    plt.title('%s: Market Cap/Time' % sys.argv[1])
    plt.ylabel('Market Cap ($)')
    plt.xlabel('Date (DD HH:MM)')
    plt.grid(True)
    plt.show()

    current = cap[-1]
    print "\t%s" % sys.argv[1]
    print "CURRENT MARKET CAP:\t\t%s" % current
