#!/home/fenris/Apps/anaconda3/bin/python
import os

def find_missing(lst):
    return sorted(set(range(0, lst[-1])) - set(lst))
  
lis = os.listdir('./Wallpapers/')
lis = [ int(i.split('.')[0][6:]) for i in lis if 'Screen' in i ]
lis.sort()
# print(lis[0:15])
print(find_missing(lis))
print(len(find_missing(lis)))
