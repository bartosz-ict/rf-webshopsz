import random
import string

def getVariables():

    VARIABELEN = {
	    "RANDOM" : ''.join(random.choice(string.ascii_lowercase) for i in range(10))
	    }
    return VARIABELEN
