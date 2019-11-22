ArrayList<Circle> queue = new ArrayList<Circle>(); // Queue of circles to draw every frameơ
int comboc = 1; // The current hit object combo
int count = 0; // Counter of how many circles displayed
int time;
void standardScreen() {
    time = millis() - timem;
    // Retrieve the circle info from the Array
    Circle circle = circles.get(count);
    // If the current time ran is above the time of the circle then display it
    for (int i = 0; i < queue.size(); i++) {
        if (time >= queue.get(i).time ) {
        	 queue.remove(i);
        }
    }
    if ((time >= circle.time - ar)) {
        circle.combo = comboc; // update the circle combo counter with the current combo
        queue.add(circle); // Add the circle to the queue for later displaying
        // check for new combo from the type of the circle
        if ((circle.type == 2) || ((circle.type >= 4) && (circle.type <= 6))) {
            comboc = 0;
        }
        //update the combo
    	count++;
        comboc++;
        if (count >= counter) {
            //go back to selection screen when song's over
            clear();
        }
    }
    // run  through circles in the queue
    for (int i = 0; i < queue.size(); i++) {
        //display the circles in the queue
    	drawobj(queue.get(i));
    }
}