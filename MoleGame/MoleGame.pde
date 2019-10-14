boolean story = true;
boolean game = false;
boolean menu = false;
boolean difficulty = false;
boolean help = false;
boolean over = false;
String howHard = "Medium";
float pointer = 475;
PImage mole;
PImage noMole;
PImage hammer;
PImage smash;
PImage whac;
float textY = height;
int i = 0;
int l;
int start = 0;
int speech = 1;
float time = 0;
float[] a;
float[] b;
float[] c;
float[] d;
float[] e;
boolean holeOne;
boolean holeTwo;
boolean holeThree;
boolean holeFour;
boolean holeFive;
float timeIncrease = 1;
int score = 0;
int totalTime = 10;
int z = 900;
void setup() {
  fullScreen();
  a = new float[4];
  b = new float[4];
  c = new float[4];
  d = new float[4];
  e = new float[4];

  a[0] = width/4 ;
  a[1] = height/2;
  a[2] = 100;
  a[3] = 50;
  b[0] = width/2;
  b[1] = height/2;
  b[2] = 100;
  b[3] = 50;
  c[0] = width/4 + width/2;
  c[1] = height/2;
  c[2] = 100;
  c[3] = 50;
  d[0] = width/4 + width/8;
  d[1] = height/2 + 180;
  d[2] = 100;
  d[3] = 50;
  e[0] = width/2 + width/8;
  e[1] = height/2 + 180;
  e[2] = 100;
  e[3] = 50;

  mole = loadImage("mole.png");
  noMole = loadImage("noMole.png");
  hammer = loadImage("hammer.png");
  smash = loadImage("hammerSmash.png");
  whac = loadImage("whac.png");
  frameRate(60);
}

void draw() {
if (!story) {
  noCursor();
}
  if (story) {
    story();
  }
  if (game) {
    game();
  }
  if (menu) {
    menu();
  }
  if (difficulty) {
    difficulty();
  }
  if (help) {
   help();
  }
  if(over) {
    over();
  }

}
void story() {
  i++;
  cursor();
  background(135, 206, 235);
  fill(76, 187, 23);
  noStroke();
  imageMode(CENTER);
  ellipse(width/2, height +1600, 4000, 4000);
  image(mole, width/2, height/2);
  fill(255);
  rectMode(CENTER);
  rect(width/2, textY, 600, 190, 7);
  if (i < 60) {
    textY = textY + 0.5;
  } else {
    textY = textY - 0.5;
  }
  if ( i > 120) {
    i = 0;
  }
  if (speech == 1) {
    textMode(CENTER);
    fill(0);
    textSize(40);
    text("Hey there, human!", (width/2) - 180, textY + 20);
    image(hammer, 100, 300);
    fill(255);
    text("Click to continue!", 0, height);
  }

  if (speech == 2) {
    textMode(CENTER);
    fill(0);
    textSize(40);
    text("Wait, I don't like humans..", (width/2) - 250, textY + 20);
    image(hammer, 100, 300);
    fill(255);
    text("Click to continue!", 0, height);
  }

  if (speech == 3) {
    textMode(CENTER);
    fill(0);
    textSize(40);
    text("You is ugly, human.", (width/2) - 250, textY + 20);
    image(hammer, 100, 300);
    fill(255);
    text("Click to continue!", 0, height);
  }

  if (speech == 4) {
    textMode(CENTER);
    fill(0);
    textSize(40);
    text("What are you gonna do,", (width/2) - 250, textY - 20);
    text("hit me with that hammer there?", (width/2) - 300, textY + 20);
    image(hammer, 100, 300);
    fill(255);
    text("Click to continue!", 0, height);
  }

  if (speech == 5) {
    textMode(CENTER);
    fill(0);
    textSize(40);
    text("Wait, don't touch it!", (width/2) - 250, textY + 20);
    image(hammer, 100, 300);
    fill(255);
    text("Click the hammer to start!", 0, height);
  }

  if (speech == 6) {
    textMode(CENTER);
    fill(0);
    textSize(40);
    text("STOP STOP STOP!", (width/2) - 250, textY + 20);

    fill(255);
    text("Hit the Mole!", 0, height);
    noCursor();
    if (mousePressed) {
      if (story == true && speech == 6 ) {
        image(smash, mouseX, mouseY);
        if (mouseX > (width/2) -100 && mouseX < (width/2) + 100 && mouseY > (height/2) -100 && mouseY < (height/2) + 100) {
          speech = 7;
        }
      }
    } else {
      image(hammer, mouseX, mouseY);
    }
  }

  if (speech == 7) {
    textMode(CENTER);
    fill(0);
    textSize(40);
    text("OW OW OW", (width/2) - 250, textY + 20);

    fill(255);
    text("Click to continue!", 0, height);
    noCursor();
    if (mousePressed) {
      if (story == true && speech == 7 ) {
        image(smash, mouseX, mouseY);
      }
    } else {
      image(hammer, mouseX, mouseY);
    }
  }
  if (speech == 8) {
    story = false;
    game = true;
  }
}

void over() {
  l++;
  background(0);
  fill(255);
  text("Game Over",width/2, 40);
  text("Your Score: " + score,width/2,200);
  if (score > 15 && score < 30) {
    text("You're pretty good!",width/2,height/2);
  }
   if (score > 30) {
    text("Wow, that is high!",width/2,height/2);
  }
   if (score < 15) {
    text("Maybe try again?",width/2,height/2);
  }
  if (l > 300) {
    score = 0;
    z = 900;
    over = false;
    menu = true;
  }
}

void game() {
  if (totalTime == 0) {
    game = false;
    over = true;
  }
  z--;
  totalTime = round(z/60);
  if (time < 1) {
    start = round(random(1, 5));
  }
  time = time + timeIncrease;
  background(135, 206, 235);
  fill(76, 187, 23);
  noStroke();
  imageMode(CENTER);
  ellipseMode(CENTER);
  ellipse(width/2, height +1600, 4000, 4000);
  fill(139, 69, 19);
  ellipse(width/4, (height/2) + 100, 200, 100);
  ellipse(width/2, (height/2) + 100, 200, 100);
  ellipse((width/4) + width/2, (height/2) + 100, 200, 100);
  ellipse((width/4)+ width/8, (height/2) + 300, 200, 100);
  ellipse((width/2)+ width/8, (height/2) + 300, 200, 100);
  imageMode(CENTER);
  if (start == 1) {
    image(mole, a[0], a[1]);
    holeOne = true;
    holeTwo = false;
    holeThree = false;
    holeFour = false;
    holeFive = false;
  }
  if (start == 2) {
    image(mole, b[0], b[1]);
    holeOne = false;
    holeTwo = true;
    holeThree = false;
    holeFour = false;
    holeFive = false;
  }
  if (start == 3) {
    image(mole, c[0], c[1]);
    holeOne = false;
    holeTwo = false;
    holeThree = true;
    holeFour = false;
    holeFive = false;
  }
  if (start == 4) {
    image(mole, d[0], d[1]);
    holeOne = false;
    holeTwo = false;
    holeThree = false;
    holeFour = true;
    holeFive = false;
  }
  if (start == 5) {
    image(mole, e[0], e[1]);
    holeOne = false;
    holeTwo = false;
    holeThree = false;
    holeFour = false;
    holeFive = true;
  }
  if (mousePressed) {
    image(smash, mouseX, mouseY);
  } else {
    image(hammer, mouseX, mouseY);
  }
  if (time > 60) {
    start = round(random(1, 5));
    time = 1;
  }
  text("Score: " + score,width/2 - 100,40);
  text("Time: " + totalTime,width/2 - 100,80);
}

void menu() {
   background(135, 206, 235);
  fill(76, 187, 23);
  noStroke();
  imageMode(CENTER);
  ellipseMode(CENTER);
  ellipse(width/2, height +1600, 4000, 4000);
  
  image(whac,width/2,90);
    textSize(40);
    fill(255);
  text("Game", 840, 500);
  text("Difficulty", 840, 550);
  text("Story", 840, 600);
  text("Help", 840, 650);



  triangle(760, pointer, 780, pointer+ 10, 760, pointer + 20);
}

void difficulty() {
   background(135, 206, 235);
  fill(76, 187, 23);
  noStroke();
  imageMode(CENTER);
  ellipseMode(CENTER);
  ellipse(width/2, height +1600, 4000, 4000);
  
  textSize(40);
  fill(255);
  text("Easy", 830, 500);
  text("Medium", 800, 550);
  text("Hard", 830, 600);
  triangle(760, pointer, 780, pointer+ 10, 760, pointer + 20);

  String stringDisplay = "Your difficulty is: " + howHard;

  if (timeIncrease == 0.5) {
     howHard = "Easy";
  }
  if (timeIncrease == 1) {
     howHard = "Medium";
  }
  if (timeIncrease == 2) {
     howHard = "Hard";
  }

  text(stringDisplay, 100, 100);
  
}

void help() { 
   background(135, 206, 235);
  fill(76, 187, 23);
  noStroke();
  imageMode(CENTER);
  ellipseMode(CENTER);
  ellipse(width/2, height +1600, 4000, 4000);
  
  fill(255);
  textSize(20);
  text("To go back to the menu at any time press backspace!", (width/2) - 300, height/2);
  text("The difficulty menu lets you change the game's difficulty.", (width/2) - 300, height/2 + 30);
  text("The Game Button lets you play a game of Whac-a-mole!", (width/2) - 300, height/2 + 60);
  text("The story button lets you go back to the title story.", (width/2) - 300, height/2 + 90);
 
}


void mousePressed() {
  if (story == true && speech <= 4 || speech ==7) {
    speech = speech + 1;
  }
  if (story == true && speech == 5 && (mouseX > 000 && mouseX < 200 && mouseY > 200 && mouseY < 400)) {
    speech = speech + 1;
  }
  if (holeOne && game && mouseX>a[0]-a[2] && mouseX<a[0]+a[2] + 20 && mouseY > a[1] - a[3] - 80&& mouseY < a[1] + a[3] + 50) {
    time = 0;
    score++;
  }
  if (holeTwo && game && mouseX>b[0]-b[2] && mouseX<b[0]+b[2] + 20&& mouseY > b[1] - b[3] - 80&& mouseY < b[1] + b[3]+ 50) {
    time = 0;
    score++;
  }
  if (holeThree && game && mouseX>c[0]-c[2] && mouseX<c[0]+c[2]+ 20&& mouseY > c[1] - c[3] - 80&& mouseY < c[1] + c[3]+ 50) {
    time = 0;
    score++;
  }
  if (holeFour && game && mouseX>d[0]-d[2] && mouseX<d[0]+d[2] + 20&& mouseY > d[1] - d[3] - 80&& mouseY < d[1] + d[3]+ 50) {
    time = 0;
    score++;
  }
  if (holeFive && game && mouseX>e[0]-e[2] && mouseX<e[0]+e[2]+ 20 && mouseY > e[1] - e[3] - 80&& mouseY < e[1] + e[3]+ 50) {
    time = 0;
    score++;
  }
}

void keyPressed () {/////////////////////////////////////////////////////////
    if (keyCode == ENTER) {
      if (pointer == 475 && menu == true) {
        game = true;
        menu = false;
      }
      if (pointer == 525 && menu == true) {
        difficulty = true;
        menu = false;
      }
      if (pointer == 575 && menu == true) {
      story = true;
      menu = false;
      speech = 1;
      }
      if (pointer == 625 && menu == true) {
        help = true;
        menu = false;
      }
      if (pointer == 475 && difficulty == true) {
      timeIncrease = 0.5;
      }
      if (pointer == 525 && difficulty == true) {
      timeIncrease = 1;
      }
      if (pointer == 575 && difficulty == true) {
      timeIncrease = 2;
      }
    }
    if (keyCode == UP ) {
      pointer =  pointer - 50;
   
    } 
    if (keyCode == DOWN) {
      pointer = pointer + 50;
    } 
    if (keyCode == BACKSPACE) {
      menu = true;
      story = false;
      game = false;
      difficulty = false;
      help = false;
      over = false;
      score = 0;
      z= 900;
    }
     if (pointer < 475 && menu == true) {
      pointer = 625;
    } 
    if (pointer > 725 - 100 && menu == true) {
      pointer = 475;
    }
    if (pointer < 475 && difficulty == true) {
      pointer = 575;
    } 
    if (pointer > 675 - 100 && difficulty == true) {
      pointer = 475;
    }
    
}
