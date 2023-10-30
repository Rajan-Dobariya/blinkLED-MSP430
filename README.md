# blinkLED-MSP430

Title: **LED controlled by Switch with MSP430 MCU**

Objective:

To ensure one of the Launch LEDs turns on when the push button is pressed and turned off when the push button is not pressed (default state) using the **MSP-EXP430FR2355** microcontroller.


## Pseudocode for blinkLED-MSP430

### Steps:

**Step 1**: Initialise one of the Launch LEDs to be output (In our case we have chosen LED2 to be our test LED).\
**Step 2**: Choose one of the Switches (We have chosen Switch1 i.e P4.1) and set it to be a pull-up switch.\
**Step 3**: Check the value of Switch1 continuously, if not pressed, stay in the same loop.\
**Step 4**: If Switch1 is pressed, then turn ON the LED port.


## Output

[Video link](https://usfedu-my.sharepoint.com/:v:/g/personal/dobariya_usf_edu/EZkFUZ8iVK9GnPoRhrbSZ1IBSR6y5sJsfPVEViHaqwXO_w)
