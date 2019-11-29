from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import Select
from selenium.webdriver import ActionChains
from openpyxl import load_workbook

import time
import os
import shutil

CONFIG_FILE="D:\AIPOS - Fixathon\ODH_GRAFANA.xlsx"
DOWNLOAD_PATH="D:/AIPOS - Fixathon/ODH_GRAFANA/"

PATH = r"C:\Users\komathi.s\Documents\My Received Files\chromedriver.exe"
chrome_options = webdriver.ChromeOptions()	
prefs = {'download.default_directory' : 'D:/AIPOS - Fixathon/ODH_GRAFANA/'}	
chrome_options.add_experimental_option('prefs', prefs)
chrome_options.add_argument('--start-maximized')
driver = webdriver.Chrome(PATH,chrome_options=chrome_options)
                                                                                                                          

driver.get("http://connectivity.odh.lgi.io/grafana/login")
time.sleep(5)
	
elem = driver.find_element_by_name("username")
elem.click()
elem.clear()
elem.send_keys("gsundaravadivelu")

elem = driver.find_element_by_name("password")
elem.click()
elem.clear()
elem.send_keys("Mar-2019")

elem = driver.find_element_by_xpath('//*[@id="login-view"]/form/div[3]/button')
elem.click()
time.sleep(5)

wb = load_workbook(filename=CONFIG_FILE, read_only=True)	
ws_URL = wb['Dashboard_URL']

ws_URL_Cells = ws_URL['A2': 'D50']

ws_chDet_name = []
ChartUrl = []
for c1UrlCountry, c2UrlEnv, c3UrlDash, c4UrlChartUrl  in ws_URL_Cells:
	if c1UrlCountry.value == "END":
		break
	else:
		ws_chDet_name.append(c1UrlCountry.value + "_" + c3UrlDash.value) 
		ChartUrl.append(c4UrlChartUrl.value)
def downloads_done():
    print ("Vijay111")
    for i in os.listdir(DOWNLOAD_PATH):
        if ".crdownload" in i:
            time.sleep(3)
            print ("Vijay")
            downloads_done()

        if ".tmp" in i:
            time.sleep(3)
            print ("Vijay2")
            downloads_done()
            
def download_csv():
	for sheet,url in zip(ws_chDet_name,ChartUrl):
		ws_chDet = wb[sheet]
		ws_chDet_Cells = ws_chDet['A2': 'E150']
		driver.get(url)
		time.sleep(10)
		list_ChartTitles = []
		list_ChartTitles = driver.find_elements_by_class_name('panel-title-text')
	
		for c1ChDetCountry, c2ChDetEnv, c3ChDetDash, c4ChDetModule, c5ChDetChart  in ws_chDet_Cells:
			if c1ChDetCountry.value == "END":
				break
			else:
			
				VarCahrtName = c5ChDetChart.value
				elem_clickTitle = [x for x in list_ChartTitles if VarCahrtName == x.text][0]
				elem_clickTitle.click()

				list_dropDown_Menu = driver.find_elements_by_class_name("dropdown-item-text")

				elemMore_hover = [x1 for x1 in list_dropDown_Menu if "More ..." == x1.text][0]

				actions = ActionChains(driver)
				time.sleep(1)
				actions.move_to_element(elemMore_hover).perform()

				list_dropDown_SubMenu = driver.find_elements_by_class_name("dropdown-item-text")

				elemExportCSV = [x2 for x2 in list_dropDown_SubMenu if "Export CSV" == x2.text][0]
				elemExportCSV.click()

				elemExportMenu = driver.find_element_by_css_selector("input.gf-form-input.ng-pristine.ng-untouched.ng-valid.ng-not-empty")
				elemExportMenu.click()
				elemExportMenu.clear()
				elemExportMenu.send_keys("YYYY-MM-DD HH:mm")
					
				#slider = driver.find_element_by_xpath(".//*[contains(text(), 'Excel CSV Dialect')]")
				#slider.click()

				time.sleep(3)
				elem = driver.find_element_by_css_selector("a.btn.btn-success")
				elem.click()
				time.sleep(1)

				VarCahrtName_NOSpl = VarCahrtName.replace('/', '')

				newfilename = DOWNLOAD_PATH + "Mon__" + c1ChDetCountry.value + "__" + c2ChDetEnv.value + "__" + c3ChDetDash.value +"__" + VarCahrtName_NOSpl + "__.csv"
				time.sleep(1)   
				downloads_done()
                
				filename = max([DOWNLOAD_PATH +"\\"+ f for f in os.listdir(DOWNLOAD_PATH)], key=os.path.getmtime)
				shutil.move(os.path.join(DOWNLOAD_PATH,filename),newfilename)    
		
while True:
	download_csv()
	time.sleep(900)
