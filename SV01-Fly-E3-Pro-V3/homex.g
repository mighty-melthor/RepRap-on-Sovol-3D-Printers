; homex.g
; called to home the X axis
;
; generated by RepRapFirmware Configuration Tool v3.4.0-LPC-STM32+4 on Tue Aug 23 2022 13:05:36 GMT+0200 (CEST)
G91                 ; relative positioning
G1 H2 Z5 F7200      ; lift Z relative to current position
G1 H1 X-305.5 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 H2 X5 F7200      ; go back a few mm
G1 H1 X-305.5 F360  ; move slowly to X axis endstop once more (second pass)
G1 H2 Z-5 F7200     ; lower Z again
G90                 ; absolute positioning

