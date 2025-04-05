Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EF5224F0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743896753; cv=none; b=Uw3uFsCjZdrcvCzDvqJAo1BnsvTd+x2GIgdgutJojkANUlml7gVJcWgRyjtid2PblyEOXqEXVwE8L+ZxCqKWecAFsBKa63aoe/tNBOWDtfXvAOrANQgBl8q2EN7FU2hxi6J9GuxdB9mndCSlmMditNlIP5wXYH32b4XIeidK/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743896753; c=relaxed/simple;
	bh=KDdngCgnIx4XK5yKgqyVnjPC9FOad5S55vz8J4VerK8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmFNioNiuczywb8XPLsZn2bwsB/p6G9HJPA4Bvg6NSC8bA5ketNQMAwz3cYxSEQ6q2nQMv7M08pu2n5VCS5QEaXwk57fNoHnf8TXYCzXVs57UmV0BPqKZbcDgEYARb81v0Mf3bqNiQZns/g9nCp2A0urZuo6bvPkhcymqzmojBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPIirdaJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPIirdaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743896751; x=1775432751;
  h=date:from:to:subject:message-id:mime-version;
  bh=KDdngCgnIx4XK5yKgqyVnjPC9FOad5S55vz8J4VerK8=;
  b=PPIirdaJIhktG+OBdpoW1euS4Q7sNSEAxio1jb1wV2Cgw180kbozqfpF
   HZTqPOS+TpbDqdYoFwii1F3dPp7GU+n82yGVT7g9XhXzancPVkfv7WqhK
   E86QPkgahNA6cH1iPh6uohKoWHAuWBBnHiMFiSiYh6l1RK3mVmABA7ZKY
   e3tPsbxax+Xtjc8174LjkcVIiUUnO5D0vdIAn0ZTddWdNrBaTKKuCDvp9
   dEkJlsX1Wa3qehRZQZJzzmHV4E7tAMaNXoiW/yewmCMF48f6CwPkFkAqm
   BFcF7VWuTQaB1/GsYmS1zquNHpsDDctzDnM9m5M/DQ3ucE30xTV3YDuop
   A==;
X-CSE-ConnectionGUID: 1jZ5qkCVSQGcAL+QuUzhwg==
X-CSE-MsgGUID: 1mCSl0rNQoKiMIKr32VUFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="45480960"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="45480960"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 16:45:50 -0700
X-CSE-ConnectionGUID: 9P/WaAs5Tai/Ulri4icJjA==
X-CSE-MsgGUID: +vbqbQ4HRRWU81eWY703KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="127572307"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 16:45:51 -0700
Date: Sat, 5 Apr 2025 16:45:48 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: lockdep warnings from upstream build
Message-ID: <Z_HArDcN1zdd9wdt@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Several email threads on this over the past few days, but none
seem to be getting much attention:

https://lore.kernel.org/all/?q=%22%28%26q-%3Eelevator_lock%29%7B%2B.%2B.%7D-%7B4%3A4%7D%2C+at%3A+elv_iosched_store%22

Since tomorrow is "-rc1" day I thought I'd add my lockdep splat to the
mix.

System is a 2-socket Icelake. Kernel built from:

f4d2ef48250a ("Merge tag 'kbuild-v6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")

Though I saw the same thing a few days ago, so the problem was
introduced much earlier in the merge window.

-Tony


[   30.011513] systemd-journald[2006]: Received client request to flush runtime journal.

[   31.046613] ======================================================
[   31.053649] WARNING: possible circular locking dependency detected
[   31.060631] 6.14.0+ #64 Not tainted
[   31.064914] ------------------------------------------------------
[   31.071620] (udev-worker)/2100 is trying to acquire lock:
[   31.077547] ff2f0c75591e74d8 (&q->elevator_lock){+.+.}-{4:4}, at: elv_iosched_store+0xe9/0x260
[   31.086566] 
               but task is already holding lock:
[   31.093170] ff2f0c75591e6fa8 (&q->q_usage_counter(io)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x12/0x20
[   31.103652] 
               which lock already depends on the new lock.

[   31.112950] 
               the existing dependency chain (in reverse order) is:
[   31.121170] 
               -> #2 (&q->q_usage_counter(io)){++++}-{0:0}:
[   31.128715]        blk_alloc_queue+0x30e/0x350
[   31.133637]        blk_mq_alloc_queue+0x62/0xd0
[   31.138549]        scsi_alloc_sdev+0x280/0x3c0
[   31.143462]        scsi_probe_and_add_lun+0x223/0x470
[   31.148887]        __scsi_add_device+0x10d/0x120
[   31.153955]        ata_scsi_scan_host+0x9c/0x1b0
[   31.159043]        async_run_entry_fn+0x31/0x130
[   31.164116]        process_one_work+0x22f/0x5b0
[   31.168998]        worker_thread+0x1cc/0x3c0
[   31.173690]        kthread+0xfc/0x240
[   31.177775]        ret_from_fork+0x31/0x50
[   31.182210]        ret_from_fork_asm+0x1a/0x30
[   31.187052] 
               -> #1 (fs_reclaim){+.+.}-{0:0}:
[   31.193487]        fs_reclaim_acquire+0x9d/0xd0
[   31.198410]        kmem_cache_alloc_noprof+0x51/0x430
[   31.203833]        __kernfs_new_node+0x5d/0x290
[   31.208663]        kernfs_new_node+0x68/0xa0
[   31.213332]        kernfs_create_dir_ns+0x2b/0x90
[   31.218325]        sysfs_create_dir_ns+0x83/0xe0
[   31.223229]        kobject_add_internal+0xba/0x250
[   31.228342]        kobject_add+0x95/0xc0
[   31.232583]        elv_register_queue+0x46/0xd0
[   31.237373]        blk_register_queue+0x18c/0x210
[   31.242375]        add_disk_fwnode+0x29c/0x480
[   31.247110]        sd_probe+0x378/0x570
[   31.251239]        really_probe+0xdb/0x340
[   31.255623]        __driver_probe_device+0x78/0x110
[   31.260734]        driver_probe_device+0x1f/0xa0
[   31.265581]        __device_attach_driver+0x89/0x110
[   31.270835]        bus_for_each_drv+0x97/0xf0
[   31.275468]        __device_attach_async_helper+0xa3/0xf0
[   31.281166]        async_run_entry_fn+0x31/0x130
[   31.286013]        process_one_work+0x22f/0x5b0
[   31.290760]        worker_thread+0x1cc/0x3c0
[   31.295264]        kthread+0xfc/0x240
[   31.299116]        ret_from_fork+0x31/0x50
[   31.303403]        ret_from_fork_asm+0x1a/0x30
[   31.308033] 
               -> #0 (&q->elevator_lock){+.+.}-{4:4}:
[   31.314659]        __lock_acquire+0x1510/0x2630
[   31.319361]        lock_acquire+0xc9/0x2d0
[   31.323629]        __mutex_lock+0xca/0xe50
[   31.327895]        elv_iosched_store+0xe9/0x260
[   31.332591]        kernfs_fop_write_iter+0x165/0x240
[   31.337723]        vfs_write+0x2b0/0x540
[   31.341808]        ksys_write+0x71/0xf0
[   31.345806]        do_syscall_64+0x95/0x180
[   31.350156]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   31.355896] 
               other info that might help us debug this:

[   31.364380] Chain exists of:
                 &q->elevator_lock --> fs_reclaim --> &q->q_usage_counter(io)

[   31.376096]  Possible unsafe locking scenario:

[   31.382367]        CPU0                    CPU1
[   31.387083]        ----                    ----
[   31.391795]   lock(&q->q_usage_counter(io));
[   31.396254]                                lock(fs_reclaim);
[   31.402101]                                lock(&q->q_usage_counter(io));
[   31.409079]   lock(&q->elevator_lock);
[   31.413020] 
                *** DEADLOCK ***

[   31.419474] 5 locks held by (udev-worker)/2100:
[   31.424194]  #0: ff2f0c7cd7fb7420 (sb_writers#4){.+.+}-{0:0}, at: ksys_write+0x71/0xf0
[   31.432312]  #1: ff2f0c7558671488 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x11e/0x240
[   31.441561]  #2: ff2f0c7551161138 (kn->active#87){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x127/0x240
[   31.450896]  #3: ff2f0c75591e6fa8 (&q->q_usage_counter(io)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x12/0x20
[   31.461623]  #4: ff2f0c75591e6fe0 (&q->q_usage_counter(queue)){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x12/0x20
[   31.472618] 
               stack backtrace:
[   31.477405] CPU: 0 UID: 0 PID: 2100 Comm: (udev-worker) Not tainted 6.14.0+ #64 PREEMPT(voluntary) 
[   31.477409] Hardware name: Intel Corporation WHITLEY/WHITLEY, BIOS WLYDCRB1.SYS.0021.P06.2104260458 04/26/2021
[   31.477412] Call Trace:
[   31.477416]  <TASK>
[   31.477420]  dump_stack_lvl+0x6e/0xa0
[   31.477431]  print_circular_bug.cold+0x178/0x1be
[   31.477437]  check_noncircular+0x146/0x160
[   31.477443]  __lock_acquire+0x1510/0x2630
[   31.477449]  lock_acquire+0xc9/0x2d0
[   31.477452]  ? elv_iosched_store+0xe9/0x260
[   31.477460]  __mutex_lock+0xca/0xe50
[   31.477466]  ? elv_iosched_store+0xe9/0x260
[   31.477470]  ? elv_iosched_store+0xe9/0x260
[   31.477475]  ? elv_iosched_store+0xe9/0x260
[   31.477478]  elv_iosched_store+0xe9/0x260
[   31.477483]  kernfs_fop_write_iter+0x165/0x240
[   31.477487]  vfs_write+0x2b0/0x540
[   31.477494]  ksys_write+0x71/0xf0
[   31.477497]  do_syscall_64+0x95/0x180
[   31.477502]  ? do_sys_openat2+0xa4/0xe0
[   31.477505]  ? kmem_cache_free+0x13b/0x460
[   31.477512]  ? __lock_acquire+0x45e/0x2630
[   31.477515]  ? lockdep_hardirqs_on_prepare+0xdb/0x190
[   31.477517]  ? syscall_exit_to_user_mode+0x97/0x290
[   31.477521]  ? do_syscall_64+0xa1/0x180
[   31.477524]  ? lock_acquire+0xc9/0x2d0
[   31.477526]  ? ktime_get_coarse_real_ts64+0x15/0x70
[   31.477534]  ? find_held_lock+0x2b/0x80
[   31.477536]  ? ktime_get_coarse_real_ts64+0x15/0x70
[   31.477539]  ? file_has_perm+0xa8/0xf0
[   31.477545]  ? syscall_exit_to_user_mode_prepare+0x21b/0x250
[   31.477549]  ? lockdep_hardirqs_on_prepare+0xdb/0x190
[   31.477552]  ? syscall_exit_to_user_mode+0x97/0x290
[   31.477555]  ? do_syscall_64+0xa1/0x180
[   31.477558]  ? ktime_get+0x41/0x100
[   31.477561]  ? clockevents_program_event+0x9f/0x110
[   31.477568]  ? sched_clock+0x10/0x30
[   31.477570]  ? sched_clock_cpu+0xf/0x1f0
[   31.477575]  ? irqtime_account_irq+0x3e/0xc0
[   31.477580]  ? clear_bhb_loop+0x15/0x70
[   31.477583]  ? clear_bhb_loop+0x15/0x70
[   31.477585]  ? clear_bhb_loop+0x15/0x70
[   31.477587]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   31.477591] RIP: 0033:0x7f5934cf4484
[   31.477596] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 80 3d 45 9c 10 00 00 74 13 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
[   31.477598] RSP: 002b:00007ffd86f47198 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
[   31.477602] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f5934cf4484
[   31.477604] RDX: 0000000000000003 RSI: 00007ffd86f474a0 RDI: 0000000000000033
[   31.477605] RBP: 00007ffd86f471c0 R08: 00007f5934df51c8 R09: 00007ffd86f47270
[   31.477607] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000003
[   31.477608] R13: 00007ffd86f474a0 R14: 0000562ed0666260 R15: 00007f5934df4e80
[   31.477612]  </TASK>
