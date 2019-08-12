#Program which  wrap the string into a paragraph of width .
import textwrap3  #textwrap module can be used for wrapping and formatting of plain text
String = input("Enter a String : ")  #string input
count=len(String)     #finding the string length
try:        # error handling if the provided width is not an integer
 width =int(input("Enter the width : "))  
 if(width > count):    #comparing the width & string length
  print("Entered width is greater than String count")
 else:
  wrapper = textwrap3.TextWrapper(width)  #function wraps the input paragraph such that 
  word_list = wrapper.wrap(text=String)   #each line in the paragraph is at most width characters long, returns output as list
  for element in word_list: 
   print(element)  # printing the list
except ValueError:
 print("Enter a valid number")
