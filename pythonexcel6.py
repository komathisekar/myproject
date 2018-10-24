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
  for p in range(sheet.ncols):
   if sheet.cell_value(0,p) == "From subcomponent":
    l=p
  for s in range(sheet.ncols):
   if sheet.cell_value(0,s) == "To Vendor":
    u=s
    for y in range(sheet.nrows):
     if  sheet.cell_value(y,k) == "SeaChange" and  sheet.cell_value(y,u) == "SeaChange":
      z=y
      for a in range(sheets.ncols):
       if sheets.cell_value(1,a) == "Subcomponents":
        v=a
        for  b in range(sheets.nrows):
         if sheets.cell_value(b,v) == sheet.cell_value(z,l):
          for c in range(sheet.ncols):
           if sheet.cell_value(0,c) == "Port":
             w=c
             for d in range(sheet.ncols):
              if sheet.cell_value(0,d) == "To IP":
               o=d
               value.append(sheet.cell_value(z,l))
               value1.append(sheet.cell_value(z,w))
               value2.append(sheet.cell_value(z,o))
print(value)
print(value1)
print(value2)
list_length=len(value)
for x in range(list_length):
 sheet1.write(x,0,value[x])
for x in range(list_length):
 sheet1.write(x,1,value1[x])
 sheet1.write(x,2,value2[x])
wbss.save('pythonexcel12.xlsx')
