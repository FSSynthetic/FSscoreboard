# FSscoreboard

#### Hello again! I'm back with another release and must admit, I never thought I'd release a scoreboard.

---

This is a simple scoreboard that took design inspiration from panzarb's scoreboard which can be found [here](https://github.com/panzarb/scoreboard).

This scoreboard has been completely redesigned and fitted with the most updated and proficient code as of today. The scoreboard takes a simplistic design, yet still feels like just the right amount of information. The scoreboard is designed to take in as many players as a server can fit. 

The scoreboard is toggled to the key you set in the configuration file. When the scoreboard is toggled, every key input will be disabled except for the key you set to open and close the menu. The scoreboard will also show a mouse whilst toggled as when it reaches a certain amount of players, it will initiate a scroll wheel allowing you to scroll and see everyone connected to the server.

One last thing, if you rename the folder to anything but FSscoreboard then it will disrupt the flow of the scoreboard thus making it show a big image and not the scoreboard. If you really want to change the folder name, follow the instructions below: 
___
1. Find and open the HTML folder

2.  Open **scoreboard.html**

3. Search for: `<link rel="stylesheet" href="nui://FSscoreboard/html/style.css">`

4. Rename **FSscoreboard** in that href to whatever you renamed the folder.

After that, restart the script and it should be all set!
___

Besides that, it's pretty straightforward.

<details>
<summary>Screenshots</summary>

![Alt text](https://forum.cfx.re/uploads/default/original/4X/b/b/8/bb8027c3e1fa5c6b0aededbbcd1f76341b9b9dc9.jpeg)
![Alt text](https://forum.cfx.re/uploads/default/original/4X/3/3/4/334ff14b1fa43c64b26c878e72f2ff5a69aaab42.jpeg)

</details>

<details>
<summary>Newest Version Changes!</summary>
  <h3> Version 1.1.2 </h3>
<ul>
  <li><h4> Added Ability to choose Toggle </h4></li>
  <ul>
    <li> Added the ability to choose whether the scoreboard is toggled on and off or if the scoreboard is turned on whilst holding a key and turned off when that key is released. The command to choose said ability is: /scoreboardToggle (on/off). </li>
  </ul>
    <li> Updated config.lua comments. </li>
    <li> Updated fxmanifest.lua version number. </li>
    <li> Updated readme to add version changes. </li>
    <li> Added safety check to make sure the scoreboard toggle command contains only one argument before checking for on or off </li>
</ul>
</details>
