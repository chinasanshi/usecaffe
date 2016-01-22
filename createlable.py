#!/usr/bin/env python
#-*- coding:utf-8 -*-


import os
#import shutil

#copy the picture and save the picture lable into the file
def createlable(filepath, trainlable, vallable, classNum):

	lable = 0

	for totalpath in os.listdir(filepath):
		subpath = os.path.join(filepath, totalpath)

		if os.path.isdir(subpath):

			lable = lable + 1
			if lable > classNum:
				break

			pictureNo = 0
                        #picTotal = len( [ x for x in os.listdir(os.path.dirname(subpath)) if os.path.isfile(x) ] )
			picTotal = len( [ x for x in os.listdir(subpath)] )
			print "picTotal is: ", picTotal
                        trainNum = int(picTotal * 0.85)
			print "trainNum is: ", trainNum
                        #valNum = picTotal * 0.25

			for picture in os.listdir(subpath):
				picturepath = os.path.join(subpath,picture)
				if os.path.isfile(picturepath):

					pictureNo = pictureNo + 1
					#shutil.copy(picturepath,dstpath) #copy the picture to the new path

					if pictureNo <= trainNum :
						with open(trainlable,'a') as train_f:
							print "picture for train: ", picturepath, lable
							train_f.write('%s %d\n' % (picturepath,lable)) #write the name and lable into the lable.txt
					else:
						with open(vallable,'a') as val_f:
							print "picture for val: ", picturepath, lable
							val_f.write('%s %d\n' % (picturepath,lable)) #write the name and lable into the lable.txt


createlable('./CASIA-WebFace','./train.txt','./val.txt',1000000000000)
