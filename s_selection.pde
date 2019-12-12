ArrayList<SelectionBox> boxes = new ArrayList<SelectionBox>();
void getSongs() {
    File[] filenames = listFiles(songsPath); //Get all of the folders in ./songs
    //drawing the names to the screen with a box surrounding them
    int ySelection = 5; //y value for song selection elements
    for (int i = 0; i < filenames.length; i++) {
        //removing the id from the beatmap
        String[] string = filenames[i].getName().split(" ");
        string[0] = "";
        String name = join(string, " ");
        // Creating a new SelectionBox and adding them to the Array
        SelectionBox box = new SelectionBox(width / 5, ySelection, name, filenames[i].getAbsolutePath());
        boxes.add(box);
        // Offset y to draw the next box
        ySelection += 70; 
    }
}
void selectionScreen() {
    noFill();
    strokeWeight(1);
    stroke(255);
    textSize(25);
    for (int i = 0; i < int(boxes.size()); i++) {
        SelectionBox box = boxes.get(i);
        box.y -= scroll * 1;
        // Make selection box visble if it in range
        if (box.y > -60 && box.y < height + 60) {
            //draw the selection box
            if (collision(mouseX, mouseY, box.x, box.y - 25, 2000, 60)) {
                // if hovered move the x back smoothly with lerp
                box.x = lerp(box.x, width / 5, 0.03);
            } else {
                // else draw normally
                box.x = lerp(box.x, width / 2, 0.03);
            }
            rect(box.x, box.y, 2000, 50);
            text(box.content, box.x + 5, box.y + 33);
            //check for mouse click on box
            if ((mx > box.x) && (my > box.y) && (mx < box.x + 2000) && (my < box.y + 50)) {
                String song = loadSong(box.path);
                player = minim.loadFile(song);
                //play the audio
                player.setGain(-10);
                player.play();
                state = playing;
                //set the song start time
                timem = millis();
            }
        }
    }
    scroll = lerp(scroll, 0, 0.01);
}