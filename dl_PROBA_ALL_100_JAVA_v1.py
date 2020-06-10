# Import the Earth Engine Python Package
import ee
import time
import os
import math
from datetime import datetime

# Initialize the Earth Engine object, using the authentication credentials.
ee.Initialize()

def getPROBA(img):
	RED = img.select(['RED'])	
	NIR = img.select(['NIR'])
	BLUE = img.select(['BLUE'])
	SWIR = img.select(['SWIR'])	
	NDVI = img.select(['NDVI']).toInt16()
	SM = img.select(['SM']).toInt16()
	return img.select([]).addBands([RED,NIR,BLUE,SWIR,NDVI,SM]).select([0,1,2,3,4,5],['RED','NIR','BLUE','SWIR','NDVI','SM'])  


java_region =[[[104.87671324999405, -6.617130502942074],[105.26123473436905, -7.216977733951505],[107.00806090624405, -7.772491468163925],[109.24927184374405, -8.055415211422698],[112.06177184374405, -8.58807517471107],[114.70947692186905, -9.06574699261073],[114.72046324999405, -7.696286806092489],[114.45679137499405, -6.715338959664886],
[109.91943785936905, -5.950995062539529],[106.53564879686905, -5.601218082333037],[105.04150817186905, -6.180416120421386]]]
		  
		  
java_poly = ee.Geometry.Polygon(java_region)

PROBA_Collection = ee.ImageCollection('VITO/PROBAV/C1/S1_TOC_100M').filterDate('2014-01-01','2020-01-01')
PROBA_Collection = PROBA_Collection.filterBounds(java_poly)
PROBA_Collection = PROBA_Collection.sort('DATE_ACQUIRED')
PROBA_Collection = PROBA_Collection.select(['RED','NIR','BLUE','SWIR','NDVI','SM'])
PROBA_Collection = PROBA_Collection.map(getPROBA)

colList = PROBA_Collection.toList(4000)
n = colList.size().getInfo();
print n
for j in range(0, n):
	img = ee.Image(colList.get(j));		
	id = img.id().getInfo();
	filename = 'PROBA-TOC-ALL-JAVA-100m-utm-' + id
	fullname_check = "F:\\RS_images\\PROBA-TOC-ALL-JAVA-100m-utm\\" + filename +  '.tif'
	if os.path.isfile(fullname_check):
		print datetime.now().strftime("%Y-%m-%d %H:%M:%S") + ' sudah didownload->  '  + str(j+1) + ' - ' + filename
	else:		
		task_config = {
		  'description': filename,
		  'scale': 100,
		  'crs' : 'EPSG:32749',
		  'region': java_region,
		  'driveFolder': 'PROBA-TOC-ALL-JAVA-100m-utm'
		}
		task = ee.batch.Export.image(img, filename, task_config)
		task.start()
		print datetime.now().strftime("%Y-%m-%d %H:%M:%S") + ' ->  '  + str(j+1) + ' - ' + filename


