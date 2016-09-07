int insTotal, avgTotal, netTotal, total1, total2, total3, total4, total5, total6, numRolls, numRolled;

void setup() {
	size(800,800);
	noLoop();
	numRolls = 1;
	numRolled = 91;
}

void draw() {

	background(238,130,238);

	insTotal = 0;

	for (int x = 10; x < width-10; x = x + 60) {
		for (int y = 10; y < height/2; y = y+ 60) {
			Die d6 = new Die(x,y);
			d6.roll();
			d6.show();
			insTotal += d6.value;
			netTotal += d6.value;
		}
	}

	avgTotal = netTotal/numRolls;

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

void mousePressed() {
	numRolls++;
	numRolled+=91;
	redraw();
}

class Die { //models one single dice cube

	int value, myX, myY;

	//variable declarations here

	Die(int x, int y) { // constructor
		myX = x;
		myY = y;
	}

	void roll() {
		value = (int)(Math.random() * 6 + 1);
	}

	void show() {

		stroke(0);
		fill(255);
		rect(myX, myY, 50, 50);

		fill(0);
		switch(value) {
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

private static double round (double value, int precision) {
    int scale = (int) Math.pow(10, precision);
    return (double) Math.round(value * scale) / scale;
}
