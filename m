Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25CA234994
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012697; cv=none; b=Gi3SGDnfPX4S7Dl/9p2kgnt0b06BC+TgCk6DJMpuM0NNElY7qBxWESZEZt51lyNgANU6LWSJ2hN1kpeEqpl2xxKmLWiPRzfDHnmqEaFknLPcm2ChI6HNykgTz4l7o1Uqmw+2eIWq4+QB2WjzhvuRrQBLWSc4r1NzjkfcUyAHiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012697; c=relaxed/simple;
	bh=9BPcP2XccUhqi1MYefdPCegta4TmTqS7Cb4/YZKTNWg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iEFeEbQPUuQYtVRcSDApN1otavXH26W/tfTNIAyUVj6rKt79mdQaol+mLFHPrxyLGwaxCHFskA/QouKL/kCm11+sgCIMP4zOpyZqAAtK9sCTUSWZmU56x3WI0sSkk11/qPC+KDX2FXkxB9IMG0pDjmG6186c1dxoWjiqk+9R3B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=E1gSXgXQ; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="E1gSXgXQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MC/8Tmn954QnvO13HLP8F1em+Q0HednHKXYmDDF0Iw4=;
	t=1751012695; x=1752222295; b=E1gSXgXQAZkTmpz6lLh6ECfhkqTikiLqqBK81gjQ7olgUov
	s47TRIE9pwngyP9ryBq8DTsJZeu3+UqbSw95u87YT/Tg0RrGeKQZM8RjzyF/74fdRWc38eI00uKek
	rtmmh3G/u/s3y7lN5bpZxsmemUna5nQBSdqCgP4s1+L2V8NIshJsUhRUpZMkLf2GhYjvMGThgYIaB
	Uj3NmpWMx9DpI8Z6opkBFV90IFN99HFpJx9uVRZZIb/qmIGuDygYcX25zsf/4jDbu43sj33bwcj9s
	j+2w9av7106LgBq+OwBgNFMugf09mBdIBQmavSq9rKCySeN47vKpThDJOThtyv0w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uV4Nz-0000000DMQo-1ayc;
	Fri, 27 Jun 2025 10:24:39 +0200
Message-ID: <45f44f0298259abf1862b965805307b7c01a279d.camel@sipsolutions.net>
Subject: Re: [PATCH 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
From: Johannes Berg <johannes@sipsolutions.net>
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>, Anton
 Ivanov	 <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 10:24:38 +0200
In-Reply-To: <b911c2f15c031354850eee277a773832890c3c17.1750947651.git.namcao@linutronix.de>
References: <cover.1750947651.git.namcao@linutronix.de>
	 <b911c2f15c031354850eee277a773832890c3c17.1750947651.git.namcao@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-06-26 at 16:47 +0200, Nam Cao wrote:
> Move away from the legacy MSI domain setup, switch to use
> msi_create_parent_irq_domain().

I applied this on 6.16-rc1 (plus a handful of local patches), and got a
lockdep warning and kernel crash with this change:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
WARNING: inconsistent lock state
6.16.0-rc1-g05358285a53b #1 Tainted: G           O      =20
--------------------------------
inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
modprobe/462 [HC0[0]:SC0[0]:HE0:SE1] takes:
0000000061b3fd30 (&irq_desc_lock_class){?...}-{2:2}, at: __setup_irq+0x4ac/=
0x12d5
{IN-HARDIRQ-W} state was registered at:
  save_stack_trace+0x55/0x62
  stack_trace_save+0x81/0xa4
  save_trace+0xc7/0x354
  mark_lock+0x17d/0x4d9
  __lock_acquire+0x670/0x1a60
  lock_acquire+0x172/0x30e
  _raw_spin_lock+0xa4/0x107
  handle_edge_irq+0x2e/0x2a6
  handle_irq_desc+0x182/0x1a0
  generic_handle_irq+0x1f/0x23
  irq_event_handler+0xbb/0xc8
  deliver_time_travel_irqs+0x254/0x2c3
  unblock_signals.part.0+0x34/0x11c
  unblock_signals+0x1f/0x26
  um_set_signals+0x26/0x40
  time_travel_update_time_rel+0xeb/0xff
  time_travel_ndelay+0x10/0x16
  virtio_pcidev_send_cmd+0x693/0x73a
  virtio_pcidev_cfgspace_read+0xbc/0x129
  um_pci_cfgspace_read+0xde/0xf5
  __raw_readl+0xe6/0xfc
  pci_generic_config_read+0xfc/0x133
  pci_bus_read_config_dword+0xe0/0x18f
  pci_bus_generic_read_dev_vendor_id+0x2e/0x2b4
  pci_bus_read_dev_vendor_id+0xbf/0xd6
  pci_scan_single_device+0xbc/0x218
  pci_scan_slot+0x277/0x3d6
  pci_scan_child_bus_extend+0xa3/0x5be
  pci_scan_child_bus+0x12/0x18
  pci_rescan_bus+0x16/0x41
  um_pci_device_register+0x1b2/0x1f6
  virtio_pcidev_virtio_probe+0x4f2/0x5ee
  virtio_dev_probe+0x53e/0x639
  really_probe+0x3f6/0x8d0
  __driver_probe_device+0x373/0x3f3
  driver_probe_device+0x72/0x12c
  __driver_attach+0x35d/0x3ae
  bus_for_each_dev+0x136/0x184
  driver_attach+0x4e/0x5a
  bus_add_driver+0x343/0x63c
  driver_register+0x2e4/0x3a1
  __register_virtio_driver+0x13e/0x14e
  0x600066bf
  do_one_initcall+0x13b/0x46e
  0x60002e8a
  kernel_init+0x29/0x1f0
  new_thread_handler+0xf2/0x119
irq event stamp: 118040
hardirqs last  enabled at (118039): [<00000000603cc7af>] kasan_quarantine_p=
ut+0x1b9/0x1f3
hardirqs last disabled at (118040): [<0000000060f3c278>] _raw_spin_lock_irq=
save+0x6d/0x16d
softirqs last  enabled at (117512): [<00000000600ac1db>] handle_softirqs+0x=
749/0x8c5
softirqs last disabled at (117339): [<0000000060f3db56>] __do_softirq+0x12/=
0x18

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&irq_desc_lock_class);
  <Interrupt>
    lock(&irq_desc_lock_class);

 *** DEADLOCK ***

3 locks held by modprobe/462:
 #0: 000000006518a1a8 (&dev->mutex){....}-{4:4}, at: device_lock+0x16/0x1e
 #1: 0000000061b3fe58 (&desc->request_mutex){+.+.}-{4:4}, at: __setup_irq+0=
x332/0x12d5
 #2: 0000000061b3fd30 (&irq_desc_lock_class){?...}-{2:2}, at: __setup_irq+0=
x4ac/0x12d5

stack backtrace:
CPU: 0 UID: 0 PID: 462 Comm: modprobe Tainted: G           O        6.16.0-=
rc1-g05358285a53b #1 VOLUNTARY=20
Tainted: [O]=3DOOT_MODULE
Stack:
 66454828 6119fd60 61cb6fa0 00000000
 ffffff00 6119fd60 612dd005 6015081f
 61cb6ff0 60066af1 00000000 6005180e
Call Trace:
 [<6005180e>] ? _printk+0x0/0xdc
 [<6006d7f5>] show_stack+0x1bd/0x1d4
 [<6015081f>] ? __print_lock_name+0x0/0xb7
 [<60066af1>] dump_stack_lvl+0xab/0x12f
 [<6005180e>] ? _printk+0x0/0xdc
 [<60066b8f>] dump_stack+0x1a/0x20
 [<60154818>] print_usage_bug+0x309/0x334
 [<60154843>] ? valid_state+0x0/0x98
 [<601548c6>] valid_state+0x83/0x98
 [<6014f895>] ? hlock_class+0x0/0xcd
 [<60154a9e>] mark_lock+0x1c3/0x4d9
 [<60071f82>] ? segv+0x336/0x71b
 [<602e2a12>] ? _end_441+0x9c/0x16c
 [<60071c4c>] ? segv+0x0/0x71b
 [<601548db>] ? mark_lock+0x0/0x4d9
 [<60154e0a>] mark_held_locks+0x56/0x70
 [<60154db4>] ? mark_held_locks+0x0/0x70
 [<60155086>] lockdep_hardirqs_on_prepare+0x262/0x319
 [<6008b3ef>] ? um_set_signals+0x0/0x40
 [<60288534>] trace_hardirqs_on+0x1b4/0x1d6
 [<6006cfb8>] unblock_signals_trace+0x47/0x5d
 [<6008af06>] sig_handler_common+0xa1/0xe4
 [<6008b5d1>] sig_handler+0xcb/0xea
 [<6008ae45>] hard_handler+0x18/0x24

Modules linked in: iwlwifi(O+) iwlmei(O) cfg80211(O) meisim(O) vlab_control=
(O) compat(O)
Pid: 462, comm: modprobe Tainted: G           O        6.16.0-rc1-g05358285=
a53b
RIP: 0033:0x0
RSP: 00000000724ff038  EFLAGS: 00010246
RAX: 0000100000000000 RBX: 000000006aa4c400 RCX: 0000000000000000
RDX: 000000000c280950 RSI: 0000000000000001 RDI: 000000006aa4c400
RBP: 00000000724ff050 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000061404a40
R13: 000000006a813030 R14: 0000000061b3fc98 R15: 0000000000000001
Kernel panic - not syncing: Kernel mode fault at addr 0x0, ip 0x0
CPU: 0 UID: 0 PID: 462 Comm: modprobe Tainted: G           O        6.16.0-=
rc1-g05358285a53b #1 VOLUNTARY=20
Tainted: [O]=3DOOT_MODULE
Stack:
 6018488e 61b3fc98 6a813198 724ff070
 607b3a44 61b3fc80 61b3fca8 724ff0a0
 60186c6e 0d502609 61b3fc80 61b3fca8
Call Trace:
 [<6018488e>] ? irq_chip_unmask_parent+0x8d/0x98
 [<607b3a44>] pci_irq_unmask_msix+0xa3/0x147
 [<60186c6e>] unmask_irq+0xd1/0x138
 [<60186d52>] irq_enable+0x7d/0x151
 [<6018705a>] irq_startup+0x234/0x29e
 [<60180e06>] __setup_irq+0xdad/0x12d5
 [<733ea37a>] ? iwl_pcie_msix_isr+0x0/0x6 [iwlwifi]
 [<60181598>] request_threaded_irq+0x26a/0x2e5
 [<733e79c3>] ? iwl_pcie_irq_rx_msix_handler+0x0/0x55f [iwlwifi]
 [<60188f5c>] devm_request_threaded_irq+0xe6/0x18b
 [<733e79c3>] ? iwl_pcie_irq_rx_msix_handler+0x0/0x55f [iwlwifi]
 [<733ea37a>] ? iwl_pcie_msix_isr+0x0/0x6 [iwlwifi]
 [<7340d595>] iwl_pci_gen1_2_probe+0x15b3/0x2a0f [iwlwifi]
 [<60087977>] ? virtio_pcidev_bar_copy_from+0xb1/0xd3
 [<7340bfe2>] ? iwl_pci_gen1_2_probe+0x0/0x2a0f [iwlwifi]
 [<6008fefe>] ? copy_sc_from_user+0x4a0/0x632
 [<6008b3e8>] ? unblock_signals+0x1f/0x26
 [<6008b415>] ? um_set_signals+0x26/0x40
 [<600859fa>] ? um_pci_bar_read+0x0/0x111
 [<733ddc30>] iwl_pci_probe+0x281/0x2b1 [iwlwifi]
 [<6008b3e8>] ? unblock_signals+0x1f/0x26
 [<733dd9af>] ? iwl_pci_probe+0x0/0x2b1 [iwlwifi]
 [<60f3c65d>] ? _raw_spin_unlock_irqrestore+0x9f/0x11a
 [<6079c55d>] pci_device_probe+0x1bb/0x324
 [<60832c93>] really_probe+0x3f6/0x8d0
 [<6083289d>] ? really_probe+0x0/0x8d0
 [<603cbea0>] ? __kasan_check_read+0x0/0x22
 [<608334e0>] __driver_probe_device+0x373/0x3f3
 [<603cbec2>] ? __kasan_check_write+0x0/0x25
 [<603cbea0>] ? __kasan_check_read+0x0/0x22
 [<60833696>] driver_probe_device+0x72/0x12c
 [<60833a15>] ? __driver_attach+0x0/0x3ae
 [<60eda91e>] ? klist_next+0x0/0x2d5
 [<60833d72>] __driver_attach+0x35d/0x3ae
 [<60833a15>] ? __driver_attach+0x0/0x3ae
 [<60eda91e>] ? klist_next+0x0/0x2d5
 [<6082d714>] bus_for_each_dev+0x136/0x184
 [<60eda021>] ? klist_add_tail+0x84/0x94
 [<6082d5de>] ? bus_for_each_dev+0x0/0x184
 [<60830f1c>] driver_attach+0x4e/0x5a
 [<6082fc3c>] bus_add_driver+0x343/0x63c
 [<60835a96>] driver_register+0x2e4/0x3a1
 [<607993b6>] __pci_register_driver+0x249/0x25d
 [<733de1d6>] iwl_pci_register_driver+0x30/0x5c [iwlwifi]
 [<7208514e>] __init_backport+0x14e/0x1000 [iwlwifi]
 [<72085000>] ? __init_backport+0x0/0x1000 [iwlwifi]
 [<60067ede>] do_one_initcall+0x13b/0x46e
 [<603c96bc>] ? poison_kmalloc_redzone+0x76/0x89
 [<60067da3>] ? do_one_initcall+0x0/0x46e
 [<603cac13>] ? __asan_register_globals+0x6a/0x85
 [<601bbe3c>] do_init_module+0x2f5/0x7fd
 [<601bbb47>] ? do_init_module+0x0/0x7fd
 [<601c12fb>] load_module+0x492e/0x4df4
 [<603e1938>] ? __kernel_read+0x0/0x3b7
 [<601bc9cd>] ? load_module+0x0/0x4df4
 [<603e1cef>] ? kernel_read+0x0/0x5b
 [<603e1d3a>] ? kernel_read+0x4b/0x5b
 [<6048d18e>] ? kernel_read_file+0x406/0x466
 [<60156d68>] ? __lock_acquire+0x1838/0x1a60
 [<601c1d0a>] init_module_from_file+0x11a/0x160
 [<601c1bf0>] ? init_module_from_file+0x0/0x160
 [<6008b3e8>] ? unblock_signals+0x1f/0x26
 [<60f3c40d>] ? _raw_spin_unlock+0x0/0xa6
 [<60f3c40d>] ? _raw_spin_unlock+0x0/0xa6
 [<601c2020>] idempotent_init_module+0x2d0/0x59c
 [<60f3bcd6>] ? _raw_spin_lock+0x0/0x107
 [<601c1d50>] ? idempotent_init_module+0x0/0x59c
 [<6043dc3a>] ? __fget_light+0xd1/0x13f
 [<601c23d6>] sys_finit_module+0xb2/0xe7
 [<601c2324>] ? sys_finit_module+0x0/0xe7
 [<60073ed9>] handle_syscall+0x2cc/0x38b
 [<6008dcca>] userspace+0x677/0x727
 [<6006bb49>] ? interrupt_end+0x0/0x11d
 [<6006b9b1>] fork_handler+0xa9/0xb4

johannes
