import xlrd
import xlwt
from xlwt import Workbook
wb=xlrd.open_workbook("NETWORK_LLD.xlsx")
sheet=wb.sheet_by_index(1)
sheet.cell_value(0,0)
wbs=xlrd.open_workbook("INFRA_LLD.xlsx")
sheets=wbs.sheet_by_index(0)
sheets.cell_value(0,0)
wbss=Workbook()
sheet1=wbss.add_sheet('sheet 1')
value=[]
value1=[]
value2=[]
for x in range(sheet.ncols):
 if sheet.cell_value(0,x) == "From Vendor":
  k=x
  l=x-1
  for y in range(sheet.nrows):
   if sheet.cell_value(y,k) == "SeaChange":
    z=y
    for a in range(sheets.ncols):
     if sheets.cell_value(1,a) == "Subcomponents":
      v=a
      for  b in range(sheets.nrows):
       if sheets.cell_value(b,v) == sheet.cell_value(z,l):
        for c in range(sheets.ncols):
         if sheets.cell_value(1,c) == "Hostname":
          w=c
          value.append(sheet.cell_value(z,l))
          value1.append(sheets.cell_value(b,v))
          value2.append(sheets.cell_value(b,w))
print(value)
print(value1)
print(value2)
list_length=len(value)
for x in range(list_length):
 sheet1.write(x,0,value[x])
for x in range(list_length):
 sheet1.write(x,1,value1[x])
 sheet1.write(x,2,value2[x])
wbss.save('pythonexcel5.xlsx')
