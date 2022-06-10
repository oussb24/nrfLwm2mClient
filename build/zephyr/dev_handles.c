#include <device.h>
#include <toolchain.h>

/* 1 : /soc/peripheral@40000000/clock@5000:
 * Direct Dependencies:
 *   - (/soc/interrupt-controller@e000e100)
 *   - (/soc/peripheral@40000000)
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_soc_S_peripheral_40000000_S_clock_5000[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };

/* 2 : /soc/peripheral@40000000/gpio@842500:
 * Direct Dependencies:
 *   - (/soc/peripheral@40000000)
 * Supported:
 *   - (/gpio-reset)
 *   - (/buttons/button_0)
 *   - (/buttons/button_1)
 *   - (/buttons/button_2)
 *   - (/buttons/button_3)
 *   - (/leds/led_0)
 *   - (/leds/led_1)
 *   - (/leds/led_2)
 *   - (/leds/led_3)
 *   - /soc/peripheral@40000000/spi@b000
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_soc_S_peripheral_40000000_S_gpio_842500[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, 8, DEVICE_HANDLE_ENDS };

/* 3 : /cryptocell-sw:
 * Direct Dependencies:
 *   - (/)
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_cryptocell_sw[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };

/* 4 : /soc/peripheral@40000000/uart@8000:
 * Direct Dependencies:
 *   - (/pin-controller/uart0_default)
 *   - (/pin-controller/uart0_sleep)
 *   - (/soc/interrupt-controller@e000e100)
 *   - (/soc/peripheral@40000000)
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_soc_S_peripheral_40000000_S_uart_8000[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };

/* 5 : sysinit:
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_nrf91_socket[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };

/* 6 : /soc/peripheral@40000000/i2c@a000:
 * Direct Dependencies:
 *   - (/pin-controller/i2c2_default)
 *   - (/pin-controller/i2c2_sleep)
 *   - (/soc/interrupt-controller@e000e100)
 *   - (/soc/peripheral@40000000)
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_soc_S_peripheral_40000000_S_i2c_a000[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };

/* 7 : /soc/peripheral@40000000/flash-controller@39000:
 * Direct Dependencies:
 *   - (/soc/peripheral@40000000)
 * Supported:
 *   - (/soc/peripheral@40000000/flash-controller@39000/flash@0)
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_soc_S_peripheral_40000000_S_flash_controller_39000[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };

/* 8 : /soc/peripheral@40000000/spi@b000:
 * Direct Dependencies:
 *   - (/pin-controller/spi3_default_alt)
 *   - (/pin-controller/spi3_sleep_alt)
 *   - (/soc/interrupt-controller@e000e100)
 *   - (/soc/peripheral@40000000)
 *   - /soc/peripheral@40000000/gpio@842500
 * Supported:
 *   - /soc/peripheral@40000000/spi@b000/mx25r6435f@0
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_soc_S_peripheral_40000000_S_spi_b000[] = { 2, DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, 9, DEVICE_HANDLE_ENDS };

/* 9 : /soc/peripheral@40000000/spi@b000/mx25r6435f@0:
 * Direct Dependencies:
 *   - /soc/peripheral@40000000/spi@b000
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_soc_S_peripheral_40000000_S_spi_b000_S_mx25r6435f_0[] = { 8, DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };

/* 10 : /sensor-sim:
 * Direct Dependencies:
 *   - (/)
 */
const device_handle_t __aligned(2) __attribute__((__section__(".__device_handles_pass2")))
__devicehdl_DT_N_S_sensor_sim[] = { DEVICE_HANDLE_SEP, DEVICE_HANDLE_SEP, DEVICE_HANDLE_ENDS };
