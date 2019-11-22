void drawobj(Circle circle) {
    imageMode(CENTER);
    // Stringify the currrent hit object combo so we can read the digits
    String combo = str(circle.combo);
    int offset = circle.x - loadImage("./skin/default-0.png").width / 2 * (combo.length() - 1);
    // Load in images from ./sking
    for (int i = 0; i < combo.length(); i++) {
        // The image of the current combo digit
        int combon = Character.getNumericValue(combo.charAt(i));
        //draw the combo
        image(combonum[combon], offset, circle.y);
        // Increase the offset to draw the next combo number
        offset += combonum[combon].width;
    }
    //resize circle
    hitcircle.resize((int)cs, (int)cs);
    hitcircleoverlay.resize((int)cs, (int)cs);
    //draw it
    image(hitcircle, circle.x, circle.y);
    image(hitcircleoverlay, circle.x, circle.y);
}