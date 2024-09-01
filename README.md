### Washing Machine Controller Overview:
The washing machine controller is designed to automate the operations of a washing machine by managing its various states. The controller ensures that the washing, rinsing, and spinning cycles are executed in a predefined sequence, with appropriate durations for each cycle.

### State Machine Description:
The washing machine operates based on a state machine that transitions through various states. These states include:

1. **IDLE**:
   - This is the initial state of the washing machine.
   - In this state, the machine waits for a start signal from the user.
   - No operations are performed in this state.

2. **START**:
   - This state is activated once the start signal is received.
   - The machine prepares to begin the wash cycle.
   - It may involve initial checks and setups, such as ensuring the door is closed and the machine is ready to operate.

3. **WASH**:
   - In this state, the washing cycle is in progress.
   - The machine runs the washing cycle for a specified duration known as `WASH_DURATION`.
   - The washing cycle involves agitating the clothes with water and detergent to clean them.

4. **RINSE**:
   - After the wash cycle is complete, the machine transitions to the rinse state.
   - The rinsing cycle is in progress for a specified duration known as `RINSE_DURATION`.
   - During rinsing, the machine removes detergent from the clothes by agitating them in clean water.

5. **SPIN**:
   - Once rinsing is done, the machine moves to the spin state.
   - The spinning cycle is in progress for a specified duration known as `SPIN_DURATION`.
   - The spin cycle involves rotating the drum at high speeds to remove excess water from the clothes.

6. **COMPLETE**:
   - This state indicates that all cycles (wash, rinse, and spin) have been successfully completed.
   - The machine may signal the completion of the laundry process to the user.

7. **STOPPED**:
   - The washing machine can be stopped at any time during the cycles.
   - When stopped, the machine transitions to this state, halting all operations.

### Duration Parameters:
The controller is programmed with specific durations for each cycle:
- **WASH_DURATION**: The duration for which the washing cycle runs.
- **RINSE_DURATION**: The duration for which the rinsing cycle runs.
- **SPIN_DURATION**: The duration for which the spinning cycle runs.

### Transition Logic:
The transition between the states is governed by transition logic within the controller. This logic ensures smooth and correct transitions between states based on the following:
- **Input Signals**: These are signals received from sensors or user inputs, such as the start button.
- **Delay Counter**: The counter keeps track of the time spent in each state, ensuring the machine stays in each state for the specified duration before moving to the next state.
