PImage cursor;
PImage hit300;
PImage hit100;
PImage hit50;
PImage hit0;

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

    hit300 = loadImage("./skin/hit300.png");
    hit100 = loadImage("./skin/hit100.png");
    hit50 = loadImage("./skin/hit50.png");
    hit0 = loadImage("./skin/hit0.png");

    for (int i = 0; i <= 9; i++) {
        //load the combo numbers
        combonum[i] = loadImage("./skin/default-"+ str(i) + ".png");
    }
}