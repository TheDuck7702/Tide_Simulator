# Tide_Simulator

Tides on Earth are caused mainly by the **gravitational pull of the Moon and the Sun**.  
I modeled a prgram that will simulate a tide with customizable setting where you can change the wind and other nateral phonomena on effecting the tide.
It will return a table on every day for info on the moon and sun phase, tide height and type (low or high) and a record holding feature.
In **Neptune’s Pulse**, we simulate these effects mathematically using a **sine wave** to model the natural rise and fall of sea levels over time.

---

# Set Up
Download all files and put them in one folder and open that folding in prossesing 4.

---

## Moon Phases and Their Effects

Each moon phase influences the **tide amplitude** (height difference between high and low tide) differently.  
Here’s how the simulation models it:

| Moon Phase | Phase Value | Effect on Tide | Description |
|-------------|--------------|----------------|--------------|
| **New Moon** | 0.0 | **Highest amplitude** | Moon and Sun align — their gravity combines → extreme **spring tides** |
| **Waxing Crescent** | 0.25 | Moderate amplitude | Moon pulling slightly out of alignment — tides start to weaken |
| **First Quarter** | 0.5 | **Lowest amplitude** | Moon at 90° angle from the Sun → weaker **neap tides** |
| **Waxing Gibbous** | 0.75 | Moderate amplitude | Alignment begins to increase again |
| **Full Moon** | 1.0 | **Highest amplitude** | Moon and Sun align on opposite sides → another **spring tide** |
| **Waning Gibbous** | 1.25 | Moderate amplitude | Alignment weakening once more |
| **Last Quarter** | 1.5 | **Lowest amplitude** | Another **neap tide** phase |
| **Waning Crescent** | 1.75 | Moderate amplitude | Preparing for next new moon cycle |

## Language used ##
Processing was chosen as the base platform for this project because it allows real-time graphical simulations and simple animation control.

