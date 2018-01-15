import de.voidplus.leapmotion.*;


LeapMotion leap;
ArrayList<TimeoutButton> buttons = new ArrayList<TimeoutButton>();
ArrayList<PVector> cursors = new ArrayList<PVector>();

void setup() {
  size(1000, 600);

  leap = new LeapMotion(this);
  buttons.add(new TimeoutButton(10, 10, 150, 150, 1));
  buttons.add(new TimeoutButton(840, 10, 150, 150, 1));
  buttons.add(new TimeoutButton(10, 440, 150, 150, 1));
  buttons.add(new TimeoutButton(840, 440, 150, 150, 1));
}

void draw() {
  background(0);
  cursors.clear();

  // handle buttons
  for (TimeoutButton b : buttons) {
    b.render();
  }

  strokeWeight(3);
  noFill();
  for (Hand hand : leap.getHands()) {
    PVector pos = hand.getPosition();
    if (hand.isRight()) {
      stroke(255, 0, 0);
    } else {
      stroke(0, 255, 0);
    }
    ellipse(pos.x, pos.y, 30, 30);
    cursors.add(pos);
  }

  for (TimeoutButton b : buttons) {
    b.update(cursors);
  }
  
 /* fill(255);
  textSize(20);
  textAlign(CENTER);
   text("Index Finger Cursors (right = red, left = green)", width/2, 50);
  */
}