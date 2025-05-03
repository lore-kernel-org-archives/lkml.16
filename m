Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F38C2FD
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 00:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746233646; cv=none; b=uJ83AM4g0THHz5uAHWyu3qh4IOoqb3j7KIQzGMUOlvBpQKtZALX1Jqg8/c3RN+CUHYYaqRyQxZTQNR9CC30n8jTeuJFIaCru1VtPQxPzqNSvwAcM02BXx7p0cQ7OgeJPOr4W3ZzS1I6HeJ4BSNDTq2Scjs8a+9oJDL6nX6Je/OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746233646; c=relaxed/simple;
	bh=Qb2RDhUatXXh5yPww2v1lXx1iWKda5FnxaPPwtA2DDA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=emIsRDfp5sqKnWfu7PFtAn6Dqs95N+WAepCmYxKOTwNe9Cr4yqaN39VqKA1IVulra2T8Kv7Gx/MP3Idd/QgWcgcPVE5XhgKNP4KJh+aETp5akhqU8llYaaxVddrHSmKrmF9lEYgXVxh9y13ZBAMNNkqnGSIAaMV16/Z6bfb3hYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d9099f9056so28937055ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 17:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746233643; x=1746838443;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTCPyeJUrKDdgjUy+FHlrek8IZ1pTDa+QgAzZQ6x670=;
        b=dybNzh4OeO3KhkbbTw3a43hr+m8UeCXv7cdQXpBFQOSzhMaCDC1T9TNj5x0sh51PI3
         11v6oFKaQR6BqHtfoHTFPD8DaYErylDNZqQaDSFXfasVns6haVnnxm7wcT332rYUlQ17
         o6fNlL/oLQYXpmp4ZVBMz+KqKlLe8UrEjIMAAhhR1i5YW2q+dsN2xO73jWXPEwY7X19/
         DJvSMTMFxZGm5F9PjvLEPmc2FRdE1+rLuVzEb41xiCI+7AWjD4KL14gAdjUetkr5cl33
         q1iAqx7ItzYdQFGRUDrula3dDMJgl1kbdF+a9eqOJjWPML9Oqjq+oXBiu5KgeoFfDMM+
         6Knw==
X-Forwarded-Encrypted: i=1; AJvYcCXbp5DGfkKB6ZO9Dn+aJVJehPxmY2g/a7kDrxYfi4VBt3D6isydFHnSTXZqrV/ze+EJYJ7NUiJrwHcyZLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAwM7YrzGQb8xorU8RJIvaTpA8ax/hm8fl+W4B0B+RP7uo8v75
	bBY7oYUZu34yPs0ebE8JEB6Xcy/ImIFUgpfpmGLxdUal0K9DuTFMEAaCcnxNViu4L0M82XTzN1w
	/cRZ1pY2yOWT0lOT1jGoOLAhVD0YNg0SdY0PlZSkQUhaY8mSONeGuCC8=
X-Google-Smtp-Source: AGHT+IHcZGHGaIBQDqt24LFp3aZUrjZIJ2lV9Pp27PO5AzjjcDmbjfZQRmisM1xDJ0T4dned9HQoWW4/rvFXH8R5vzfySVWhvABE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18c6:b0:3d9:3adb:e589 with SMTP id
 e9e14a558f8ab-3da56903330mr11079025ab.4.1746233643572; Fri, 02 May 2025
 17:54:03 -0700 (PDT)
Date: Fri, 02 May 2025 17:54:03 -0700
In-Reply-To: <20250503003241.1433-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6815692b.a70a0220.254cdc.000e.GAE@google.com>
Subject: Re: [syzbot] [mm?] BUG: Bad page state in page_cache_ra_order
From: syzbot <syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

page)
[    2.038932][    T0] Inode-cache hash table entries: 262144 (order: 9, 20=
97152 bytes, vmalloc hugepage)
[    2.045289][    T0] Mount-cache hash table entries: 8192 (order: 4, 6553=
6 bytes, vmalloc)
[    2.047511][    T0] Mountpoint-cache hash table entries: 8192 (order: 4,=
 65536 bytes, vmalloc)
[    2.058085][    T0] Running RCU synchronous self tests
[    2.060824][    T0] Running RCU synchronous self tests
[    2.065914][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.60GHz (famil=
y: 0x6, model: 0x6a, stepping: 0x6)
[    2.067336][    T1] Performance Events: unsupported CPU family 6 model 1=
06 no PMU driver, software events only.
[    2.067553][    T1] signal: max sigframe size: 3632
[    2.071766][    T1] rcu: Hierarchical SRCU implementation.
[    2.075644][    T1] rcu: 	Max phase no-delay instances is 1000.
[    2.078665][    T1] Timer migration: 2 hierarchy levels; 8 children per =
group; 1 crossnode level
[    2.092923][    T1] NMI watchdog: Perf NMI watchdog permanently disabled
[    2.107441][    T1] smp: Bringing up secondary CPUs ...
[    2.113280][    T1] smpboot: x86: Booting SMP configuration:
[    2.116314][    T1] .... node  #0, CPUs:      #2
[    2.127675][    T1]  #1 #3
[    2.137504][    T1] smp: Brought up 2 nodes, 4 CPUs
[    2.140134][    T1] smpboot: Total of 4 processors activated (20800.19 B=
ogoMIPS)
[    2.146262][    T1] Memory: 2933020K/4193772K available (171030K kernel =
code, 41416K rwdata, 39624K rodata, 27132K init, 120336K bss, 1157332K rese=
rved, 0K cma-reserved)
[    2.148752][    T1] devtmpfs: initialized
[    2.151771][    T1] x86/mm: Memory block size: 128MB
[    2.191210][    T1] Running RCU synchronous self tests
[    2.194030][    T1] Running RCU synchronous self tests
[    2.197772][    T1] Running RCU Tasks wait API self tests
[    2.317559][    T1] Running RCU Tasks Trace wait API self tests
[    2.377536][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 19112604462750000 ns
[    2.387361][    T1] posixtimers hash table entries: 4096 (order: 6, 2949=
12 bytes, vmalloc)
[    2.398618][    T1] futex hash table entries: 2048 (order: 6, 262144 byt=
es, vmalloc)
[    2.411226][    T1] PM: RTC time: 00:43:25, date: 2025-05-03
[    2.434489][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    2.447374][    T1] audit: initializing netlink subsys (disabled)
[    2.447904][   T40] audit: type=3D2000 audit(1746233006.122:1): state=3D=
initialized audit_enabled=3D0 res=3D1
[    2.452195][    T1] thermal_sys: Registered thermal governor 'step_wise'
[    2.457397][   T39] Callback from call_rcu_tasks_trace() invoked.
[    2.464513][    T1] cpuidle: using governor menu
[    2.467870][    T1] NET: Registered PF_QIPCRTR protocol family
[    2.481944][    T1] dca service started, version 1.12.1
[    2.486211][    T1] PCI: ECAM [mem 0xb0000000-0xbfffffff] (base 0xb00000=
00) for domain 0000 [bus 00-ff]
[    2.487421][    T1] PCI: ECAM [mem 0xb0000000-0xbfffffff] reserved as E8=
20 entry
[    2.557442][   T38] Callback from call_rcu_tasks() invoked.
[    2.594084][    T1] PCI: Using configuration type 1 for base access
[    2.608729][    T1] HugeTLB: allocation took 0ms with hugepage_allocatio=
n_threads=3D1
[    2.613153][    T1] HugeTLB: registered 1.00 GiB page size, pre-allocate=
d 0 pages
[    2.613153][    T1] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 G=
iB page
[    2.617371][    T1] HugeTLB: registered 2.00 MiB page size, pre-allocate=
d 0 pages
[    2.622304][    T1] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB =
page
[    2.648450][    T1] cryptd: max_cpu_qlen set to 1000
[    2.657359][    T1] raid6: skipped pq benchmark and selected avx512x4
[    2.657359][    T1] raid6: using avx512x2 recovery algorithm
[    2.659260][    T1] ACPI: Added _OSI(Module Device)
[    2.662468][    T1] ACPI: Added _OSI(Processor Device)
[    2.665870][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
[    2.677416][    T1] ACPI: Added _OSI(Processor Aggregator Device)
[    2.790948][    T1] ACPI: 2 ACPI AML tables successfully acquired and lo=
aded
[    2.844227][    T1] ACPI: Interpreter enabled
[    2.846912][    T1] ACPI: PM: (supports S0 S3 S4 S5)
[    2.847374][    T1] ACPI: Using IOAPIC for interrupt routing
[    2.850856][    T1] PCI: Using host bridge windows from ACPI; if necessa=
ry, use "pci=3Dnocrs" and report a bug
[    2.856311][    T1] PCI: Using E820 reservations for host bridge windows
[    2.861318][    T1] ACPI: Enabled 4 GPEs in block 00 to 3F
[    2.904041][    T1]  non-paged memory
[    2.906435][    T1] list_del corruption. next->prev should be ffffea0000=
80d610, but was 000000000080d610. (next=3Dffffea000080d750)
[    2.907336][    T1] ------------[ cut here ]------------
[    2.907336][    T1] kernel BUG at lib/list_debug.c:65!
[    2.907336][    T1] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
[    2.907336][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.1=
5.0-rc4-syzkaller-gb6a218ff8b88-dirty #0 PREEMPT(full)=20
[    2.907336][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[    2.907336][    T1] RIP: 0010:__list_del_entry_valid_or_report+0x1b3/0x2=
00
[    2.907336][    T1] Code: 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 0=
0 75 4b 49 8b 54 24 08 4c 89 e1 48 89 de 48 c7 c7 c0 87 f4 8b e8 7e 49 c4 f=
c 90 <0f> 0b e8 a6 79 4a fd e9 6b fe ff ff 48 89 df e8 99 79 4a fd e9 7d
[    2.907336][    T1] RSP: 0000:ffffc90000046da0 EFLAGS: 00010082
[    2.907336][    T1] RAX: 000000000000006d RBX: ffffea000080d610 RCX: fff=
fffff819a90e9
[    2.907336][    T1] RDX: 0000000000000000 RSI: ffffffff819b0f76 RDI: 000=
0000000000005
[    2.907336][    T1] RBP: ffffea000080d758 R08: 0000000000000005 R09: 000=
0000000000000
[    2.907336][    T1] R10: 0000000080000002 R11: 0000000000000000 R12: fff=
fea000080d750
[    2.907336][    T1] R13: ffff88801b49b600 R14: ffffea000080d740 R15: fff=
fea000080d600
[    2.907336][    T1] FS:  0000000000000000(0000) GS:ffff8880d6ae2000(0000=
) knlGS:0000000000000000
[    2.907336][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.907336][    T1] CR2: 0000000000000000 CR3: 000000000e180000 CR4: 000=
0000000350ef0
[    2.907336][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    2.907336][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    2.907336][    T1] Call Trace:
[    2.907336][    T1]  <TASK>
[    2.907336][    T1]  get_partial_node.part.0+0x8f/0x360
[    2.907336][    T1]  ___slab_alloc+0x673/0x1940
[    2.907336][    T1]  ? acpi_ut_create_internal_object_dbg+0x78/0x3f0
[    2.907336][    T1]  ? new_slab+0x2e1/0x340
[    2.907336][    T1]  ? acpi_ut_create_internal_object_dbg+0x78/0x3f0
[    2.907336][    T1]  ? __slab_alloc.constprop.0+0x56/0xb0
[    2.907336][    T1]  __slab_alloc.constprop.0+0x56/0xb0
[    2.907336][    T1]  kmem_cache_alloc_noprof+0xef/0x3b0
[    2.907336][    T1]  ? acpi_ut_update_ref_count.part.0+0x149/0xd70
[    2.907336][    T1]  ? acpi_ut_create_internal_object_dbg+0x78/0x3f0
[    2.907336][    T1]  acpi_ut_create_internal_object_dbg+0x78/0x3f0
[    2.907336][    T1]  acpi_ds_create_operand+0x30b/0x880
[    2.907336][    T1]  ? __pfx_acpi_ds_create_operand+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_ut_update_object_reference+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_ut_update_object_reference+0x10/0x10
[    2.907336][    T1]  acpi_ds_eval_data_object_operands+0x108/0x540
[    2.907336][    T1]  ? __pfx_acpi_ds_eval_data_object_operands+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_ds_create_node+0x10/0x10
[    2.907336][    T1]  ? __sanitizer_cov_trace_switch+0x54/0x90
[    2.907336][    T1]  acpi_ds_exec_end_op+0xde1/0x1460
[    2.907336][    T1]  ? __pfx_acpi_ds_exec_end_op+0x10/0x10
[    2.907336][    T1]  acpi_ps_parse_loop+0x425/0x1d00
[    2.907336][    T1]  ? __pfx_acpi_ps_parse_loop+0x10/0x10
[    2.907336][    T1]  ? acpi_ns_get_normalized_pathname+0x97/0xd0
[    2.907336][    T1]  ? acpi_ds_call_control_method+0x91/0x700
[    2.907336][    T1]  acpi_ps_parse_aml+0x3c1/0xcb0
[    2.907336][    T1]  acpi_ps_execute_method+0x55a/0xb30
[    2.907336][    T1]  ? acpi_ut_acquire_mutex+0x125/0x1d0
[    2.907336][    T1]  acpi_ns_evaluate+0x76c/0xca0
[    2.907336][    T1]  ? kasan_save_track+0x14/0x30
[    2.907336][    T1]  acpi_ut_evaluate_object+0xda/0x4a0
[    2.907336][    T1]  acpi_rs_get_method_data+0x84/0xf0
[    2.907336][    T1]  ? __pfx_acpi_rs_get_method_data+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_dev_process_resource+0x10/0x10
[    2.907336][    T1]  acpi_walk_resources+0x15b/0x1e0
[    2.907336][    T1]  ? __pfx_acpi_walk_resources+0x10/0x10
[    2.907336][    T1]  ? acpi_get_handle+0x185/0x270
[    2.907336][    T1]  acpi_dev_get_resources+0x1d2/0x260
[    2.907336][    T1]  ? __pfx_acpi_check_serial_bus_slave+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_dev_get_resources+0x10/0x10
[    2.907336][    T1]  ? __pfx___acpi_match_device.constprop.0+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_check_serial_bus_slave+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_has_method+0x10/0x10
[    2.907336][    T1]  ? strstr+0x109/0x170
[    2.907336][    T1]  acpi_init_device_object+0xba4/0x1970
[    2.907336][    T1]  ? __pfx_acpi_init_device_object+0x10/0x10
[    2.907336][    T1]  acpi_add_single_object+0xea/0x1b80
[    2.907336][    T1]  ? acpi_ns_get_node+0x5d/0x70
[    2.907336][    T1]  ? __pfx_acpi_add_single_object+0x10/0x10
[    2.907336][    T1]  ? acpi_has_method+0x85/0xc0
[    2.907336][    T1]  ? __pfx_acpi_has_method+0x10/0x10
[    2.907336][    T1]  ? acpi_os_signal_semaphore+0x76/0xa0
[    2.907336][    T1]  ? acpi_ut_release_mutex+0xe8/0x190
[    2.907336][    T1]  acpi_bus_check_add+0x23f/0x910
[    2.907336][    T1]  ? __pfx_acpi_bus_check_add+0x10/0x10
[    2.907336][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    2.907336][    T1]  ? lockdep_hardirqs_on+0x7c/0x110
[    2.907336][    T1]  ? up+0xcb/0x140
[    2.907336][    T1]  ? __pfx_up+0x10/0x10
[    2.907336][    T1]  ? _raw_spin_unlock_irqrestore+0x52/0x80
[    2.907336][    T1]  ? acpi_os_signal_semaphore+0x76/0xa0
[    2.907336][    T1]  acpi_ns_walk_namespace+0x405/0x5b0
[    2.907336][    T1]  ? __pfx_acpi_bus_check_add_1+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_bus_check_add_1+0x10/0x10
[    2.907336][    T1]  acpi_walk_namespace+0x110/0x130
[    2.907336][    T1]  acpi_bus_scan+0x3e8/0x4a0
[    2.907336][    T1]  ? __pfx_acpi_bus_scan+0x10/0x10
[    2.907336][    T1]  ? acpi_update_all_gpes+0xeb/0x240
[    2.907336][    T1]  ? __pfx_acpi_update_all_gpes+0x10/0x10
[    2.907336][    T1]  ? acpi_ut_release_mutex+0xe8/0x190
[    2.907336][    T1]  acpi_scan_init+0x244/0x760
[    2.907336][    T1]  ? __pfx_acpi_scan_init+0x10/0x10
[    2.907336][    T1]  ? internal_create_groups+0x11a/0x150
[    2.907336][    T1]  ? bus_register+0x123/0x6a0
[    2.907336][    T1]  acpi_init+0x426/0xb80
[    2.907336][    T1]  ? __pfx_acpi_init+0x10/0x10
[    2.907336][    T1]  ? _raw_spin_unlock_irqrestore+0x3b/0x80
[    2.907336][    T1]  ? add_device_randomness+0xb7/0xf0
[    2.907336][    T1]  ? __pfx_fbmem_init+0x10/0x10
[    2.907336][    T1]  ? __pfx_acpi_init+0x10/0x10
[    2.907336][    T1]  do_one_initcall+0x120/0x6e0
[    2.907336][    T1]  ? __pfx_do_one_initcall+0x10/0x10
[    2.907336][    T1]  ? trace_kmalloc+0x2b/0xd0
[    2.907336][    T1]  ? __kmalloc_noprof+0x242/0x510
[    2.907336][    T1]  kernel_init_freeable+0x5c2/0x900
[    2.907336][    T1]  ? __pfx_kernel_init+0x10/0x10
[    2.907336][    T1]  kernel_init+0x1c/0x2b0
[    2.907336][    T1]  ? __pfx_kernel_init+0x10/0x10
[    2.907336][    T1]  ret_from_fork+0x45/0x80
[    2.907336][    T1]  ? __pfx_kernel_init+0x10/0x10
[    2.907336][    T1]  ret_from_fork_asm+0x1a/0x30
[    2.907336][    T1]  </TASK>
[    2.907336][    T1] Modules linked in:
[    2.907336][    T1] ---[ end trace 0000000000000000 ]---
[    2.907336][    T1] RIP: 0010:__list_del_entry_valid_or_report+0x1b3/0x2=
00
[    2.907336][    T1] Code: 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 0=
0 75 4b 49 8b 54 24 08 4c 89 e1 48 89 de 48 c7 c7 c0 87 f4 8b e8 7e 49 c4 f=
c 90 <0f> 0b e8 a6 79 4a fd e9 6b fe ff ff 48 89 df e8 99 79 4a fd e9 7d
[    2.907336][    T1] RSP: 0000:ffffc90000046da0 EFLAGS: 00010082
[    2.907336][    T1] RAX: 000000000000006d RBX: ffffea000080d610 RCX: fff=
fffff819a90e9
[    2.907336][    T1] RDX: 0000000000000000 RSI: ffffffff819b0f76 RDI: 000=
0000000000005
[    2.907336][    T1] RBP: ffffea000080d758 R08: 0000000000000005 R09: 000=
0000000000000
[    2.907336][    T1] R10: 0000000080000002 R11: 0000000000000000 R12: fff=
fea000080d750
[    2.907336][    T1] R13: ffff88801b49b600 R14: ffffea000080d740 R15: fff=
fea000080d600
[    2.907336][    T1] FS:  0000000000000000(0000) GS:ffff8880d6ae2000(0000=
) knlGS:0000000000000000
[    2.907336][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.907336][    T1] CR2: 0000000000000000 CR3: 000000000e180000 CR4: 000=
0000000350ef0
[    2.907336][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[    2.907336][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[    2.907336][    T1] Kernel panic - not syncing: Fatal exception
[    2.907336][    T1] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-=
go1.23.7.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0=
.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.23.7'
GODEBUG=3D''
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build1629730015=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at c6b4fb399
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dc6b4fb399236b655a39701fd51c33522caa06811 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250425-123509'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"c6b4fb399236b655a39701fd51c33522ca=
a06811\"
/usr/bin/ld: /tmp/cciuSsoo.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D111c539b980000


Tested on:

commit:         b6a218ff Merge tag 'pm-6.15-rc5' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dca17f2d2ba38f7a=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D7b3842775c9ce6b69=
efc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1106f7745800=
00

