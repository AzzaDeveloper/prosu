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
        SelectionBox box = new SelectionBox(width / 3, ySelection, 4200, 50, name, filenames[i].getAbsolutePath());
        boxes.add(box);
        // Offset y to draw the next box
        ySelection += 70; 
    }
}
void selectionScreen() {
    noFill();
    stroke(255);
    textSize(25);
    rectMode(CORNER);
    for (int i = 0; i < boxes.size(); i++) {
        SelectionBox box = boxes.get(i);
        box.y -= scroll * 1;
        //draw the selection box
        if (collision(mouseX, mouseY, box.x, box.y - 25, box.width, box.height)) {
            // if hovered move the x back smoothly with lerp
            box.x = lerp(box.x, width / 5, 0.05);
            rect(box.x, box.y, box.width, box.height);
            text(box.content, box.x + 5, box.y + 33);
        } else {
            // else draw normally
            box.x = lerp(box.x, width / 3, 0.05);
            rect(box.x, box.y, box.width, box.height);
            text(box.content, box.x + 5, box.y + 33);
        }
        if ((mx > box.x) && (my > box.y) && (mx < box.x + box.width) && (my < box.y + box.height)) {
            loadSong(box.path);
            state = playing;
            timem = millis();
        }
        //check for mouse click on box
    }
    scroll = lerp(scroll, 0, 0.01);
}