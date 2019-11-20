/*ArrayList<SelectionBox> boxes = new ArrayList<SelectionBox>(); // Array to store box info
int stage = 1;
void getSongs(int stage, String path) {
    boxes.clear();
    File[] filenames = listFiles(songsPath);
    if (stage == 2) {
        filenames = listFiles(songsPath -> endsWith(".osu"); //Get all of the folders in ./songs, change path in c_config
    } else if (stage == 3) {
        String[] lines = loadStrings(path);
        readfile(lines, path);
        state = playing;
        timem = millis();
    }
    //drawing the names to the screen with a box surrounding them
    int ySelection = 45; //y value for song selection element
    for (int i = 0; i < filenames.length; i++) {
        //removing the id from the beatmap
        String[] string = filenames[i].getName().split(" ");
        string[0] = "";
        //adding the made box to selectionbox for detecting mouse clicks later
        SelectionBox box = new SelectionBox(5, ySelection - 40, 630, 50, join(string, " "), filenames[i].getAbsolutePath());
        boxes.add(box);
         //offset the y
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
        rect(box.x, box.y, box.width, box.height);
        text(box.content, box.x, box.y + 5);
        //check for mouse click on box
        if ((mx > box.x) && (my > box.y) && (mx < box.x + box.width) && (my < box.y + box.height)) {
            /*loadSong(box.path);
            state = playing;
            timem = millis();
            getSongs(stage + 1, box.path);
    }
}*/
ArrayList<SelectionBox> boxes = new ArrayList<SelectionBox>();
void getSongs() {
    File[] filenames = listFiles(songsPath); //Get all of the folders in ./songs
    //drawing the names to the screen with a box surrounding them
    int ySelection = 45; //y value for song selection elements
    for (int i = 0; i < filenames.length; i++) {
        //removing the id from the beatmap
        String[] string = filenames[i].getName().split(" ");
        string[0] = "";
        //adding the made box to selectionbox for detecting mouse clicks later
        SelectionBox box = new SelectionBox(5, ySelection - 40, 630, 50, join(string, " "), filenames[i].getAbsolutePath());
        boxes.add(box);
        //offset the y
        ySelection += 70;
    }
}
void selectionScreen() {
    noFill();
    stroke(255);
    textSize(25);
    for (int i = 0; i < boxes.size(); i++) {
        SelectionBox box = boxes.get(i);
        box.y -= (scroll * 25);
        //draw the selection box
        rect(box.x, box.y, box.width, box.height);
        text(box.content, 10, box.y + 33);
        //check for mouse click on box
        if ((mx > box.x) && (my > box.y) && (mx < box.x + box.width) && (my < box.y + box.height)) {
            loadSong(box.path);
            state = playing;
            timem = millis();
            print(box.path);
        }
    }
    scroll = 0;
}