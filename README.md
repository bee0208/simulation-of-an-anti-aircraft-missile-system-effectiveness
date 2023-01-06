# simulation-of-an-anti-aircraft-missile-system-effectiveness

## Introduction 
The project presents the results of the development of an application for testing the effectiveness of the anti-aircraft system. The application was developed with Matlab App Designer and is based on a simulation model developed in Matlab&Simulink software. It was created for repeated research of the anti-aircraft system in a clear interface. This will allow you to quickly change the initial shooting conditions and analyze the data in one window. Matlab ver. 2020b was used.

## APP
The application interface is divided into two main parts: the input data panel (left side) and the shooting simulation summary panel (right side).

![image](https://user-images.githubusercontent.com/118617819/211039679-f7e7d5a2-b485-488e-81d7-562e9830672f.png)

### The left panel of the application
The input panel contains four cells where initial conditions can be edited. It consists of the following cells and each of them is editable:
1) Shooting Parameters:
• parallel simulations (on or off);
• simulation time;
• number of shoots;
• type of guidance.
2) Guidance errors:
• rocket tracking error in elevation, azimuth and distance [degrees];
• target tracking error in elevation, azimuth and distance [degrees].
3) Warhead parameters:
• mass of the explosive charge;
• number of fragments;
• splinter spread angle.
4) Target movement parameters:
• starting position of the target xyz;
• sensitive surface of the target;
• initial speed.

The application allows you to add any maneuvers of the target that you want to simulate. By clicking on the „Parametry ruchu celu” ("Target movement parameters") cell on the yellow button called „Dodaj manewry” ("Add maneuvers") a secondary application opens. The main application provides the second application with matrices characterizing the motion parameters of the target. In the new window, it is possible to add target maneuvers that interest us. User-created maneuvers appear in the table above the „ZAAKCEPTUJ” ("ACCEPT") and „ANULUJ” ("CANCEL") buttons. To accept the added maneuvers, just press the blue button. At this point, the slave application sends the modified matrices of target motion parameters to the master application. If the user does not want to modify these matrices in the parent application, he should press the red button or close the window. To clear all added maneuvers in the main window, press the bright red „Wyczyść manewry” ("Clear maneuvers") button.

![image](https://user-images.githubusercontent.com/118617819/211040965-44513099-4c73-4bbe-9bf8-aef086649a85.png)

After accepting the input data, it is possible to quickly simulate the target's trajectory. This allows you to visualize the path of the target in accordance with the adopted assumptions. The orange „Symuluj tor ruchu celu” ("Simulate Target Track") button is used for this. After pressing the button, the program simulates the target using the Simulink tool and sends the simulation results of the subordinate application showing the target's path. This application contains three plots of the target's path: in three-dimensional, two-dimensional and polar coordinates. Below the graphs there is a table with the basic parameters of the target's movement. To go to the main window, just close the window.

![image](https://user-images.githubusercontent.com/118617819/211041616-1ffacce2-76c8-4efb-9478-d2382cb1c78f.png)

The situation is analogous if we want to run a single simulation of the guidance circuit in order to check whether the target is attainable by the tested anti-aircraft system. By pressing the „Pojedynczy strzał” ("Single Shot") button on the left panel of the main application, the guidance circuit is simulated under ideal conditions. This is when all guidance errors equal zero. After running the simulation, the simulation summary window opens. The window that opens contains charts of the target and missile trajectories and a summary table. In addition, there is a plane for evaluating guidance errors and a marked point where the rocket hit.

![image](https://user-images.githubusercontent.com/118617819/211041646-f11279a0-229a-4ac7-af41-2355c9d1ab73.png)

The green "SYMULACJA" ("SIMULATION") button simulates the guidance circuit the set number of times. The simulation process is the same as in the simulation program.
### The right panel of the application
