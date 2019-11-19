// osu! written in Processing
// Azza 2019
// For an understanding of how osu! elements works have a read of these:
// https://osu.ppy.sh/help/wiki/Skinning/osu!
// https://osu.ppy.sh/help/wiki/osu!_File_Formats/Osu_(file_format)
// All mouse-related processing is done in f_mouse.pde
// Check c_config.pde to set things up before running.

// ----------------------------------------------------------------------- /
// the Cirlce object is stored in circle.pde
// drawObj is stored in drawObjFunction.pde
// ----------------------------------------------------------------------- //

// Import sound libray
import ddf.minim.*;
Minim minim;
AudioPlayer player;

String errorMessage = "";

void setup() {
    size(640,480);
    background(0);
    //load osus
    getSongs(); //s_selection.pde
}

int timem; // time in millis since starting a song

void draw() {
    background(0);
    switch (state) {
        case selection:
            selectionScreen(); //s_selection.pde
        break;
        case playing:
            standardScreen(timem); //s_standard.pde
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