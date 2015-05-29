in_file = open('All.txt','r')
out_file = open('All-no-dup.txt','w')
unique = set()
for line in in_file.readlines():
    if line in unique: 
        continue 
    else:
        unique.add(line)
        out_file.write(line)
in_file.close()
out_file.close()

in_file = open('All-no-dup.txt','r')
out_file = open('All-clean.txt','w')
for i in in_file.readlines(): 
    a = i.split(',')[0]
    c = i.rsplit(',',3)[1] 
    d = i.rsplit(',',3)[2] 
    e = i.rsplit(',',3)[3] 
    if '（' in a:
        b = a.split('（')[0]
        out_file.write((b+','+c+','+d+','+e))
    elif '(' in a:
        b = a.split('(')[0]
        out_file.write((b+','+c+','+d+','+e))
    else:
        out_file.write(i) 
        
in_file.close()
out_file.close()

test_file1 = open('tagsAll-Cat.csv','r')
dic={}
lines_counter = 0
for i in test_file1.readlines():
    aa = i.split(',')[0].strip()
    bb = i.split(',')[1].strip()
    dic[bb] = aa            
test_file1.close()
