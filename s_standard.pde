ArrayList<Circle> queue = new ArrayList<Circle>(); // Queue of circles to draw every frame
int comboc = 1; // The current hit object combo
int count = 0; // Counter of how many circles displayed
int time;
void standardScreen(int timem) {
    time = millis() - timem;
    // Retrieve the circle info from the Array
    Circle circle = circles.get(count);
    // Run through circles in the queue
	for (int i = 0; i < queue.size(); i++) {
        // If it has been >500 ms since the circles appeared then remove it from queue (no longer displayed next frame)
	    if (time - queue.get(i).time >= 500) {
    	    queue.remove(i);
        }
    }
    // If the current time ran is above the time of the circle then display it
    if ((time >= circle.time)) {
        circle.combo = comboc; // update the circle combo counter with the current combo
        queue.add(circle); // Add the circle to the queue for later displaying
        // check for new combo from the type of the circle
        if ((circle.type == 2) || ((circle.type >= 4) && (circle.type <= 6))) {
            comboc = 0;
        }
        //update the combo
    	count++;
        comboc++;
    }
    for (int i = 0; i < queue.size(); i++) {
        //display the circles in the queue
    	drawobj(queue.get(i));
    }
    if (count >= counter) {
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
        player.stop();
    }
}