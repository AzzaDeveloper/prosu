ArrayList<SelectionBox> boxes = new ArrayList<SelectionBox>();
void getSongs() {
    File[] filenames = listFiles(songsPath); //Get all of the folders in ./songs
    //drawing the names to the screen with a box surrounding them
    int ySelection = 45; //y value for song selection elements
    for (int i = 0; i < filenames.length; i++) {
        //removing the id from the beatmap
        String[] string = filenames[i].getName().split(" ");
        string[0] = "";
        // Creating a new SelectionBox and adding them to the Array
        SelectionBox box = new SelectionBox(5, ySelection - 40, 630, 50, join(string, " "), filenames[i].getAbsolutePath());
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
        rect(box.x, box.y, box.width, box.height);
        text(box.content, 10, box.y + 33);
        //check for mouse click on box
        if ((mx > box.x) && (my > box.y) && (mx < box.x + box.width) && (my < box.y + box.height)) {
            loadSong(box.path);
            state = playing;
            timem = millis();
        }
    }
    scroll *= 0;
    println("scroll: "+scroll);
}