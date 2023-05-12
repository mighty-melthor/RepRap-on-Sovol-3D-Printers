; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool v3.4.0-LPC-STM32+2 on Wed Jun 15 2022 09:35:14 GMT+0200 (Mitteleuropäische Sommerzeit)
M117 "Heating up Bed"
M190 S80 ; Set Bed Temp and wait

M561 ; clear any bed transform


M117 "start calibration"
G28 ; home
M400 ;wait
M401 ; deploy Z probe (omit if using bltouch)
M400  ; wait
G30 P0 X35 Y120 Z-99999 ; probe near a leadscrew, half way along Y axis
G30 P1 X245 Y120 Z-99999 S2 ; probe near a leadscrew and calibrate 2 motors
M402 ; retract probe (omit if using bltouch)
M400 ; wait

M117 "start Mesh"
G29  ; probe the bed and enable compensation

M190 S0
M117 "cooling down"

M117 "finished"
M500  ; save
M18 X Y E0
