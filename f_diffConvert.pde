int hp = 0;
int cs = 0;
int od = 0;
int ar = 0;

void diffConvert() {
    cs = 109 - 9 * cs;

    if (ar < 5) {
        ar = 1600 + ((5 - ar) * 160);
    } else if (ar == 5) {
        ar = 1600;
    } else if (ar > 5) {
        ar = 1600 - ((ar - 5) * 200);
    }

    if (od < 5) {
        od = 66 - ((5 - od) * 8);
    } else if (od == 5) {
        od = 66;
    } else if (od > 5) {
        od = 66 - ((od - 5) * 8);
    }
}