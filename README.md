# Viagogo-Coding-Challenge

Instructions for accessing xcode project to look at code:
- you must have a mac with the most recent version of xcode
- clone or download this repository and open up the .xcodeproj file


Instructions for running the mac app:
- you must have a mac
- clone or download this repository and open the mac app
- enter the x and y coordinates into the text fields
- click generate
- a graph should appear displaying your location in blue, nearest event locations in red, and the rest of events in green
- information of the nearest events will appear along with the cheapest ticket for that event
- if your input is of the incorrect format, red error messages will appear explaining the fault


Assumptions:
- ticket price ranges from 1-300 dollars
- each event has 0-10 tickets
- world has 6-50 events. 6 is minimum so world can display nearest 5.
- each xcoordinate is an integer
- each ycoordinate is an integer


Changing the program to support multiple events at the same location:
- I would have a separate class for locations, where each location has an array of events, and the world has an array of locations

Changing the program to support a much larger world:
- I would have to further optimise the code. It would also be preferable to reduce the number of tickets per event and number of events per world. This would reduce the amount of data the program has to produce, and  searching through the events and tickets arrays would be faster if you reduce the quantity of data.
