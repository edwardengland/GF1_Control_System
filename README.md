# Chemical Evaporator Control
CUED Part IIA Project - GF1 Control System

This project involved the modelling of a chemical evaporator process in Simulink and investigating various control system designs.
A model of the system was built up using the fundamental equations and was then made more realistic by adding lags in input variables to simulate servo-controlled valves, and saturation limits added within the system.

Three PI controller were built to control product composition, operating pressure and seperator liquid level.
Due to the system's nonlinearities, the PI controllers only worked well around the nominal operating point.
The performance gains of gain-scheduled control and state-feedback were then explored.

![til](https://github.com/edwardengland/GF1_Control_System/blob/main/SimulinkGIF.gif)
