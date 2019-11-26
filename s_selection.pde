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
    for (int i = 0; i < boxes.size(); i++) {
        SelectionBox box = boxes.get(i);
        box.y -= scroll * 25;
        //draw the selection box
        if (((mouseX > box.x) && (mouseY > box.y) && (mouseX < box.x + box.width) && (mouseY < box.y + box.height))) {
            // if hovered move the x back
            rect(width / 5, box.y, box.width, box.height);
            text(box.content, width / 5  + 5, box.y + 33);
        } else {
            // else draw normally
            rect(box.x, box.y, box.width, box.height);
            text(box.content, box.x + 5, box.y + 33);
        }
        //check for mouse click on box
        if ((mx > box.x) && (my > box.y) && (mx < box.x + box.width) && (my < box.y + box.height)) {
            loadSong(box.path);
            state = playing;
            timem = millis();
        }
    }
    scroll *= 0;
}