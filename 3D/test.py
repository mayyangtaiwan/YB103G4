file1 = open('Ingre-cal.csv','r')
file2 = open('Ingre-cal1.csv','w')
seaSum = []
for i in file1.readlines():
	sea = i.split(',')[2]
	try:
		if sea:
			a=list(sea)
			a = map(int, a)
			seaSum.append(sum(a))
	except:
		pass

for i in seaSum:
	file2.write(str(i)+'\n')

file2.close()
file1.close()
