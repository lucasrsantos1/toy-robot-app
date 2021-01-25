## Toy Robot App

This challenge is to simulate toy robots moving on a 6x6 square board, the robots can move around the surface of the board, but cannot collide with each other or fall off the edge.

## Instructions

To run the Toy Robot App, first generate a CSV file in the following format:

NAME,ACTION,X,Y,F
ALICE,PLACE,0,0,NORTH
ALICE,MOVE
ALICE,REPORT

Next run the following command: `ruby -r "./lib/toy_robot_app.rb" -e "ToyRobotApp.call './data/test-data-1.csv'"` replacing `./data/test-data-1.csv` with the location of your CSV file.