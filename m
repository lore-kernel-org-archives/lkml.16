Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDC828A411;
	Tue, 10 Jun 2025 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546963; cv=none; b=fVwZLjfGIExvGfv1KxvgZX49ac3yYn6XhnnjfsOO7i2+1z8HvfyETG3JzmatwMx8y5vHnA6+CxclGMdApFwdLQJTd8ReG+IBBy8d+mMtvMNjCiHLFciRkHTTUBUpNR2/QE438cOJj5j2LIHkWA0zAvdOY46FW1lw64NfL6LqTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546963; c=relaxed/simple;
	bh=5g1KcNYEca2VVL7dmON+X68UhtZi5lp7Ojo9DBjQeXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfwGsZj5QchkS1ounK1HzOrZPT5vcjsqiQB7eraxsZHmEd171w1fK4oX4+CMHvwV2f7zzBNqjrBh/0+J4SICmzNKhUhb1WGZCAaoxIXawp0SKsVLJSh/ezYc4qkTS1/4zQU6esQyv+2IzC1JNRtVwFYmjZUbdr8JqXDe+QO9T6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSONUS7O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSONUS7O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247F2C4CEED;
	Tue, 10 Jun 2025 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749546963;
	bh=5g1KcNYEca2VVL7dmON+X68UhtZi5lp7Ojo9DBjQeXk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=OSONUS7OPq11ZZNG+U6CwxWvLTjn+gFPeBfSVJgwpUVC9dxfk7KTAjvEKGinng19k
	 3F8+1d5DIGcRKz326m7i+l2PlkZcR5/KKrEqz1VCYDm4Kw6NPsk6Vr/ixMZvtFy3NX
	 a1und/cjLoxXh0p4IwjmznUWZvI9CwdtRs0liUJUpf/QfBLa6RcTCJtdRVR6p0phzd
	 SoZNQ8ILWj1llgTI/oUHGbCweUNhtvG5Hf1TlmhpV+aZMHHr1PAEn1NSCYJLM5k5Jl
	 zMJJsbxZD1BDZYBBfSTNJLTlMrn63L3A+Eg8tvgDXXZVaehqTGTHuG460sZ3vsv6bJ
	 DZ8+ByjKXOqqw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AD2D4CE0928; Tue, 10 Jun 2025 02:16:02 -0700 (PDT)
Date: Tue, 10 Jun 2025 02:16:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [paulmck-rcu:dev.2025.06.04a] [rcutorture]  9605367000:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture]
Message-ID: <ad8d8a6d-1e81-4ce5-afe7-19cea07ef128@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202506101435.e96fc5f7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506101435.e96fc5f7-lkp@intel.com>

On Tue, Jun 10, 2025 at 03:16:52PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture]" on:
> 
> commit: 96053670002f05c8aae39a668bddd54eb253dca7 ("rcutorture: Make Trivial RCU ignore onoff_interval and shuffle_interval")
> https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev.2025.06.04a
> 
> in testcase: rcutorture
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	test: default
> 	torture_type: trivial
> 
> 
> 
> config: x86_64-randconfig-071-20250605
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +-------------------------------------------------------------------------------+------------+------------+
> |                                                                               | 964687d8d4 | 9605367000 |
> +-------------------------------------------------------------------------------+------------+------------+
> | WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture] | 0          | 12         |
> | RIP:rcu_sync_torture_init_trivial[rcutorture]                                 | 0          | 12         |
> +-------------------------------------------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202506101435.e96fc5f7-lkp@intel.com
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250610/202506101435.e96fc5f7-lkp@intel.com
> 
> 
> [ 1078.501737][ T1445] torture module --- trivial:  disable_onoff_at_boot=0 ftrace_dump_at_shutdown=0 verbose_sleep_frequency=0 verbose_sleep_duration=1 random_shuffle=0
> [ 1078.531216][ T1445] ------------[ cut here ]------------
> [ 1078.542757][ T1445] rcu_sync_torture_init_trivial: Non-zero onoff_interval (0) or shuffle_interval (3) breaks trivial RCU, resetting to zero

This is expected behavior.

You are specifying shuffle_interval=3, and this is not permitted for
trivial RCU.  So rcutorture is complaining.  ;-)

> [ 1078.543244][ T1445] WARNING: CPU: 0 PID: 1445 at kernel/rcu/rcutorture.c:990 rcu_sync_torture_init_trivial+0x42/0x5e [rcutorture]
> [ 1078.589843][ T1445] Modules linked in: rcutorture(+) torture ipmi_devintf processor drm fuse drm_panel_orientation_quirks font stm_p_basic
> [ 1078.614928][ T1445] CPU: 0 UID: 0 PID: 1445 Comm: modprobe Not tainted 6.15.0-rc1-00080-g96053670002f #1 PREEMPT(voluntary) 
> [ 1078.636870][ T1445] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 1078.656604][ T1445] RIP: 0010:rcu_sync_torture_init_trivial+0x42/0x5e [rcutorture]
> [ 1078.672737][ T1445] Code: 00 89 d0 09 c8 74 33 80 3d 66 03 17 00 00 75 1c 48 c7 c6 c0 0a 3f c0 48 c7 c7 20 ba 3e c0 c6 05 4f 03 17 00 01 e8 f2 dc 83 e6 <0f> 0b 31 c0 89 05 29 3b 17 00 89 05 e3 29 16 00 5d 31 c0 31 d2 31
> [ 1078.708709][ T1445] RSP: 0018:ffff8881bb48f6a0 EFLAGS: 00210246
> [ 1078.720639][ T1445] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> [ 1078.736089][ T1445] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [ 1078.751748][ T1445] RBP: ffff8881bb48f6a0 R08: 0000000000000000 R09: 0000000000000000
> [ 1078.768592][ T1445] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffc06382a0
> [ 1078.784896][ T1445] R13: ffffffffc03f0f80 R14: ffff8881bb48f730 R15: dffffc0000000000
> [ 1078.801843][ T1445] FS:  0000000000000000(0000) GS:0000000000000000(0063) knlGS:00000000f79f1700
> [ 1078.820215][ T1445] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [ 1078.833348][ T1445] CR2: 00000000f7e7e51c CR3: 00000001bb406000 CR4: 00000000000006b0
> [ 1078.850385][ T1445] Call Trace:
> [ 1078.858560][ T1445]  <TASK>
> [ 1078.865009][ T1445]  rcu_torture_init+0x2ee/0x1c88 [rcutorture]
> [ 1078.878454][ T1445]  ? rcu_torture_fwd_prog_init+0x378/0x378 [rcutorture]
> [ 1078.892547][ T1445]  ? rcu_torture_fwd_prog_init+0x378/0x378 [rcutorture]
> [ 1078.907288][ T1445]  do_one_initcall+0xfc/0x316
> [ 1078.915264][ T1445]  ? kasan_save_alloc_info+0x3b/0x51
> [ 1078.925474][ T1445]  ? trace_initcall_level+0x8d/0x8d
> [ 1078.936365][ T1445]  ? kasan_poison+0x57/0x63
> [ 1078.945140][ T1445]  ? kasan_unpoison+0x45/0x54
> [ 1078.954319][ T1445]  ? kasan_poison+0x57/0x63
> [ 1078.963549][ T1445]  ? __asan_register_globals+0x5e/0x73
> [ 1078.973664][ T1445]  do_init_module+0x228/0x584
> [ 1078.983443][ T1445]  load_module+0xf35/0x1332
> [ 1079.041071][ T1445]  ? layout_and_allocate+0x4ec/0x4ec
> [ 1079.053668][ T1445]  ? __kasan_check_write+0x18/0x22
> [ 1079.063917][ T1445]  ? kernel_read_file+0x55a/0x59e
> [ 1079.074280][ T1445]  ? mode_strip_umask+0xa0/0xa0
> [ 1079.084161][ T1445]  init_module_from_file+0xf6/0x13c
> [ 1079.094886][ T1445]  ? init_module_from_file+0xf6/0x13c
> [ 1079.106003][ T1445]  ? __ia32_sys_init_module+0x90/0x90
> [ 1079.117160][ T1445]  ? idempotent_init_module+0x2cb/0x5cd
> [ 1079.128590][ T1445]  ? lock_release+0xaa/0xdb
> [ 1079.137666][ T1445]  idempotent_init_module+0x2e9/0x5cd
> [ 1079.148390][ T1445]  ? init_module_from_file+0x13c/0x13c
> [ 1079.159804][ T1445]  ? __fget_light+0x89/0xe6
> [ 1079.170011][ T1445]  __do_sys_finit_module+0x77/0x9e
> [ 1079.181158][ T1445]  __ia32_sys_finit_module+0x83/0x90
> [ 1079.200369][ T1445]  ia32_sys_call+0x22ae/0x26a2
> [ 1079.210966][ T1445]  __do_fast_syscall_32+0xb0/0xdb
> [ 1079.221826][ T1445]  ? vm_mmap_pgoff+0x18b/0x1de
> [ 1079.231317][ T1445]  ? randomize_page+0x62/0x62
> [ 1079.240493][ T1445]  ? rcu_read_unlock+0x5f/0x69
> [ 1079.250537][ T1445]  ? __kasan_check_write+0x18/0x22
> [ 1079.260322][ T1445]  ? fput+0x43/0x6e
> [ 1079.268784][ T1445]  ? __kasan_check_read+0x15/0x1f
> [ 1079.278856][ T1445]  ? lockdep_hardirqs_on_prepare+0x109/0x12c
> [ 1079.291496][ T1445]  ? syscall_exit_to_user_mode+0xe6/0xf5
> [ 1079.303131][ T1445]  ? __do_fast_syscall_32+0xca/0xdb
> [ 1079.314090][ T1445]  ? lockdep_hardirqs_on_prepare+0x109/0x12c
> [ 1079.331846][ T1445]  ? irqentry_exit_to_user_mode+0xdc/0xeb
> [ 1079.343611][ T1445]  do_fast_syscall_32+0x36/0x6e
> [ 1079.354071][ T1445]  do_SYSENTER_32+0x23/0x27
> [ 1079.363734][ T1445]  entry_SYSENTER_compat_after_hwframe+0x58/0x5f
> [ 1079.376376][ T1445] RIP: 0023:0xf7f05579
> [ 1079.385512][ T1445] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> [ 1079.421603][ T1445] RSP: 002b:00000000ffa4760c EFLAGS: 00200296 ORIG_RAX: 000000000000015e
> [ 1079.439014][ T1445] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00000000584e6eb0
> [ 1079.459721][ T1445] RDX: 0000000000000000 RSI: 00000000584e7220 RDI: 00000000584e6fa0
> [ 1079.476023][ T1445] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> [ 1079.492738][ T1445] R10: 0000000000000000 R11: 0000000000200246 R12: 0000000000000000
> [ 1079.508981][ T1445] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> [ 1079.525796][ T1445]  </TASK>
> [ 1079.533122][ T1445] irq event stamp: 7135
> [ 1079.542197][ T1445] hardirqs last  enabled at (7147): [<ffffffffa6dcb6a6>] __up_console_sem+0x54/0x5d
> [ 1079.560760][ T1445] hardirqs last disabled at (7160): [<ffffffffa6dcb68b>] __up_console_sem+0x39/0x5d
> [ 1079.580657][ T1445] softirqs last  enabled at (7088): [<ffffffffa6d210cd>] handle_softirqs+0x4a4/0x54c
> [ 1079.603955][ T1445] softirqs last disabled at (7183): [<ffffffffa867059f>] __do_softirq+0xf/0x13
> [ 1079.622009][ T1445] ---[ end trace 0000000000000000 ]---
> [ 1079.633479][ T1445] trivial-torture:--- Start of test: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=0 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 test_boost_holdoff=0 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 stall_cpu_repeat=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 reader_flavor=1 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0 preempt_duration=0 preempt_interval=1000 n_up_down=32

It then resets shuffle_interval to zero, which allows the test to proceed
without error.

The problem is that non-zero shuffle_interval can cause a task to be
migrated twice in a row without actually executing on the specified CPU
between the two migrations.  This means that readers on the skipped CPU
can extend across the entire trivial-RCU grace period, which of course
breaks trivial RCU.

So please set shuffle_interval=0 when testing trivial RCU.

							Thanx, Paul

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
