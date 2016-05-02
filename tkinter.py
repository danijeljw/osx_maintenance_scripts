#import libraries
import os
from Tkinter import *

#create the window
root = Tk()

#modify the root window
root.title('Simple GUI')
root.geometry('600x300')

#create the frame to hold widgets
app = Frame(root)

#put the frame in the grid
app.grid()

#create labels
label = Label(app, text = 'This is a label!')
label.grid()

#create a button
button1 = Button(app, text = 'This is a button')
button1.grid()

#create second button
button2 = Button(app)
button2.grid()
button2.configure(text = 'This will show text')

#button 3
button3 = Button(app)
button3.grid()
button3['text'] = 'This will show up as well'


#kick off the main event
root.mainloop()

