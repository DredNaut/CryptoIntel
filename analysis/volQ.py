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

    # Grab coin volume and submission date for graph
    c.execute("SELECT coin_volume FROM coinData WHERE coin_name REGEXP '" + sys.argv[1] + "';")
    allVol = c.fetchall()
    c.execute("SELECT submission_date FROM coinData WHERE coin_name REGEXP '" + sys.argv[1] + "';")
    dates = c.fetchall()

    #Generate Graph using MatPlotLib
    plt.plot(dates,allVol,'r', linewidth=3.0)
    plt.title('%s: Volume/Time' % sys.argv[1])
    plt.ylabel('Price ($)')
    plt.xlabel('Date (DD HH:MM)')
    plt.grid(True)
    plt.show()

    current = allVol[-1]
    differ = "N/A"
    print "\t%s" % sys.argv[1]
    print "CURRENT VOLUME:\t%s" % current
    print "24 HOUR DIFF:\t%s" % differ
