// osu! written in Processing
// Azza 2019
// For an understanding of how osu! elements works have a read of these:
// https://osu.ppy.sh/help/wiki/Skinning/osu!
// https://osu.ppy.sh/help/wiki/osu!_File_Formats/Osu_(file_format)
// Check c_config.pde to set things up before running.

// Import sound libray
import ddf.minim.*;
Minim minim;
AudioPlayer player;

String errorMessage = "";

void setup() {
    // Setup
    frameRate(69420);
    size(640,480);
    //fullScreen();
    background(0);
    // Loads
    minim = new Minim(this); //load mini
    loadImages(); // f_loadImages.pde
    getSongs(); //s_selection.pde
    noCursor(); // turns off the default cursor
}
int rot = 0;
int timem; // time in millis since starting a song
int x = 0;
void draw() {
    //Print the current memory used
    if (debug) {
        println((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory()) / (1024 * 1024) + " MB");
    }

    background(0);
    imageMode(CENTER);

    switch (state) {
        case selection:
            selectionScreen(); //s_selection.pde
        break;
        case playing:
            standardScreen(); //s_standard.pde
        break;
        case loading:
            textSize(50);
            String load = "Loading...";
            text(load, width / 2 - textWidth(load), height / 2 - 50);
        break;
        case error:
            //draw the error message
            textSize(32);
            fill(255);
            text(errorMessage, 50, 50);
        break;
        case testing:
            x = 0;
            for (int i = 0; i <= 9; i++) {
                image(combonum[i], x, 0);
                x += 25;
            }
        break;
    }
    // Draw the framerate
    fill(82, 186, 113); //cool green
    noStroke(); // remove the white border
    rect(width - 60, height - 20, 60, 20, 5, 5, 5, 5); //draw the green box
    fill(255); // change color to white
    textSize(15); // change the text size
    text(int(frameRate) + "fps", width - 55, height - 5); // draw the framerate
    // Draw the cursor
    image(cursor, mouseX, mouseY);
}