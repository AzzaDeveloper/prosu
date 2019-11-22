float scroll = 0;
void mouseWheel(MouseEvent event) {
  scroll += event.getCount();
}
int mx;
int my;
void mouseClicked() {
    mx = mouseX;
    my = mouseY;
	println("mx: "+mx);
	println("my: "+my);
}