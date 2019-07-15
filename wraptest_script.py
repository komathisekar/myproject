import textwrap3
String = input("Enter a String : ")  #string input
count=len(String)     #finding the string length
try:
 width =int(input("Enter the width : "))  
 if(width > count):    #comparing the width & string length
  print("Entered width is greater than String count")
 else:
  wrapper = textwrap3.TextWrapper(width) 
  word_list = wrapper.wrap(text=String)
  for element in word_list: 
   print(element)
except ValueError:
 print("Enter a valid number")
