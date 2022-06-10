 OUTPUT_FORMAT("elf32-littlearm")
_region_min_align = 32;
MEMORY
    {
    FLASH (rx) : ORIGIN = 0x20200, LENGTH = 0x5fe00
    SRAM (wx) : ORIGIN = 0x2000c4e8, LENGTH = 0x33b18
   
    IDT_LIST (wx) : ORIGIN = 0xFFFFF7FF, LENGTH = 2K
    }
ENTRY("__start")
SECTIONS
    {
 .rel.plt :
 {
 *(.rel.plt)
 PROVIDE_HIDDEN (__rel_iplt_start = .);
 *(.rel.iplt)
 PROVIDE_HIDDEN (__rel_iplt_end = .);
 }
 .rela.plt :
 {
 *(.rela.plt)
 PROVIDE_HIDDEN (__rela_iplt_start = .);
 *(.rela.iplt)
 PROVIDE_HIDDEN (__rela_iplt_end = .);
 }
 .rel.dyn :
 {
 *(.rel.*)
 }
 .rela.dyn :
 {
 *(.rela.*)
 }
    /DISCARD/ :
 {
 *(.plt)
 }
    /DISCARD/ :
 {
 *(.iplt)
 }
   
 __rom_region_start = 0x20200;
    rom_start :
 {
. = 0x0;
. = ALIGN(4);
. = ALIGN( 1 << ((((4 * 32) <= 4) ? 2 : (((4 * 32) <= 8) ? 3 : (((4 * 32) <= 16) ? 4 : (((4 * 32) <= 32) ? 5 : (((4 * 32) <= 64) ? 6 : (((4 * 32) <= 128) ? 7 : (((4 * 32) <= 256) ? 8 : (((4 * 32) <= 512) ? 9 : (((4 * 32) <= 1024) ? 10 : (((4 * 32) <= 2048) ? 11 : (((4 * 32) <= 4096) ? 12 : (((4 * 32) <= 8192) ? 13 : (((4 * 32) <= 16384) ? 14 : (((4 * 32) <= 32768) ? 15:(((4 * 32) <= 65536) ? 16 : (((4 * 32) <= 131072) ? 17 : (((4 * 32) <= 262144) ? 18:(((4 * 32) <= 524288) ? 19 : (((4 * 32) <= 1048576) ? 20 : (((4 * 32) <= 2097152) ? 21 : (((4 * 32) <= 4194304) ? 22 : (((4 * 32) <= 8388608) ? 23 : (((4 * 32) <= 16777216) ? 24 : (((4 * 32) <= 33554432) ? 25 : (((4 * 32) <= 67108864) ? 26 : (((4 * 32) <= 134217728) ? 27 : (((4 * 32) <= 268435456) ? 28 : (((4 * 32) <= 536870912) ? 29 : (((4 * 32) <= 1073741824) ? 30 : (((4 * 32) <= 2147483648) ? 31 : 32))))))))))))))))))))))))))))))) );
. = ALIGN( 1 << ((((4 * (16 + 65)) <= 4) ? 2 : (((4 * (16 + 65)) <= 8) ? 3 : (((4 * (16 + 65)) <= 16) ? 4 : (((4 * (16 + 65)) <= 32) ? 5 : (((4 * (16 + 65)) <= 64) ? 6 : (((4 * (16 + 65)) <= 128) ? 7 : (((4 * (16 + 65)) <= 256) ? 8 : (((4 * (16 + 65)) <= 512) ? 9 : (((4 * (16 + 65)) <= 1024) ? 10 : (((4 * (16 + 65)) <= 2048) ? 11 : (((4 * (16 + 65)) <= 4096) ? 12 : (((4 * (16 + 65)) <= 8192) ? 13 : (((4 * (16 + 65)) <= 16384) ? 14 : (((4 * (16 + 65)) <= 32768) ? 15:(((4 * (16 + 65)) <= 65536) ? 16 : (((4 * (16 + 65)) <= 131072) ? 17 : (((4 * (16 + 65)) <= 262144) ? 18:(((4 * (16 + 65)) <= 524288) ? 19 : (((4 * (16 + 65)) <= 1048576) ? 20 : (((4 * (16 + 65)) <= 2097152) ? 21 : (((4 * (16 + 65)) <= 4194304) ? 22 : (((4 * (16 + 65)) <= 8388608) ? 23 : (((4 * (16 + 65)) <= 16777216) ? 24 : (((4 * (16 + 65)) <= 33554432) ? 25 : (((4 * (16 + 65)) <= 67108864) ? 26 : (((4 * (16 + 65)) <= 134217728) ? 27 : (((4 * (16 + 65)) <= 268435456) ? 28 : (((4 * (16 + 65)) <= 536870912) ? 29 : (((4 * (16 + 65)) <= 1073741824) ? 30 : (((4 * (16 + 65)) <= 2147483648) ? 31 : 32))))))))))))))))))))))))))))))) );
_vector_start = .;
KEEP(*(.exc_vector_table))
KEEP(*(".exc_vector_table.*"))
KEEP(*(.gnu.linkonce.irq_vector_table*))
KEEP(*(.vectors))
_vector_end = .;
. = 0x200;
_fw_info_start = .;
KEEP(*(SORT_BY_NAME(.firmware_info*)))
_fw_info_size = ABSOLUTE(. - _fw_info_start);
 } > FLASH
    text :
 {
 __text_region_start = .;
 *(.text)
 *(".text.*")
 *(".TEXT.*")
 *(.gnu.linkonce.t.*)
 *(.glue_7t) *(.glue_7) *(.vfp11_veneer) *(.v4_bx)
 } > FLASH
 __text_region_end = .;
 .ARM.exidx :
 {
 __exidx_start = .;
 *(.ARM.exidx* gnu.linkonce.armexidx.*)
 __exidx_end = .;
 } > FLASH
 __rodata_region_start = .;
 initlevel :
 {
  __init_start = .;
  __init_PRE_KERNEL_1_start = .; KEEP(*(SORT(.z_init_PRE_KERNEL_1[0-9]_*))); KEEP(*(SORT(.z_init_PRE_KERNEL_1[1-9][0-9]_*)));
  __init_PRE_KERNEL_2_start = .; KEEP(*(SORT(.z_init_PRE_KERNEL_2[0-9]_*))); KEEP(*(SORT(.z_init_PRE_KERNEL_2[1-9][0-9]_*)));
  __init_POST_KERNEL_start = .; KEEP(*(SORT(.z_init_POST_KERNEL[0-9]_*))); KEEP(*(SORT(.z_init_POST_KERNEL[1-9][0-9]_*)));
  __init_APPLICATION_start = .; KEEP(*(SORT(.z_init_APPLICATION[0-9]_*))); KEEP(*(SORT(.z_init_APPLICATION[1-9][0-9]_*)));
  __init_SMP_start = .; KEEP(*(SORT(.z_init_SMP[0-9]_*))); KEEP(*(SORT(.z_init_SMP[1-9][0-9]_*)));
  __init_end = .;
 } > FLASH
 devices :
 {
  __device_start = .;
  __device_PRE_KERNEL_1_start = .; KEEP(*(SORT(.z_device_PRE_KERNEL_1[0-9]_*))); KEEP(*(SORT(.z_device_PRE_KERNEL_1[1-9][0-9]_*)));
  __device_PRE_KERNEL_2_start = .; KEEP(*(SORT(.z_device_PRE_KERNEL_2[0-9]_*))); KEEP(*(SORT(.z_device_PRE_KERNEL_2[1-9][0-9]_*)));
  __device_POST_KERNEL_start = .; KEEP(*(SORT(.z_device_POST_KERNEL[0-9]_*))); KEEP(*(SORT(.z_device_POST_KERNEL[1-9][0-9]_*)));
  __device_APPLICATION_start = .; KEEP(*(SORT(.z_device_APPLICATION[0-9]_*))); KEEP(*(SORT(.z_device_APPLICATION[1-9][0-9]_*)));
  __device_SMP_start = .; KEEP(*(SORT(.z_device_SMP[0-9]_*))); KEEP(*(SORT(.z_device_SMP[1-9][0-9]_*)));
  __device_end = .;
 } > FLASH
 sw_isr_table :
 {
  . = ALIGN(0);
  *(.gnu.linkonce.sw_isr_table*)
 } > FLASH
 initlevel_error :
 {
  KEEP(*(SORT(.z_init_[_A-Z0-9]*)))
 }
 ASSERT(SIZEOF(initlevel_error) == 0, "Undefined initialization levels used.")
 app_shmem_regions : ALIGN_WITH_INPUT
 {
  __app_shmem_regions_start = .;
  KEEP(*(SORT(.app_regions.*)));
  __app_shmem_regions_end = .;
 } > FLASH
 net_socket_register_area : SUBALIGN(4) { _net_socket_register_list_start = .; KEEP(*(SORT_BY_NAME(._net_socket_register.static.*))); _net_socket_register_list_end = .; } > FLASH
 bt_l2cap_fixed_chan_area : SUBALIGN(4) { _bt_l2cap_fixed_chan_list_start = .; KEEP(*(SORT_BY_NAME(._bt_l2cap_fixed_chan.static.*))); _bt_l2cap_fixed_chan_list_end = .; } > FLASH
 bt_gatt_service_static_area : SUBALIGN(4) { _bt_gatt_service_static_list_start = .; KEEP(*(SORT_BY_NAME(._bt_gatt_service_static.static.*))); _bt_gatt_service_static_list_end = .; } > FLASH
 settings_handler_static_area : SUBALIGN(4) { _settings_handler_static_list_start = .; KEEP(*(SORT_BY_NAME(._settings_handler_static.static.*))); _settings_handler_static_list_end = .; } > FLASH
 k_p4wq_initparam_area : SUBALIGN(4) { _k_p4wq_initparam_list_start = .; KEEP(*(SORT_BY_NAME(._k_p4wq_initparam.static.*))); _k_p4wq_initparam_list_end = .; } > FLASH
 log_strings_sections : ALIGN_WITH_INPUT
 {
  __log_strings_start = .;
  KEEP(*(SORT(.log_strings*)));
  __log_strings_end = .;
 } > FLASH
 log_const_sections : ALIGN_WITH_INPUT
 {
  __log_const_start = .;
  KEEP(*(SORT(.log_const_*)));
  __log_const_end = .;
 } > FLASH
 log_backends_sections : ALIGN_WITH_INPUT
 {
  __log_backends_start = .;
  KEEP(*("._log_backend.*"));
  __log_backends_end = .;
 } > FLASH
 shell_area : SUBALIGN(4) { _shell_list_start = .; KEEP(*(SORT_BY_NAME(._shell.static.*))); _shell_list_end = .; } > FLASH
 shell_root_cmds_sections : ALIGN_WITH_INPUT
 {
  __shell_root_cmds_start = .;
  KEEP(*(SORT(.shell_root_cmd_*)));
  __shell_root_cmds_end = .;
 } > FLASH
 font_entry_sections : ALIGN_WITH_INPUT
 {
  __font_entry_start = .;
  KEEP(*(SORT_BY_NAME("._cfb_font.*")))
  __font_entry_end = .;
 } > FLASH
 tracing_backend_area : SUBALIGN(4) { _tracing_backend_list_start = .; KEEP(*(SORT_BY_NAME(._tracing_backend.static.*))); _tracing_backend_list_end = .; } > FLASH
 zephyr_dbg_info : ALIGN_WITH_INPUT
 {
  KEEP(*(".dbg_thread_info"));
 } > FLASH
 device_handles : ALIGN_WITH_INPUT
 {
__device_handles_start = .;
KEEP(*(SORT(.__device_handles_pass2*)));
__device_handles_end = .;
 } > FLASH
    rodata :
 {
 *(.rodata)
 *(".rodata.*")
 *(.gnu.linkonce.r.*)
. = ALIGN(4);
_lte_lc_cfun_cb_list_start = .;
KEEP(*(SORT_BY_NAME("._lte_lc_cfun_cb.*")));
_lte_lc_cfun_cb_list_end = .;
. = ALIGN(4);
_nrf_modem_lib_init_cb_list_start = .;
KEEP(*(SORT_BY_NAME("._nrf_modem_lib_init_cb.*")));
_nrf_modem_lib_init_cb_list_end = .;
_nrf_modem_lib_shutdown_cb_list_start = .;
KEEP(*(SORT_BY_NAME("._nrf_modem_lib_shutdown_cb.*")));
_nrf_modem_lib_shutdown_cb_list_end = .;
. = ALIGN(4);
_fw_info_images_start = .;
KEEP(*(.fw_info_images))
_fw_info_images_size = ABSOLUTE((. - _fw_info_images_start) / 4);
_ext_apis_start = .;
KEEP(*(.ext_apis))
_ext_apis_size = ABSOLUTE(. - _ext_apis_start);
_ext_apis_req_start = .;
KEEP(*(.ext_apis_req))
_ext_apis_req_size = ABSOLUTE(. - _ext_apis_req_start);
 . = ALIGN(4);
 } > FLASH
 __rodata_region_end = .;
 . = ALIGN(_region_min_align);
 __rom_region_end = .;
   
    /DISCARD/ : {
 *(.got.plt)
 *(.igot.plt)
 *(.got)
 *(.igot)
 }
   
 . = 0x2000c4e8;
 . = ALIGN(_region_min_align);
 _image_ram_start = .;
.ramfunc : ALIGN_WITH_INPUT
{
 . = ALIGN(_region_min_align);
 __ramfunc_start = .;
 *(.ramfunc)
 *(".ramfunc.*")
 . = ALIGN(_region_min_align);
 __ramfunc_end = .;
} > SRAM AT > FLASH
__ramfunc_size = __ramfunc_end - __ramfunc_start;
__ramfunc_load_start = LOADADDR(.ramfunc);
   
    datas : ALIGN_WITH_INPUT
 {
 __data_region_start = .;
 __data_start = .;
 *(.data)
 *(".data.*")
 *(".kernel.*")
. = ALIGN(4);
_at_monitor_entry_list_start = .;
KEEP(*(SORT_BY_NAME("._at_monitor_entry.*")));
_at_monitor_entry_list_end = .;
. = ALIGN(4);
_at_monitor_isr_entry_list_start = .;
KEEP(*(SORT_BY_NAME("._at_monitor_isr_entry.*")));
_at_monitor_isr_entry_list_end = .;
 __data_end = .;
 } > SRAM AT > FLASH
    __data_size = __data_end - __data_start;
    __data_load_start = LOADADDR(datas);
    __data_region_load_start = LOADADDR(datas);
        device_states : ALIGN_WITH_INPUT
        {
                __device_states_start = .;
  KEEP(*(".z_devstate"));
  KEEP(*(".z_devstate.*"));
                __device_states_end = .;
        } > SRAM AT > FLASH
 initshell : ALIGN_WITH_INPUT
 {
  __shell_module_start = .;
  KEEP(*(".shell_module_*"));
  __shell_module_end = .;
  __shell_cmd_start = .;
  KEEP(*(".shell_cmd_*"));
  __shell_cmd_end = .;
 } > SRAM AT > FLASH
 log_dynamic_sections : ALIGN_WITH_INPUT
 {
  __log_dynamic_start = .;
  KEEP(*(SORT(.log_dynamic_*)));
  __log_dynamic_end = .;
 } > SRAM AT > FLASH
 _static_thread_data_area : ALIGN_WITH_INPUT SUBALIGN(4) { __static_thread_data_list_start = .; KEEP(*(SORT_BY_NAME(.__static_thread_data.static.*))); __static_thread_data_list_end = .; } > SRAM AT > FLASH
 k_timer_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_timer_list_start = .; *(SORT_BY_NAME(._k_timer.static.*)); _k_timer_list_end = .; } > SRAM AT > FLASH
 k_mem_slab_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_mem_slab_list_start = .; *(SORT_BY_NAME(._k_mem_slab.static.*)); _k_mem_slab_list_end = .; } > SRAM AT > FLASH
 k_mem_pool_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_mem_pool_list_start = .; *(SORT_BY_NAME(._k_mem_pool.static.*)); _k_mem_pool_list_end = .; } > SRAM AT > FLASH
 k_heap_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_heap_list_start = .; *(SORT_BY_NAME(._k_heap.static.*)); _k_heap_list_end = .; } > SRAM AT > FLASH
 k_mutex_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_mutex_list_start = .; *(SORT_BY_NAME(._k_mutex.static.*)); _k_mutex_list_end = .; } > SRAM AT > FLASH
 k_stack_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_stack_list_start = .; *(SORT_BY_NAME(._k_stack.static.*)); _k_stack_list_end = .; } > SRAM AT > FLASH
 k_msgq_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_msgq_list_start = .; *(SORT_BY_NAME(._k_msgq.static.*)); _k_msgq_list_end = .; } > SRAM AT > FLASH
 k_mbox_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_mbox_list_start = .; *(SORT_BY_NAME(._k_mbox.static.*)); _k_mbox_list_end = .; } > SRAM AT > FLASH
 k_pipe_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_pipe_list_start = .; *(SORT_BY_NAME(._k_pipe.static.*)); _k_pipe_list_end = .; } > SRAM AT > FLASH
 k_sem_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_sem_list_start = .; *(SORT_BY_NAME(._k_sem.static.*)); _k_sem_list_end = .; } > SRAM AT > FLASH
 k_event_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_event_list_start = .; *(SORT_BY_NAME(._k_event.static.*)); _k_event_list_end = .; } > SRAM AT > FLASH
 k_queue_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_queue_list_start = .; *(SORT_BY_NAME(._k_queue.static.*)); _k_queue_list_end = .; } > SRAM AT > FLASH
 k_condvar_area : ALIGN_WITH_INPUT SUBALIGN(4) { _k_condvar_list_start = .; *(SORT_BY_NAME(._k_condvar.static.*)); _k_condvar_list_end = .; } > SRAM AT > FLASH
 _net_buf_pool_area : ALIGN_WITH_INPUT SUBALIGN(4)
 {
  _net_buf_pool_list = .;
  KEEP(*(SORT_BY_NAME("._net_buf_pool.static.*")))
 } > SRAM AT > FLASH
 net_if_area : ALIGN_WITH_INPUT SUBALIGN(4) { _net_if_list_start = .; KEEP(*(SORT_BY_NAME(._net_if.static.*))); _net_if_list_end = .; } > SRAM AT > FLASH net_if_dev_area : ALIGN_WITH_INPUT SUBALIGN(4) { _net_if_dev_list_start = .; KEEP(*(SORT_BY_NAME(._net_if_dev.static.*))); _net_if_dev_list_end = .; } > SRAM AT > FLASH net_l2_area : ALIGN_WITH_INPUT SUBALIGN(4) { _net_l2_list_start = .; KEEP(*(SORT_BY_NAME(._net_l2.static.*))); _net_l2_list_end = .; } > SRAM AT > FLASH eth_bridge_area : ALIGN_WITH_INPUT SUBALIGN(4) { _eth_bridge_list_start = .; KEEP(*(SORT_BY_NAME(._eth_bridge.static.*))); _eth_bridge_list_end = .; } > SRAM AT > FLASH
    __data_region_end = .;
   bss (NOLOAD) : ALIGN_WITH_INPUT
 {
        . = ALIGN(4);
 __bss_start = .;
 __kernel_ram_start = .;
 *(.bss)
 *(".bss.*")
 *(COMMON)
 *(".kernel_bss.*")
 __bss_end = ALIGN(4);
 } > SRAM AT > SRAM
    noinit (NOLOAD) :
        {
        *(.noinit)
        *(".noinit.*")
 *(".kernel_noinit.*")
        } > SRAM
    _image_ram_end = .;
    _end = .;
    __kernel_ram_end = 0x2000c4e8 + 0x33b18;
    __kernel_ram_size = __kernel_ram_end - __kernel_ram_start;
   
event_type_area : SUBALIGN(4) { _event_type_list_start = .; KEEP(*(SORT_BY_NAME(._event_type.static.*))); _event_type_list_end = .; } > FLASH
event_listener_area : SUBALIGN(4) { _event_listener_list_start = .; KEEP(*(SORT_BY_NAME(._event_listener.static.*))); _event_listener_list_end = .; } > FLASH
app_event_manager_postinit_hook_area : SUBALIGN(4) { _app_event_manager_postinit_hook_list_start = .; KEEP(*(SORT_BY_NAME(._app_event_manager_postinit_hook.static.*))); _app_event_manager_postinit_hook_list_end = .; } > FLASH
event_submit_hook_area : SUBALIGN(4) { _event_submit_hook_list_start = .; KEEP(*(SORT_BY_NAME(._event_submit_hook.static.*))); _event_submit_hook_list_end = .; } > FLASH
event_preprocess_hook_area : SUBALIGN(4) { _event_preprocess_hook_list_start = .; KEEP(*(SORT_BY_NAME(._event_preprocess_hook.static.*))); _event_preprocess_hook_list_end = .; } > FLASH
event_postprocess_hook_area : SUBALIGN(4) { _event_postprocess_hook_list_start = .; KEEP(*(SORT_BY_NAME(._event_postprocess_hook.static.*))); _event_postprocess_hook_list_end = .; } > FLASH
event_subscribers_all : ALIGN_WITH_INPUT
{
 __start_event_subscribers_all = .;
 KEEP(*(SORT(event_subscribers_*)));
 __stop_event_subscribers_all = .;
} > FLASH
/DISCARD/ :
{
 KEEP(*(.irq_info*))
 KEEP(*(.intList*))
}
 .stab 0 : { *(.stab) }
 .stabstr 0 : { *(.stabstr) }
 .stab.excl 0 : { *(.stab.excl) }
 .stab.exclstr 0 : { *(.stab.exclstr) }
 .stab.index 0 : { *(.stab.index) }
 .stab.indexstr 0 : { *(.stab.indexstr) }
 .gnu.build.attributes 0 : { *(.gnu.build.attributes .gnu.build.attributes.*) }
 .comment 0 : { *(.comment) }
 .debug 0 : { *(.debug) }
 .line 0 : { *(.line) }
 .debug_srcinfo 0 : { *(.debug_srcinfo) }
 .debug_sfnames 0 : { *(.debug_sfnames) }
 .debug_aranges 0 : { *(.debug_aranges) }
 .debug_pubnames 0 : { *(.debug_pubnames) }
 .debug_info 0 : { *(.debug_info .gnu.linkonce.wi.*) }
 .debug_abbrev 0 : { *(.debug_abbrev) }
 .debug_line 0 : { *(.debug_line .debug_line.* .debug_line_end ) }
 .debug_frame 0 : { *(.debug_frame) }
 .debug_str 0 : { *(.debug_str) }
 .debug_loc 0 : { *(.debug_loc) }
 .debug_macinfo 0 : { *(.debug_macinfo) }
 .debug_weaknames 0 : { *(.debug_weaknames) }
 .debug_funcnames 0 : { *(.debug_funcnames) }
 .debug_typenames 0 : { *(.debug_typenames) }
 .debug_varnames 0 : { *(.debug_varnames) }
 .debug_pubtypes 0 : { *(.debug_pubtypes) }
 .debug_ranges 0 : { *(.debug_ranges) }
 .debug_macro 0 : { *(.debug_macro) }
 .debug_line_str 0 : { *(.debug_line_str) }
 .debug_loclists 0 : { *(.debug_loclists) }
 .debug_rnglists 0 : { *(.debug_rnglists) }
    /DISCARD/ : { *(.note.GNU-stack) }
    .ARM.attributes 0 :
 {
 KEEP(*(.ARM.attributes))
 KEEP(*(.gnu.attributes))
 }
   
.last_section (NOLOAD) :
{
} > FLASH
_flash_used = LOADADDR(.last_section) - __rom_region_start;
    }