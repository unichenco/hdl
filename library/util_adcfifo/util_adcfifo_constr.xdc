
set_property ASYNC_REG TRUE \
  [get_cells -hier -filter {name =~ *adc_xfer_req_m*}] \
  [get_cells -hier {*cdc_sync_stage1_reg*}] \
  [get_cells -hier {*cdc_sync_stage2_reg*}]

set_false_path \
  -to [get_cells -hier -filter {name =~ *adc_xfer_req_m_reg[0]* && IS_SEQUENTIAL}]

set_false_path \
  -to [get_pins -hierarchical * -filter {NAME=~*i_adc_capture_start_sync/cdc_sync_stage1_reg[0]/D}]

set_false_path \
  -from [get_pins -hierarchical * -filter {NAME=~*i_dma_capture_start_in_sync/out_toggle_d1_reg/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_dma_capture_start_in_sync/i_sync_in/cdc_sync_stage1_reg[0]/D}]

set_false_path \
  -from [get_pins -hierarchical * -filter {NAME=~*i_dma_capture_start_in_sync/in_toggle_d1_reg/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_dma_capture_start_in_sync/i_sync_out/cdc_sync_stage1_reg[0]/D}]

set_false_path \
  -to [get_pins -hierarchical * -filter {NAME=~*i_dma_waddr_sync/cdc_sync_stage1_reg[*]/D}]
