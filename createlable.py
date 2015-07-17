

#copy the picture and save the picture lable into the file
def createlable(filepath,dstpath,lablepath):
	import os
	import shutil
	lable=0
	for totalpath in os.listdir(filepath):
		subpath = os.path.join(filepath,totalpath)
		if os.path.isdir(subpath):
			lable=lable+1
			for picture in os.listdir(subpath):
				picturepath = os.path.join(subpath,picture)
				if os.path.isfile(picturepath):
					shutil.copy(picturepath,dstpath) #copy the picture to the new path
					print picture, lable
					with open(lablepath,'a') as f:
						f.write('%s %d\n' % (picturepath,lable)) #write the name and lable into the lable.txt

createlable('d:\\src','d:\\total','d:\\lable.txt')
