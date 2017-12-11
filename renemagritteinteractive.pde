import processing.sound.*;

PImage background;
PImage foreground;
ArrayList<Cloud> clouds = new ArrayList<Cloud>();
ArrayList<Window> windows = new ArrayList<Window>();
Lamp lamp;
Chimney chimney;

SoundFile[] rustles = new SoundFile[6];
SoundFile[] doorKnock = new SoundFile[4];

void setup(){
    size(1125, 900);
    background = loadImage("background.png");
    foreground = loadImage("foreground.png");
    clouds.add(new Cloud(this, "cloud1.png", new PVector(300, 38)));
    clouds.add(new Cloud(this, "cloud2.png", new PVector(8, 188)));
    clouds.add(new Cloud(this, "cloud2.png", new PVector(750, 113)));
    clouds.add(new Cloud(this, "cloud3.png", new PVector(300, 375)));
    clouds.add(new Cloud(this, "cloud4.png", new PVector(900, 338)));
    windows.add(new Window(this, "window1.png", new PVector(162, 731)));
    windows.add(new Window(this, "window1.png", new PVector(209, 730)));
    windows.add(new Window(this, "window2.png", new PVector(490, 650)));
    windows.add(new Window(this, "window2.png", new PVector(540, 650)));
    windows.add(new Window(this, "window3.png", new PVector(1036, 716)));
    windows.add(new Window(this, "window3.png", new PVector(1077, 716)));
    windows.add(new Window(this, "window3.png", new PVector(1113, 717)));
    lamp = new Lamp(this, "lamp.png", new PVector(229, 635));
    chimney = new Chimney(this, new PVector(130, 320));
    rustles[0] = new SoundFile(this, "rustle1.wav");
    rustles[1] = new SoundFile(this, "rustle2.wav");
    rustles[2] = new SoundFile(this, "rustle3.wav");
    rustles[3] = new SoundFile(this, "rustle4.wav");
    rustles[4] = new SoundFile(this, "rustle5.wav");
    rustles[5] = new SoundFile(this, "rustle6.wav");
    doorKnock[0] = new SoundFile(this, "doorKnock1.wav");
    doorKnock[1] = new SoundFile(this, "doorKnock2.wav");
    doorKnock[2] = new SoundFile(this, "doorKnock3.wav");
    doorKnock[3] = new SoundFile(this, "doorKnock4.wav");
}

void draw(){
    background(0);
    tint(255);
    image(background, 0, 0);
    chimney.draw();
    tint(255);
    image(foreground, 0, 0);
    lamp.draw();
    for(Window window : windows){
        window.draw();
    }
    for(Cloud cloud : clouds){
        cloud.draw();
    }
}

void mousePressed(){
    lamp.mousePressed();
    for(Window window : windows){
        window.mousePressed();
    }
    if((mouseX > 0 && mouseX < 400 && mouseY > 400 && mouseY < 620) || (mouseX > 550 && mouseX < width && mouseY > 400 && mouseY < 620)){
        SoundFile rustle = rustles[(int) random(rustles.length)];
        rustle.play(1, 0.5);
        rustle.pan(map(mouseX, 0, width, -1, 1));
    }
    if((mouseX > 275 && mouseX < 300 && mouseY > 710 && mouseY < 790) || (mouseX > 655 && mouseX < 740 && mouseY > 710 && mouseY < 805)){
        SoundFile knock = doorKnock[(int) random(doorKnock.length)];
        knock.play(1, 0.5);
        knock.pan(map(mouseX, 0, width, -1, 1));
    }
}