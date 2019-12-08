float scroll = 0;
void mouseWheel(MouseEvent event) {
  	scroll += event.getCount();
}

float mx;
float my;
// set mx and my to mouse position upon clicking
boolean clicked = false;
void mouseClicked() {
  	mx = mouseX;
  	my = mouseY;
}
void keyPressed() {
	mx = mouseX;
  	my = mouseY;
	clicked = true;
}
int click(Circle circle, int time) {
	if (dist(circle.x, circle.y, mouseX, mouseY) <= (hitcircle.width / 2)) {;
		int tClick = abs(time - circle.time);
		println("tClick: "+tClick);
		if (tClick > lateMS) {
			return 0; //missed
		} else if ((tClick < lateMS) && (tClick > mediumMS)) {
			return 1; // 50
		} else if ((tClick < mediumMS) && (tClick > perfectMS)) {
			return 2; // 100
		} else if ((tClick < perfectMS) && (tClick > 0)) {
			return 3; // 300
		}
    } else {
		return -1;
	}
	return 0;
}
boolean collision(int cx, int cy, float x, float y, int w, int h) {
	if ((cx > x) && (cy > y) && (cx < x + w) && (cy < y + h)) {
		return true;
	}
	return false;
}