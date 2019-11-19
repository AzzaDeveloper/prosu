void drawobj(Circle circle) {
    imageMode(CENTER);
    // Stringify the currrent hit object combo so we can read the characters
    String combo = str(circle.combo);
    int offset = circle.x - loadImage("./skin/default-0.png").width / 2 * (combo.length() - 1);
    // Load in images from ./sking
    PImage hitcircle = loadImage("./skin/hitcircle.png");
    PImage hitcircleoverlay = loadImage("./skin/hitcircleoverlay.png");
    for (int i = 0; i < combo.length(); i++) {
        // Load in the combo numvers from ./skin
        PImage combonum = loadImage("./skin/default-" + str(combo.charAt(i)) + ".png");
        // Resize it to osu! standards
        combonum.resize(floor(0.8 * combonum.width), 0);
        //draw the combo
        image(combonum, offset, circle.y);
        // Increase the offset to draw the next combo number
        offset += combonum.width;
    }
    //draw it
    image(hitcircle, circle.x, circle.y);
    image(hitcircleoverlay, circle.x, circle.y);
}