// osu! written in Processing
// Azza 2019
// For an understanding of how osu! elements works have a read of these:
// https://osu.ppy.sh/help/wiki/Skinning/osu!
// https://osu.ppy.sh/help/wiki/osu!_File_Formats/Osu_(file_format)

// ----------------------------------------------------------------------- /
/* Bug tracker
-Program will crash if the song ends
*/
// ----------------------------------------------------------------------- //

// Import sound libray
import ddf.minim.*;
Minim minim;
AudioPlayer player;
// Circle (hit circle) object Class
class Circle {
    int x;
    int y;
    int time;
    int type;
    int combo;
    // Constructor
    Circle(int x1, int y1, int time1, int type1) {
        x = x1;
        y = y1;
        time = time1;
        type = type1;
    }
}
// Array to store circles read from the file
ArrayList<Circle> circles = new ArrayList<Circle>();
// Circles counter
int counter = 0;
// Setup
void setup() {
    size(640, 480);
    background(0);
    // Read the .osu file
    String[] lines = loadStrings("test.osu");
    // Run through every line in the file
    for (int i = 0; i < lines.length; i++) {
        // If found [HitObjects] then read the rest of the lines in the file
        if (lines[i].equals("[HitObjects]")) {
            for (int n = i + 1; n < lines.length; n++) {
                //Reading the HitObjects parameters (separated by ,)
                String[] params = split(lines[n], ",");
                // Adding circles to the the Array 
                Circle hit = new Circle(int(params[0]), int(params[1]), int(params[2]), int(params[3]));
                circles.add(hit);
                counter++;
            }
            //Breaking the for loop since we already went through the hit cirlces
            break;
        }
    }
    //Audio control
    minim = new Minim(this);
    player = minim.loadFile("audio.mp3");
	player.setGain(-10);
    player.play();
    println(counter);
}
// Function to draw a circle
void drawobj(int x, int y, int curcombo) {
    imageMode(CENTER);
    // Stringify the currrent hit object combo so we can read the characters
    String combo = str(curcombo);
    int offset = x - loadImage("./skin/default-0.png").width / 2 * (combo.length() - 1);
    // Load in images from ./sking
    PImage hitcircle = loadImage("./skin/hitcircle.png");
    PImage hitcircleoverlay = loadImage("./skin/hitcircleoverlay.png");
    for (int i = 0; i < combo.length(); i++) {
        // Load in the combo numvers from ./skin
        PImage combonum = loadImage("./skin/default-" + str(combo.charAt(i)) + ".png");
        // fix the offset
        // Resize it to osu! standards
        combonum.resize(floor(0.8 * combonum.width), 0);
        image(combonum, offset, y);
        // Increase the offset to draw the next combo number
        offset += combonum.width;
    }
    //draw it
    image(hitcircle, x, y);
    image(hitcircleoverlay, x, y);
}
// The current hit object combo
int comboc = 1;
// Counter of how many circles displayed
int count = 0;
// Queue of circles to draw every frame
ArrayList<Circle> queue = new ArrayList<Circle>();
void draw() {
    background(0);
    // Retrieve the circle info from the Array
    Circle circle = circles.get(count);
    // Run through circles in the queue
	for (int i = 0; i < queue.size(); i++) {
        // If it has been >500 ms since the circles appeared then remove it from queue (no longer displayed next frame)
		if (millis() - queue.get(i).time >= 500) {
			queue.remove(i);
		}
	}
    // If the current time ran is above the time of the circle then display it
    if ((millis() >= circle.time)) {
        // update the circle combo counter with the current combo
        circle.combo = comboc;
        // Add the circle to the queue for later displaying
        queue.add(circle);
        // check for new combo from the type of the circle
        if ((circle.type == 2) || ((circle.type >= 4) && (circle.type <= 6))) {
            comboc = 0;
        }
        //update the combo
		count++;
        comboc++;
    }
	for (int i = 0; i < queue.size(); i++) {
        //display the circles in the queue
        println("combo: " + circle.combo);
        println("i: ", i);
		drawobj(queue.get(i).x, queue.get(i).y, queue.get(i).combo);
	}
}