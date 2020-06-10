# Import the Earth Engine Python Package
import ee
import time
import os
import math
from datetime import datetime

# Initialize the Earth Engine object, using the authentication credentials.
ee.Initialize()

regency_code=range(7)
regency_code[0] = '3212'
regency_code[1] = '3213'
regency_code[2] = '3215'
regency_code[3] = '3517'
regency_code[4] = '3518'
regency_code[5] = '3522'
regency_code[6] = '3524'




regency_region=range(7)
regency_region[0] = [[[107.85008931002845,-6.6767776647842068],[108.53938569317057,-6.6807052436117607],[108.54155646158407,-6.2311203918922091],[107.85286599975034,-6.2274592071470662],[107.85008931002845,-6.6767776647842068]]]
regency_region[1] = [[[107.52337571659255,-6.8128015829719715],[107.92213880176756,-6.8155095834678603],[107.92598795047394,-6.1825661762315001],[107.5277212504932,-6.1801116433829586],[107.52337571659255,-6.8128015829719715]]]
regency_region[2] = [[[107.07988956805879,-6.5897470400645339],[107.641099075348,-6.5938449787380691],[107.64528418122191,-5.9397937627877129],[107.08476987986732,-5.9361052670271839],[107.07988956805879,-6.5897470400645339]]]
regency_region[3] = [[[112.06352250278002,-7.7803827245697512],[112.4558336701248,-7.7792180647653097],[112.45437365965267,-7.343355576713174],[112.0624557152223,-7.3444542691365049],[112.06352250278002,-7.7803827245697512]]]
regency_region[4] = [[[111.72553754845603,-7.8367006139159177],[112.17005707933524,-7.8357007452640008],[112.1688579934099,-7.3934166933220657],[111.72479388343491,-7.3943594997541435],[111.72553754845603,-7.8367006139159177]]]
regency_region[5] = [[[111.42374487956054,-7.4701085826404405],[112.16668911962644,-7.4687705849073245],[112.16544869622754,-6.9850046460977149],[111.42329424622658,-6.9862551195647171],[111.42374487956054,-7.4701085826404405]]]
regency_region[6] = [[[112.0726867405661,-7.3849218597130912],[112.55351188021343,-7.3835077819192065],[112.55175861673327,-6.8624613283077442],[112.07147581705456,-6.8637746577719465],[112.0726867405661,-7.3849218597130912]]]



#12_S1_SR_05Jul-21Jul-2017.tif


for i in range(6, 7):
	regency_poly = ee.Geometry.Polygon(regency_region[i])
	regency_code_str = regency_code[i]
	S1_Collection = ee.ImageCollection('COPERNICUS/S1_GRD').filterDate('2018-01-01','2018-12-31')
	#S1_Collection = ee.ImageCollection('COPERNICUS/S1_GRD').filterDate('2013-05-01','2020-05-15')
	#S1_Collection = ee.ImageCollection('COPERNICUS/S1_GRD').filterDate('2018-06-01','2018-08-01')
	S1_Collection = S1_Collection.filterBounds(regency_poly)
	S1_Collection = S1_Collection.sort('DATE_ACQUIRED')
	S1_Collection = S1_Collection.select(['VH'])
	S1_Collection = S1_Collection.filter(ee.Filter.listContains('transmitterReceiverPolarisation', 'VV'))
	S1_Collection = S1_Collection.filter(ee.Filter.listContains('transmitterReceiverPolarisation', 'VH'))
	S1_Collection = S1_Collection.filter(ee.Filter.eq('instrumentMode', 'IW'))
	S1_Collection = S1_Collection.filter(ee.Filter.eq('orbitProperties_pass', 'DESCENDING'))
	S1_Collection = S1_Collection.filter(ee.Filter.eq('resolution_meters', 10))
 
	colList = S1_Collection.toList(1000)
	n = colList.size().getInfo();
	print  regency_code_str
	print n
	for j in range(0, n):
		img = ee.Image(colList.get(j));		
		id = img.id().getInfo();
		filename = 'S1-DESC-VH-10m-utm-'+ regency_code_str + '-' + id
		fullname_check = "F:\\RS_images\\S1-DESC-VH-10m-utm\\" + filename +  '.tif'
		if os.path.isfile(fullname_check):
			print datetime.now().strftime("%Y-%m-%d %H:%M:%S") + ' sudah didownload->  '  + str(j+1) + ' - ' + filename
		else:		
			task_config = {
			  'description': filename,
			  'scale': 10,
			  'crs' : 'EPSG:32749',
			  'region': regency_region[i],
			  'driveFolder': 'S1-DESC-VH-10m-utm'
			}
			task = ee.batch.Export.image(img, filename, task_config)
			task.start()
			print datetime.now().strftime("%Y-%m-%d %H:%M:%S") + ' ->  '  + str(j+1) + ' - ' + filename


