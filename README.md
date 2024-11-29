# **Robotic Hand Control**  
### Verilog Code for Controlling a Robotic Hand  

This repository demonstrates a simple yet effective implementation of a robotic hand control system using Verilog. It highlights fundamental principles of robotic hand operation, including object gripping, pressure management, and controlled release.  

![Robotic Hand Diagram](https://github.com/user-attachments/assets/ec97577c-0e1b-49ea-b11c-49b4cc292972)

---

## **Overview**  

The algorithm is designed to enable a robotic hand to:  
1. **Lift an object**: Grip the object when it is within a valid distance range.  
2. **Monitor pressure**: Ensure the grip is firm but not excessive to prevent damaging the object.  
3. **Release the object**: Respond to a command to drop the object safely.  

This implementation incorporates sensors to measure distance and pressure, as well as control logic for servo motors to actuate the robotic hand.  

---

## **Features**  
- **Distance Detection**: Determines if the object is within the gripping range.  
- **Pressure Monitoring**: Prevents excessive force to avoid damaging fragile objects.  
- **Command Control**: Supports commands for lifting and dropping objects.  
- **Safety Mechanisms**: Automatically stops movement when limits are exceeded.  

---

## **Project Structure**  

- **`Main`**: Core control module integrating all submodules.  
- **`Visual`**: Handles distance sensing and validates if the object is within range.  
- **`Tenzo1` and `Tenzo2`**: Measure grip pressure and ensure limits are not exceeded.  
- **`Servo`**: Controls the servo motor for gripping and releasing objects.  

---

## **How It Works**  

1. **Receive Lift Command**:  
   The system receives a command to lift an object.  

2. **Check Distance**:  
   The `Visual` module determines if the object is within the gripping range:  
   - Maximum Range: 10 cm  
   - Minimum Range: 4 cm  

3. **Grip the Object**:  
   If the distance is valid, the servo motor closes the hand to grip the object.  

4. **Monitor Pressure**:  
   The system uses the `Tenzo1` and `Tenzo2` modules to ensure the grip pressure stays within safe limits.  

5. **Drop Command**:  
   Upon receiving a drop command, the servo releases the object and returns to the idle state.  

