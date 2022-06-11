# Chemical Evaporator Control
CUED Part IIA Project - GF1 Control System

This project involved the modelling of a chemical evaporator process in Simulink, and investigating the control systems for system states, mainly the product composition.
A model of the system was built up using equations provided in [1], and was then made more realistic by adding lags in unput variables to simulate serve-controlled valves, and saturation limits within the system.
Three PI controller were built for product composition, operating pressure and seperator liquid level.
Due to the system's nonlinearities, the PI controllers only worked well around the nominal operating point.
The performance gains of gain-scheduled control and state-feedback were then explored.

![til](https://github.com/edwardengland/GF1_Control_System/blob/main/SimulinkGIF.gif)
