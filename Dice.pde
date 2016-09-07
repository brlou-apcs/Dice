/*
* DEV: BRANDON LOU
* SCHOOL: LOWELL HIGH SCHOOL
* CLASS: AP COMPUTER SCIENCE
*
* Peeking around? Feel free to be inspired by my code!
*
*/

// Much variable
int insTotal, avgTotal, netTotal, total1, total2, total3, total4, total5, total6, numRolls, numRolled;

void setup() {
	size(800,800);   // Size is 800x800
	noLoop();        // Runs draw() only once
	numRolls = 1;
	numRolled = 91;
}

void draw() {

	background(238,130,238); // Background color

	insTotal = 0; // Resets current total

	for (int x = 10; x < width-10; x = x + 60) {      // Loops through x coordinates
		for (int y = 10; y < height/2; y = y+ 60) {   // Loops through y coordinates
			Die d6 = new Die(x,y); // New dice instance named d6
			d6.roll();
			d6.show();
			insTotal += d6.value; // Add value of dice to current total
			netTotal += d6.value; // Add value of dice to net total
		}
	}

	avgTotal = netTotal/numRolls; // Average total is net total divided by number of rolls

	// Display all text
	textSize(25);
	text("Current Total: " + insTotal, 10, 460);
	text("Average Total: " + (int)avgTotal, 10, 500);
	text("Net Total: " + netTotal, 10, 540);
	text("Rolls: " + numRolls, 10, 750);
	text("1's Rolled: " + total1 + " - " + round(((double)total1/(double)numRolled)*100,2) + "%", 400, 460);
	text("2's Rolled: " + total2 + " - " + round(((double)total2/(double)numRolled)*100,2) + "%", 400, 485);
	text("3's Rolled: " + total3 + " - " + round(((double)total3/(double)numRolled)*100,2) + "%", 400, 510);
	text("4's Rolled: " + total4 + " - " + round(((double)total4/(double)numRolled)*100,2) + "%", 400, 535);
	text("5's Rolled: " + total5 + " - " + round(((double)total5/(double)numRolled)*100,2) + "%", 400, 560);
	text("6's Rolled: " + total6 + " - " + round(((double)total6/(double)numRolled)*100,2) + "%", 400, 585);
}

// When mouse is pressed
void mousePressed() {
	numRolls++;      // Number of rolls increase by 1
	numRolled += 91; // Number of diced rolled increase by 91
	redraw();        // Runs draw function again
}

// Class to model a D6 die
class Die { 

	// Class variables
	int value, myX, myY;

	// Constructor... get's the x and y coordinates
	Die(int x, int y) {
		myX = x;
		myY = y;
	}

	// Roll method
	void roll() {
		value = (int)(Math.random() * 6 + 1); // Random int from 1 to 6
	}

	// Show method
	void show() {

		// Draws a white square
		stroke(0);
		fill(255);
		rect(myX, myY, 50, 50);

		// Draws the dots
		fill(0);
		switch(value) { // Switch case for each random value 1 - 6
			case 1:
				ellipse(myX + 25, myY + 25, 10, 10);
				total1++;
				break;
			case 2:
				ellipse(myX+15,myY+15,10,10);
				ellipse(myX+35,myY+35,10,10);
				total2++;
				break;
			case 3:
				ellipse(myX+15,myY+15,10,10);
				ellipse(myX+25,myY+25,10,10);
				ellipse(myX+35,myY+35,10,10);
				total3++;
				break;
			case 4:
				ellipse(myX+15,myY+15,10,10);
				ellipse(myX+35,myY+15,10,10);
				ellipse(myX+15,myY+35,10,10);
				ellipse(myX+35,myY+35,10,10);
				total4++;
				break;
			case 5:
				ellipse(myX+15,myY+15,10,10);
				ellipse(myX+35,myY+15,10,10);
				ellipse(myX+15,myY+35,10,10);
				ellipse(myX+35,myY+35,10,10);
				ellipse(myX+25,myY+25,10,10);
				total5++;
				break;
			case 6:
				ellipse(myX+12.5,myY+15,10,10);
				ellipse(myX+12.5,myY+35,10,10);
				ellipse(myX+25,myY+15,10,10);
				ellipse(myX+25,myY+35,10,10);
				ellipse(myX+37.5,myY+15,10,10);
				ellipse(myX+37.5,myY+35,10,10);
				total6++;
				break;
		}
	}
}

// Rounding function I found on StackOverflow... used for the percentage to the hundredths place
private static double round (double value, int precision) {
    int scale = (int)Math.pow(10, precision);
    return (double)Math.round(value * scale) / scale;
}
