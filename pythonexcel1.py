import xlrd 
sheet_data = []
found = []
rows_to_be_saved = []
loc=(r"/home/test/Downloads/C2-seat-allocation.xls")
wb=xlrd.open_workbook(loc)
sheet=wb.sheet_by_index(0)
sheet.cell_value(0,0)
value=[]
team_name=input("Enter the team name\n1.ODH\n2.EYE-BALL\n3.DEVOPS\n4.NA\n.others\n")
try:
 if team_name == "ODH":
  for col in range(sheet.nrows):
   if sheet.cell_value(col,2) == "ODH":
    k=col
    value.append(sheet.cell_value(col,0))
    value.append(sheet.cell_value(col,1))
  print(value)
 elif team_name == "EYE-BALL":
  for col in range(sheet.nrows):
   if sheet.cell_value(col,2) == "EYE-BALL":
    k=col
    value.append(sheet.cell_value(col,0))
    value.append(sheet.cell_value(col,1))
  print(value)
 elif team_name == "DEVOPS":
  for col in range(sheet.nrows):
   if sheet.cell_value(col,2) == "DEVOPS":
    k=col
    value.append(sheet.cell_value(col,0))
    value.append(sheet.cell_value(col,1))
  print(value)
 elif team_name == "NA":
  for col in range(sheet.nrows):
   if sheet.cell_value(col,2) == "NA":
    k=col
    value.append(sheet.cell_value(col,0))
    value.append(sheet.cell_value(col,1))
  print(value)
except:
 print("give correct team name")

