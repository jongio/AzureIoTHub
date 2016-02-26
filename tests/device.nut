#require "WS2812.class.nut:2.0.1"

/**
 * This file will be removed upon PR merge
 */

hardware.spi257.configure(MSB_FIRST, 7500);
local leds = WS2812(hardware.spi257, 5);

i <- 0;
d <- 1;

function step() {
    imp.wakeup(0.2, step);

    leds.fill([0, 0, 0], 0, 4)
        .set(i, [0, 50, 0])
        .draw();

    i += d;
    if (i == 4 || i == 0) d = -d;
}

function start() {
    leds.fill([0, 50, 0], 0, 4)
        .draw();
    imp.wakeup(15, step);
}

start();
