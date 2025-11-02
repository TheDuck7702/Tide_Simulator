//====================================\\ 
//            Tide Simulator          //
//  Shayaan Shaikh, ICS4UI at LHSS    \\
//====================================//

//to initalize the other classes in the other tabs.
Environment env;
celPos c;
Tide t;

void setup() {
  frameRate(60);  //to allow our time system to work

  //create the env and celPos amd tide objects
  env = new Environment(0, 0, "Calm", 0);  // day, hour, wind type, wind effect
  c = new celPos(); // creates the simulator's celestial objects (sun and moon)
  t = new Tide();
  
  c.env = env; // assigns teh object of env to the feild in the brakets (the one needed for the env class). THis is needed so when teh celPos class calc the grav using env.windEft it does not do null pointer erro.
  
  //we want to simulate this for an x ammount of days, so we need a nested for loop. We need to both handle the days and the hour
  println("------Starting Tide Sim------");
}

void draw() {
    
  env.updateTime(); // step 1: update the time in the env class
  env.randWind(); // step 2, again in the env class, randomize the wind
  
  if(env.frameTrack == 0 ){ // runs every hour
 
                  // step 3, update the methods in the celpos class
                 
    if (env.hour % 24 == 0 && env.frameTrack == 0){ //*IMPORTANT* we need the updateMoonPos method every 24 hours and not every hour as the method changes the moon phase every 24 horus or 1 day this if statment allows that by only runnign when frameTrack is 0, or when ever teh frames roll over to an hour AND  
      c.updateMoonPos();  // pushes the next phase up for moon
    }
    
    if(env.hour % 6 == 0 && env.frameTrack == 0){ // similer as teh moon one, but insted of every 24 hours we need to change every 6 hours, as in this modle, there are 4 sun phases. 24/4 = 6
      c.updateSunPos();
    }
    c.indexToPhase();  // so convert the phase (String) to a int we can use in calc
    c.calcGrav(); // to calc the total effect and gravity
    
                 //Step 4, u need to now update the calc methods in tide class
    t.updateLevel(c, env); // main calc, calcs the tide
    t.updateRecord(); // updates and check for any record breaking tide
    t.updateG4S(); // checks if this good for swimming
    t.updateHighOrLow(env, c); // calc and checks if its high or low tide
    t.updateTideHist(c, env); // keeps track of the history of the tide. 
    
    String tideStatus; //to make sure the disc of the tide matches with tideLvl. tideLvl can go neg which just means its low tide. as there is no offical bondery of where low tide becomes high tide, i made a geuss, sometimes the hight will show neg which just mean that its high/lower than the geuss
    if (t.tideLvl >= 0){
      tideStatus = "high Tide";
    }
    else{
      tideStatus = "low Tide";
    }
    
    println("Day " + int(env.day) + " Hour " + int(env.hour));     // env.hour is a float so its more good looking to have a whole number as a day
    println("Moon Phase: " + c.moonI2P + " (" + c.moonPhase + ")");
    println("Sun Phase: " + c.sunI2P + " (" + c.sunPhase + ")");
    println("The tide level is " + t.tideLvl + " meters, which is considered " + tideStatus);
    println("-------------------------------------------------");
  }
}
