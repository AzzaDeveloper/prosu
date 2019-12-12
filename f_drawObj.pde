void drawobj(Circle circle) {
    tint(255, circle.alpha);
    // Stringify the currrent hit object combo so we can read the digits
    String combo = str(circle.combo);
    int offset = circle.x - combonum[0].width / 2 * (combo.length() - 1);
    // Load in images from ./skin
    for (int i = 0; i < combo.length(); i++) {
        // The image of the current combo digit
        int combon = Character.getNumericValue(combo.charAt(i));
        //draw the combo
        image(combonum[combon], offset, circle.y);
        // Increase the offset to draw the next combo number
        offset += combonum[0].width;
    }
    //fading in
    if (circle.alpha < 255) {
        circle.alpha += 17;
    }
    //draw it
    image(hitcircle, circle.x, circle.y);
    image(hitcircleoverlay, circle.x, circle.y);
    tint(255, 255);
}