/* auto-generated by gen_syscalls.py, don't edit */

#include <syscalls/dac.h>

extern int z_vrfy_dac_channel_setup(const struct device * dev, const struct dac_channel_cfg * channel_cfg);
uintptr_t z_mrsh_dac_channel_setup(uintptr_t arg0, uintptr_t arg1, uintptr_t arg2,
		uintptr_t arg3, uintptr_t arg4, uintptr_t arg5, void *ssf)
{
	_current->syscall_frame = ssf;
	(void) arg2;	/* unused */
	(void) arg3;	/* unused */
	(void) arg4;	/* unused */
	(void) arg5;	/* unused */
	union { uintptr_t x; const struct device * val; } parm0;
	parm0.x = arg0;
	union { uintptr_t x; const struct dac_channel_cfg * val; } parm1;
	parm1.x = arg1;
	int ret = z_vrfy_dac_channel_setup(parm0.val, parm1.val);
	_current->syscall_frame = NULL;
	return (uintptr_t) ret;
}

