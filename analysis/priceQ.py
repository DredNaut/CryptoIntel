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

    #Grab Prices and dates for graph
    c.execute("SELECT coin_price FROM coinData WHERE coin_name REGEXP '" + sys.argv[1] + "';")
    lastPrice = c.fetchall()
    c.execute("SELECT submission_date FROM coinData WHERE coin_name REGEXP '" + sys.argv[1] + "';")
    dates = c.fetchall()


    #Generate Graph using MatPlotLib
    plt.plot(dates,lastPrice,'r', linewidth=3.0)
    plt.title('%s: Price/Time' % sys.argv[1])
    plt.ylabel('Price ($)')
    plt.xlabel('Date (DD HH:MM)')
    plt.grid(True)
    plt.show()

    # Set mean and current price variables
    mean = np.mean(lastPrice)
    current = a[-1]

    print "\t%s" % sys.argv[1]
    print "CURRENT:\t\t\t%s" % current
    print "MEAN:\t\t\t\t%s" % mean 
    print "PERCENT CHANGE FROM THE MEAN:\t%s" % (100*(current-mean)/mean)
