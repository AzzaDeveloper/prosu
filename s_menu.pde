/*
WARNING:
I decided to make everything in here s c a l e so it works with all resolution.
That's why you see a lot of width and height in here.
And for some god forsaken reason, i can't assign a variable to width / 2 or width * 0.25
So it turned into this almost unreadable mess.
just some headups:
width / 2: half the resolution
width * 0.25: radius of the circle
add a counter to everytime you visited this and try to debug it: 3

i'll properly rewrite this someday, i promise
*/
float circleX = width / 2;
boolean moved = false;
void menuScreen() {
    if (dist(circleX, height / 2, mx, my) <= (width * 0.25)) {
        moved = !moved;
    }
    String[] texts = {"Play", "Options", "Exit"};
    fill(255);
    if (moved) {
        noFill();
        stroke(255);
        float offset = width * 0.05;
        for (int i = 0; i < 3; i++) {
            if (collision(mx, my, width / 2 - width * 0.15, height / 2 - width * 0.25 + offset, width * 0.5, height * 0.12)) {
                switch (i) {
                    case 0:
                        state = selection;
                    break;
                    case 1:
                    break;
                    case 2:
                        exit();
                    break;
                }
            }
            rect(width / 2 - width * 0.15, height / 2 - width * 0.25 + offset, width * 0.5, height * 0.12);
            textSize(width * 0.025);
            text(texts[i], width / 2 + width * 0.1, height / 2 - width * 0.25 + offset + height * 0.07);
            offset += width * 0.15;
        }
        circleX = lerp(circleX, width / 2 - width * 0.25, 0.05);
    } else {
        circleX = lerp(circleX, width / 2, 0.05);
    }
    //circle
    ellipseMode(CENTER);
    stroke(255);
    strokeWeight(width * 0.01);
    fill(0);
    ellipse(circleX, height / 2, width * 0.5, width * 0.5);
    //text
    PFont aller = createFont("Aller Bold", height * 0.15);
    textFont(aller);
    textAlign(CENTER, CENTER);
    fill(255);
    text("prosu!", circleX, height / 2 - 25);
    textAlign(BASELINE);
    mx = -1; my = -1;
}