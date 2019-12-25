##########################################################    
# Global Variables
t = 0.0
bkgd_clr = 0
extents = 1

##########################################################
def setup():
    size(1920, 1080)
    
##########################################################    
def draw():
    # Reinstate global var to local
    global t
    global bkgd_clr
    global extents
    
    background(bkgd_clr)
    translate(width/2, height/2)
    noFill()
    rectMode(CENTER)

    #***************************
    # Interactive spiral
    # This speed var is used for the spiral effect only and driven by mouseX pos
    # Mouse left is slow and mouse right speeds up animation
    speed = 0.00002
    speed *= mouseX
    
    linLength = 1
    for i in range(1, extents):
    #for i in range(1, 1920):
        
        # Vary strokeWeight based on dist from center
        strokeW = map(i, 0, 400, 1, 3)
        strokeWeight(strokeW)
        #strokeWeight(2)
        
        # Set color variation via mouseY pos
        orig = i
        #clr1 = map(orig, 0, mouseY, 0, 255)
        clr1 = map(mouseY, 0, height, 0, 255)
        clr1 = lerp(clr1, orig, 0.1)
        clr2 = 255 - clr1
        clr3 = clr1 - clr2
        
        if i == 1:
            spinLine(linLength * i, radians(t), color(255, 0, 0))
        else:
            pushMatrix()
            # Line length divided by float to allow for line length of 1 to be divided into a float
            translate((linLength / 2.0) * (i - 1) * cos(radians(t * (i - 1))), (linLength / 2.0) * (i - 1) * sin(radians(t * (i - 1))))
            spinLine(linLength, radians(t * i), color(clr3, clr2, clr1))
            popMatrix()

    #***************************
    # Iterate time via speed; drives global t var
    t+=speed

##########################################################        
def spinLine(lenLine, angle, strokeRGB):
    '''Spin shape via angle'''
    pushMatrix()
    stroke(strokeRGB)
    rotate(angle)
    line(-lenLine/2, 0, lenLine/2, 0)  # Draw centered line
    popMatrix()

##########################################################    
def mouseDragged():
    '''Adjust bkgd color via mouse X dragged'''
    global bkgd_clr
    bkgd_clr = map(mouseX, 0, width, 0, 0)
    # Variation of mouse drag to control bkgd color 
    #bkgd_clr += 1
    #if bkgd_clr == 255:
    #    bkgd_clr = 0
    
    global extents
    extents = int(map(mouseY, 1, height, 1, 2200))
    
        
