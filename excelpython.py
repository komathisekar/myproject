import xlrd
loc=(r"/home/test/Downloads/C2-seat-allocation.xls")
wb=xlrd.open_workbook(loc)
sheet=wb.sheet_by_index(0)
sheet.cell_value(0,0) 
column_name=input("Enter the column name:\n")
try:
 if column_name == "Seat number":
  k=0
 elif column_name == "Resource":
  k=1
 elif column_name == "Team":
  k=2
 for i in range(sheet.nrows):
  print(sheet.cell_value(i,k))
except NameError:
 print("give proper input")


