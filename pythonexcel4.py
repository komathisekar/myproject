import xlrd
import xlwt
from xlrd import workbook
wb=xlrd.open_workbook("")
sheet=wb.sheet_by_index(1)
sheet.cell_value(0,0)
wbs=xlrd.open_workbook("")
sheets=wbs.sheet_by_index(0)
sheets.cell_value(0,0)
value=[]
try:
 for x in range(sheet.ncols):
  if sheet.cell_value(0,x) == "From Vendor":
   k=x
   y=k-1
   for x in range(sheet.nrows):
    if sheet.cell_value(x,k) == "SeaChange":
     z=x 
     for x in range(sheets.ncols):
      if sheets.cell_value(0,x) == "Subcomponents":
       i=x
        if sheets.cell_value(0,x) == "Hostname":
         j=x
         for x in range(sheets.nrows):
          if sheets.cell_value(x,i) == sheet.cell_value(z,y):
           value.append(sheets.cell_value(x,j)
           print(value)
with open('excel.txt','w') as f:
 for item in value:
  f.wite("%s\n" % item)
except:
 print("Not found")
      
