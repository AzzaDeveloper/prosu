// osu! written in Processing
// Azza 2019
// For an understanding of how osu! elements works have a read of these:
// https://osu.ppy.sh/help/wiki/Skinning/osu!
// https://osu.ppy.sh/help/wiki/osu!_File_Formats/Osu_(file_format)

// ----------------------------------------------------------------------- /
// the Cirlce object is stored in circle.pde
// drawObj is stored in drawObjFunction.pde
// ----------------------------------------------------------------------- //

// Import sound libray
import ddf.minim.*;
Minim minim;
AudioPlayer player;
// Array to store circles read from loadSong.pde
ArrayList<Circle> circles = new ArrayList<Circle>();
// Circles counter
int counter = 0;
// Setup
void setup() {
    size(640,480);
    background(0);
    //load .osu
    int code = loadSong("./Songs/test/");
    switch (code) {
        case 0:
            //OK
            break;
        case 1:
            //No .osu found
            exit();
            break;
    }
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
		drawobj(queue.get(i).x, queue.get(i).y, queue.get(i).combo);
	}
}