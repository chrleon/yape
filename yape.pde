// yape - Yet Another Pixel Editor
// copyright 2023 christian leon christensen
// Code is on https://github.com/chrleon/yape
// Buy for life at https://itch.io/chrleon/yape

JSONArray ui = new JSONArray();
JSONObject tools = new JSONObject();
JSONObject canvas = new JSONObject();
Button btn_paint = new Button();


void setup() {
  size(700, 400);
  surface.setResizable(true);
  UIInit();
}


void draw() {
  UI();
}


void UIInit() {
  tools.setInt("width", 48);
  canvas.setInt("width", 256);
  canvas.setInt("height", 256);
  ui.setJSONObject(0, tools);
};

void debugInfo(String msg, int x, int y) {
  push();
  fill(255, 0, 0);
  text(msg, x, y);
  pop();
}

void UI() {
  background(200);
  Canvas();
  Toolbar("R");
}



class Button {
  // add in variables you need
  // ex: float color;
  // get variables from outside by calling object.variablename
  // or set variables from outside by calling object.variablename = foo;
  color bg;
  color fg;
  int x;
  int y;
  int w;
  int h;

  Button() {
    // constructor
    // set up the variables with data
    // also load any datafiles (esp. for Processing) that you'll work with
    bg = color(200, 200, 200, 0); // background
    fg = color(100, 100, 100, 100); // foreground / icon
    x = 0;
    y = 0;
    w = 48;
    h = 48;
  }

  void show() {
    push();
    ellipseMode(CENTER);
    fill(this.bg);
    rect(this.x, this.y, 48, 48);
    fill(this.fg);
    ellipse(this.w/2, this.h/2, 36, 36);
    pop();
  }

  void hover() {
    debugInfo(str(screenX(this.x, this.y)), 10, 10);
    if (
      mouseX > screenX(this.x, this.y)
      && mouseX < screenX(this.x + this.w, this.y + this.h)
      && mouseY > screenY(this.x, this.y)
      && mouseY < screenY(this.x + this.w, this.y + this.h)
      ) {
      bg = color(100, 100, 100, 100);
      fg = color(200, 200, 200, 100);
    } else {
      bg = color(200, 200, 200, 100);
      fg = color(100, 100, 100, 100);
    }
  }
}

void Toolbar(String pos) {
  push();
  if (pos == "R") {
    translate(width-tools.getInt("width"), 0);
  }
  fill(255);
  noStroke();
  rect(0, 0, tools.getInt("width"), height);
  btn_paint.show();
  btn_paint.hover();
  pop();
}


void Layers() {
}

void Canvas() {
  push();
  noStroke();
  rectMode(CENTER);
  translate((width/2)-tools.getInt("width"), height/2);
  fill(0, 0, 0, 50);
  rect(0, 0, canvas.getInt("width")+4, canvas.getInt("height")+4);
  fill(255);
  rect(0, 0, canvas.getInt("width"), canvas.getInt("height"));
  pop();
}
