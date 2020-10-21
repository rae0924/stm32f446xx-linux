# stm32f446xx-linux
Template for programming STM32F446xx type microcontrollers on linux using the GNU ARM embedded toolchain and ST's standard peripheral libraries. You
should be able to edit this template to work with most STM32 devices. I used the [Nucleo-64 development board with the STM32F446RE MCU](https://www.amazon.com/STM32-Nucleo-Development-STM32F446RE-NUCLEO-F446RE/dp/B01I8XLEM8/ref=sr_1_7?dchild=1&keywords=stm32&qid=1603259442&sr=8-7)
and it works.

## Requirements
* [GNU ARM Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm)
* [ST's Standard Peripheral Libraries](https://www.st.com/en/embedded-software/stm32-standard-peripheral-libraries.html)
* [STlink Tools](https://github.com/stlink-org/stlink)
* A text editor

## Flashing
You can flash using GDB if you have a built-in USB debugger on your STM32 device. You can also probably make a .bin or .hex file from the .elf file to flash directly onto a 
MCU using the `st-flash` command.

1. In a terminal, start a GDB server: ``st-util``.
2. On a separate terminal, start the GDB with a .elf file to flash: `arm-none-eabi-gdb led_on.elf`
3. Connect to the external server: `(gdb) target extended-remote :4242`
4. Flash the .elf file: `(gdb) load` or `(gdb) load led_on.elf`

## led_on.elf
After flashing the file, the user LED (LD2) on the Nucleo board should light up. You can blink it by hitting the reset button. The code simply configures
the GPIO port A pin 5 to output and sets it high, so if you don't have an led, just set up an external LED attached to that pin.

## Resources Used
1. [Discovering the STM32 Microcontroller](https://legacy.cs.indiana.edu/~geobrown/book.pdf)
2. [Bare Metal Embedded playlist on YouTube](https://www.youtube.com/playlist?list=PLERTijJOmYrDiiWd10iRHY0VRHdJwUH4g)
3. [This YouTube video on STM32 development on Linux](https://sourceware.org/binutils/docs/ld/Scripts.html)
3. [Linker Script documentations](https://sourceware.org/binutils/docs/ld/Scripts.html)
4. [ST's STM32F446RE documentations](https://www.st.com/en/microcontrollers-microprocessors/stm32f446re.html#documentatio)
