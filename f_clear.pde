void clear() {
    //if the song finishes (circles displayed > circles counter) reset
    // goes back to selection screen
    state = selection;
    //reset mouse click position
    mx = -1;
    my = -1;
    count = 0;
    //clear the objs
    circles.clear();
    queue.clear();
    player.pause();
}