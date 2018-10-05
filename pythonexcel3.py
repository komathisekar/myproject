import xlrd 
import xlwt
loc=(r"/home/test/Downloads/C2-seat-allocation.xls")
locs=(r"/home/test/Downloads/kom.xls")
wb=xlrd.open_workbook(loc)
wbs=xlrd.open_workbook(locs)
sheet=wb.sheet_by_index(0)
sheets=wbs.sheet_by_index(0)
sheet.cell_value(0,0)
sheets.cell_value(0,0)
from xlwt import Workbook
wbss=Workbook()
sheet1=wbss.add_sheet('sheet 1')
value=[]
for col in range(sheet.nrows):
 if sheet.cell_value(col,2) == "ODH":
  k=col
  value.append(sheet.cell_value(k,1))
  value.append(sheet.cell_value(k,2))
  sheet1.write(col,0,sheet.cell_value(k,1))
  sheet1.write(col,1,sheet.cell_value(k,2))
  for x in range(sheets.nrows):
   if sheets.cell_value(x,0) == sheet.cell_value(k,1):
    value.append(sheets.cell_value(x,1))
    sheet1.write(col,2,sheets.cell_value(x,1))
print(value)
wbss.save('pythonexcel.xls')
