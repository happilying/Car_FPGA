cd   "C:/Program Files (x86)/eHiWay/eLinx3.0/bin/shell/bin"
set tclFile  "C:/Program Files (x86)/eHiWay/eLinx3.0/bin/shell/bin/run_pack.tcl"
set dir "D:/FPGA/car"
set prj car
set topEntity wires
set seriesName "eHiChip6"
set deviceName "EQ6HL130"
set packageName "CSG484_H"
set synthName synth_1
source $tclFile
run_pack $dir $prj $topEntity $seriesName $deviceName $packageName $synthName
exit 0
