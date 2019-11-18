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

ArrayList<Circle> circles = new ArrayList<Circle>(); // Array to store circles
int counter = 0; // Circles counter
// Game states
byte state = 2;
static final byte playing = 1;
static final byte selection = 2;
static final byte error = 0;
static final byte testing = 69;
String errorMessage = "";
// Setup
void setup() {
    size(640,480);
    background(0);
    //load .osu
}
int comboc = 1; // The current hit object combo
int count = 0; // Counter of how many circles displayed
int timem; // time in millis since starting a song
int time;
ArrayList<Circle> queue = new ArrayList<Circle>(); // Queue of circles to draw every frame
//mouse functions
int scroll = 0;
void mouseWheel(MouseEvent event) {
  scroll += event.getCount();
}
int mx;
int my;
void mouseClicked() {
    mx = mouseX;
    my = mouseY;
}
void draw() {

    background(0);
    switch (state) {
        case selection:
            File[] filenames = listFiles("./Songs"); //Get all of the folders in ./songs
            ArrayList<SelectionBox> boxes = new ArrayList<SelectionBox>(); // Array to store box ifno
            //text properties
            noFill();
            stroke(255);
            textSize(25);
            //drawing the names to the screen with a box surrounding them
            int ySelection = 45; //y value for song selection elements
            ySelection -= scroll * 25; //scroll 25 pixel each time
            for (int i = 0; i < filenames.length; i++) {
                //removing the id from the beatmap
                String[] string = filenames[i].getName().split(" ");
                string[0] = "";
                rect(5, ySelection - 40, 630, 50); //draw the rectangle to surround the text
                text(join(string, " "), 10, ySelection - 5); // write the song name
                //adding the made box to selectionbox for detecting mouse clicks later
                SelectionBox box = new SelectionBox(5, ySelection - 40, 630, 50, filenames[i].getAbsolutePath());
                boxes.add(box);
                //offset the y
                ySelection += 70;
            }
            for (int i = 0; i < boxes.size(); i++) {
                SelectionBox box = boxes.get(i);
                //check for mouse click on box
                if ((mx > box.x) && (my > box.y) && (mx < box.x + box.width) && (my < box.y + box.height)) {
                    loadSong(box.path);
                    state = playing;
                    timem = millis();
                }
            }
        break;
        case playing:
            time = millis() - timem;
            // Retrieve the circle info from the Array
            Circle circle = circles.get(count);
            // Run through circles in the queue
	        for (int i = 0; i < queue.size(); i++) {
                // If it has been >500 ms since the circles appeared then remove it from queue (no longer displayed next frame)
		        if (time - queue.get(i).time >= 500) {
    			    queue.remove(i);
                }
    		}
            // If the current time ran is above the time of the circle then display it
            if ((time >= circle.time)) {
                circle.combo = comboc; // update the circle combo counter with the current combo
                queue.add(circle); // Add the circle to the queue for later displaying
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
    	    	drawobj(queue.get(i));
            }
        break;
        case error:
            //draw the error message
            textSize(32);
            fill(255);
            text(errorMessage, 50, 50);
        break;
        case testing:
            noFill();
            stroke(255);
        break;
    }   
}