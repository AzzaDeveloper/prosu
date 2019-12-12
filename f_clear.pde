void clear() {
    //if the song finishes (circles displayed > circles counter) reset
    //reset mouse click position
    mx = -1;
    my = -1;
    clicked = false;
    count = 0;
    counter = 0;
    comboc = 0;
    //clear the objs
    circles.clear();
    queue.clear();
    player.pause();
    // goes back to selection screen
    state = selection;
}