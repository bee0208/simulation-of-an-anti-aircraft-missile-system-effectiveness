# simulation-of-an-anti-aircraft-missile-system-effectiveness

## Introduction 
The project presents the results of the development of an application for testing the effectiveness of the anti-aircraft system. The application was developed with Matlab App Designer and is based on a simulation model developed in Matlab&Simulink software. It was created for repeated research of the anti-aircraft system in a clear interface. This will allow you to quickly change the initial shooting conditions and analyze the data in one window. Matlab ver. 2020b was used.

## APP
The application interface is divided into two main parts: the input data panel (left side) and the shooting simulation summary panel (right side).

![image](https://user-images.githubusercontent.com/118617819/211039679-f7e7d5a2-b485-488e-81d7-562e9830672f.png)

### The left panel of the application
The input panel contains four cells where initial conditions can be edited. It consists of the following cells and each of them is editable:
1) Shooting Parameters:
- parallel simulations (on or off);
- simulation time;
- number of shoots;
- type of guidance.
2) Guidance errors:
- rocket tracking error in elevation, azimuth and distance [degrees];
- target tracking error in elevation, azimuth and distance [degrees].
3) Warhead parameters:
- mass of the explosive charge;
- number of fragments;
- splinter spread angle.
4) Target movement parameters:
- starting position of the target xyz;
- sensitive surface of the target;
- initial speed.

The application allows you to add any maneuvers of the target that you want to simulate. By clicking on the „Parametry ruchu celu” ("Target movement parameters") cell on the yellow button called „Dodaj manewry” ("Add maneuvers") a secondary application opens. The main application provides the second application with matrices characterizing the motion parameters of the target. In the new window, it is possible to add target maneuvers that interest us. User-created maneuvers appear in the table above the „ZAAKCEPTUJ” ("ACCEPT") and „ANULUJ” ("CANCEL") buttons. To accept the added maneuvers, just press the blue button. At this point, the slave application sends the modified matrices of target motion parameters to the master application. If the user does not want to modify these matrices in the parent application, he should press the red button or close the window. To clear all added maneuvers in the main window, press the bright red „Wyczyść manewry” ("Clear maneuvers") button.

![image](https://user-images.githubusercontent.com/118617819/211040965-44513099-4c73-4bbe-9bf8-aef086649a85.png)

After accepting the input data, it is possible to quickly simulate the target's trajectory. This allows you to visualize the path of the target in accordance with the adopted assumptions. The orange „Symuluj tor ruchu celu” ("Simulate Target Track") button is used for this. After pressing the button, the program simulates the target using the Simulink tool and sends the simulation results of the subordinate application showing the target's path. This application contains three plots of the target's path: in three-dimensional, two-dimensional and polar coordinates. Below the graphs there is a table with the basic parameters of the target's movement. To go to the main window, just close the window.

![image](https://user-images.githubusercontent.com/118617819/211041616-1ffacce2-76c8-4efb-9478-d2382cb1c78f.png)

The situation is analogous if we want to run a single simulation of the guidance circuit in order to check whether the target is attainable by the tested anti-aircraft system. By pressing the „Pojedynczy strzał” ("Single Shot") button on the left panel of the main application, the guidance circuit is simulated under ideal conditions. This is when all guidance errors equal zero. After running the simulation, the simulation summary window opens. The window that opens contains charts of the target and missile trajectories and a summary table. In addition, there is a plane for evaluating guidance errors and a marked point where the rocket hit.

![image](https://user-images.githubusercontent.com/118617819/211041646-f11279a0-229a-4ac7-af41-2355c9d1ab73.png)

The green "SYMULACJA" ("SIMULATION") button simulates the guidance circuit the set number of times. The simulation process is the same as in the simulation program.
### The right panel of the application
The right panel of the application is a summary of the simulation. Its task is to present the fire characteristics and the obtained statistical data regarding the dispersion, the probability of striking the target or targets. Charts, tables and statistical data are presented here.
After opening the application, the right panel is blank and shows no information. After pressing the "SYMULACJA" ("SIMULATION") button, a window is displayed showing information about the ongoing simulation of a specific number of shots in the background of the program. While the additional window is displayed, numerical calculations are in progress, initially by the simulation program, and then by the research program.

![image](https://user-images.githubusercontent.com/118617819/211042176-6c2cd1c9-e60b-4e54-88b2-4a26ed6721e2.png)

After performing the simulation and loading the data into the right panel of the application, a summary of the shooting simulation is visible. The Shooting Simulation Summary is divided into four tabs: Target Data, Shooting Data, Bullet Spread, Target Shock Probability.

![image](https://user-images.githubusercontent.com/118617819/211042285-c2e82819-62b6-4260-a884-c99c58d7cb68.png)

1) The „DANE CELU” ("TARGET DATA") tab contains:
- chart of the target's path in three-dimensional coordinates;
- plot of the target's path in two-dimensional coordinates;
- plot of the target's path in polar coordinates;
- a table summarizing the targets in the shooting series.
2) The „DANE STRZELANIA” ("SHOOTING DATA") tab contains:
- chart of the target and rocket movement track in three-dimensional coordinates;
- a chart of the target and rocket trajectory in two-dimensional coordinates;
- chart of the target and rocket movement track in polar coordinates;
- chart of target and rocket speed;
- a table summarizing the series of shootings.
3) The „ROZRZUT POCISKÓW” ("SHOT SPREAD") tab contains:
- box chart;
- histograms;
- characteristics of hit points;
- dispersion characteristics;
- a table of position and error dispersion indicators.
4) The „PRAWDOPODOBIEŃSTWO PORAŻENIA CELU” ("PROBABILITY OF TARGET SHOCK") tab contains:
- a graph of the probability of striking a target from a deviation;
- pie chart of the obtained probability;
- bar graph of the obtained probability.
