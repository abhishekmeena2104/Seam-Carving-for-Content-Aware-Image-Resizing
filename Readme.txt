               
			 
			   # Name      - Abhishek Meena
			   # Deapartment of Electrical Engineering
                           # IIT KANPUR

		
		

  PROJECT TOPIC : IMAGE RESIZING


content-sensitive-image-resizing

 RESEARCH PAPER :A  content-sensitive image resizing algorithm using "seam-carving", based on this paper: 
([Avidan, Shamir 2007)](http://www.win.tue.nl/~wstahw/edu/2IV05/seamcarving.pdf)

The idea is to figure out what's important in an image, and then reduce and enlarge the image without distorting the important parts.

To automatically identify "interesting" parts of a image, I used gradient magnitude as an energy function. Then removed 8-connected one-pixel-wide seams, one at a time, 
based on minimizing the cumulative-sum of energy values along a seam using dynamic programming. The actual seam choice by the algorithm is optimal!

KEY STEPS:

STEP 1: The gradient magnitude values at each pixel.
STEP2: The cumulative-minimum-energy values at each pixel, (the cost of the cheapest path to that pixel in the previous image, if you start at the top).
STEP3: Then finding the optimum path,the path with the lowest cummulative energy associated with it .
STEP4: Removing the seam for reducing the image or introducing a new col/row to enlarge the image.


CONS of the algorithm:

It's  slow for large images, because it's dynamic and not easily vectorizable and matlab is slow. The time complexity is O(n^3) where n is whichever dimension 
of the image is larger. I don't think that can be reduced, but it could definitely be rewritten in C.


 There are two main files in the folder -
 1. main_minimize   -  to reduce the size of the image
 2. main_enlarge    -  to increase the size of the image
 
 rest are the functions 
 
 
 Remaining work-
 
 1. object deletion using seam carving algorithm.
 2. to reduce the image size without distorting the faces.(seam carving + face detection )
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
