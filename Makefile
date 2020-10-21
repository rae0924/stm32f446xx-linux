PROJECT = led_on
SRCS = main.c stm32f446xx_startup.c system_stm32f4xx.c
SRCS += stm32f4xx_rcc.c
SRCS += stm32f4xx_gpio.c
OBJS = $(SRCS:.c=.o)

# directory to the standard peripheral library from ST
LIBROOT = /home/rae384/Desktop/embedded/STM32F4xx_DSP_StdPeriph_Lib_V1.8.0
# subdirectories to libraries
DEVICE = $(LIBROOT)/Libraries/CMSIS/Device/ST/STM32F4xx/Include
CORE = $(LIBROOT)/Libraries/CMSIS/Include
PERIPH = $(LIBROOT)/Libraries/STM32F4xx_StdPeriph_Driver

# search for src files
vpath %.c $(PERIPH)/src

CC = arm-none-eabi-gcc
MCPU = cortex-m4
CFLAGS = -mcpu=$(MCPU) -mthumb
CFLAGS += -DSTM32F446xx -DUSE_FULL_ASSERT -DUSE_STDPERIPH_DRIVER
CFLAGS += -I$(DEVICE) -I$(CORE) -I$(PERIPH)/inc -I.
LDFLAGS = -mcpu=$(MCPU) -mthumb -T stm32f446re.ld -Wl,-Map=$(PROJECT).map

all: $(PROJECT).elf 

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

$(PROJECT).elf: $(OBJS)
	$(CC) $(LDFLAGS) $^ -o $@ 

clean:
	rm -rf *.o *.map