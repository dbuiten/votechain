# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL-1065} -limit 10000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir H:/Documents/Votechain/VotechainIP/Votechain.cache/wt [current_project]
set_property parent.project_path H:/Documents/Votechain/VotechainIP/Votechain.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zedboard:part0:1.0 [current_project]
set_property ip_repo_paths {
  h:/ESE498_Capstone/votechain_ip
  h:/ESE498_Capstone/ip_repo
  h:/Documents/Votechain/votechain_ip
  h:/Documents/Votechain/ip_repo
} [current_project]
set_property ip_output_repo h:/Documents/Votechain/VotechainIP/Votechain.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/controller.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/blk_mem_gen_1.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/BRAM.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/data_validation.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/button_debounce.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/addr_timing_ctrl.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/extend.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/k_rom.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/sha256_top.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/update_h.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/w_ram.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/new/data_mining.v
  H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/bd/votechain1/hdl/votechain1_wrapper.v
}
add_files H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/bd/votechain1/votechain1.bd
set_property used_in_implementation false [get_files -all H:/Documents/Votechain/VotechainIP/Votechain.srcs/sources_1/bd/votechain1/votechain1_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc H:/Documents/Votechain/VotechainIP/Votechain.srcs/constrs_1/zedboard_constraints.xdc
set_property used_in_implementation false [get_files H:/Documents/Votechain/VotechainIP/Votechain.srcs/constrs_1/zedboard_constraints.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top votechain1_wrapper -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef votechain1_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file votechain1_wrapper_utilization_synth.rpt -pb votechain1_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
