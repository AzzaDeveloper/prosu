ArrayList<Circle> queue = new ArrayList<Circle>(); // Queue of circles to draw every frameơ
int comboc = 1; // The current hit object combo
int count = 0; // Counter of how many circles displayed
int time;
void standardScreen() {
    time = millis() - timem; // The current time since starting the song
    Circle circle = circles.get(count); // Retrieve the circle info from the Array
    // Remove the circle from the queue once playing time > circle.time
    for (int i = 0; i < queue.size(); i++) {
        if (time >= queue.get(i).time ) {
        	queue.remove(i);
        }
    }
    // If the current time ran is above the time of the circle then display it
    if ((time >= circle.time - ar - 50 /* time for the circle to fade in */)) {
        circle.combo = comboc; // update the circle combo counter with the current combo
        queue.add(circle); // Add the circle to the queue for later displaying
        // check for new combo from the type of the circle
        if ((circle.type == 2) || ((circle.type >= 4) && (circle.type <= 6))) {
            comboc = 0;
        }
    	count++; comboc++; //update the combo
        if (count >= counter) { 
            clear(); // f_clear.pde
        }
    }
    // run through circles in the queue
    for (int i = 0; i < queue.size(); i++) {
    	if (drawobj(queue.get(i)) == 1) {
            queue.remove(i);
            mx = -1; my = -1;
        } //display the circles in the queue
    }
}