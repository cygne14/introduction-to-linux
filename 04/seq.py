#!/usr/bin/env python3

import sys



def main():     
    if len(sys.argv) == 2:
    	try:
    		j = int(sys.argv[1])
    	except:
    		print("Wrong argument (integer expected).", file = sys.stderr)
    		sys.exit(1)
    		
    	for i in range (1, j):
    		print(i, end = " ")
    		if i == j-1:
    			print(j, end = "")
           
    elif len(sys.argv) == 3:
        try:
        	j = int(sys.argv[1])
        	k = int(sys.argv[2])
        except:
        	print("Wrong argument (integer expected).", file = sys.stderr)
        	sys.exit(1)
        
        for i in range (j, k):
        	print(i, end = " ")
        	if i == k-1:
        		print(k, end = "")
        
    elif len(sys.argv) == 4:
        try:
        	j = int(sys.argv[1])  # start
        	l = int(sys.argv[2])  # krok
        	k = int(sys.argv[3])  # cil
        except:
        	print("Wrong argument (integer expected).", file = sys.stderr)
        	sys.exit(1)
        	
        if l == 0:
        	print("Step cannot be zero.", file = sys.stderr)
        	sys.exit(3)
        	
        for i in range (j, k, l):
        	if l > 0:
        		if i + l >= k:
        			print(i, end = "")
        		else:
        			print(i, end = " ")
        	else:
        		if i + l <= k:
        			print(i, end = "")
        		else:
        			print(i, end = " ")
       
    else:
        print("Wrong argument count.", file = sys.stderr)
        sys.exit(2)
        

if __name__ == '__main__':
    main()
