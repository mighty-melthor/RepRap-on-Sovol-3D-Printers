; Configuration file for Fly-CDYv3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.4.0-LPC-STM32+2 on Wed Jun 15 2022 09:35:15 GMT+0200 (Mitteleuropäische Sommerzeit)

; General preferences
G90                                                    ; send absolute coordinates...
M83                                                    ; ...but relative extruder moves
M550 P"Sovol SV01"                         	           ; set printer name

; Network
M552 S1                                                ; enable network
M586 P0 S1                                             ; enable HTTP
M586 P1 S0                                             ; disable FTP
M586 P2 S0                                             ; disable Telnet

M555 P2												   ; Marlin compatible

; Drives
M569 P0 S0                                             ; physical drive 0 goes backwards using default driver timings	X-Achse
M569 P1 S0                                             ; physical drive 1 goes backwards using default driver timings	Y-Achse
M569 P2 S1                                             ; physical drive 2 goes forwards using default driver timings	Z-links
M569 P3 S0                                             ; physical drive 3 goes backwards using default driver timings	Extruder
M569 P4 S1                                             ; physical drive 4 goes forwards using default driver timings	Z-Rechts
M584 X0 Y1 Z2:4 E3                                     ; set drive mapping
M350 X16 Y16 Z16 E16 I1                      	       ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00:400.00 E397.00               ; set steps per mm
M566 X900.00 Y900.00 Z60.00:60.00 E640.00              ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z600.00:600.00 E20000.00        ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z120.00:120.00 E6400.00           ; set accelerations (mm/s^2)
M906 X560 Y560 Z560:560 E800 I25                       ; set motor currents (mA) and motor idle factor in per cent
M671 X-40:320 Y0:0 S10                	   			   ; define dual driven z-axis
M84 S30                                                ; Set idle timeout
M564 H0					                               ; Moved unhomed

; Axis Limits
M208 X-19 Y-6.5 Z0 S1                                        ; set axis minima
M208 X280 Y240 Z300 S0                                       ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                                          ; configure switch-type (e.g. microswitch) endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                          ; configure switch-type (e.g. microswitch) endstop for low end on Y via pin ystop
M574 Z1 S2                                                   ; configure Z-probe endstop for low end on Z

; Z-Probe
M950 S0 C"servo0"                                            ; create servo pin 0 for BLTouch
M558 P9 C"^probe" H5 F250 T7200 A3                           ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X-32 Y-9 Z0.88                                      ; set Z probe trigger value, offset and trigger height
M557 X0:248 Y0:231 P7                                        ; define mesh grid

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950         		 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                                            ; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                                             ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                      ; map heated bed to heater 0
M143 H0 S120                                                 ; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8		 ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                         ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                                             ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S310                                                 ; set temperature limit for heater 1 to 310C

; Fans
M950 F0 C"fan0" Q25                                    ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                         ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q250                                   ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H1 T65                                      ; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q100                                   ; create fan 2 on pin fan2 and set its frequency
M106 P2 S0.2 H0 T50                                    ; set fan 2 value. Thermostatic control is turned off

; Tools
M563 P0 S"Hemera" D0 H1 F0                             ; define tool 0
G10 P0 X0 Y0 Z0                                        ; set tool 0 axis offsets
G10 P0 R0 S0                                           ; set initial tool 0 active and standby temperatures to 0C

; Miscellaneous
T0                                                     ; select first tool
M575 P1 S2 B57600									   ; enable Fly-Screen
M501                                                   ; load saved parameters from non-volatile memory
