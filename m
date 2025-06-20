Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C27224AE9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402625; cv=none; b=pn8VToeOHtl9mWn7ryqzzMy2YI6Kn2A/ehnittk/IfcnWHxg2GeoEuo3ynQUdDP0cjAneHFzm46EkHdYIUBrjkWtoL9i6QXFlLwpgIIhV5TTt8ucxVTEfdFmaFn0uyc6/Bbj9fNI8BMqzwmNMyXfYWvyn4pu5lGyKzpj34Eiy9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402625; c=relaxed/simple;
	bh=MfrkO8sZ+UaVwbn5ZXaghuHw/ZTeNyRM9GiEfjP+z/k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cOYiW0Buk4aHSFxj0pgDqD1URFL2ywCU368N7yOrp3tUuGdwTQEbUOnywRrJcoxZeIUDEi9pHn35MI/sh364PpzdfiTlXkUZVZvdAQ8WC03bQf1d8hNDtaY/vtEdk0oMxjV8kjezRy5T7pUyjuQYKFZlJQ36PuD4Pc+C/r9JITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc9ee4794so21893235ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402622; x=1751007422;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YigM5IV3V+6m8woRFsujwe6/Uz5xRi9ZvahghLnDI6o=;
        b=RkAYAM7OIuat6Zly/Qw6Aq1gf6/62zCntLYq5ZqVb074TUgd1O74gCiLnTnZKkBXr9
         H9S2La2goBNZpkDeS87cBZVTMatQ9JkTTeEEek52sRAJauL6KOI4O0tx46AIbBX8S3Yq
         w3k83S7IbLS2xBOHiAQWo0WpLBY862JmHz+WU23v9kxEoIF7i5/ezL2UIp3M7M8KQmAf
         GUCxQfgIhJU6h57PHIM9stbYnqVM1+LZJ78JfMOUWmE+7wnEe0198IllQ8gj+uNRjQAD
         Sz19ZY4MBvPdwWBFx8x/1mx09kcp9AKDBJ85WwXuQr+S5CdZH7y+WnRYfj9nFPdBexcF
         QGcg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/r0j6H2nQmfsYP/lrKPL95w8QL8SIu+oWRzySszv5DDWrHE+hlmQAIiyoUc+jPzX41QWp3Nygoy9N0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqJYe62c2YjTgpZ0kz+AaLXfvWAMwVRGKOpRwtll2bdFQSfJS
	oUiqWtF3dtj529q9mw3f2gflvVhLaoMatorAtanY0AkaMklMFifnrVyJIZ92u0RrTh5TQ9GR56+
	v+936dUJ2HvikR+So4TUO/Udgdw1Jq5/s7a8XTVaVZGOK1Vvaz5E1gNS9o0Q=
X-Google-Smtp-Source: AGHT+IGwo93yHo0sVq1otB4W/Ten92tk+69ojlEPZxjx0o8Sn6HCQsR99TqXXBwoKWFSYny8F9shC4e+q+a413WaaAqvrXV82+ek
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda4:0:b0:3dc:7f17:72e6 with SMTP id
 e9e14a558f8ab-3de38c2ee00mr19231315ab.5.1750402622355; Thu, 19 Jun 2025
 23:57:02 -0700 (PDT)
Date: Thu, 19 Jun 2025 23:57:02 -0700
In-Reply-To: <20250620055500.1295-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6855063e.a00a0220.137b3.0037.GAE@google.com>
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
From: syzbot <syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

596589][    T1] l2tp_eth: L2TP ethernet pseudowire support (L2TPv3)
[   27.603669][    T1] l2tp_ip6: L2TP IP encapsulation support for IPv6 (L2=
TPv3)
[   27.612030][    T1] NET: Registered PF_PHONET protocol family
[   27.619226][    T1] 8021q: 802.1Q VLAN Support v1.8
[   27.624904][    T1] sctp: Hash tables configured (bind 32/56)
[   27.633622][    T1] NET: Registered PF_RDS protocol family
[   27.640981][    T1] Registered RDS/infiniband transport
[   27.647953][    T1] Registered RDS/tcp transport
[   27.653173][    T1] tipc: Activated (version 2.0.0)
[   27.659306][    T1] NET: Registered PF_TIPC protocol family
[   27.667111][    T1] tipc: Started in single node mode
[   27.673627][    T1] NET: Registered PF_SMC protocol family
[   27.679893][    T1] 9pnet: Installing 9P2000 support
[   27.686223][    T1] NET: Registered PF_CAIF protocol family
[   27.698111][    T1] NET: Registered PF_IEEE802154 protocol family
[   27.705116][    T1] Key type dns_resolver registered
[   27.710323][    T1] Key type ceph registered
[   27.715773][    T1] libceph: loaded (mon/osd proto 15/24)
[   27.724864][    T1] batman_adv: B.A.T.M.A.N. advanced 2025.2 (compatibil=
ity version 15) loaded
[   27.735532][    T1] openvswitch: Open vSwitch switching datapath
[   27.745784][    T1] NET: Registered PF_VSOCK protocol family
[   27.752455][    T1] mpls_gso: MPLS GSO support
[   27.791829][    T1] IPI shorthand broadcast: enabled
[   28.853017][ T4368] kworker/u8:5 (4368) used greatest stack depth: 25544=
 bytes left
[   29.545777][    T1] sched_clock: Marking stable (29480023419, 60586956)-=
>(29548520009, -7909634)
[   29.559295][    T1] registered taskstats version 1
[   29.587631][    T1] Loading compiled-in X.509 certificates
[   29.629727][    T1] Loaded X.509 cert 'Build time autogenerated kernel k=
ey: 9544ed9c381b9ee60e03c33019a0775f61856505'
[   30.041269][    T1] zswap: loaded using pool 842/zsmalloc
[   30.050869][    T1] Demotion targets for Node 0: null
[   30.056261][    T1] Demotion targets for Node 1: null
[   30.061859][    T1] debug_vm_pgtable: [debug_vm_pgtable         ]: Valid=
ating architecture page table helpers
[   33.228886][    T1] Key type .fscrypt registered
[   33.233756][    T1] Key type fscrypt-provisioning registered
[   33.249155][    T1] kAFS: Red Hat AFS client v0.1 registering.
[   33.284299][    T1] Btrfs loaded, assert=3Don, ref-verify=3Don, zoned=3D=
yes, fsverity=3Dyes
[   33.293561][    T1] Key type big_key registered
[   33.298857][    T1] Key type encrypted registered
[   33.304175][    T1] AppArmor: AppArmor sha256 policy hashing enabled
[   33.311287][    T1] ima: No TPM chip found, activating TPM-bypass!
[   33.317886][    T1] Loading compiled-in module X.509 certificates
[   33.356852][    T1] Loaded X.509 cert 'Build time autogenerated kernel k=
ey: 9544ed9c381b9ee60e03c33019a0775f61856505'
[   33.367969][    T1] ima: Allocated hash algorithm: sha256
[   33.373914][    T1] ima: No architecture policies found
[   33.379932][    T1] evm: Initialising EVM extended attributes:
[   33.385960][    T1] evm: security.selinux (disabled)
[   33.391455][    T1] evm: security.SMACK64 (disabled)
[   33.396585][    T1] evm: security.SMACK64EXEC (disabled)
[   33.402069][    T1] evm: security.SMACK64TRANSMUTE (disabled)
[   33.408143][    T1] evm: security.SMACK64MMAP (disabled)
[   33.413994][    T1] evm: security.apparmor
[   33.418456][    T1] evm: security.ima
[   33.422434][    T1] evm: security.capability
[   33.427069][    T1] evm: HMAC attrs: 0x1
[   33.434168][    T1] PM:   Magic number: 13:923:822
[   33.439967][    T1] video4linux v4l-touch0: hash matches
[   33.446106][    T1] block loop10: hash matches
[   33.451222][    T1] tty ptyt2: hash matches
[   33.455932][    T1] netconsole: network logging started
[   33.462668][    T1] gtp: GTP module loaded (pdp ctx size 128 bytes)
[   33.475283][    T1] rdma_rxe: loaded
[   33.480368][    T1] cfg80211: Loading compiled-in X.509 certificates for=
 regulatory database
[   33.492268][    T1] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   33.501017][    T1] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06=
c7248db18c600'
[   33.510851][    T9] platform regulatory.0: Direct firmware load for regu=
latory.db failed with error -2
[   33.511215][    T1] clk: Disabling unused clocks
[   33.524683][    T9] platform regulatory.0: Falling back to sysfs fallbac=
k for: regulatory.db
[   33.526178][    T1] ALSA device list:
[   33.538940][    T1]   #0: Dummy 1
[   33.542650][    T1]   #1: Loopback 1
[   33.546384][    T1]   #2: Virtual MIDI Card 1
[   33.555198][    T1] md: Waiting for all devices to be available before a=
utodetect
[   33.562972][    T1] md: If you don't use raid, use raid=3Dnoautodetect
[   33.569582][    T1] md: Autodetecting RAID arrays.
[   33.574788][    T1] md: autorun ...
[   33.578693][    T1] md: ... autorun DONE.
[   33.739773][    T1] EXT4-fs (sda1): orphan cleanup on readonly fs
[   33.749322][    T1] EXT4-fs (sda1): mounted filesystem 4f91c6db-4997-4bb=
4-91b8-7e83a20c1bf1 ro with ordered data mode. Quota mode: none.
[   33.762960][    T1] VFS: Mounted root (ext4 filesystem) readonly on devi=
ce 8:1.
[   33.773900][    T1] devtmpfs: mounted
[   33.875119][    T1] Freeing unused kernel image (initmem) memory: 26276K
[   33.889782][    T1] Write protecting the kernel read-only data: 210944k
[   33.913533][    T1] Freeing unused kernel image (text/rodata gap) memory=
: 948K
[   33.925400][    T1] Freeing unused kernel image (rodata/data gap) memory=
: 492K
[   34.137917][    T1] x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[   34.146494][    T1] x86/mm: Checking user space page tables
[   34.329365][    T1] x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[   34.343651][    T1] Failed to set sysctl parameter 'max_rcu_stall_to_pan=
ic=3D1': parameter not found
[   34.353892][    T1] Run /sbin/init as init process
[   34.394256][    T1]=20
[   34.396622][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   34.402211][    T1] WARNING: bad unlock balance detected!
[   34.407859][    T1] 6.16.0-rc2-next-20250619-syzkaller-03877-g2c923c8457=
68-dirty #0 Not tainted
[   34.416889][    T1] -------------------------------------
[   34.422537][    T1] swapper/0/1 is trying to release lock (vm_lock) at:
[   34.429320][    T1] [<ffffffff82090441>] get_user_pages_remote+0x2f1/0xa=
d0
[   34.436517][    T1] but there are no more locks to release!
[   34.442250][    T1]=20
[   34.442250][    T1] other info that might help us debug this:
[   34.450415][    T1] 1 lock held by swapper/0/1:
[   34.455282][    T1]  #0: ffff88801a471760 (&mm->mmap_lock){++++}-{4:4}, =
at: mmap_read_lock_maybe_expand+0xbc/0x3c0
[   34.466037][    T1]=20
[   34.466037][    T1] stack backtrace:
[   34.471986][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.1=
6.0-rc2-next-20250619-syzkaller-03877-g2c923c845768-dirty #0 PREEMPT(full)=
=20
[   34.472011][    T1] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 05/07/2025
[   34.472029][    T1] Call Trace:
[   34.472039][    T1]  <TASK>
[   34.472048][    T1]  dump_stack_lvl+0x189/0x250
[   34.472081][    T1]  ? __pfx_dump_stack_lvl+0x10/0x10
[   34.472108][    T1]  ? __pfx__printk+0x10/0x10
[   34.472127][    T1]  ? print_lock_name+0xde/0x100
[   34.472146][    T1]  ? get_user_pages_remote+0x2f1/0xad0
[   34.472170][    T1]  print_unlock_imbalance_bug+0xdc/0xf0
[   34.472199][    T1]  lock_release+0x269/0x3e0
[   34.472222][    T1]  ? get_user_pages_remote+0x2f1/0xad0
[   34.472247][    T1]  __get_user_pages+0x2dc7/0x3020
[   34.472285][    T1]  ? __pfx___get_user_pages+0x10/0x10
[   34.472312][    T1]  get_user_pages_remote+0x2f1/0xad0
[   34.472339][    T1]  ? __pfx_get_user_pages_remote+0x10/0x10
[   34.472362][    T1]  ? down_read+0x1ad/0x2e0
[   34.472386][    T1]  ? mmap_read_lock_maybe_expand+0xc6/0x3c0
[   34.472405][    T1]  get_arg_page+0x104/0x330
[   34.472429][    T1]  ? __pfx_get_arg_page+0x10/0x10
[   34.472452][    T1]  ? __pfx___might_resched+0x10/0x10
[   34.472478][    T1]  ? create_init_stack_vma+0x523/0x680
[   34.472506][    T1]  copy_string_kernel+0x191/0x2a0
[   34.472531][    T1]  kernel_execve+0x5a2/0x9f0
[   34.472559][    T1]  ? __pfx_kernel_init+0x10/0x10
[   34.472580][    T1]  try_to_run_init_process+0x13/0x60
[   34.472604][    T1]  ? __pfx_kernel_init+0x10/0x10
[   34.472630][    T1]  kernel_init+0xad/0x1d0
[   34.472649][    T1]  ? __pfx_kernel_init+0x10/0x10
[   34.472668][    T1]  ret_from_fork+0x3fc/0x770
[   34.472694][    T1]  ? __pfx_ret_from_fork+0x10/0x10
[   34.472720][    T1]  ? __switch_to_asm+0x39/0x70
[   34.472736][    T1]  ? __switch_to_asm+0x33/0x70
[   34.472752][    T1]  ? __pfx_kernel_init+0x10/0x10
[   34.472773][    T1]  ret_from_fork_asm+0x1a/0x30
[   34.472797][    T1]  </TASK>
[   97.551206][    T9] cfg80211: failed to load regulatory.db
[  202.580574][    C0] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks=
:
[  202.588016][    C0] rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): =
P1
[  202.595200][    C0] rcu: 	(detected by 0, t=3D10502 jiffies, g=3D3113, q=
=3D77 ncpus=3D2)
[  202.603497][    C0] task:swapper/0       state:R  running task     stack=
:18840 pid:1     tgid:1     ppid:0      task_flags:0x0140 flags:0x00004002
[  202.617438][    C0] Call Trace:
[  202.621217][    C0]  <IRQ>
[  202.624138][    C0]  sched_show_task+0x49d/0x630
[  202.628927][    C0]  ? __pfx_sched_show_task+0x10/0x10
[  202.634220][    C0]  ? rcu_dump_cpu_stacks+0x79/0x4e0
[  202.639427][    C0]  ? wq_watchdog_touch+0xef/0x180
[  202.644461][    C0]  print_other_cpu_stall+0xfa6/0x1370
[  202.649853][    C0]  ? __pfx_print_other_cpu_stall+0x10/0x10
[  202.655786][    C0]  ? rcu_is_watching+0x15/0xb0
[  202.660753][    C0]  ? rcu_is_watching+0x15/0xb0
[  202.665646][    C0]  rcu_sched_clock_irq+0x9d1/0x1090
[  202.670878][    C0]  ? __pfx_rcu_sched_clock_irq+0x10/0x10
[  202.676623][    C0]  update_process_times+0x23c/0x2f0
[  202.681946][    C0]  tick_nohz_handler+0x39a/0x520
[  202.686907][    C0]  ? __pfx_tick_nohz_handler+0x10/0x10
[  202.692408][    C0]  __hrtimer_run_queues+0x4e0/0xc60
[  202.697758][    C0]  ? __pfx___hrtimer_run_queues+0x10/0x10
[  202.703594][    C0]  ? read_tsc+0x9/0x20
[  202.707700][    C0]  hrtimer_interrupt+0x45b/0xaa0
[  202.712854][    C0]  __sysvec_apic_timer_interrupt+0x10b/0x410
[  202.719067][    C0]  sysvec_apic_timer_interrupt+0xa1/0xc0
[  202.724828][    C0]  </IRQ>
[  202.727779][    C0]  <TASK>
[  202.730737][    C0]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[  202.737352][    C0] RIP: 0010:mtree_range_walk+0x6b7/0x840
[  202.743593][    C0] Code: 9f 52 bf f6 e9 47 fb ff ff e8 a5 2a 5b f6 89 d=
8 e9 09 fb ff ff e8 99 2a 5b f6 48 8b 54 24 08 48 8d 7a 3f 48 89 f8 48 c1 e=
8 03 <0f> b6 04 28 84 c0 0f 85 19 01 00 00 8b 44 24 04 88 42 3f 4c 8d 72
[  202.764005][    C0] RSP: 0000:ffffc90000067760 EFLAGS: 00000a07
[  202.770192][    C0] RAX: 1ffff9200000cf21 RBX: 0000000000000001 RCX: fff=
f8881404c8000
[  202.778278][    C0] RDX: ffffc900000678d0 RSI: ffff88801a471500 RDI: fff=
fc9000006790f
[  202.787151][    C0] RBP: dffffc0000000000 R08: ffff8881404c8000 R09: 000=
0000000000004
[  202.795319][    C0] R10: 0000000000000003 R11: 0000000000000000 R12: 000=
07fffffffe000
[  202.803574][    C0] R13: 00007fffffffefff R14: ffff88801a471500 R15: fff=
f88802dc03e00
[  202.811580][    C0]  mas_walk+0xc6/0x2e0
[  202.815671][    C0]  ? lock_vma_under_rcu+0x3c8/0x710
[  202.821095][    C0]  lock_vma_under_rcu+0x1be/0x710
[  202.826211][    C0]  ? lock_vma_under_rcu+0xf8/0x710
[  202.831323][    C0]  ? __pfx_lock_vma_under_rcu+0x10/0x10
[  202.836979][    C0]  __get_user_pages+0x404/0x3020
[  202.841960][    C0]  ? __pfx___get_user_pages+0x10/0x10
[  202.847542][    C0]  ? mmap_read_lock_maybe_expand+0xbc/0x3c0
[  202.853459][    C0]  ? rcu_is_watching+0x15/0xb0
[  202.858511][    C0]  ? is_valid_gup_args+0x11f/0x200
[  202.863664][    C0]  get_user_pages_remote+0x2f1/0xad0
[  202.868997][    C0]  ? __pfx_get_user_pages_remote+0x10/0x10
[  202.874986][    C0]  ? down_read+0x1ad/0x2e0
[  202.879586][    C0]  ? mmap_read_lock_maybe_expand+0xc6/0x3c0
[  202.885490][    C0]  get_arg_page+0x104/0x330
[  202.890016][    C0]  ? __pfx_get_arg_page+0x10/0x10
[  202.895261][    C0]  ? __pfx___might_resched+0x10/0x10
[  202.900673][    C0]  copy_string_kernel+0x191/0x2a0
[  202.905734][    C0]  kernel_execve+0x673/0x9f0
[  202.910444][    C0]  ? __pfx_kernel_init+0x10/0x10
[  202.915485][    C0]  try_to_run_init_process+0x13/0x60
[  202.921105][    C0]  ? __pfx_kernel_init+0x10/0x10
[  202.926068][    C0]  kernel_init+0xad/0x1d0
[  202.930515][    C0]  ? __pfx_kernel_init+0x10/0x10
[  202.935512][    C0]  ret_from_fork+0x3fc/0x770
[  202.940312][    C0]  ? __pfx_ret_from_fork+0x10/0x10
[  202.945721][    C0]  ? __switch_to_asm+0x39/0x70
[  202.950593][    C0]  ? __switch_to_asm+0x33/0x70
[  202.955365][    C0]  ? __pfx_kernel_init+0x10/0x10
[  202.960497][    C0]  ret_from_fork_asm+0x1a/0x30
[  202.965371][    C0]  </TASK>
[  328.590772][   T36] kworker/u8:2 (36) used greatest stack depth: 23608 b=
ytes left


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
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.=
1-go1.23.7.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0=
.0.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
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
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build2886964739=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 0e8da31f2d4
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
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D0e8da31f2d4312fc3ad5c1e2e221075831885e0e -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20250613-131303"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"0e8da31f2d4312fc3ad5c1e2e221075831=
885e0e\"
/usr/bin/ld: /tmp/cci5PNSq.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D158b9d0c580000


Tested on:

commit:         2c923c84 Add linux-next specific files for 20250619
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D58afc4b78b52b7e=
3
dashboard link: https://syzkaller.appspot.com/bug?extid=3D8e4be574cb8c40140=
a2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-=
1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D149793705800=
00

