import_device eagle_s20.db -package BG256
open_project potato.al
elaborate -top toplevel
read_adc "constraint/io.adc"
optimize_rtl
report_area -file "potato_rtl.area"

export_db "potato_rtl.db"
optimize_gate -packarea "potato_gate.area"
legalize_phy_inst
export_db "potato_gate.db"
place
route
report_area -io_info -file "potato_phy.area"
export_db "potato_pr.db"
bitgen -bit "potato.bit" -version 0X00 -g ucode:00000000000000000000000000000000
