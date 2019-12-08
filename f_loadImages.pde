PImage cursor;
PImage[] hit = new PImage[4];

PImage hitcircle;
PImage hitcircleoverlay;
PImage approachcircle;
PImage cursortrail;
PImage[] combonum = new PImage[10];



void loadImages() {
    cursor = loadImage("./skin/cursor.png"); cursor.resize(int(cursor.width * 0.8), 0); //resize cursor

    hitcircle = loadImage("./skin/hitcircle.png");
    hitcircleoverlay = loadImage("./skin/hitcircleoverlay.png");
    approachcircle = loadImage("./skin/approachcircle.png");
    cursortrail = loadImage("./skin/cursortrail.png");

    hit[3] = loadImage("./skin/hit300.png");
    hit[2] = loadImage("./skin/hit100.png");
    hit[1] = loadImage("./skin/hit50.png");
    hit[0] = loadImage("./skin/hit0.png");

    for (int i = 0; i <= 9; i++) {
        //load the combo numbers
        combonum[i] = loadImage("./skin/default-"+ str(i) + ".png");
    }
}