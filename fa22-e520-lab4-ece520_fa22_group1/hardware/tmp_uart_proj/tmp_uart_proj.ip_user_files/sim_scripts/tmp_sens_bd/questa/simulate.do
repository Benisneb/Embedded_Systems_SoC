onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib tmp_sens_bd_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {tmp_sens_bd.udo}

run -all

quit -force
