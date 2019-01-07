def egyenlo():
    return False

def return_string():
    return "valami return string"

def egyenlo2(a, b):
    if a == b:
        return True
    else:
        return False

def osszead_string(a, b):
    return a+b

def windows_scroll(y,y2):
    if type(y2) == str:
        y3 = int(y2)
    else:
        y3 = y2
    return "window.scrollTo(0," + str(y-(y3))+")"