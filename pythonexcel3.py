import xlrd 
import xlwt
import warnings
def fxn():
 warnings.warn("deprecated",DeprecationWarning)
with warnings.catch_warnings():
 warnings.simplefilter("ignore")
 fxn()
from xlwt import Workbook
wb=xlrd.open_workbook("new.xlsx")
sheet=wb.sheet_by_index(0)
sheet.cell_value(0,0)
wbs=xlrd.open_workbook("kom.xlsx")
sheets=wbs.sheet_by_index(0)
sheets.cell_value(0,0)
wbss=Workbook()
sheet1=wbss.add_sheet('sheet 1')
value=[]
value1=[]
value2=[]
count=0
for col in range(sheet.nrows):
 if sheet.cell_value(col,2) == "DEVOPS":
  k=col
  for x in range(sheets.nrows):
   if sheets.cell_value(x,0) == sheet.cell_value(k,1):
    value.append(sheet.cell_value(k,1))
    value1.append(sheet.cell_value(k,2))
    value2.append(sheets.cell_value(x,1))
 else:
  count+=1
  if count == sheet.nrows:
   print("column not found")
   exit()  
list_length=len(value)
for x in range(list_length):
 sheet1.write(x,0,value[x])
 sheet1.write(x,1,value1[x])
for x in range(list_length):
 sheet1.write(x,2,value2[x])
print(value)
print(value1)
print(value2)
wbss.save('pythonexcel4.xlsx')

