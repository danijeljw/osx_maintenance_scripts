from Tkinter import *

class Application(Frame):
  '''A GUI application with three buttons'''
  
  def __init__(self, master):
    ''' Initialise the frame'''
    Frame.__init__(self,master)
    self.grid()
    self.button_clicks = 0 #count the number of button clicks
    self.create_widgets()


  def create_widgets(self):
    self.button3 = Button(self)
    self.button3.grid()
    self.button3['text'] = 'This will also show text'
    self.button3['command'] = self.update_count

  def update_count(self):
    '''increase the click count and display new total'''  
    self.button_clicks += 1
    self.button3['text'] = 'Total clicks: ' + str(self.button_clicks)
  
  
  
# code for other buttons
'''
    #create second button
    self.button2 = Button(self)
    self.button2.configure(text = 'This will show up text')
    self.button2.grid()
    
    #create third button
    self.button3 = Button(self)
    self.button3.grid()
    self.button3['text'] = 'This will also show text'
'''

'''    
  def create_widgets(self):
    #Create button to display number of clicks
    #create first button
    self.button1 = Button(self, text = 'Total clicks: 0')
    self.button1['command'] = self.update_count
    self.button1.grid()
'''

root = Tk()
root.title('Lazy button')
root.geometry('400x200')

app = Application(root)

root.mainloop()