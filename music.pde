import ddf.minim.*;
import beads.*;
import controlP5.*;
import processing.opengl.*;




Minim minim;
int numberOfSongs = 13;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //WAV, AIFF, AU, SND, & MP3
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs]; //meta data
int nowPlaying = numberOfSongs - numberOfSongs;
String[] songNames;
int index, prevIndex;
Button playButton, pauseButton, nextButton, prevButton, shuffleButton, speedButton, homeButton;
Slider volumeSlider;
float volume;





void setup(){

  minim = new Minim(this);
song[nowPlaying] = minim.loadFile("AJR - World's Smallest Violin.mp3"); //albe to pass absulute path, file name & extension, and URL
  song[nowPlaying+=1] = minim.loadFile("Alien Blues.mp3");
  song[nowPlaying+=1] = minim.loadFile("Footloose.mp3");
  song[nowPlaying+=1] = minim.loadFile("Fox Stevenson - All Eyes On Me.mp3");
  song[nowPlaying+=1] = minim.loadFile("Frankie Valli - Grease.mp3");
  song[nowPlaying+=1] = minim.loadFile("glass beach - classic j dies and goes to hell part 1.mp3");
  song[nowPlaying+=1] = minim.loadFile("Introduction to the Snow.mp3");
  song[nowPlaying+=1] = minim.loadFile("Jack Johnson - banana pancakes.mp3");
  song[nowPlaying+=1] = minim.loadFile("Meteor Shower.mp3");
  song[nowPlaying+=1] = minim.loadFile("Rick Astley - Never Gonna Give You Up.mp3");
  song[nowPlaying+=1] = minim.loadFile("The Beatles - Eleanor Rigby.mp3");
  song[nowPlaying+=1] = minim.loadFile("The Honeysticks - Out Like A Light.mp3");
  song[nowPlaying+=1] = minim.loadFile("Walk The Moon _ Shut Up and Dance With Me.mp3");
  nowPlaying-=nowPlaying;
  for ( int i=nowPlaying; i<song.length; i++ ) {
  }
  
  size(600, 300);
      playButton = new Button(275,185,50,50,"P/P",0,300,200);
      nextButton = new Button(330,185,50,50,">",0,300,200);
      prevButton = new Button(220,185,50,50,"<",0,300,200);
      shuffleButton = new Button(385,215,50,50,"?",0,300,200);
      speedButton = new Button(165,215,50,50,">>",0,300,200);
  volumeSlider = new Slider( 230,260, 140, 10, 10, 50, "Volume");
  volume = volumeSlider.sliderVal;
  textAlign(CENTER);
  
  

}
void draw(){
  background(255);
  fill(255,0,255);
   textSize(width/23);
  text("Now Playing:\n" + nowPlaying, width/2,height/3);
  
  playButton.render();
  nextButton.render();
  prevButton.render();
  speedButton.render();
  shuffleButton.render();
  
     if( mousePressed){
    boolean isChanged = volumeSlider.checkPressed( mouseX, mouseY);
    if(isChanged){
        volume = volumeSlider.sliderVal;
    }
  }
  
  volumeSlider.display();
  
      if(playButton.isClicked()){
    if ( song[nowPlaying].isPlaying() ) {
      song[nowPlaying].pause();
    } else {
      song[nowPlaying].play();
    }
  }
      if(nextButton.isClicked()){
    if ( song [nowPlaying].isPlaying() ) {
      song[nowPlaying].pause();
      song[nowPlaying].rewind();
      song[nowPlaying].play();
    } else {
      song[nowPlaying].rewind();
      song[nowPlaying].play();
    }
        
        
  }
      if(prevButton.isClicked()){
    if ( song [nowPlaying].isPlaying() ) {
      song[nowPlaying].pause();
      song[nowPlaying].rewind();
      song[nowPlaying].play();
    } else {
      song[nowPlaying].rewind();
      song[nowPlaying].play();
    }
  } 
  }