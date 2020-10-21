
ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
    SRAM (rwx)   : ORIGIN = 0x20000000, LENGTH = 128K
}

__ram_start__ = ORIGIN(SRAM);
__ram_size__  = LENGTH(SRAM);
__ram_end__   = __ram_start__ + __ram_size__;
_estack = __ram_end__;


SECTIONS
{
    .text : 
    {
        *(.isr_vector)
        *(.text)
        *(.text.*)
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
        _etext = .;
    } > FLASH

    _sidata = LOADADDR(.data);
    .data :
    {
        _sdata = .;
        *(.data)
        *(.data.*)
        . = ALIGN(4);
        _edata = .;
    } > SRAM AT> FLASH

    .bss : 
    {
        _sbss = .;
        __bss_start__ = _sbss;
        *(.bss)
        *(.bss.*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
        __bss_end__ = _ebss;
        . = ALIGN(4);
    } > SRAM

    PROVIDE ( end = _ebss );
    PROVIDE ( _exit = _ebss );

}