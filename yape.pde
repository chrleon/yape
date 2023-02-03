// yape - Yet Another Pixel Editor
// copyright 2023 christian leon christensen
// Code is on https://github.com/chrleon/yape
// Buy for life at https://itch.io/chrleon/yape

JSONArray ui = new JSONArray();
JSONObject tools = new JSONObject();
JSONObject canvas = new JSONObject();
Button btn_paint = new Button();


void setup() {
  size(1366, 768);
  UIInit();
}


void draw() {
  UI();
}


void UIInit() {
  tools.setInt("width", 50);
  canvas.setInt("width", 256);
  canvas.setInt("height", 256);
  ui.setJSONObject(0, tools);
};


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
  color bg = color(200, 200, 200, 10); // background
  color fg = color(100, 100, 100, 100); // foreground / icon

  Button() {
    // constructor
    // set up the variables with data
    // also load any datafiles (esp. for Processing) that you'll work with
  }

  void show() {
    push();
    rectMode(CENTER);
    ellipseMode(CENTER);
    fill(this.bg);
    rect(0, 0, 48, 48);
    fill(this.fg);
    ellipse(0, 0, 20, 20);
    pop();
  }

  void hover() {
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
