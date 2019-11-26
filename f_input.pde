float scroll = 0;
void mouseWheel(MouseEvent event) {
  	scroll += event.getCount();
}

float mx;
float my;
// set mx and my to mouse position upon clicking
void mouseClicked() {
  	mx = mouseX;
  	my = mouseY;
}
void keyPressed() {
	mx = mouseX;
  	my = mouseY;
}
boolean collision(int cx, int cy, float x, float y, int w, int h) {
	if ((cx > x) && (cy > y) && (cx < x + w) && (cy < y + h)) {
		return true;
	}
	return false;
}