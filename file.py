filename = "gcc.trace"
with open(filename) as file:
	a = []
	for line in file:
		a.append(line)
	for i in range(1,len(a)):
		a[i] = a[i][2:12]	
	a[0] = a[0][0:10]		
	for i in a:
		print i
