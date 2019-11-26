PImage cursor;
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
    for (int i = 0; i <= 9; i++) {
        //load the combo numbers
        combonum[i] = loadImage("./skin/default-"+ str(i) + ".png");
    }
}