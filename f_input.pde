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