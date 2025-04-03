Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24BE2512CD;
	Thu,  3 Apr 2025 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703358; cv=none; b=o5KNM6ugczMiY3E8LW9caU5NxGvtsKanpNdyi/GZ2rhJaU9uotHmleMv9MzPklcQXByZVZIWsYFLaUl+HrrpMo0V49Nn1LVnLFFvpWkHQ0H2dVP6eDfzB5tmik/Eh1i0eLxIjP+lK2aGbApV1jNj8DeLMl2ds8yyut78fOS36AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703358; c=relaxed/simple;
	bh=UBwbe7JqG7pYMWZ+JBI3aA52ObPymjh3ebRg4APNqzA=;
	h=Content-Type:Message-ID:Date:MIME-Version:Cc:From:Subject:To; b=tqcBOg25PY7hLxHPQi2/J4SYITHBRSsIuT1zi2zuww/Ji4B3pTQWdFLRo+oh3xx285ciCPvYeZc8x/hxsOP2yOEqwaTijm0KsYIfBPRRy7D4UdY+eal+lw+qfSsfA1aVrMsUHLqOMZOqVnpYOU5vxeEeLHuE8jx+m2GI9adEG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.53] (ip5f5ae856.dynamic.kabel-deutschland.de [95.90.232.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 891FD61E647B3;
	Thu, 03 Apr 2025 20:02:06 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------oejv6gGTqF8qlgEPhAyEdYyv"
Message-ID: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
Date: Thu, 3 Apr 2025 20:02:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
To: Mathias Nyman <mathias.nyman@intel.com>,
 Michal Pecio <michal.pecio@gmail.com>

This is a multi-part message in MIME format.
--------------oejv6gGTqF8qlgEPhAyEdYyv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


Just a heads-up, that connecting an LMP USB-C mini Dock [1] to the Intel 
Kaby Lake Dell XPS 13 9360 with

     00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP 
USB 3.0 xHCI Controller [8086:9d2f] (rev 21)

resulted in Linux 6.14.0-12966-ga2cc6ff5ec8f logging the warning and 
trace below.

```
[   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using 
xhci_hcd
[   74.916241] sd 0:0:0:0: [sda] Media removed, stopped polling
[   74.916634] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   98.803081] PM: suspend entry (deep)
[   98.813999] Filesystems sync: 0.010 seconds
[   98.819226] Freezing user space processes
[  105.534176] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed due 
to incorrect slot or ep state.
[  105.606437] usb 4-1.4: reset SuperSpeed USB device number 5 using 
xhci_hcd
[  118.822270] Freezing user space processes failed after 20.003 seconds 
(2 tasks refusing to freeze, wq_busy=0):
[  118.822281] task:systemd-journal state:D stack:0     pid:474 
tgid:474   ppid:1      task_flags:0x400100 flags:0x00000006
[  118.822285] Call Trace:
[  118.822287]  <TASK>
[  118.822291]  __schedule+0x537/0xbb0
[  118.822297]  schedule+0x27/0xd0
[  118.822300]  schedule_preempt_disabled+0x15/0x20
[  118.822302]  __mutex_lock.constprop.0+0x4b4/0x890
[  118.822306]  uevent_show+0x99/0x150
[  118.822309]  dev_attr_show+0x19/0x40
[  118.822312]  sysfs_kf_seq_show+0xcd/0x110
[  118.822315]  seq_read_iter+0x116/0x400
[  118.822318]  vfs_read+0x299/0x360
[  118.822321]  ksys_read+0x6b/0xe0
[  118.822323]  do_syscall_64+0x82/0x9b0
[  118.822327]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
[  118.822331]  ? syscall_exit_to_user_mode+0x37/0x1a0
[  118.822333]  ? do_syscall_64+0x8e/0x9b0
[  118.822336]  ? __memcg_slab_free_hook+0xf9/0x140
[  118.822339]  ? __x64_sys_close+0x3d/0x80
[  118.822341]  ? kmem_cache_free+0x236/0x460
[  118.822344]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
[  118.822346]  ? syscall_exit_to_user_mode+0x37/0x1a0
[  118.822348]  ? do_syscall_64+0x8e/0x9b0Dez 21 10:22:08 abreu kernel: 
sd 0:0:0:0: [sda] Asking for cache data failed
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Assuming drive cache: 
write through
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Attached SCSI disk
Dez 21 10:22:08 abreu systemd-coredump[5647]: Process 386 
(systemd-journal) of user 0 terminated abnormally with signal 6/ABRT, 
processing...
Dez 21 10:22:08 abreu systemd-coredump[5647]: Process 386 
(systemd-journal) of user 0 dumped core.
Dez 21 10:22:08 abreu systemd-coredump[5647]: Coredump diverted to 
/var/lib/systemd/coredump/core.systemd-journal.0.05a680906c62416790aa2d9b90677a90.386.1734772928000000.zst
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module libzstd.so.1 from 
deb libzstd-1.5.6+dfsg-1+b1.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module libmount.so.1 from 
deb util-linux-2.40.2-12.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module libblkid.so.1 from 
deb util-linux-2.40.2-12.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module 
libsystemd-shared-257.so from deb systemd-257.1-2.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Stack trace of thread 386:
Dez 21 10:22:08 abreu systemd-coredump[5647]: #0  0x00007f081410d49c 
__GI___libc_read (libc.so.6 + 0x10349c)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #1  0x00007f08143f0121 
read_virtual_file_fd (libsystemd-shared-257.so + 0x1f0121)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #2  0x00007f08143f0368 
read_virtual_file_at (libsystemd-shared-257.so + 0x1f0368)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #3  0x00007f08144c213b 
device_read_uevent_file (libsystemd-shared-257.so + 0x2c213b)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #4  0x00007f08144c325a 
sd_device_get_devname (libsystemd-shared-257.so + 0x2c325a)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #5  0x0000555b6e97c36e n/a 
(n/a + 0x0)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #6  0x0000000000000016 n/a 
(n/a + 0x0)
Dez 21 10:22:08 abreu systemd-coredump[5647]: ELF object binary 
architecture: AMD x86-64
Dez 21 10:22:08 abreu systemd[1]: systemd-journald.service: Main process 
exited, code=dump
[  118.822350]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  118.822352] RIP: 0033:0x7f23b5ea49ee
[  118.822382] RSP: 002b:00007ffd638a1298 EFLAGS: 00000246 ORIG_RAX: 
0000000000000000
[  118.822385] RAX: ffffffffffffffda RBX: 00007f23b6440980 RCX: 
00007f23b5ea49ee
[  118.822386] RDX: 0000000000001008 RSI: 00005593bf1ef260 RDI: 
0000000000000030
[  118.822387] RBP: 0000000000000030 R08: 0000000000000000 R09: 
0000000000000000
[  118.822388] R10: 0000000000000000 R11: 0000000000000246 R12: 
0000000000001007
[  118.822390] R13: 0000000000001008 R14: ffffffffffffffff R15: 
0000000000000002
[  118.822392]  </TASK>
[  118.822430] task:(udev-worker)   state:D stack:0     pid:2453 
tgid:2453  ppid:520    task_flags:0x400140 flags:0x00004006
[  118.822433] Call Trace:
[  118.822434]  <TASK>
[  118.822435]  __schedule+0x537/0xbb0
[  118.822438]  schedule+0x27/0xd0
[  118.822440]  async_synchronize_cookie_domain+0x116/0x160
[  118.822444]  ? prepare_to_swait_exclusive+0xb0/0xb0
[  118.822450]  do_init_module+0x1fd/0x270
[  118.822453]  init_module_from_file+0x85/0xc0
[  118.822455]  __x64_sys_finit_module+0x168/0x3c0
[  118.822458]  do_syscall_64+0x82/0x9b0
[  118.822461]  ? __count_memcg_events+0x99/0x130
[  118.822463]  ? count_memcg_events.constprop.0+0x1a/0x30
[  118.822467]  ? handle_mm_fault+0x1ce/0x2d0
[  118.822469]  ? do_user_addr_fault+0x20d/0x680
[  118.822473]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
[  118.822476]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[  118.822477] RIP: 0033:0x7f8ee5918779
[  118.822482] RSP: 002b:00007ffd6aca4828 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[  118.822484] RAX: ffffffffffffffda RBX: 000055d01da0a430 RCX: 
00007f8ee5918779
[  118.822485] RDX: 0000000000000000 RSI: 00007f8ee5efe44d RDI: 
0000000000000011
[  118.822486] RBP: 0000000000000000 R08: 0000000000000000 R09: 
000055d01d971f00
[  118.822487] R10: 0000000000000000 R11: 0000000000000246 R12: 
00007f8ee5efe44d
[  118.822488] R13: 0000000000020000 R14: 000055d01da95ab0 R15: 
0000000000000000
[  118.822490]  </TASK>
```

The warning repeated several times without the trace though. Please find 
the full log attached.

The Linux kernel contains Mathias’ and Michal’s commits

     $ git log --oneline --no-decorate
     28a76fcc4c85dd39633fb96edb643c91820133e3 -3
     28a76fcc4c85 usb: xhci: Avoid Stop Endpoint retry loop if the 
endpoint seems Running
     dfc88357b6b6 usb: xhci: Don't change the status of stalled TDs on 
failed Stop EP
     0c74d232578b xhci: Avoid queuing redundant Stop Endpoint command 
for stalled endpoint

After noticing this warning, I haven’t been able to reproduce this 
though by un-plugging and re-plugging the LMP device.


Kind regards,

Paul


[1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/


PS: According to

     $ journalctl -g 'WARN Set TR Deq Ptr cmd failed due to incorrect 
slot or ep state.'

I have already hit this in November 20th, 2024 with Linux 6.12.0, 
December 21st, 2024 with Linux 6.13.0-rc3-00193-ge9b8ffafd20a, January 
10th, 2025 with Linux 6.12.6-1.

### Linux 6.12.0

Nov 20 18:33:44 abreu kernel: PM: suspend entry (deep)
Nov 20 18:33:44 abreu kernel: Filesystems sync: 0.011 seconds
Nov 20 18:33:47 abreu kernel: Freezing user space processes
Nov 20 18:33:47 abreu kernel: Freezing user space processes completed 
(elapsed 0.001 seconds)
Nov 20 18:33:47 abreu kernel: OOM killer disabled.
Nov 20 18:33:47 abreu kernel: Freezing remaining freezable tasks
Nov 20 18:33:47 abreu kernel: Freezing remaining freezable tasks 
completed (elapsed 0.001 seconds)
Nov 20 18:33:47 abreu kernel: printk: Suspending console(s) (use 
no_console_suspend to debug)
Nov 20 18:33:47 abreu kernel: usb 3-1.2: clear tt 3 (0090) error -71
Nov 20 18:40:00 abreu kernel: usb 3-1.2: clear tt 3 (0090) error -71
Nov 20 18:40:00 abreu kernel: usb 4-1-port2: device 4-1.2 not suspended yet
Nov 20 18:40:00 abreu kernel: xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr 
cmd failed due to incorrect slot or ep state.
Nov 20 18:40:00 abreu kernel: xhci_hcd 0000:39:00.0: PM: 
pci_pm_suspend(): hcd_pci_suspend [usbcore] returns -16
Nov 20 18:40:00 abreu kernel: xhci_hcd 0000:39:00.0: PM: 
dpm_run_callback(): pci_pm_suspend returns -16
Nov 20 18:40:00 abreu kernel: xhci_hcd 0000:39:00.0: PM: failed to 
suspend async: error -16
Nov 20 18:40:00 abreu kernel: PM: Some devices failed to suspend, or 
early wake event detected

### Linux 6.13.0-rc3-00193-ge9b8ffafd20a

(Beware of the non-linear timestamps.)

Dez 21 10:14:37 abreu kernel: sd 0:0:0:0: [sda] Unit Not Ready
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Sense Key : 0x4 [current]
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] ASC=0x44 
<<vendor>>ASCQ=0x81
Dez 21 10:15:19 abreu kernel: usb 2-1: new SuperSpeed USB device number 
3 using xhci_hcd
Dez 21 10:15:19 abreu kernel: usb 2-1: New USB device found, 
idVendor=18a5, idProduct=0237, bcdDevice= 1.00
Dez 21 10:15:19 abreu kernel: usb 2-1: New USB device strings: Mfr=2, 
Product=3, SerialNumber=1
Dez 21 10:15:19 abreu kernel: usb 2-1: Product: Portable USB 3.0 Drive
Dez 21 10:15:19 abreu kernel: usb 2-1: Manufacturer: Verbatim
Dez 21 10:15:19 abreu kernel: usb 2-1: SerialNumber: WM2804496000
Dez 21 10:15:19 abreu kernel: usb-storage 2-1:1.0: USB Mass Storage 
device detected
Dez 21 10:15:19 abreu kernel: scsi host1: usb-storage 2-1:1.0
Dez 21 10:15:19 abreu kernel: scsi 1:0:0:0: Direct-Access     WDC WD20 
SPZX-00UA7T0     0    PQ: 0 ANSI: 6
Dez 21 10:15:19 abreu kernel: sd 1:0:0:0: [sdb] 3907029168 512-byte 
logical blocks: (2.00 TB/1.82 TiB)
Dez 21 10:15:19 abreu kernel: sd 1:0:0:0: [sdb] Write Protect is off
Dez 21 10:15:19 abreu kernel: sd 1:0:0:0: [sdb] Mode Sense: 43 00 00 00
Dez 21 10:15:19 abreu kernel: sd 1:0:0:0: [sdb] Write cache: enabled, 
read cache: enabled, doesn't support DPO or FUA
Dez 21 10:15:19 abreu kernel:  sdb: sdb1
Dez 21 10:15:19 abreu kernel: sd 1:0:0:0: [sdb] Attached SCSI disk
Dez 21 10:15:19 abreu kernel: usb 2-2: USB disconnect, device number 2
Dez 21 10:15:19 abreu kernel: xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr 
cmd failed due to incorrect slot or ep state.
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Read Capacity(10) 
failed: Result: hostbyte=0x07 driverbyte=DRIVER_OK
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Sense not available.
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] 0 512-byte logical 
blocks: (0 B/0 B)
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] 0-byte physical blocks
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Write Protect is off
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Mode Sense: 00 00 00 00
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Asking for cache data failed
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Assuming drive cache: 
write through
Dez 21 10:15:19 abreu kernel: sd 0:0:0:0: [sda] Attached SCSI disk
Dez 21 10:15:19 abreu fwupd[2041]: 09:14:39.694 FuEngine 
failed to add device 
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/host1/target1:0:0/1:0:0:0/block/sdb: 
failed to subclass open: failed to open /dev/sdb: Die Operation ist 
nicht erlaubt
Dez 21 10:15:19 abreu fwupd[2041]: 09:14:39.701 FuEngine 
failed to add device 
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/host1/target1:0:0/1:0:0:0/block/sdb: 
failed to subclass open: failed to open /dev/sdb: Die Operation ist 
nicht erlaubt
Dez 21 10:15:19 abreu fwupd[2041]: 09:14:39.710 FuEngine 
failed to add device 
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/host1/target1:0:0/1:0:0:0/block/sdb: 
failed to subclass open: failed to open /dev/sdb: Die Operation ist 
nicht erlaubt
Dez 21 10:14:37 abreu NetworkManager[610]: <info>  [1734772477.8429] 
manager: rfkill: Wi-Fi now disabled by radio killswitch
Dez 21 10:14:37 abreu charon[739]: 16[KNL] interface wlan0 deactivated
Dez 21 10:14:37 abreu NetworkManager[610]: <info>  [1734772477.8430] 
device (wlan0): state change: disconnected -> unavailable (reason 
'none', managed-type: 'full')
Dez 21 10:14:37 abreu wpa_supplicant[612]: rfkill: WLAN soft blocked
Dez 21 10:14:37 abreu systemd[1]: Starting systemd-rfkill.service - 
Load/Save RF Kill Switch Status...
Dez 21 10:14:37 abreu wpa_supplicant[612]: rfkill: WLAN soft blocked
Dez 21 10:14:37 abreu NetworkManager[610]: <info>  [1734772477.8665] 
device (p2p-dev-wlan0): state change: disconnected -> unavailable 
(reason 'supplicant-failed', managed-type: 'full')
Dez 21 10:14:37 abreu wpa_supplicant[612]: p2p-dev-wlan0: 
CTRL-EVENT-DSCP-POLICY clear_all
Dez 21 10:14:37 abreu NetworkManager[610]: <info>  [1734772477.8716] 
audit: op="radio-control" arg="wwan-enabled:off" pid=1621 uid=5272 
result="success"
Dez 21 10:14:37 abreu wpa_supplicant[612]: p2p-dev-wlan0: 
CTRL-EVENT-DSCP-POLICY clear_all
Dez 21 10:14:37 abreu systemd[1]: Started systemd-rfkill.service - 
Load/Save RF Kill Switch Status.
Dez 21 10:14:37 abreu wpa_supplicant[612]: nl80211: deinit 
ifname=p2p-dev-wlan0 disabled_11b_rates=0
Dez 21 10:14:38 abreu systemd[1328]: Started app-gnome-ptyxis-2322.scope 
- Application launched by gsd-media-keys.
Dez 21 10:14:37 abreu wpa_supplicant[612]: wlan0: CTRL-EVENT-DSCP-POLICY 
clear_all
Dez 21 10:14:38 abreu ptyxis-agent[2344]: Failed to process podman 
containers: Failed to execute child process “podman” (No such file or 
directory)
Dez 21 10:14:37 abreu wpa_supplicant[612]: wlan0: CTRL-EVENT-DSCP-POLICY 
clear_all
Dez 21 10:14:38 abreu systemd[1328]: Started run-p2372-i2672.scope - 
[systemd-run] /usr/bin/bash.
Dez 21 10:14:37 abreu wpa_supplicant[612]: nl80211: deinit ifname=wlan0 
disabled_11b_rates=0
Dez 21 10:14:39 abreu systemd-timesyncd[407]: Contacted time server 
[2a02:8106:21:9400::5]:123 (2.debian.pool.ntp.org).
Dez 21 10:14:38 abreu mtp-probe[2329]: checking bus 2, device 3: 
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
[…]
Dez 21 10:15:01 abreu PackageKit[963]: get-updates transaction 
/95551_baeccaec from uid 5272 finished with success after 924ms
Dez 21 10:15:02 abreu PackageKit[963]: get-updates transaction 
/95552_ebebaaab from uid 5272 finished with success after 911ms
Dez 21 10:15:10 abreu sudo[2614]:  pmenzel : TTY=pts/3 ; 
PWD=/home/pmenzel ; USER=root ; COMMAND=/usr/bin/dmesg
Dez 21 10:15:10 abreu sudo[2614]: pam_unix(sudo:session): session opened 
for user root(uid=0) by pmenzel(uid=5272)
Dez 21 10:15:10 abreu sudo[2614]: pam_unix(sudo:session): session closed 
for user root
Dez 21 10:15:20 abreu dbus-daemon[1354]: [session uid=5272 pid=1354 
pidfd=5] Activating via systemd: service name='org.gtk.vfs.Metadata' 
unit='gvfs-metadata.service' requested
by ':1.30' (uid=5272 pid=1512 comm="/usr/bin/gnome-shell")
Dez 21 10:15:20 abreu systemd[1328]: Starting gvfs-metadata.service - 
Virtual filesystem metadata service...
Dez 21 10:15:20 abreu dbus-daemon[1354]: [session uid=5272 pid=1354 
pidfd=5] Successfully activated service 'org.gtk.vfs.Metadata'
Dez 21 10:15:20 abreu systemd[1328]: Started gvfs-metadata.service - 
Virtual filesystem metadata service.
Dez 21 10:15:21 abreu kernel: usb 2-2: new SuperSpeed USB device number 
4 using xhci_hcd
Dez 21 10:15:21 abreu kernel: usb 2-2: New USB device found, 
idVendor=152d, idProduct=0583, bcdDevice=31.06
Dez 21 10:15:21 abreu kernel: usb 2-2: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Dez 21 10:15:21 abreu kernel: usb 2-2: Product: USB 3.1 Storage Device
Dez 21 10:15:21 abreu kernel: usb 2-2: Manufacturer: JMicron
Dez 21 10:15:21 abreu kernel: usb 2-2: SerialNumber: DD5641988391D
Dez 21 10:15:21 abreu kernel: usb-storage 2-2:1.0: USB Mass Storage 
device detected
Dez 21 10:15:21 abreu kernel: scsi host0: usb-storage 2-2:1.0
Dez 21 10:15:21 abreu mtp-probe[2650]: checking bus 2, device 4: 
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-2"
Dez 21 10:15:21 abreu mtp-probe[2650]: bus: 2, device: 4 was not an MTP 
device
Dez 21 10:15:21 abreu mtp-probe[2654]: checking bus 2, device 4: 
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-2"
Dez 21 10:15:21 abreu mtp-probe[2654]: bus: 2, device: 4 was not an MTP 
device
Dez 21 10:15:22 abreu kernel: scsi 0:0:0:0: Direct-Access     Samsung 
SSD 990 PRO      3106 PQ: 0 ANSI: 6
Dez 21 10:15:47 abreu kernel: sd 0:0:0:0: [sda] Unit Not Ready
Dez 21 10:15:47 abreu kernel: sd 0:0:0:0: [sda] Sense Key : 0x4 [current]
Dez 21 10:15:47 abreu kernel: sd 0:0:0:0: [sda] ASC=0x44 
<<vendor>>ASCQ=0x81
Dez 21 10:15:47 abreu kernel: usb 2-2: USB disconnect, device number 4
Dez 21 10:15:48 abreu kernel: xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr 
cmd failed due to incorrect slot or ep state.
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] Read Capacity(10) 
failed: Result: hostbyte=0x07 driverbyte=DRIVER_OK
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] Sense not available.
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] 0 512-byte logical 
blocks: (0 B/0 B)
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] 0-byte physical blocks
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] Write Protect is off
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] Mode Sense: 00 00 00 00
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] Asking for cache data failed
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] Assuming drive cache: 
write through
Dez 21 10:15:48 abreu kernel: sd 0:0:0:0: [sda] Attached SCSI disk
Dez 21 10:15:48 abreu fwupd[2041]: 09:15:48.048 FuBackend 
failed to create device: failed to probe: FuUsbBaseHdr failed read of 
0x2: Fehler beim Suchen in Datei: Kein passendes Geraet gefunden
Dez 21 10:16:00 abreu kernel: usb 4-1.3: new SuperSpeed Plus Gen 2x1 USB 
device number 4 using xhci_hcd
Dez 21 10:16:00 abreu kernel: usb 4-1.3: New USB device found, 
idVendor=152d, idProduct=0583, bcdDevice=31.06
Dez 21 10:16:00 abreu kernel: usb 4-1.3: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Dez 21 10:16:00 abreu kernel: usb 4-1.3: Product: USB 3.1 Storage Device
Dez 21 10:16:00 abreu kernel: usb 4-1.3: Manufacturer: JMicron
Dez 21 10:16:00 abreu kernel: usb 4-1.3: SerialNumber: DD5641988391D
Dez 21 10:16:00 abreu kernel: usb-storage 4-1.3:1.0: USB Mass Storage 
device detected
Dez 21 10:16:00 abreu kernel: scsi host0: usb-storage 4-1.3:1.0
Dez 21 10:16:00 abreu mtp-probe[2694]: checking bus 4, device 4: 
"/sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb4/4-1/4-1.3"
Dez 21 10:16:00 abreu mtp-probe[2694]: bus: 4, device: 4 was not an MTP 
device
Dez 21 10:16:00 abreu mtp-probe[2696]: checking bus 4, device 4: 
"/sys/devices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb4/4-1/4-1.3"
Dez 21 10:16:00 abreu mtp-probe[2696]: bus: 4, device: 4 was not an MTP 
device
Dez 21 10:16:01 abreu kernel: scsi 0:0:0:0: Direct-Access     Samsung 
SSD 990 PRO      3106 PQ: 0 ANSI: 6
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Unit Not Ready
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Sense Key : 0x4 [current]
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] ASC=0x44 
<<vendor>>ASCQ=0x81
Dez 21 10:16:28 abreu kernel: usb 2-1: USB disconnect, device number 3
Dez 21 10:16:28 abreu kernel: sd 1:0:0:0: [sdb] Synchronizing SCSI cache
Dez 21 10:16:28 abreu kernel: sd 1:0:0:0: [sdb] Synchronize Cache(10) 
failed: Result: hostbyte=0x01 driverbyte=DRIVER_OK
Dez 21 10:16:28 abreu kernel: usb 4-1.3: USB disconnect, device number 4
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Read Capacity(10) 
failed: Result: hostbyte=0x07 driverbyte=DRIVER_OK
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Sense not available.
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] 0 512-byte logical 
blocks: (0 B/0 B)
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] 0-byte physical blocks
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Write Protect is off
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Mode Sense: 00 00 00 00
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Asking for cache data failed
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Assuming drive cache: 
write through
Dez 21 10:16:28 abreu kernel: sd 0:0:0:0: [sda] Attached SCSI disk
[…]
Dez 21 10:19:17 abreu kernel: usb 2-1: new SuperSpeed USB device number 
5 using xhci_hcd
Dez 21 10:19:17 abreu kernel: usb 2-1: New USB device found, 
idVendor=152d, idProduct=0583, bcdDevice=31.06
Dez 21 10:19:17 abreu kernel: usb 2-1: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Dez 21 10:19:17 abreu kernel: usb 2-1: Product: USB 3.1 Storage Device
Dez 21 10:19:17 abreu kernel: usb 2-1: Manufacturer: JMicron
Dez 21 10:19:17 abreu kernel: usb 2-1: SerialNumber: DD5641988391D
Dez 21 10:19:17 abreu kernel: usb-storage 2-1:1.0: USB Mass Storage 
device detected
Dez 21 10:19:17 abreu kernel: scsi host0: usb-storage 2-1:1.0
Dez 21 10:19:17 abreu mtp-probe[2771]: checking bus 2, device 5: 
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dez 21 10:19:17 abreu mtp-probe[2771]: bus: 2, device: 5 was not an MTP 
device
Dez 21 10:19:17 abreu mtp-probe[2773]: checking bus 2, device 5: 
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Dez 21 10:19:17 abreu mtp-probe[2773]: bus: 2, device: 5 was not an MTP 
device
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Unit Not Ready
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Sense Key : 0x4 [current]
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] ASC=0x44 
<<vendor>>ASCQ=0x81
Dez 21 10:22:08 abreu kernel: INFO: task systemd-journal:386 blocked for 
more than 120 seconds.
Dez 21 10:22:08 abreu kernel:       Tainted: G     U 
6.13.0-rc3-00193-ge9b8ffafd20a #45
Dez 21 10:22:08 abreu kernel: "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Dez 21 10:22:08 abreu kernel: task:systemd-journal state:D stack:0 
pid:386   tgid:386   ppid:1      flags:0x00000002
Dez 21 10:22:08 abreu kernel: Call Trace:
Dez 21 10:22:08 abreu kernel:  <TASK>
Dez 21 10:22:08 abreu kernel:  __schedule+0x4d8/0xb80
Dez 21 10:22:08 abreu kernel:  schedule+0x27/0xe0
Dez 21 10:22:08 abreu kernel:  schedule_preempt_disabled+0x15/0x20
Dez 21 10:22:08 abreu kernel:  __mutex_lock.constprop.0+0x442/0x770
Dez 21 10:22:08 abreu kernel:  uevent_show+0xb8/0x130
Dez 21 10:22:08 abreu kernel:  dev_attr_show+0x19/0x40
Dez 21 10:22:08 abreu kernel:  sysfs_kf_seq_show+0xa1/0xe0
Dez 21 10:22:08 abreu kernel:  seq_read_iter+0x118/0x470
Dez 21 10:22:08 abreu kernel:  vfs_read+0x295/0x360
Dez 21 10:22:08 abreu kernel:  ksys_read+0x6c/0xe0
Dez 21 10:22:08 abreu kernel:  do_syscall_64+0x82/0x160
Dez 21 10:22:08 abreu kernel:  ? __do_sys_newfstat+0x64/0x70
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? kmem_cache_free+0x27f/0x500
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? __do_sys_newfstat+0x64/0x70
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
Dez 21 10:22:08 abreu kernel: RIP: 0033:0x7f081410d49c
Dez 21 10:22:08 abreu kernel: RSP: 002b:00007fffae97bc10 EFLAGS: 
00000246 ORIG_RAX: 0000000000000000
Dez 21 10:22:08 abreu kernel: RAX: ffffffffffffffda RBX: 
0000555b71d91360 RCX: 00007f081410d49c
Dez 21 10:22:08 abreu kernel: RDX: 0000000000001008 RSI: 
0000555b71d91360 RDI: 000000000000001f
Dez 21 10:22:08 abreu kernel: RBP: 000000000000001f R08: 
0000000000000000 R09: 0000555b71d75040
Dez 21 10:22:08 abreu kernel: R10: 00007f08141f1b60 R11: 
0000000000000246 R12: 0000000000001007
Dez 21 10:22:08 abreu kernel: R13: 0000000000001008 R14: 
ffffffffffffffff R15: 0000000000000002
Dez 21 10:22:08 abreu kernel:  </TASK>
Dez 21 10:22:08 abreu kernel: INFO: task fwupd:2041 blocked for more 
than 120 seconds.
Dez 21 10:22:08 abreu kernel:       Tainted: G     U 
6.13.0-rc3-00193-ge9b8ffafd20a #45
Dez 21 10:22:08 abreu kernel: "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Dez 21 10:22:08 abreu kernel: task:fwupd           state:D stack:0 
pid:2041  tgid:2041  ppid:1      flags:0x00000002
Dez 21 10:22:08 abreu kernel: Call Trace:
Dez 21 10:22:08 abreu kernel:  <TASK>
Dez 21 10:22:08 abreu kernel:  __schedule+0x4d8/0xb80
Dez 21 10:22:08 abreu kernel:  schedule+0x27/0xe0
Dez 21 10:22:08 abreu kernel:  schedule_preempt_disabled+0x15/0x20
Dez 21 10:22:08 abreu kernel:  __mutex_lock.constprop.0+0x442/0x770
Dez 21 10:22:08 abreu kernel:  uevent_show+0xb8/0x130
Dez 21 10:22:08 abreu kernel:  dev_attr_show+0x19/0x40
Dez 21 10:22:08 abreu kernel:  sysfs_kf_seq_show+0xa1/0xe0
Dez 21 10:22:08 abreu kernel:  seq_read_iter+0x118/0x470
Dez 21 10:22:08 abreu kernel:  vfs_read+0x295/0x360
Dez 21 10:22:08 abreu kernel:  ksys_read+0x6c/0xe0
Dez 21 10:22:08 abreu kernel:  do_syscall_64+0x82/0x160
Dez 21 10:22:08 abreu kernel:  ? __x64_sys_poll+0xc8/0x170
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? kmem_cache_free+0x27f/0x500
Dez 21 10:22:08 abreu kernel:  ? mntput_no_expire+0x4a/0x260
Dez 21 10:22:08 abreu kernel:  ? do_readlinkat+0xc5/0x180
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? do_statx+0x72/0xa0
Dez 21 10:22:08 abreu kernel:  ? kmem_cache_free+0x27f/0x500
Dez 21 10:22:08 abreu kernel:  ? __x64_sys_statx+0xa7/0xf0
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
Dez 21 10:22:08 abreu kernel: RIP: 0033:0x7fc21b4e049c
Dez 21 10:22:08 abreu kernel: RSP: 002b:00007ffe75e4ad50 EFLAGS: 
00000246 ORIG_RAX: 0000000000000000
Dez 21 10:22:08 abreu kernel: RAX: ffffffffffffffda RBX: 
000055b2dcfc75d0 RCX: 00007fc21b4e049c
Dez 21 10:22:08 abreu kernel: RDX: 0000000000000400 RSI: 
000055b2dcc19830 RDI: 00000000000000ae
Dez 21 10:22:08 abreu kernel: RBP: 000055b2df0f1490 R08: 
0000000000000000 R09: 00007fc21b5c4ac8
Dez 21 10:22:08 abreu kernel: R10: 0000000000000000 R11: 
0000000000000246 R12: ffffffffffffffff
Dez 21 10:22:08 abreu kernel: R13: 000055b2dcdd2250 R14: 
0000000000000000 R15: 0000000000000032
Dez 21 10:22:08 abreu kernel:  </TASK>
Dez 21 10:22:08 abreu kernel: INFO: task (udev-worker):2769 blocked for 
more than 120 seconds.
Dez 21 10:22:08 abreu kernel:       Tainted: G     U 
6.13.0-rc3-00193-ge9b8ffafd20a #45
Dez 21 10:22:08 abreu kernel: "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Dez 21 10:22:08 abreu kernel: task:(udev-worker)   state:D stack:0 
pid:2769  tgid:2769  ppid:432    flags:0x00000002
Dez 21 10:22:08 abreu kernel: Call Trace:
Dez 21 10:22:08 abreu kernel:  <TASK>
Dez 21 10:22:08 abreu kernel:  __schedule+0x4d8/0xb80
Dez 21 10:22:08 abreu kernel:  schedule+0x27/0xe0
Dez 21 10:22:08 abreu kernel:  schedule_preempt_disabled+0x15/0x20
Dez 21 10:22:08 abreu kernel:  __mutex_lock.constprop.0+0x442/0x770
Dez 21 10:22:08 abreu kernel:  uevent_show+0xb8/0x130
Dez 21 10:22:08 abreu kernel:  dev_attr_show+0x19/0x40
Dez 21 10:22:08 abreu kernel:  sysfs_kf_seq_show+0xa1/0xe0
Dez 21 10:22:08 abreu kernel:  seq_read_iter+0x118/0x470
Dez 21 10:22:08 abreu kernel:  vfs_read+0x295/0x360
Dez 21 10:22:08 abreu kernel:  ksys_read+0x6c/0xe0
Dez 21 10:22:08 abreu kernel:  do_syscall_64+0x82/0x160
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
Dez 21 10:22:08 abreu kernel: RIP: 0033:0x7f7d1c6be45d
Dez 21 10:22:08 abreu kernel: RSP: 002b:00007ffd6da2fb58 EFLAGS: 
00000246 ORIG_RAX: 0000000000000000
Dez 21 10:22:08 abreu kernel: RAX: ffffffffffffffda RBX: 
000055a00898d080 RCX: 00007f7d1c6be45d
Dez 21 10:22:08 abreu kernel: RDX: 0000000000001008 RSI: 
000055a00898d080 RDI: 0000000000000011
Dez 21 10:22:08 abreu kernel: RBP: 0000000000000011 R08: 
0000000000000000 R09: 00007f7d1c7a3140
Dez 21 10:22:08 abreu kernel: R10: 000055a008993960 R11: 
0000000000000246 R12: 0000000000001007
Dez 21 10:22:08 abreu kernel: R13: 0000000000001008 R14: 
ffffffffffffffff R15: 0000000000000002
Dez 21 10:22:08 abreu kernel:  </TASK>
Dez 21 10:22:08 abreu kernel: INFO: task (udev-worker):2770 blocked for 
more than 120 seconds.
Dez 21 10:22:08 abreu kernel:       Tainted: G     U 
6.13.0-rc3-00193-ge9b8ffafd20a #45
Dez 21 10:22:08 abreu kernel: "echo 0 > 
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Dez 21 10:22:08 abreu kernel: task:(udev-worker)   state:D stack:0 
pid:2770  tgid:2770  ppid:432    flags:0x00000002
Dez 21 10:22:08 abreu kernel: Call Trace:
Dez 21 10:22:08 abreu kernel:  <TASK>
Dez 21 10:22:08 abreu kernel:  __schedule+0x4d8/0xb80
Dez 21 10:22:08 abreu kernel:  schedule+0x27/0xe0
Dez 21 10:22:08 abreu kernel:  schedule_preempt_disabled+0x15/0x20
Dez 21 10:22:08 abreu kernel:  __mutex_lock.constprop.0+0x442/0x770
Dez 21 10:22:08 abreu kernel:  uevent_show+0xb8/0x130
Dez 21 10:22:08 abreu kernel:  dev_attr_show+0x19/0x40
Dez 21 10:22:08 abreu kernel:  sysfs_kf_seq_show+0xa1/0xe0
Dez 21 10:22:08 abreu kernel:  seq_read_iter+0x118/0x470
Dez 21 10:22:08 abreu kernel:  vfs_read+0x295/0x360
Dez 21 10:22:08 abreu kernel:  ksys_read+0x6c/0xe0
Dez 21 10:22:08 abreu kernel:  do_syscall_64+0x82/0x160
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? kmem_cache_free+0x27f/0x500
Dez 21 10:22:08 abreu kernel:  ? vfs_fstatat+0x75/0xa0
Dez 21 10:22:08 abreu kernel:  ? __do_sys_newfstatat+0x3c/0x70
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? 
arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
Dez 21 10:22:08 abreu kernel:  ? syscall_exit_to_user_mode+0x37/0x1a0
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  ? do_syscall_64+0x8e/0x160
Dez 21 10:22:08 abreu kernel:  entry_SYSCALL_64_after_hwframe+0x4b/0x53
Dez 21 10:22:08 abreu kernel: RIP: 0033:0x7f7d1c6be45d
Dez 21 10:22:08 abreu kernel: RSP: 002b:00007ffd6da2fb58 EFLAGS: 
00000246 ORIG_RAX: 0000000000000000
Dez 21 10:22:08 abreu kernel: RAX: ffffffffffffffda RBX: 
000055a008977280 RCX: 00007f7d1c6be45d
Dez 21 10:22:08 abreu kernel: RDX: 0000000000001008 RSI: 
000055a008977280 RDI: 0000000000000012
Dez 21 10:22:08 abreu kernel: RBP: 0000000000000012 R08: 
0000000000000000 R09: 00007ffd6da2fde8
Dez 21 10:22:08 abreu kernel: R10: 0000000000000000 R11: 
0000000000000246 R12: 0000000000001007
Dez 21 10:22:08 abreu kernel: R13: 0000000000001008 R14: 
ffffffffffffffff R15: 0000000000000002
Dez 21 10:22:08 abreu kernel:  </TASK>
Dez 21 10:22:08 abreu kernel: usb 2-1: USB disconnect, device number 5
Dez 21 10:22:08 abreu kernel: xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr 
cmd failed due to incorrect slot or ep state.
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Read Capacity(10) 
failed: Result: hostbyte=0x07 driverbyte=DRIVER_OK
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Sense not available.
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] 0 512-byte logical 
blocks: (0 B/0 B)
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] 0-byte physical blocks
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Write Protect is off
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Mode Sense: 00 00 00 00
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Asking for cache data failed
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Assuming drive cache: 
write through
Dez 21 10:22:08 abreu kernel: sd 0:0:0:0: [sda] Attached SCSI disk
Dez 21 10:22:08 abreu systemd-coredump[5647]: Process 386 
(systemd-journal) of user 0 terminated abnormally with signal 6/ABRT, 
processing...
Dez 21 10:22:08 abreu systemd-coredump[5647]: Process 386 
(systemd-journal) of user 0 dumped core.
Dez 21 10:22:08 abreu systemd-coredump[5647]: Coredump diverted to 
/var/lib/systemd/coredump/core.systemd-journal.0.05a680906c62416790aa2d9b90677a90.386.1734772928000000.zst
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module libzstd.so.1 from 
deb libzstd-1.5.6+dfsg-1+b1.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module libmount.so.1 from 
deb util-linux-2.40.2-12.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module libblkid.so.1 from 
deb util-linux-2.40.2-12.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Module 
libsystemd-shared-257.so from deb systemd-257.1-2.amd64
Dez 21 10:22:08 abreu systemd-coredump[5647]: Stack trace of thread 386:
Dez 21 10:22:08 abreu systemd-coredump[5647]: #0  0x00007f081410d49c 
__GI___libc_read (libc.so.6 + 0x10349c)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #1  0x00007f08143f0121 
read_virtual_file_fd (libsystemd-shared-257.so + 0x1f0121)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #2  0x00007f08143f0368 
read_virtual_file_at (libsystemd-shared-257.so + 0x1f0368)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #3  0x00007f08144c213b 
device_read_uevent_file (libsystemd-shared-257.so + 0x2c213b)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #4  0x00007f08144c325a 
sd_device_get_devname (libsystemd-shared-257.so + 0x2c325a)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #5  0x0000555b6e97c36e n/a 
(n/a + 0x0)
Dez 21 10:22:08 abreu systemd-coredump[5647]: #6  0x0000000000000016 n/a 
(n/a + 0x0)
Dez 21 10:22:08 abreu systemd-coredump[5647]: ELF object binary 
architecture: AMD x86-64
Dez 21 10:22:08 abreu systemd[1]: systemd-journald.service: Main process 
exited, code=dump
[…]

### Linux 6.12.6-1 (Debian)

Jan 10 18:31:56 abreu kernel: usb 2-1: USB disconnect, device number 2
Jan 10 18:31:56 abreu udisksd[632]: Couldn't find existing drive object 
for device 
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/host0/target0:0:0/0:0:0:0/block/sda 
(ue
vent action 'change', VPD 'pci-0000:00:14.0')
Jan 10 18:31:57 abreu kernel: usb 2-1: new SuperSpeed USB device number 
3 using xhci_hcd
Jan 10 18:31:58 abreu kernel: usb 2-1: New USB device found, 
idVendor=0781, idProduct=5580, bcdDevice= 0.10
Jan 10 18:31:58 abreu kernel: usb 2-1: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Jan 10 18:31:58 abreu kernel: usb 2-1: Product: Extreme
Jan 10 18:31:58 abreu kernel: usb 2-1: Manufacturer: SanDisk
Jan 10 18:31:58 abreu kernel: usb 2-1: SerialNumber: AA010316151450491977
Jan 10 18:31:58 abreu kernel: usb-storage 2-1:1.0: USB Mass Storage 
device detected
Jan 10 18:31:58 abreu kernel: scsi host0: usb-storage 2-1:1.0
Jan 10 18:31:58 abreu mtp-probe[230728]: checking bus 2, device 3: 
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Jan 10 18:31:58 abreu mtp-probe[230728]: bus: 2, device: 3 was not an 
MTP device
Jan 10 18:31:58 abreu mtp-probe[230730]: checking bus 2, device 3: 
"/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1"
Jan 10 18:31:58 abreu mtp-probe[230730]: bus: 2, device: 3 was not an 
MTP device
Jan 10 18:31:59 abreu kernel: scsi 0:0:0:0: Direct-Access     SanDisk 
Extreme          0001 PQ: 0 ANSI: 6
Jan 10 18:31:59 abreu kernel: sd 0:0:0:0: Attached scsi generic sg0 type 0
Jan 10 18:31:59 abreu kernel: sd 0:0:0:0: [sda] 122544516 512-byte 
logical blocks: (62.7 GB/58.4 GiB)
Jan 10 18:31:59 abreu kernel: sd 0:0:0:0: [sda] Write Protect is off
Jan 10 18:31:59 abreu kernel: sd 0:0:0:0: [sda] Mode Sense: 53 00 00 08
Jan 10 18:31:59 abreu kernel: sd 0:0:0:0: [sda] Write cache: disabled, 
read cache: enabled, doesn't support DPO or FUA
Jan 10 18:31:59 abreu kernel:  sda: sda1
Jan 10 18:31:59 abreu kernel: sd 0:0:0:0: [sda] Attached SCSI removable disk
Jan 10 18:31:59 abreu fwupd[206462]: 17:31:59.184 FuEngine 
failed to add device 
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/host0/target0:0:0/0:0:0:0/block/sda: 
failed to setup: failed to read version: command fail with status 2, 
senseKey 0x05, asc 0x20, ascq 0x00
Jan 10 18:32:12 abreu kernel: EXT4-fs (sda1): mounted filesystem 
031e1c8a-d3d4-457e-a358-6e48111602cb r/w with ordered data mode. Quota 
mode: none.
Jan 10 18:32:12 abreu udisksd[632]: Mounted /dev/sda1 at 
/media/pmenzel/sandisk on behalf of uid 5272
Jan 10 18:32:27 abreu kernel: EXT4-fs (sda1): unmounting filesystem 
031e1c8a-d3d4-457e-a358-6e48111602cb.
Jan 10 18:32:27 abreu systemd[1]: media-pmenzel-sandisk.mount: 
Deactivated successfully.
Jan 10 18:32:27 abreu udisksd[632]: Cleaning up mount point 
/media/pmenzel/sandisk (device 8:1 is not mounted)
Jan 10 18:32:27 abreu udisksd[632]: Unmounted /dev/sda1 on behalf of uid 
5272
Jan 10 18:32:30 abreu kernel: usb 2-1: USB disconnect, device number 3
Jan 10 18:32:30 abreu kernel: xhci_hcd 0000:00:14.0: WARN Set TR Deq Ptr 
cmd failed due to incorrect slot or ep state.
Jan 10 18:32:30 abreu udisksd[632]: Couldn't find existing drive object 
for device 
/sys/devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/host0/target0:0:0/0:0:0:0/block/sda 
(uevent action 'change', VPD 'pci-0000:00:14.0')
Jan 10 18:32:33 abreu kernel: usb 2-2: new SuperSpeed USB device number 
4 using xhci_hcd
Jan 10 18:32:33 abreu kernel: usb 2-2: New USB device found, 
idVendor=0781, idProduct=5580, bcdDevice= 0.10
Jan 10 18:32:33 abreu kernel: usb 2-2: New USB device strings: Mfr=1, 
Product=2, SerialNumber=3
Jan 10 18:32:33 abreu kernel: usb 2-2: Product: Extreme
Jan 10 18:32:33 abreu kernel: usb 2-2: Manufacturer: SanDisk
Jan 10 18:32:33 abreu kernel: usb 2-2: SerialNumber: AA010316151450491977
Jan 10 18:32:33 abreu kernel: usb-storage 2-2:1.0: USB Mass Storage 
device detected
Jan 10 18:32:33 abreu kernel: scsi host0: usb-storage 2-2:1.0
--------------oejv6gGTqF8qlgEPhAyEdYyv
Content-Type: text/plain; charset=UTF-8;
 name="20250403--dell-xps-13-9360--linux-6.14.0-12966-ga2cc6ff5ec8f--messages.txt"
Content-Disposition: attachment;
 filename*0="20250403--dell-xps-13-9360--linux-6.14.0-12966-ga2cc6ff5ec8f";
 filename*1="--messages.txt"
Content-Transfer-Encoding: base64

WyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjE0LjAtMTI5NjYtZ2EyY2M2ZmY1ZWM4
ZiAoYnVpbGRAYm9oZW1pYW5yaGFwc29keS5tb2xnZW4ubXBnLmRlKSAoZ2NjIChEZWJpYW4g
MTQuMi4wLTE5KSAxNC4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzIGZvciBEZWJpYW4pIDIu
NDQpICMxMzIgU01QIFBSRUVNUFRfRFlOQU1JQyBUaHUgQXByICAzIDE2OjU5OjQ1IENFU1Qg
MjAyNQpbICAgIDAuMDAwMDAwXSBDb21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9L3ZtbGludXot
Ni4xNC4wLTEyOTY2LWdhMmNjNmZmNWVjOGYgcm9vdD1VVUlEPTMyZTI5ODgyLWQ5NGQtNGE5
Mi05ZWU0LTRkMDMwMDJiZmEyOSBybyBxdWlldCBwY2k9bm9hZXIgbWVtX3NsZWVwX2RlZmF1
bHQ9ZGVlcCBsb2dfYnVmX2xlbj0xNk0gY3J5cHRvbWdyLm5vdGVzdHMKWyAgICAwLjAwMDAw
MF0gQklPUy1wcm92aWRlZCBwaHlzaWNhbCBSQU0gbWFwOgpbICAgIDAuMDAwMDAwXSBCSU9T
LWU4MjA6IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDAwMDA1N2ZmZl0gdXNh
YmxlClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwNTgwMDAt
MHgwMDAwMDAwMDAwMDU4ZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6
IFttZW0gMHgwMDAwMDAwMDAwMDU5MDAwLTB4MDAwMDAwMDAwMDA5ZGZmZl0gdXNhYmxlClsg
ICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwOWUwMDAtMHgwMDAw
MDAwMDAwMGZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0g
MHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDA1NTZhYWZmZl0gdXNhYmxlClsgICAgMC4w
MDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwNTU2YWIwMDAtMHgwMDAwMDAwMDU1
NmFiZmZmXSBBQ1BJIE5WUwpbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAw
MDAwMDU1NmFjMDAwLTB4MDAwMDAwMDA1NTZhY2ZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAw
MF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDA1NTZhZDAwMC0weDAwMDAwMDAwNjRkZjNm
ZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDY0
ZGY0MDAwLTB4MDAwMDAwMDA2NTE3ZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklP
Uy1lODIwOiBbbWVtIDB4MDAwMDAwMDA2NTE4MDAwMC0weDAwMDAwMDAwNjUxYzNmZmZdIEFD
UEkgZGF0YQpbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDY1MWM0
MDAwLTB4MDAwMDAwMDA2Zjg3MWZmZl0gQUNQSSBOVlMKWyAgICAwLjAwMDAwMF0gQklPUy1l
ODIwOiBbbWVtIDB4MDAwMDAwMDA2Zjg3MjAwMC0weDAwMDAwMDAwNmZmZmVmZmZdIHJlc2Vy
dmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwNmZmZmYwMDAt
MHgwMDAwMDAwMDZmZmZmZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBb
bWVtIDB4MDAwMDAwMDA3MDAwMDAwMC0weDAwMDAwMDAwNzdmZmZmZmZdIHJlc2VydmVkClsg
ICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwNzgwMDAwMDAtMHgwMDAw
MDAwMDc4NWZmZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4
MDAwMDAwMDA3ODYwMDAwMC0weDAwMDAwMDAwN2M3ZmZmZmZdIHJlc2VydmVkClsgICAgMC4w
MDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwZTAwMDAwMDAtMHgwMDAwMDAwMGVm
ZmZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAw
MDAwMGZlMDAwMDAwLTB4MDAwMDAwMDBmZTAxMGZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAw
MF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDBmZWMwMDAwMC0weDAwMDAwMDAwZmVjMDBm
ZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAw
ZmVlMDAwMDAtMHgwMDAwMDAwMGZlZTAwZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBC
SU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGZmMDAwMDAwLTB4MDAwMDAwMDBmZmZmZmZmZl0g
cmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDEwMDAw
MDAwMC0weDAwMDAwMDA0ODE3ZmZmZmZdIHVzYWJsZQpbICAgIDAuMDAwMDAwXSBOWCAoRXhl
Y3V0ZSBEaXNhYmxlKSBwcm90ZWN0aW9uOiBhY3RpdmUKWyAgICAwLjAwMDAwMF0gQVBJQzog
U3RhdGljIGNhbGxzIGluaXRpYWxpemVkClsgICAgMC4wMDAwMDBdIGVmaTogRUZJIHYyLjQg
YnkgQW1lcmljYW4gTWVnYXRyZW5kcwpbICAgIDAuMDAwMDAwXSBlZmk6IEFDUEk9MHg2NTE4
ZDAwMCBBQ1BJIDIuMD0weDY1MThkMDAwIFNNQklPUz0weGYwMDAwIFNNQklPUyAzLjA9MHhm
MDAyMCBUUE1GaW5hbExvZz0weDZmODEyMDAwIEVTUlQ9MHg2ZmM4NjY5OCBNRU1BVFRSPTB4
NjI2NzUwMTggSU5JVFJEPTB4NTU3N2RhOTggVFBNRXZlbnRMb2c9MHg2NTE4ODAxOCAKWyAg
ICAwLjAwMDAwMF0gZWZpOiBSZW1vdmUgbWVtMzY6IE1NSU8gcmFuZ2U9WzB4ZTAwMDAwMDAt
MHhlZmZmZmZmZl0gKDI1Nk1CKSBmcm9tIGU4MjAgbWFwClsgICAgMC4wMDAwMDBdIGU4MjA6
IHJlbW92ZSBbbWVtIDB4ZTAwMDAwMDAtMHhlZmZmZmZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAw
MDAwMF0gZWZpOiBOb3QgcmVtb3ZpbmcgbWVtMzc6IE1NSU8gcmFuZ2U9WzB4ZmUwMDAwMDAt
MHhmZTAxMGZmZl0gKDY4S0IpIGZyb20gZTgyMCBtYXAKWyAgICAwLjAwMDAwMF0gZWZpOiBO
b3QgcmVtb3ZpbmcgbWVtMzg6IE1NSU8gcmFuZ2U9WzB4ZmVjMDAwMDAtMHhmZWMwMGZmZl0g
KDRLQikgZnJvbSBlODIwIG1hcApbICAgIDAuMDAwMDAwXSBlZmk6IE5vdCByZW1vdmluZyBt
ZW0zOTogTU1JTyByYW5nZT1bMHhmZWUwMDAwMC0weGZlZTAwZmZmXSAoNEtCKSBmcm9tIGU4
MjAgbWFwClsgICAgMC4wMDAwMDBdIGVmaTogUmVtb3ZlIG1lbTQwOiBNTUlPIHJhbmdlPVsw
eGZmMDAwMDAwLTB4ZmZmZmZmZmZdICgxNk1CKSBmcm9tIGU4MjAgbWFwClsgICAgMC4wMDAw
MDBdIGU4MjA6IHJlbW92ZSBbbWVtIDB4ZmYwMDAwMDAtMHhmZmZmZmZmZl0gcmVzZXJ2ZWQK
WyAgICAwLjAwMDAwMF0gU01CSU9TIDMuMC4wIHByZXNlbnQuClsgICAgMC4wMDAwMDBdIERN
STogRGVsbCBJbmMuIFhQUyAxMyA5MzYwLzA1OTZLRiwgQklPUyAyLjIxLjAgMDYvMDIvMjAy
MgpbICAgIDAuMDAwMDAwXSBETUk6IE1lbW9yeSBzbG90cyBwb3B1bGF0ZWQ6IDIvMgpbICAg
IDAuMDAwMDAwXSB0c2M6IERldGVjdGVkIDI5MDAuMDAwIE1IeiBwcm9jZXNzb3IKWyAgICAw
LjAwMDAwMF0gdHNjOiBEZXRlY3RlZCAyODk5Ljg4NiBNSHogVFNDClsgICAgMC4wMDA1ODdd
IGU4MjA6IHVwZGF0ZSBbbWVtIDB4MDAwMDAwMDAtMHgwMDAwMGZmZl0gdXNhYmxlID09PiBy
ZXNlcnZlZApbICAgIDAuMDAwNTg5XSBlODIwOiByZW1vdmUgW21lbSAweDAwMGEwMDAwLTB4
MDAwZmZmZmZdIHVzYWJsZQpbICAgIDAuMDAwNTk0XSBsYXN0X3BmbiA9IDB4NDgxODAwIG1h
eF9hcmNoX3BmbiA9IDB4NDAwMDAwMDAwClsgICAgMC4wMDA1OTddIE1UUlIgbWFwOiA0IGVu
dHJpZXMgKDMgZml4ZWQgKyAxIHZhcmlhYmxlOyBtYXggMjMpLCBidWlsdCBmcm9tIDEwIHZh
cmlhYmxlIE1UUlJzClsgICAgMC4wMDA1OTldIHg4Ni9QQVQ6IENvbmZpZ3VyYXRpb24gWzAt
N106IFdCICBXQyAgVUMtIFVDICBXQiAgV1AgIFVDLSBXVCAgClsgICAgMC4wMDA4ODddIGxh
c3RfcGZuID0gMHg3ODYwMCBtYXhfYXJjaF9wZm4gPSAweDQwMDAwMDAwMApbICAgIDAuMDA2
ODc2XSBlc3J0OiBSZXNlcnZpbmcgRVNSVCBzcGFjZSBmcm9tIDB4MDAwMDAwMDA2ZmM4NjY5
OCB0byAweDAwMDAwMDAwNmZjODY2ZDAuClsgICAgMC4wMDY4ODJdIFVzaW5nIEdCIHBhZ2Vz
IGZvciBkaXJlY3QgbWFwcGluZwpbICAgIDAuMDE5MjA4XSBwcmludGs6IGxvZyBidWZmZXIg
ZGF0YSArIG1ldGEgZGF0YTogMTY3NzcyMTYgKyA1ODcyMDI1NiA9IDc1NDk3NDcyIGJ5dGVz
ClsgICAgMC4wMTkyMDldIHByaW50azogZWFybHkgbG9nIGJ1ZiBmcmVlOiAxMjczODQoOTcl
KQpbICAgIDAuMDE5MjEwXSBTZWN1cmUgYm9vdCBkaXNhYmxlZApbICAgIDAuMDE5MjExXSBS
QU1ESVNLOiBbbWVtIDB4NTE0ZTYwMDAtMHg1MjUyYWZmZl0KWyAgICAwLjAxOTIxNV0gQUNQ
STogRWFybHkgdGFibGUgY2hlY2tzdW0gdmVyaWZpY2F0aW9uIGRpc2FibGVkClsgICAgMC4w
MTkyMTddIEFDUEk6IFJTRFAgMHgwMDAwMDAwMDY1MThEMDAwIDAwMDAyNCAodjAyIERFTEwg
ICkKWyAgICAwLjAxOTIyMF0gQUNQSTogWFNEVCAweDAwMDAwMDAwNjUxOEQwQzggMDAwMTBD
ICh2MDEgREVMTCAgIENCWDMgICAgIDAxMDcyMDA5IEFNSSAgMDAwMTAwMTMpClsgICAgMC4w
MTkyMjVdIEFDUEk6IEZBQ1AgMHgwMDAwMDAwMDY1MUIyQTQ4IDAwMDEwQyAodjA1IERFTEwg
ICBDQlgzICAgICAwMTA3MjAwOSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMDE5MjI4XSBBQ1BJ
OiBEU0RUIDB4MDAwMDAwMDA2NTE4RDI2MCAwMjU3RTcgKHYwMiBERUxMICAgQ0JYMyAgICAg
MDEwNzIwMDkgSU5UTCAyMDE2MDQyMikKWyAgICAwLjAxOTIzMF0gQUNQSTogRkFDUyAweDAw
MDAwMDAwNkY4NkYxODAgMDAwMDQwClsgICAgMC4wMTkyMzJdIEFDUEk6IEFQSUMgMHgwMDAw
MDAwMDY1MUIyQjU4IDAwMDA4NCAodjAzIERFTEwgICBDQlgzICAgICAwMTA3MjAwOSBBTUkg
IDAwMDEwMDEzKQpbICAgIDAuMDE5MjM0XSBBQ1BJOiBGUERUIDB4MDAwMDAwMDA2NTFCMkJF
MCAwMDAwNDQgKHYwMSBERUxMICAgQ0JYMyAgICAgMDEwNzIwMDkgQU1JICAwMDAxMDAxMykK
WyAgICAwLjAxOTIzNl0gQUNQSTogRklEVCAweDAwMDAwMDAwNjUxQjJDMjggMDAwMEFDICh2
MDEgREVMTCAgIENCWDMgICAgIDAxMDcyMDA5IEFNSSAgMDAwMTAwMTMpClsgICAgMC4wMTky
MzhdIEFDUEk6IE1DRkcgMHgwMDAwMDAwMDY1MUIyQ0Q4IDAwMDAzQyAodjAxIERFTEwgICBD
QlgzICAgICAwMTA3MjAwOSBNU0ZUIDAwMDAwMDk3KQpbICAgIDAuMDE5MjQwXSBBQ1BJOiBI
UEVUIDB4MDAwMDAwMDA2NTFCMkQxOCAwMDAwMzggKHYwMSBERUxMICAgQ0JYMyAgICAgMDEw
NzIwMDkgQU1JLiAwMDA1MDAwQikKWyAgICAwLjAxOTI0MV0gQUNQSTogU1NEVCAweDAwMDAw
MDAwNjUxQjJENTAgMDAwMzU5ICh2MDEgU2F0YVJlIFNhdGFUYWJsIDAwMDAxMDAwIElOVEwg
MjAxNjA0MjIpClsgICAgMC4wMTkyNDNdIEFDUEk6IEJPT1QgMHgwMDAwMDAwMDY1MUIzMEIw
IDAwMDAyOCAodjAxIERFTEwgICBDQlgzICAgICAwMTA3MjAwOSBBTUkgIDAwMDEwMDEzKQpb
ICAgIDAuMDE5MjQ1XSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA2NTFCMzBEOCAwMDEyQ0YgKHYw
MiBTYVNzZHQgU2FTc2R0ICAgMDAwMDMwMDAgSU5UTCAyMDE2MDQyMikKWyAgICAwLjAxOTI0
N10gQUNQSTogSFBFVCAweDAwMDAwMDAwNjUxQjQzQTggMDAwMDM4ICh2MDEgSU5URUwgIEtC
TC1VTFQgIDAwMDAwMDAxIE1TRlQgMDAwMDAwNUYpClsgICAgMC4wMTkyNDldIEFDUEk6IFNT
RFQgMHgwMDAwMDAwMDY1MUI0M0UwIDAwMEQ4NCAodjAyIElOVEVMICB4aF9ydnAwNyAwMDAw
MDAwMCBJTlRMIDIwMTYwNDIyKQpbICAgIDAuMDE5MjUxXSBBQ1BJOiBVRUZJIDB4MDAwMDAw
MDA2NTFCNTE2OCAwMDAwNDIgKHYwMSAgICAgICAgICAgICAgICAgMDAwMDAwMDAgICAgICAw
MDAwMDAwMCkKWyAgICAwLjAxOTI1M10gQUNQSTogU1NEVCAweDAwMDAwMDAwNjUxQjUxQjAg
MDAwRURFICh2MDIgQ3B1UmVmIENwdVNzZHQgIDAwMDAzMDAwIElOVEwgMjAxNjA0MjIpClsg
ICAgMC4wMTkyNTVdIEFDUEk6IExQSVQgMHgwMDAwMDAwMDY1MUI2MDkwIDAwMDA5NCAodjAx
IElOVEVMICBLQkwtVUxUICAwMDAwMDAwMCBNU0ZUIDAwMDAwMDVGKQpbICAgIDAuMDE5MjU3
XSBBQ1BJOiBXU01UIDB4MDAwMDAwMDA2NTFCNjEyOCAwMDAwMjggKHYwMSBERUxMICAgQ0JY
MyAgICAgMDAwMDAwMDAgTVNGVCAwMDAwMDA1RikKWyAgICAwLjAxOTI1OF0gQUNQSTogU1NE
VCAweDAwMDAwMDAwNjUxQjYxNTAgMDAwMTYxICh2MDIgSU5URUwgIEhkYURzcCAgIDAwMDAw
MDAwIElOVEwgMjAxNjA0MjIpClsgICAgMC4wMTkyNjBdIEFDUEk6IFNTRFQgMHgwMDAwMDAw
MDY1MUI2MkI4IDAwMDI5RiAodjAyIElOVEVMICBzZW5zcmh1YiAwMDAwMDAwMCBJTlRMIDIw
MTYwNDIyKQpbICAgIDAuMDE5MjYyXSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA2NTFCNjU1OCAw
MDMwMDIgKHYwMiBJTlRFTCAgUHRpZERldmMgMDAwMDEwMDAgSU5UTCAyMDE2MDQyMikKWyAg
ICAwLjAxOTI2NV0gQUNQSTogU1NEVCAweDAwMDAwMDAwNjUxQjk1NjAgMDAwMERCICh2MDIg
SU5URUwgIFRidFR5cGVDIDAwMDAwMDAwIElOVEwgMjAxNjA0MjIpClsgICAgMC4wMTkyNjdd
IEFDUEk6IERCR1AgMHgwMDAwMDAwMDY1MUI5NjQwIDAwMDAzNCAodjAxIElOVEVMICAgICAg
ICAgICAwMDAwMDAwMiBNU0ZUIDAwMDAwMDVGKQpbICAgIDAuMDE5MjY5XSBBQ1BJOiBEQkcy
IDB4MDAwMDAwMDA2NTFCOTY3OCAwMDAwNTQgKHYwMCBJTlRFTCAgICAgICAgICAgMDAwMDAw
MDIgTVNGVCAwMDAwMDA1RikKWyAgICAwLjAxOTI3MV0gQUNQSTogU1NEVCAweDAwMDAwMDAw
NjUxQjk2RDAgMDAwN0REICh2MDIgSU5URUwgIFVzYkNUYWJsIDAwMDAxMDAwIElOVEwgMjAx
NjA0MjIpClsgICAgMC4wMTkyNzNdIEFDUEk6IFNTRFQgMHgwMDAwMDAwMDY1MUI5RUIwIDAw
ODRGMSAodjAyIERwdGZUYSBEcHRmVGFibCAwMDAwMTAwMCBJTlRMIDIwMTYwNDIyKQpbICAg
IDAuMDE5Mjc1XSBBQ1BJOiBTTElDIDB4MDAwMDAwMDA2NTFDMjNBOCAwMDAxNzYgKHYwMyBE
RUxMICAgQ0JYMyAgICAgMDEwNzIwMDkgTVNGVCAwMDAxMDAxMykKWyAgICAwLjAxOTI3N10g
QUNQSTogTkhMVCAweDAwMDAwMDAwNjUxQzI1MjAgMDAwMDJEICh2MDAgSU5URUwgIEVESzIg
ICAgIDAwMDAwMDAyICAgICAgMDEwMDAwMTMpClsgICAgMC4wMTkyNzldIEFDUEk6IEJHUlQg
MHgwMDAwMDAwMDY1MUMyNTUwIDAwMDAzOCAodjAwICAgICAgICAgICAgICAgICAwMTA3MjAw
OSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMDE5MjgxXSBBQ1BJOiBUUE0yIDB4MDAwMDAwMDA2
NTFDMjU4OCAwMDAwMzQgKHYwMyAgICAgICAgVHBtMlRhYmwgMDAwMDAwMDEgQU1JICAwMDAw
MDAwMCkKWyAgICAwLjAxOTI4Ml0gQUNQSTogQVNGISAweDAwMDAwMDAwNjUxQzI1QzAgMDAw
MEEwICh2MzIgSU5URUwgICBIQ0cgICAgIDAwMDAwMDAxIFRGU00gMDAwRjQyNDApClsgICAg
MC4wMTkyODRdIEFDUEk6IERNQVIgMHgwMDAwMDAwMDY1MUMyNjYwIDAwMDBGMCAodjAxIElO
VEVMICBLQkwgICAgICAwMDAwMDAwMSBJTlRMIDAwMDAwMDAxKQpbICAgIDAuMDE5Mjg2XSBB
Q1BJOiBSZXNlcnZpbmcgRkFDUCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDY1MWIyYTQ4LTB4
NjUxYjJiNTNdClsgICAgMC4wMTkyODddIEFDUEk6IFJlc2VydmluZyBEU0RUIHRhYmxlIG1l
bW9yeSBhdCBbbWVtIDB4NjUxOGQyNjAtMHg2NTFiMmE0Nl0KWyAgICAwLjAxOTI4OF0gQUNQ
STogUmVzZXJ2aW5nIEZBQ1MgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg2Zjg2ZjE4MC0weDZm
ODZmMWJmXQpbICAgIDAuMDE5Mjg4XSBBQ1BJOiBSZXNlcnZpbmcgQVBJQyB0YWJsZSBtZW1v
cnkgYXQgW21lbSAweDY1MWIyYjU4LTB4NjUxYjJiZGJdClsgICAgMC4wMTkyODldIEFDUEk6
IFJlc2VydmluZyBGUERUIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NjUxYjJiZTAtMHg2NTFi
MmMyM10KWyAgICAwLjAxOTI4OV0gQUNQSTogUmVzZXJ2aW5nIEZJRFQgdGFibGUgbWVtb3J5
IGF0IFttZW0gMHg2NTFiMmMyOC0weDY1MWIyY2QzXQpbICAgIDAuMDE5MjkwXSBBQ1BJOiBS
ZXNlcnZpbmcgTUNGRyB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDY1MWIyY2Q4LTB4NjUxYjJk
MTNdClsgICAgMC4wMTkyOTBdIEFDUEk6IFJlc2VydmluZyBIUEVUIHRhYmxlIG1lbW9yeSBh
dCBbbWVtIDB4NjUxYjJkMTgtMHg2NTFiMmQ0Zl0KWyAgICAwLjAxOTI5MV0gQUNQSTogUmVz
ZXJ2aW5nIFNTRFQgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg2NTFiMmQ1MC0weDY1MWIzMGE4
XQpbICAgIDAuMDE5MjkyXSBBQ1BJOiBSZXNlcnZpbmcgQk9PVCB0YWJsZSBtZW1vcnkgYXQg
W21lbSAweDY1MWIzMGIwLTB4NjUxYjMwZDddClsgICAgMC4wMTkyOTJdIEFDUEk6IFJlc2Vy
dmluZyBTU0RUIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NjUxYjMwZDgtMHg2NTFiNDNhNl0K
WyAgICAwLjAxOTI5M10gQUNQSTogUmVzZXJ2aW5nIEhQRVQgdGFibGUgbWVtb3J5IGF0IFtt
ZW0gMHg2NTFiNDNhOC0weDY1MWI0M2RmXQpbICAgIDAuMDE5MjkzXSBBQ1BJOiBSZXNlcnZp
bmcgU1NEVCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDY1MWI0M2UwLTB4NjUxYjUxNjNdClsg
ICAgMC4wMTkyOTRdIEFDUEk6IFJlc2VydmluZyBVRUZJIHRhYmxlIG1lbW9yeSBhdCBbbWVt
IDB4NjUxYjUxNjgtMHg2NTFiNTFhOV0KWyAgICAwLjAxOTI5NF0gQUNQSTogUmVzZXJ2aW5n
IFNTRFQgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg2NTFiNTFiMC0weDY1MWI2MDhkXQpbICAg
IDAuMDE5Mjk1XSBBQ1BJOiBSZXNlcnZpbmcgTFBJVCB0YWJsZSBtZW1vcnkgYXQgW21lbSAw
eDY1MWI2MDkwLTB4NjUxYjYxMjNdClsgICAgMC4wMTkyOTVdIEFDUEk6IFJlc2VydmluZyBX
U01UIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NjUxYjYxMjgtMHg2NTFiNjE0Zl0KWyAgICAw
LjAxOTI5Nl0gQUNQSTogUmVzZXJ2aW5nIFNTRFQgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg2
NTFiNjE1MC0weDY1MWI2MmIwXQpbICAgIDAuMDE5Mjk3XSBBQ1BJOiBSZXNlcnZpbmcgU1NE
VCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDY1MWI2MmI4LTB4NjUxYjY1NTZdClsgICAgMC4w
MTkyOTddIEFDUEk6IFJlc2VydmluZyBTU0RUIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NjUx
YjY1NTgtMHg2NTFiOTU1OV0KWyAgICAwLjAxOTI5OF0gQUNQSTogUmVzZXJ2aW5nIFNTRFQg
dGFibGUgbWVtb3J5IGF0IFttZW0gMHg2NTFiOTU2MC0weDY1MWI5NjNhXQpbICAgIDAuMDE5
Mjk4XSBBQ1BJOiBSZXNlcnZpbmcgREJHUCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDY1MWI5
NjQwLTB4NjUxYjk2NzNdClsgICAgMC4wMTkyOTldIEFDUEk6IFJlc2VydmluZyBEQkcyIHRh
YmxlIG1lbW9yeSBhdCBbbWVtIDB4NjUxYjk2NzgtMHg2NTFiOTZjYl0KWyAgICAwLjAxOTI5
OV0gQUNQSTogUmVzZXJ2aW5nIFNTRFQgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg2NTFiOTZk
MC0weDY1MWI5ZWFjXQpbICAgIDAuMDE5MzAwXSBBQ1BJOiBSZXNlcnZpbmcgU1NEVCB0YWJs
ZSBtZW1vcnkgYXQgW21lbSAweDY1MWI5ZWIwLTB4NjUxYzIzYTBdClsgICAgMC4wMTkzMDBd
IEFDUEk6IFJlc2VydmluZyBTTElDIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NjUxYzIzYTgt
MHg2NTFjMjUxZF0KWyAgICAwLjAxOTMwMV0gQUNQSTogUmVzZXJ2aW5nIE5ITFQgdGFibGUg
bWVtb3J5IGF0IFttZW0gMHg2NTFjMjUyMC0weDY1MWMyNTRjXQpbICAgIDAuMDE5MzAxXSBB
Q1BJOiBSZXNlcnZpbmcgQkdSVCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDY1MWMyNTUwLTB4
NjUxYzI1ODddClsgICAgMC4wMTkzMDJdIEFDUEk6IFJlc2VydmluZyBUUE0yIHRhYmxlIG1l
bW9yeSBhdCBbbWVtIDB4NjUxYzI1ODgtMHg2NTFjMjViYl0KWyAgICAwLjAxOTMwM10gQUNQ
STogUmVzZXJ2aW5nIEFTRiEgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg2NTFjMjVjMC0weDY1
MWMyNjVmXQpbICAgIDAuMDE5MzAzXSBBQ1BJOiBSZXNlcnZpbmcgRE1BUiB0YWJsZSBtZW1v
cnkgYXQgW21lbSAweDY1MWMyNjYwLTB4NjUxYzI3NGZdClsgICAgMC4wMTk0MjBdIE5vIE5V
TUEgY29uZmlndXJhdGlvbiBmb3VuZApbICAgIDAuMDE5NDIwXSBGYWtpbmcgYSBub2RlIGF0
IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDQ4MTdmZmZmZl0KWyAgICAwLjAx
OTQyOF0gTk9ERV9EQVRBKDApIGFsbG9jYXRlZCBbbWVtIDB4NDdjZmQ1NjQwLTB4NDdjZmZm
ZmZmXQpbICAgIDAuMDE5NjA5XSBab25lIHJhbmdlczoKWyAgICAwLjAxOTYxMF0gICBETUEg
ICAgICBbbWVtIDB4MDAwMDAwMDAwMDAwMTAwMC0weDAwMDAwMDAwMDBmZmZmZmZdClsgICAg
MC4wMTk2MTJdICAgRE1BMzIgICAgW21lbSAweDAwMDAwMDAwMDEwMDAwMDAtMHgwMDAwMDAw
MGZmZmZmZmZmXQpbICAgIDAuMDE5NjEzXSAgIE5vcm1hbCAgIFttZW0gMHgwMDAwMDAwMTAw
MDAwMDAwLTB4MDAwMDAwMDQ4MTdmZmZmZl0KWyAgICAwLjAxOTYxNF0gICBEZXZpY2UgICBl
bXB0eQpbICAgIDAuMDE5NjE1XSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpb
ICAgIDAuMDE5NjE3XSBFYXJseSBtZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAxOTYxN10g
ICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwMDAwMDEwMDAtMHgwMDAwMDAwMDAwMDU3ZmZm
XQpbICAgIDAuMDE5NjE4XSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDAwMDA1OTAwMC0w
eDAwMDAwMDAwMDAwOWRmZmZdClsgICAgMC4wMTk2MTldICAgbm9kZSAgIDA6IFttZW0gMHgw
MDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDA1NTZhYWZmZl0KWyAgICAwLjAxOTYyMF0gICBu
b2RlICAgMDogW21lbSAweDAwMDAwMDAwNTU2YWQwMDAtMHgwMDAwMDAwMDY0ZGYzZmZmXQpb
ICAgIDAuMDE5NjIwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDA2ZmZmZjAwMC0weDAw
MDAwMDAwNmZmZmZmZmZdClsgICAgMC4wMTk2MjFdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAw
MDAwMDc4MDAwMDAwLTB4MDAwMDAwMDA3ODVmZmZmZl0KWyAgICAwLjAxOTYyMV0gICBub2Rl
ICAgMDogW21lbSAweDAwMDAwMDAxMDAwMDAwMDAtMHgwMDAwMDAwNDgxN2ZmZmZmXQpbICAg
IDAuMDE5NjIzXSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAwMDAwMDAwMDAwMTAw
MC0weDAwMDAwMDA0ODE3ZmZmZmZdClsgICAgMC4wMTk2MjddIE9uIG5vZGUgMCwgem9uZSBE
TUE6IDEgcGFnZXMgaW4gdW5hdmFpbGFibGUgcmFuZ2VzClsgICAgMC4wMTk2MjldIE9uIG5v
ZGUgMCwgem9uZSBETUE6IDEgcGFnZXMgaW4gdW5hdmFpbGFibGUgcmFuZ2VzClsgICAgMC4w
MTk2NDldIE9uIG5vZGUgMCwgem9uZSBETUE6IDk4IHBhZ2VzIGluIHVuYXZhaWxhYmxlIHJh
bmdlcwpbICAgIDAuMDIyMTgwXSBPbiBub2RlIDAsIHpvbmUgRE1BMzI6IDIgcGFnZXMgaW4g
dW5hdmFpbGFibGUgcmFuZ2VzClsgICAgMC4wMjI1ODldIE9uIG5vZGUgMCwgem9uZSBETUEz
MjogNDU1NzkgcGFnZXMgaW4gdW5hdmFpbGFibGUgcmFuZ2VzClsgICAgMC4wMjMwOTNdIE9u
IG5vZGUgMCwgem9uZSBOb3JtYWw6IDMxMjMyIHBhZ2VzIGluIHVuYXZhaWxhYmxlIHJhbmdl
cwpbICAgIDAuMDIzMzQwXSBPbiBub2RlIDAsIHpvbmUgTm9ybWFsOiAyNjYyNCBwYWdlcyBp
biB1bmF2YWlsYWJsZSByYW5nZXMKWyAgICAwLjAyMzM0N10gUmVzZXJ2aW5nIEludGVsIGdy
YXBoaWNzIG1lbW9yeSBhdCBbbWVtIDB4N2E4MDAwMDAtMHg3YzdmZmZmZl0KWyAgICAwLjAy
MzUyNl0gQUNQSTogUE0tVGltZXIgSU8gUG9ydDogMHgxODA4ClsgICAgMC4wMjM1MzFdIEFD
UEk6IExBUElDX05NSSAoYWNwaV9pZFsweDAxXSBoaWdoIGVkZ2UgbGludFsweDFdKQpbICAg
IDAuMDIzNTMyXSBBQ1BJOiBMQVBJQ19OTUkgKGFjcGlfaWRbMHgwMl0gaGlnaCBlZGdlIGxp
bnRbMHgxXSkKWyAgICAwLjAyMzUzM10gQUNQSTogTEFQSUNfTk1JIChhY3BpX2lkWzB4MDNd
IGhpZ2ggZWRnZSBsaW50WzB4MV0pClsgICAgMC4wMjM1MzRdIEFDUEk6IExBUElDX05NSSAo
YWNwaV9pZFsweDA0XSBoaWdoIGVkZ2UgbGludFsweDFdKQpbICAgIDAuMDIzNTYwXSBJT0FQ
SUNbMF06IGFwaWNfaWQgMiwgdmVyc2lvbiAzMiwgYWRkcmVzcyAweGZlYzAwMDAwLCBHU0kg
MC0xMTkKWyAgICAwLjAyMzU2Ml0gQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEg
MCBnbG9iYWxfaXJxIDIgZGZsIGRmbCkKWyAgICAwLjAyMzU2M10gQUNQSTogSU5UX1NSQ19P
VlIgKGJ1cyAwIGJ1c19pcnEgOSBnbG9iYWxfaXJxIDkgaGlnaCBsZXZlbCkKWyAgICAwLjAy
MzU2Nl0gQUNQSTogVXNpbmcgQUNQSSAoTUFEVCkgZm9yIFNNUCBjb25maWd1cmF0aW9uIGlu
Zm9ybWF0aW9uClsgICAgMC4wMjM1NjddIEFDUEk6IEhQRVQgaWQ6IDB4ODA4NmE3MDEgYmFz
ZTogMHhmZWQwMDAwMApbICAgIDAuMDIzNTcyXSBlODIwOiB1cGRhdGUgW21lbSAweDYyMjVm
MDAwLTB4NjIzZWJmZmZdIHVzYWJsZSA9PT4gcmVzZXJ2ZWQKWyAgICAwLjAyMzU3OV0gVFND
IGRlYWRsaW5lIHRpbWVyIGF2YWlsYWJsZQpbICAgIDAuMDIzNTgzXSBDUFUgdG9wbzogTWF4
LiBsb2dpY2FsIHBhY2thZ2VzOiAgIDEKWyAgICAwLjAyMzU4NF0gQ1BVIHRvcG86IE1heC4g
bG9naWNhbCBkaWVzOiAgICAgICAxClsgICAgMC4wMjM1ODRdIENQVSB0b3BvOiBNYXguIGRp
ZXMgcGVyIHBhY2thZ2U6ICAgMQpbICAgIDAuMDIzNTg3XSBDUFUgdG9wbzogTWF4LiB0aHJl
YWRzIHBlciBjb3JlOiAgIDIKWyAgICAwLjAyMzU4OF0gQ1BVIHRvcG86IE51bS4gY29yZXMg
cGVyIHBhY2thZ2U6ICAgICAyClsgICAgMC4wMjM1ODhdIENQVSB0b3BvOiBOdW0uIHRocmVh
ZHMgcGVyIHBhY2thZ2U6ICAgNApbICAgIDAuMDIzNTg5XSBDUFUgdG9wbzogQWxsb3dpbmcg
NCBwcmVzZW50IENQVXMgcGx1cyAwIGhvdHBsdWcgQ1BVcwpbICAgIDAuMDIzNjA1XSBQTTog
aGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweDAwMDAwMDAw
LTB4MDAwMDBmZmZdClsgICAgMC4wMjM2MDddIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJl
ZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4MDAwNTgwMDAtMHgwMDA1OGZmZl0KWyAgICAwLjAy
MzYwOF0gUE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0g
MHgwMDA5ZTAwMC0weDAwMGZmZmZmXQpbICAgIDAuMDIzNjEwXSBQTTogaGliZXJuYXRpb246
IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweDU1NmFiMDAwLTB4NTU2YWJmZmZd
ClsgICAgMC4wMjM2MTBdIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVt
b3J5OiBbbWVtIDB4NTU2YWMwMDAtMHg1NTZhY2ZmZl0KWyAgICAwLjAyMzYxMl0gUE06IGhp
YmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHg2MjI1ZjAwMC0w
eDYyM2ViZmZmXQpbICAgIDAuMDIzNjEzXSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQg
bm9zYXZlIG1lbW9yeTogW21lbSAweDY0ZGY0MDAwLTB4NjUxN2ZmZmZdClsgICAgMC4wMjM2
MTNdIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4
NjUxODAwMDAtMHg2NTFjM2ZmZl0KWyAgICAwLjAyMzYxNF0gUE06IGhpYmVybmF0aW9uOiBS
ZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHg2NTFjNDAwMC0weDZmODcxZmZmXQpb
ICAgIDAuMDIzNjE0XSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9y
eTogW21lbSAweDZmODcyMDAwLTB4NmZmZmVmZmZdClsgICAgMC4wMjM2MTVdIFBNOiBoaWJl
cm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4NzAwMDAwMDAtMHg3
N2ZmZmZmZl0KWyAgICAwLjAyMzYxN10gUE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5v
c2F2ZSBtZW1vcnk6IFttZW0gMHg3ODYwMDAwMC0weDdjN2ZmZmZmXQpbICAgIDAuMDIzNjE3
XSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweDdj
ODAwMDAwLTB4ZmRmZmZmZmZdClsgICAgMC4wMjM2MThdIFBNOiBoaWJlcm5hdGlvbjogUmVn
aXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4ZmUwMDAwMDAtMHhmZTAxMGZmZl0KWyAg
ICAwLjAyMzYxOF0gUE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6
IFttZW0gMHhmZTAxMTAwMC0weGZlYmZmZmZmXQpbICAgIDAuMDIzNjE5XSBQTTogaGliZXJu
YXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweGZlYzAwMDAwLTB4ZmVj
MDBmZmZdClsgICAgMC4wMjM2MTldIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3Nh
dmUgbWVtb3J5OiBbbWVtIDB4ZmVjMDEwMDAtMHhmZWRmZmZmZl0KWyAgICAwLjAyMzYxOV0g
UE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHhmZWUw
MDAwMC0weGZlZTAwZmZmXQpbICAgIDAuMDIzNjIwXSBQTTogaGliZXJuYXRpb246IFJlZ2lz
dGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweGZlZTAxMDAwLTB4ZmZmZmZmZmZdClsgICAg
MC4wMjM2MjFdIFttZW0gMHg3YzgwMDAwMC0weGZkZmZmZmZmXSBhdmFpbGFibGUgZm9yIFBD
SSBkZXZpY2VzClsgICAgMC4wMjM2MjJdIEJvb3RpbmcgcGFyYXZpcnR1YWxpemVkIGtlcm5l
bCBvbiBiYXJlIGhhcmR3YXJlClsgICAgMC4wMjM2MjRdIGNsb2Nrc291cmNlOiByZWZpbmVk
LWppZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4
X2lkbGVfbnM6IDc2NDU1MTk2MDAyMTE1NjggbnMKWyAgICAwLjAyNzgxMl0gc2V0dXBfcGVy
Y3B1OiBOUl9DUFVTOjgxOTIgbnJfY3B1bWFza19iaXRzOjQgbnJfY3B1X2lkczo0IG5yX25v
ZGVfaWRzOjEKWyAgICAwLjAyODA4OF0gcGVyY3B1OiBFbWJlZGRlZCA4OSBwYWdlcy9jcHUg
czI3MDMzNiByNjU1MzYgZDI4NjcyIHU1MjQyODgKWyAgICAwLjAyODA5M10gcGNwdS1hbGxv
YzogczI3MDMzNiByNjU1MzYgZDI4NjcyIHU1MjQyODggYWxsb2M9MSoyMDk3MTUyClsgICAg
MC4wMjgwOTVdIHBjcHUtYWxsb2M6IFswXSAwIDEgMiAzIApbICAgIDAuMDI4MTExXSBLZXJu
ZWwgY29tbWFuZCBsaW5lOiBCT09UX0lNQUdFPS92bWxpbnV6LTYuMTQuMC0xMjk2Ni1nYTJj
YzZmZjVlYzhmIHJvb3Q9VVVJRD0zMmUyOTg4Mi1kOTRkLTRhOTItOWVlNC00ZDAzMDAyYmZh
Mjkgcm8gcXVpZXQgcGNpPW5vYWVyIG1lbV9zbGVlcF9kZWZhdWx0PWRlZXAgbG9nX2J1Zl9s
ZW49MTZNIGNyeXB0b21nci5ub3Rlc3RzClsgICAgMC4wMjgxNzJdIFVua25vd24ga2VybmVs
IGNvbW1hbmQgbGluZSBwYXJhbWV0ZXJzICJCT09UX0lNQUdFPS92bWxpbnV6LTYuMTQuMC0x
Mjk2Ni1nYTJjYzZmZjVlYzhmIiwgd2lsbCBiZSBwYXNzZWQgdG8gdXNlciBzcGFjZS4KWyAg
ICAwLjAyODIwMF0gcmFuZG9tOiBjcm5nIGluaXQgZG9uZQpbICAgIDAuMDI5Njg2XSBEZW50
cnkgY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAyMDk3MTUyIChvcmRlcjogMTIsIDE2Nzc3
MjE2IGJ5dGVzLCBsaW5lYXIpClsgICAgMC4wMzA0NDJdIElub2RlLWNhY2hlIGhhc2ggdGFi
bGUgZW50cmllczogMTA0ODU3NiAob3JkZXI6IDExLCA4Mzg4NjA4IGJ5dGVzLCBsaW5lYXIp
ClsgICAgMC4wMzA0OTJdIHNvZnR3YXJlIElPIFRMQjogYXJlYSBudW0gNC4KWyAgICAwLjA0
Mjc5MF0gRmFsbGJhY2sgb3JkZXIgZm9yIE5vZGUgMDogMCAKWyAgICAwLjA0Mjc5M10gQnVp
bHQgMSB6b25lbGlzdHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDQw
OTA3NjcKWyAgICAwLjA0Mjc5NF0gUG9saWN5IHpvbmU6IE5vcm1hbApbICAgIDAuMDQyODAx
XSBtZW0gYXV0by1pbml0OiBzdGFjazphbGwoemVybyksIGhlYXAgYWxsb2M6b24sIGhlYXAg
ZnJlZTpvZmYKWyAgICAwLjA0OTA5Nl0gU0xVQjogSFdhbGlnbj02NCwgT3JkZXI9MC0zLCBN
aW5PYmplY3RzPTAsIENQVXM9NCwgTm9kZXM9MQpbICAgIDAuMDQ5MDk4XSBrbWVtbGVhazog
S2VybmVsIG1lbW9yeSBsZWFrIGRldGVjdG9yIGRpc2FibGVkClsgICAgMC4wNTYyMjVdIGZ0
cmFjZTogYWxsb2NhdGluZyA0MzIzNCBlbnRyaWVzIGluIDE3MCBwYWdlcwpbICAgIDAuMDU2
MjI2XSBmdHJhY2U6IGFsbG9jYXRlZCAxNzAgcGFnZXMgd2l0aCA0IGdyb3VwcwpbICAgIDAu
MDU2OTE4XSBEeW5hbWljIFByZWVtcHQ6IHZvbHVudGFyeQpbICAgIDAuMDU2OTQ4XSByY3U6
IFByZWVtcHRpYmxlIGhpZXJhcmNoaWNhbCBSQ1UgaW1wbGVtZW50YXRpb24uClsgICAgMC4w
NTY5NDhdIHJjdTogCVJDVSByZXN0cmljdGluZyBDUFVzIGZyb20gTlJfQ1BVUz04MTkyIHRv
IG5yX2NwdV9pZHM9NC4KWyAgICAwLjA1Njk1MF0gCVRyYW1wb2xpbmUgdmFyaWFudCBvZiBU
YXNrcyBSQ1UgZW5hYmxlZC4KWyAgICAwLjA1Njk1MF0gCVJ1ZGUgdmFyaWFudCBvZiBUYXNr
cyBSQ1UgZW5hYmxlZC4KWyAgICAwLjA1Njk1MF0gCVRyYWNpbmcgdmFyaWFudCBvZiBUYXNr
cyBSQ1UgZW5hYmxlZC4KWyAgICAwLjA1Njk1MV0gcmN1OiBSQ1UgY2FsY3VsYXRlZCB2YWx1
ZSBvZiBzY2hlZHVsZXItZW5saXN0bWVudCBkZWxheSBpcyAyNSBqaWZmaWVzLgpbICAgIDAu
MDU2OTUxXSByY3U6IEFkanVzdGluZyBnZW9tZXRyeSBmb3IgcmN1X2Zhbm91dF9sZWFmPTE2
LCBucl9jcHVfaWRzPTQKWyAgICAwLjA1Njk1Nl0gUkNVIFRhc2tzOiBTZXR0aW5nIHNoaWZ0
IHRvIDIgYW5kIGxpbSB0byAxIHJjdV90YXNrX2NiX2FkanVzdD0xIHJjdV90YXNrX2NwdV9p
ZHM9NC4KWyAgICAwLjA1Njk1N10gUkNVIFRhc2tzIFJ1ZGU6IFNldHRpbmcgc2hpZnQgdG8g
MiBhbmQgbGltIHRvIDEgcmN1X3Rhc2tfY2JfYWRqdXN0PTEgcmN1X3Rhc2tfY3B1X2lkcz00
LgpbICAgIDAuMDU2OTU4XSBSQ1UgVGFza3MgVHJhY2U6IFNldHRpbmcgc2hpZnQgdG8gMiBh
bmQgbGltIHRvIDEgcmN1X3Rhc2tfY2JfYWRqdXN0PTEgcmN1X3Rhc2tfY3B1X2lkcz00Lgpb
ICAgIDAuMDYwODcwXSBOUl9JUlFTOiA1MjQ1NDQsIG5yX2lycXM6IDEwMjQsIHByZWFsbG9j
YXRlZCBpcnFzOiAxNgpbICAgIDAuMDYxMDc5XSByY3U6IHNyY3VfaW5pdDogU2V0dGluZyBz
cmN1X3N0cnVjdCBzaXplcyBiYXNlZCBvbiBjb250ZW50aW9uLgpbICAgIDAuMDYxMjYwXSBz
cHVyaW91cyA4MjU5QSBpbnRlcnJ1cHQ6IElSUTcuClsgICAgMC4wNjEyODRdIENvbnNvbGU6
IGNvbG91ciBkdW1teSBkZXZpY2UgODB4MjUKWyAgICAwLjA2MTI4N10gcHJpbnRrOiBsZWdh
Y3kgY29uc29sZSBbdHR5MF0gZW5hYmxlZApbICAgIDAuMDYxMzIxXSBBQ1BJOiBDb3JlIHJl
dmlzaW9uIDIwMjQwODI3ClsgICAgMC4wNjE0NjddIGhwZXQ6IEhQRVQgZHlzZnVuY3Rpb25h
bCBpbiBQQzEwLiBGb3JjZSBkaXNhYmxlZC4KWyAgICAwLjA2MTUxOV0gQVBJQzogU3dpdGNo
IHRvIHN5bW1ldHJpYyBJL08gbW9kZSBzZXR1cApbICAgIDAuMDYxNTIyXSBETUFSOiBIb3N0
IGFkZHJlc3Mgd2lkdGggMzkKWyAgICAwLjA2MTUyM10gRE1BUjogRFJIRCBiYXNlOiAweDAw
MDAwMGZlZDkwMDAwIGZsYWdzOiAweDAKWyAgICAwLjA2MTUyOV0gRE1BUjogZG1hcjA6IHJl
Z19iYXNlX2FkZHIgZmVkOTAwMDAgdmVyIDE6MCBjYXAgMWMwMDAwYzQwNjYwNDYyIGVjYXAg
MTllMmZmMDUwNWUKWyAgICAwLjA2MTUzMV0gRE1BUjogRFJIRCBiYXNlOiAweDAwMDAwMGZl
ZDkxMDAwIGZsYWdzOiAweDEKWyAgICAwLjA2MTUzNF0gRE1BUjogZG1hcjE6IHJlZ19iYXNl
X2FkZHIgZmVkOTEwMDAgdmVyIDE6MCBjYXAgZDIwMDhjNDA2NjA0NjIgZWNhcCBmMDUwZGEK
WyAgICAwLjA2MTUzNl0gRE1BUjogUk1SUiBiYXNlOiAweDAwMDAwMDY0ZWMyMDAwIGVuZDog
MHgwMDAwMDA2NGVlMWZmZgpbICAgIDAuMDYxNTQwXSBETUFSOiBSTVJSIGJhc2U6IDB4MDAw
MDAwN2EwMDAwMDAgZW5kOiAweDAwMDAwMDdjN2ZmZmZmClsgICAgMC4wNjE1NDFdIERNQVI6
IEFOREQgZGV2aWNlOiAxIG5hbWU6IFxfU0IuUENJMC5JMkMwClsgICAgMC4wNjE1NDJdIERN
QVI6IEFOREQgZGV2aWNlOiAyIG5hbWU6IFxfU0IuUENJMC5JMkMxClsgICAgMC4wNjE1NDRd
IERNQVItSVI6IElPQVBJQyBpZCAyIHVuZGVyIERSSEQgYmFzZSAgMHhmZWQ5MTAwMCBJT01N
VSAxClsgICAgMC4wNjE1NDVdIERNQVItSVI6IEhQRVQgaWQgMCB1bmRlciBEUkhEIGJhc2Ug
MHhmZWQ5MTAwMApbICAgIDAuMDYxNTQ2XSBETUFSLUlSOiBRdWV1ZWQgaW52YWxpZGF0aW9u
IHdpbGwgYmUgZW5hYmxlZCB0byBzdXBwb3J0IHgyYXBpYyBhbmQgSW50ci1yZW1hcHBpbmcu
ClsgICAgMC4wNjMxNjNdIERNQVItSVI6IEVuYWJsZWQgSVJRIHJlbWFwcGluZyBpbiB4MmFw
aWMgbW9kZQpbICAgIDAuMDYzMTY1XSB4MmFwaWMgZW5hYmxlZApbICAgIDAuMDYzMjIxXSBB
UElDOiBTd2l0Y2hlZCBBUElDIHJvdXRpbmcgdG86IGNsdXN0ZXIgeDJhcGljClsgICAgMC4w
NjcwNjVdIGNsb2Nrc291cmNlOiB0c2MtZWFybHk6IG1hc2s6IDB4ZmZmZmZmZmZmZmZmZmZm
ZiBtYXhfY3ljbGVzOiAweDI5Y2NkNzY3Yjg3LCBtYXhfaWRsZV9uczogNDQwNzk1MjIzNzIw
IG5zClsgICAgMC4wNjcwNzBdIENhbGlicmF0aW5nIGRlbGF5IGxvb3AgKHNraXBwZWQpLCB2
YWx1ZSBjYWxjdWxhdGVkIHVzaW5nIHRpbWVyIGZyZXF1ZW5jeS4uIDU3OTkuNzcgQm9nb01J
UFMgKGxwaj0xMTU5OTU0NCkKWyAgICAwLjA2NzEwMF0gQ1BVMDogVGhlcm1hbCBtb25pdG9y
aW5nIGVuYWJsZWQgKFRNMSkKWyAgICAwLjA2NzEzN10gTGFzdCBsZXZlbCBpVExCIGVudHJp
ZXM6IDRLQiA2NCwgMk1CIDgsIDRNQiA4ClsgICAgMC4wNjcxMzldIExhc3QgbGV2ZWwgZFRM
QiBlbnRyaWVzOiA0S0IgNjQsIDJNQiAzMiwgNE1CIDMyLCAxR0IgNApbICAgIDAuMDY3MTQy
XSBwcm9jZXNzOiB1c2luZyBtd2FpdCBpbiBpZGxlIHRocmVhZHMKWyAgICAwLjA2NzE0OV0g
U3BlY3RyZSBWMiA6IFVzZXIgc3BhY2U6IFZ1bG5lcmFibGUKWyAgICAwLjA2NzE1MV0gU3Bl
Y3VsYXRpdmUgU3RvcmUgQnlwYXNzOiBWdWxuZXJhYmxlClsgICAgMC4wNjcxNTVdIFNSQkRT
OiBWdWxuZXJhYmxlClsgICAgMC4wNjcxNjBdIEdEUzogVnVsbmVyYWJsZQpbICAgIDAuMDY3
MTY1XSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDE6ICd4ODcgZmxv
YXRpbmcgcG9pbnQgcmVnaXN0ZXJzJwpbICAgIDAuMDY3MTY2XSB4ODYvZnB1OiBTdXBwb3J0
aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDI6ICdTU0UgcmVnaXN0ZXJzJwpbICAgIDAuMDY3MTY3
XSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDQ6ICdBVlggcmVnaXN0
ZXJzJwpbICAgIDAuMDY3MTY3XSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUg
MHgwMDg6ICdNUFggYm91bmRzIHJlZ2lzdGVycycKWyAgICAwLjA2NzE2OF0geDg2L2ZwdTog
U3VwcG9ydGluZyBYU0FWRSBmZWF0dXJlIDB4MDEwOiAnTVBYIENTUicKWyAgICAwLjA2NzE2
OV0geDg2L2ZwdTogeHN0YXRlX29mZnNldFsyXTogIDU3NiwgeHN0YXRlX3NpemVzWzJdOiAg
MjU2ClsgICAgMC4wNjcxNzBdIHg4Ni9mcHU6IHhzdGF0ZV9vZmZzZXRbM106ICA4MzIsIHhz
dGF0ZV9zaXplc1szXTogICA2NApbICAgIDAuMDY3MTcxXSB4ODYvZnB1OiB4c3RhdGVfb2Zm
c2V0WzRdOiAgODk2LCB4c3RhdGVfc2l6ZXNbNF06ICAgNjQKWyAgICAwLjA2NzE3Ml0geDg2
L2ZwdTogRW5hYmxlZCB4c3RhdGUgZmVhdHVyZXMgMHgxZiwgY29udGV4dCBzaXplIGlzIDk2
MCBieXRlcywgdXNpbmcgJ2NvbXBhY3RlZCcgZm9ybWF0LgpbICAgIDAuMDcxMDY5XSBGcmVl
aW5nIFNNUCBhbHRlcm5hdGl2ZXMgbWVtb3J5OiA0MEsKWyAgICAwLjA3MTA2OV0gcGlkX21h
eDogZGVmYXVsdDogMzI3NjggbWluaW11bTogMzAxClsgICAgMC4wNzEwNjldIExTTTogaW5p
dGlhbGl6aW5nIGxzbT1jYXBhYmlsaXR5LGxhbmRsb2NrLGFwcGFybW9yLGJwZgpbICAgIDAu
MDcxMDY5XSBsYW5kbG9jazogVXAgYW5kIHJ1bm5pbmcuClsgICAgMC4wNzEwNjldIEFwcEFy
bW9yOiBBcHBBcm1vciBpbml0aWFsaXplZApbICAgIDAuMDcxMDY5XSBMU00gc3VwcG9ydCBm
b3IgZUJQRiBhY3RpdmUKWyAgICAwLjA3MTA2OV0gTW91bnQtY2FjaGUgaGFzaCB0YWJsZSBl
bnRyaWVzOiAzMjc2OCAob3JkZXI6IDYsIDI2MjE0NCBieXRlcywgbGluZWFyKQpbICAgIDAu
MDcxMDY5XSBNb3VudHBvaW50LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMzI3NjggKG9y
ZGVyOiA2LCAyNjIxNDQgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjA3MTA2OV0gc21wYm9vdDog
Q1BVMDogSW50ZWwoUikgQ29yZShUTSkgaTctNzUwMFUgQ1BVIEAgMi43MEdIeiAoZmFtaWx5
OiAweDYsIG1vZGVsOiAweDhlLCBzdGVwcGluZzogMHg5KQpbICAgIDAuMDcxMDY5XSBQZXJm
b3JtYW5jZSBFdmVudHM6IFBFQlMgZm10MyssIFNreWxha2UgZXZlbnRzLCAzMi1kZWVwIExC
UiwgZnVsbC13aWR0aCBjb3VudGVycywgSW50ZWwgUE1VIGRyaXZlci4KWyAgICAwLjA3MTA2
OV0gLi4uIHZlcnNpb246ICAgICAgICAgICAgICAgIDQKWyAgICAwLjA3MTA2OV0gLi4uIGJp
dCB3aWR0aDogICAgICAgICAgICAgIDQ4ClsgICAgMC4wNzEwNjldIC4uLiBnZW5lcmljIHJl
Z2lzdGVyczogICAgICA0ClsgICAgMC4wNzEwNjldIC4uLiB2YWx1ZSBtYXNrOiAgICAgICAg
ICAgICAwMDAwZmZmZmZmZmZmZmZmClsgICAgMC4wNzEwNjldIC4uLiBtYXggcGVyaW9kOiAg
ICAgICAgICAgICAwMDAwN2ZmZmZmZmZmZmZmClsgICAgMC4wNzEwNjldIC4uLiBmaXhlZC1w
dXJwb3NlIGV2ZW50czogICAzClsgICAgMC4wNzEwNjldIC4uLiBldmVudCBtYXNrOiAgICAg
ICAgICAgICAwMDAwMDAwNzAwMDAwMDBmClsgICAgMC4wNzEwNjldIHNpZ25hbDogbWF4IHNp
Z2ZyYW1lIHNpemU6IDE2MTYKWyAgICAwLjA3MTA2OV0gRXN0aW1hdGVkIHJhdGlvIG9mIGF2
ZXJhZ2UgbWF4IGZyZXF1ZW5jeSBieSBiYXNlIGZyZXF1ZW5jeSAodGltZXMgMTAyNCk6IDEy
MzUKWyAgICAwLjA3MTA2OV0gcmN1OiBIaWVyYXJjaGljYWwgU1JDVSBpbXBsZW1lbnRhdGlv
bi4KWyAgICAwLjA3MTA2OV0gcmN1OiAJTWF4IHBoYXNlIG5vLWRlbGF5IGluc3RhbmNlcyBp
cyAxMDAwLgpbICAgIDAuMDcxMDY5XSBUaW1lciBtaWdyYXRpb246IDEgaGllcmFyY2h5IGxl
dmVsczsgOCBjaGlsZHJlbiBwZXIgZ3JvdXA7IDEgY3Jvc3Nub2RlIGxldmVsClsgICAgMC4w
NzEwNjldIE5NSSB3YXRjaGRvZzogRW5hYmxlZC4gUGVybWFuZW50bHkgY29uc3VtZXMgb25l
IGh3LVBNVSBjb3VudGVyLgpbICAgIDAuMDcxMDY5XSBzbXA6IEJyaW5naW5nIHVwIHNlY29u
ZGFyeSBDUFVzIC4uLgpbICAgIDAuMDcxMDY5XSBzbXBib290OiB4ODY6IEJvb3RpbmcgU01Q
IGNvbmZpZ3VyYXRpb246ClsgICAgMC4wNzEwNjldIC4uLi4gbm9kZSAgIzAsIENQVXM6ICAg
ICAgIzEgIzIgIzMKWyAgICAwLjA3MTA2OV0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgNCBD
UFVzClsgICAgMC4wNzEwNjldIHNtcGJvb3Q6IFRvdGFsIG9mIDQgcHJvY2Vzc29ycyBhY3Rp
dmF0ZWQgKDIzMTk5LjA4IEJvZ29NSVBTKQpbICAgIDAuMDkxMjg4XSBub2RlIDAgZGVmZXJy
ZWQgcGFnZXMgaW5pdGlhbGlzZWQgaW4gMjRtcwpbICAgIDAuMDkyMzU5XSBNZW1vcnk6IDE1
ODYxODg0Sy8xNjM2MzA2OEsgYXZhaWxhYmxlICgxNDI4Nksga2VybmVsIGNvZGUsIDI1ODNL
IHJ3ZGF0YSwgMTAzMTJLIHJvZGF0YSwgMjkxMksgaW5pdCwgNjIyOEsgYnNzLCA0OTA0NDRL
IHJlc2VydmVkLCAwSyBjbWEtcmVzZXJ2ZWQpClsgICAgMC4wOTIzNTldIGRldnRtcGZzOiBp
bml0aWFsaXplZApbICAgIDAuMDkyMzU5XSB4ODYvbW06IE1lbW9yeSBibG9jayBzaXplOiAx
MjhNQgpbICAgIDAuMDkyMzU5XSBBQ1BJOiBQTTogUmVnaXN0ZXJpbmcgQUNQSSBOVlMgcmVn
aW9uIFttZW0gMHg1NTZhYjAwMC0weDU1NmFiZmZmXSAoNDA5NiBieXRlcykKWyAgICAwLjA5
MjM1OV0gQUNQSTogUE06IFJlZ2lzdGVyaW5nIEFDUEkgTlZTIHJlZ2lvbiBbbWVtIDB4NjUx
YzQwMDAtMHg2Zjg3MWZmZl0gKDE3NDc3NjMyMCBieXRlcykKWyAgICAwLjA5NTY2Nl0gY2xv
Y2tzb3VyY2U6IGppZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZm
ZmZmZiwgbWF4X2lkbGVfbnM6IDc2NDUwNDE3ODUxMDAwMDAgbnMKWyAgICAwLjA5NTY2Nl0g
cG9zaXh0aW1lcnMgaGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjogMywgMzI3Njgg
Ynl0ZXMsIGxpbmVhcikKWyAgICAwLjA5NTY2Nl0gZnV0ZXggaGFzaCB0YWJsZSBlbnRyaWVz
OiAxMDI0IChvcmRlcjogNCwgNjU1MzYgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjA5NTY2Nl0g
cGluY3RybCBjb3JlOiBpbml0aWFsaXplZCBwaW5jdHJsIHN1YnN5c3RlbQpbICAgIDAuMDk1
NjY2XSBORVQ6IFJlZ2lzdGVyZWQgUEZfTkVUTElOSy9QRl9ST1VURSBwcm90b2NvbCBmYW1p
bHkKWyAgICAwLjA5NTc5OF0gRE1BOiBwcmVhbGxvY2F0ZWQgMjA0OCBLaUIgR0ZQX0tFUk5F
TCBwb29sIGZvciBhdG9taWMgYWxsb2NhdGlvbnMKWyAgICAwLjA5NTkwNV0gRE1BOiBwcmVh
bGxvY2F0ZWQgMjA0OCBLaUIgR0ZQX0tFUk5FTHxHRlBfRE1BIHBvb2wgZm9yIGF0b21pYyBh
bGxvY2F0aW9ucwpbICAgIDAuMDk2MDI3XSBETUE6IHByZWFsbG9jYXRlZCAyMDQ4IEtpQiBH
RlBfS0VSTkVMfEdGUF9ETUEzMiBwb29sIGZvciBhdG9taWMgYWxsb2NhdGlvbnMKWyAgICAw
LjA5NjA0Ml0gYXVkaXQ6IGluaXRpYWxpemluZyBuZXRsaW5rIHN1YnN5cyAoZGlzYWJsZWQp
ClsgICAgMC4wOTYwNThdIGF1ZGl0OiB0eXBlPTIwMDAgYXVkaXQoMTc0MzY5ODU1Mi4wMDA6
MSk6IHN0YXRlPWluaXRpYWxpemVkIGF1ZGl0X2VuYWJsZWQ9MCByZXM9MQpbICAgIDAuMDk2
MDU4XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICdmYWlyX3No
YXJlJwpbICAgIDAuMDk2MDU4XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdv
dmVybm9yICdiYW5nX2JhbmcnClsgICAgMC4wOTYwNThdIHRoZXJtYWxfc3lzOiBSZWdpc3Rl
cmVkIHRoZXJtYWwgZ292ZXJub3IgJ3N0ZXBfd2lzZScKWyAgICAwLjA5NjA1OF0gdGhlcm1h
bF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAndXNlcl9zcGFjZScKWyAgICAw
LjA5NjA1OF0gdGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAncG93
ZXJfYWxsb2NhdG9yJwpbICAgIDAuMDk2MDU4XSBjcHVpZGxlOiB1c2luZyBnb3Zlcm5vciBs
YWRkZXIKWyAgICAwLjA5NjA1OF0gY3B1aWRsZTogdXNpbmcgZ292ZXJub3IgbWVudQpbICAg
IDAuMDk2MDU4XSBTaW1wbGUgQm9vdCBGbGFnIGF0IDB4NDcgc2V0IHRvIDB4ODAKWyAgICAw
LjA5NjA1OF0gQUNQSSBGQURUIGRlY2xhcmVzIHRoZSBzeXN0ZW0gZG9lc24ndCBzdXBwb3J0
IFBDSWUgQVNQTSwgc28gZGlzYWJsZSBpdApbICAgIDAuMDk2MDU4XSBhY3BpcGhwOiBBQ1BJ
IEhvdCBQbHVnIFBDSSBDb250cm9sbGVyIERyaXZlciB2ZXJzaW9uOiAwLjUKWyAgICAwLjA5
NjA1OF0gUENJOiBFQ0FNIFttZW0gMHhlMDAwMDAwMC0weGVmZmZmZmZmXSAoYmFzZSAweGUw
MDAwMDAwKSBmb3IgZG9tYWluIDAwMDAgW2J1cyAwMC1mZl0KWyAgICAwLjA5NjA1OF0gUENJ
OiBVc2luZyBjb25maWd1cmF0aW9uIHR5cGUgMSBmb3IgYmFzZSBhY2Nlc3MKWyAgICAwLjA5
NjA1OF0ga3Byb2Jlczoga3Byb2JlIGp1bXAtb3B0aW1pemF0aW9uIGlzIGVuYWJsZWQuIEFs
bCBrcHJvYmVzIGFyZSBvcHRpbWl6ZWQgaWYgcG9zc2libGUuClsgICAgMC4wOTYwNThdIEh1
Z2VUTEI6IGFsbG9jYXRpb24gdG9vayAwbXMgd2l0aCBodWdlcGFnZV9hbGxvY2F0aW9uX3Ro
cmVhZHM9MQpbICAgIDAuMDk2MDU4XSBIdWdlVExCOiByZWdpc3RlcmVkIDEuMDAgR2lCIHBh
Z2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzClsgICAgMC4wOTYwNThdIEh1Z2VUTEI6
IDE2MzgwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSAxLjAwIEdpQiBwYWdlClsg
ICAgMC4wOTYwNThdIEh1Z2VUTEI6IHJlZ2lzdGVyZWQgMi4wMCBNaUIgcGFnZSBzaXplLCBw
cmUtYWxsb2NhdGVkIDAgcGFnZXMKWyAgICAwLjA5NjA1OF0gSHVnZVRMQjogMjggS2lCIHZt
ZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDIuMDAgTWlCIHBhZ2UKWyAgICAwLjA5NjA1OF0g
QUNQSTogQWRkZWQgX09TSShNb2R1bGUgRGV2aWNlKQpbICAgIDAuMDk2MDU4XSBBQ1BJOiBB
ZGRlZCBfT1NJKFByb2Nlc3NvciBEZXZpY2UpClsgICAgMC4wOTYwNThdIEFDUEk6IEFkZGVk
IF9PU0koMy4wIF9TQ1AgRXh0ZW5zaW9ucykKWyAgICAwLjA5NjA1OF0gQUNQSTogQWRkZWQg
X09TSShQcm9jZXNzb3IgQWdncmVnYXRvciBEZXZpY2UpClsgICAgMC4xMzM4NjldIEFDUEk6
IDExIEFDUEkgQU1MIHRhYmxlcyBzdWNjZXNzZnVsbHkgYWNxdWlyZWQgYW5kIGxvYWRlZApb
ICAgIDAuMTM4ODc0XSBBQ1BJOiBbRmlybXdhcmUgQnVnXTogQklPUyBfT1NJKExpbnV4KSBx
dWVyeSBpZ25vcmVkClsgICAgMC4xNDM4MDJdIEFDUEk6IER5bmFtaWMgT0VNIFRhYmxlIExv
YWQ6ClsgICAgMC4xNDM4MDhdIEFDUEk6IFNTRFQgMHhGRkZGOUUzQjAyMkQ0QzAwIDAwMDNG
RiAodjAyIFBtUmVmICBDcHUwQ3N0ICAwMDAwMzAwMSBJTlRMIDIwMTYwNDIyKQpbICAgIDAu
MTQ0NjAyXSBBQ1BJOiBEeW5hbWljIE9FTSBUYWJsZSBMb2FkOgpbICAgIDAuMTQ0NjA2XSBB
Q1BJOiBTU0RUIDB4RkZGRjlFM0IwMUFDMTgwMCAwMDA2RjYgKHYwMiBQbVJlZiAgQ3B1MElz
dCAgMDAwMDMwMDAgSU5UTCAyMDE2MDQyMikKWyAgICAwLjE0NjAyNV0gQUNQSTogRHluYW1p
YyBPRU0gVGFibGUgTG9hZDoKWyAgICAwLjE0NjAzMF0gQUNQSTogU1NEVCAweEZGRkY5RTNC
MDFBQzcwMDAgMDAwNjVDICh2MDIgUG1SZWYgIEFwSXN0ICAgIDAwMDAzMDAwIElOVEwgMjAx
NjA0MjIpClsgICAgMC4xNDc4NzhdIEFDUEk6IER5bmFtaWMgT0VNIFRhYmxlIExvYWQ6Clsg
ICAgMC4xNDc4ODJdIEFDUEk6IFNTRFQgMHhGRkZGOUUzQjAxM0Q2MDAwIDAwMDE4QSAodjAy
IFBtUmVmICBBcENzdCAgICAwMDAwMzAwMCBJTlRMIDIwMTYwNDIyKQpbICAgIDAuMTUwMjky
XSBBQ1BJOiBFQzogRUMgc3RhcnRlZApbICAgIDAuMTUwMjkzXSBBQ1BJOiBFQzogaW50ZXJy
dXB0IGJsb2NrZWQKWyAgICAwLjE1NTE4N10gQUNQSTogRUM6IEVDX0NNRC9FQ19TQz0weDkz
NCwgRUNfREFUQT0weDkzMApbICAgIDAuMTU1MTg5XSBBQ1BJOiBcX1NCXy5QQ0kwLkxQQ0Iu
RUNEVjogQm9vdCBEU0RUIEVDIHVzZWQgdG8gaGFuZGxlIHRyYW5zYWN0aW9ucwpbICAgIDAu
MTU1MTkwXSBBQ1BJOiBJbnRlcnByZXRlciBlbmFibGVkClsgICAgMC4xNTUyMjRdIEFDUEk6
IFBNOiAoc3VwcG9ydHMgUzAgUzMgUzQgUzUpClsgICAgMC4xNTUyMjVdIEFDUEk6IFVzaW5n
IElPQVBJQyBmb3IgaW50ZXJydXB0IHJvdXRpbmcKWyAgICAwLjE1NTI2OF0gUENJOiBVc2lu
ZyBob3N0IGJyaWRnZSB3aW5kb3dzIGZyb20gQUNQSTsgaWYgbmVjZXNzYXJ5LCB1c2UgInBj
aT1ub2NycyIgYW5kIHJlcG9ydCBhIGJ1ZwpbICAgIDAuMTU1MjY5XSBQQ0k6IFVzaW5nIEU4
MjAgcmVzZXJ2YXRpb25zIGZvciBob3N0IGJyaWRnZSB3aW5kb3dzClsgICAgMC4xNTU3ODdd
IEFDUEk6IEVuYWJsZWQgOCBHUEVzIGluIGJsb2NrIDAwIHRvIDdGClsgICAgMC4xNTc5MjZd
IEFDUEk6IFxfU0JfLlBDSTAuUlAwOS5QWFNYLldSU1Q6IE5ldyBwb3dlciByZXNvdXJjZQpb
ICAgIDAuMTU4MTgxXSBBQ1BJOiBcX1NCXy5QQ0kwLlJQMTAuUFhTWC5XUlNUOiBOZXcgcG93
ZXIgcmVzb3VyY2UKWyAgICAwLjE1ODQzM10gQUNQSTogXF9TQl8uUENJMC5SUDExLlBYU1gu
V1JTVDogTmV3IHBvd2VyIHJlc291cmNlClsgICAgMC4xNTg2ODZdIEFDUEk6IFxfU0JfLlBD
STAuUlAxMi5QWFNYLldSU1Q6IE5ldyBwb3dlciByZXNvdXJjZQpbICAgIDAuMTU5MjY0XSBB
Q1BJOiBcX1NCXy5QQ0kwLlJQMTMuUFhTWC5XUlNUOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAg
ICAwLjE1OTUxNl0gQUNQSTogXF9TQl8uUENJMC5SUDAxLlBYU1guV1JTVDogTmV3IHBvd2Vy
IHJlc291cmNlClsgICAgMC4xNjAxMjBdIEFDUEk6IFxfU0JfLlBDSTAuUlAwMi5QWFNYLldS
U1Q6IE5ldyBwb3dlciByZXNvdXJjZQpbICAgIDAuMTYwMzc0XSBBQ1BJOiBcX1NCXy5QQ0kw
LlJQMDMuUFhTWC5XUlNUOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjE2MDYyNV0gQUNQ
STogXF9TQl8uUENJMC5SUDA0LlBYU1guV1JTVDogTmV3IHBvd2VyIHJlc291cmNlClsgICAg
MC4xNjA4NzVdIEFDUEk6IFxfU0JfLlBDSTAuUlAwNS5QWFNYLldSU1Q6IE5ldyBwb3dlciBy
ZXNvdXJjZQpbICAgIDAuMTYxMTI2XSBBQ1BJOiBcX1NCXy5QQ0kwLlJQMDYuUFhTWC5XUlNU
OiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjE2MTM4NF0gQUNQSTogXF9TQl8uUENJMC5S
UDA3LlBYU1guV1JTVDogTmV3IHBvd2VyIHJlc291cmNlClsgICAgMC4xNjE2NDZdIEFDUEk6
IFxfU0JfLlBDSTAuUlAwOC5QWFNYLldSU1Q6IE5ldyBwb3dlciByZXNvdXJjZQpbICAgIDAu
MTYxODk3XSBBQ1BJOiBcX1NCXy5QQ0kwLlJQMTcuUFhTWC5XUlNUOiBOZXcgcG93ZXIgcmVz
b3VyY2UKWyAgICAwLjE2MjE0OV0gQUNQSTogXF9TQl8uUENJMC5SUDE4LlBYU1guV1JTVDog
TmV3IHBvd2VyIHJlc291cmNlClsgICAgMC4xNjIzOTldIEFDUEk6IFxfU0JfLlBDSTAuUlAx
OS5QWFNYLldSU1Q6IE5ldyBwb3dlciByZXNvdXJjZQpbICAgIDAuMTYyNjQ4XSBBQ1BJOiBc
X1NCXy5QQ0kwLlJQMjAuUFhTWC5XUlNUOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjE2
MzY5OF0gQUNQSTogXF9TQl8uUENJMC5SUDE0LlBYU1guV1JTVDogTmV3IHBvd2VyIHJlc291
cmNlClsgICAgMC4xNjM5NDldIEFDUEk6IFxfU0JfLlBDSTAuUlAxNS5QWFNYLldSU1Q6IE5l
dyBwb3dlciByZXNvdXJjZQpbICAgIDAuMTY0MjAyXSBBQ1BJOiBcX1NCXy5QQ0kwLlJQMTYu
UFhTWC5XUlNUOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjE4MzA3MV0gQUNQSTogUENJ
IFJvb3QgQnJpZGdlIFtQQ0kwXSAoZG9tYWluIDAwMDAgW2J1cyAwMC1mZV0pClsgICAgMC4x
ODMwNzFdIGFjcGkgUE5QMEEwODowMDogX09TQzogT1Mgc3VwcG9ydHMgW0V4dGVuZGVkQ29u
ZmlnIEFTUE0gQ2xvY2tQTSBTZWdtZW50cyBNU0kgSFBYLVR5cGUzXQpbICAgIDAuMTgzMDcx
XSBhY3BpIFBOUDBBMDg6MDA6IF9PU0M6IHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgW1BD
SWVIb3RwbHVnIFNIUENIb3RwbHVnIFBNRV0KWyAgICAwLjE4MzEzOV0gYWNwaSBQTlAwQTA4
OjAwOiBfT1NDOiBPUyBub3cgY29udHJvbHMgW1BDSWVDYXBhYmlsaXR5IExUUl0KWyAgICAw
LjE4MzE0MF0gYWNwaSBQTlAwQTA4OjAwOiBGQURUIGluZGljYXRlcyBBU1BNIGlzIHVuc3Vw
cG9ydGVkLCB1c2luZyBCSU9TIGNvbmZpZ3VyYXRpb24KWyAgICAwLjE4Mzg2M10gUENJIGhv
c3QgYnJpZGdlIHRvIGJ1cyAwMDAwOjAwClsgICAgMC4xODM4NjZdIHBjaV9idXMgMDAwMDow
MDogcm9vdCBidXMgcmVzb3VyY2UgW2lvICAweDAwMDAtMHgwY2Y3IHdpbmRvd10KWyAgICAw
LjE4Mzg2OF0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbaW8gIDB4MGQw
MC0weGZmZmYgd2luZG93XQpbICAgIDAuMTgzODcwXSBwY2lfYnVzIDAwMDA6MDA6IHJvb3Qg
YnVzIHJlc291cmNlIFttZW0gMHgwMDBhMDAwMC0weDAwMGRmZmZmIHdpbmRvd10KWyAgICAw
LjE4Mzg3MV0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4N2M4
MDAwMDAtMHhkZmZmZmZmZiB3aW5kb3ddClsgICAgMC4xODM4NzNdIHBjaV9idXMgMDAwMDow
MDogcm9vdCBidXMgcmVzb3VyY2UgW21lbSAweGZkMDAwMDAwLTB4ZmU3ZmZmZmYgd2luZG93
XQpbICAgIDAuMTgzODc0XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFti
dXMgMDAtZmVdClsgICAgMC4xODM4ODldIHBjaSAwMDAwOjAwOjAwLjA6IFs4MDg2OjU5MDRd
IHR5cGUgMDAgY2xhc3MgMHgwNjAwMDAgY29udmVudGlvbmFsIFBDSSBlbmRwb2ludApbICAg
IDAuMTgzOTU0XSBwY2kgMDAwMDowMDowMi4wOiBbODA4Njo1OTE2XSB0eXBlIDAwIGNsYXNz
IDB4MDMwMDAwIFBDSWUgUm9vdCBDb21wbGV4IEludGVncmF0ZWQgRW5kcG9pbnQKWyAgICAw
LjE4Mzk2N10gcGNpIDAwMDA6MDA6MDIuMDogQkFSIDAgW21lbSAweGRiMDAwMDAwLTB4ZGJm
ZmZmZmYgNjRiaXRdClsgICAgMC4xODM5NjldIHBjaSAwMDAwOjAwOjAyLjA6IEJBUiAyIFtt
ZW0gMHg5MDAwMDAwMC0weDlmZmZmZmZmIDY0Yml0IHByZWZdClsgICAgMC4xODM5NzBdIHBj
aSAwMDAwOjAwOjAyLjA6IEJBUiA0IFtpbyAgMHhmMDAwLTB4ZjAzZl0KWyAgICAwLjE4Mzk4
MF0gcGNpIDAwMDA6MDA6MDIuMDogVmlkZW8gZGV2aWNlIHdpdGggc2hhZG93ZWQgUk9NIGF0
IFttZW0gMHgwMDBjMDAwMC0weDAwMGRmZmZmXQpbICAgIDAuMTg0MTA0XSBwY2kgMDAwMDow
MDowNC4wOiBbODA4NjoxOTAzXSB0eXBlIDAwIGNsYXNzIDB4MTE4MDAwIGNvbnZlbnRpb25h
bCBQQ0kgZW5kcG9pbnQKWyAgICAwLjE4NDExOV0gcGNpIDAwMDA6MDA6MDQuMDogQkFSIDAg
W21lbSAweGRjNDIwMDAwLTB4ZGM0MjdmZmYgNjRiaXRdClsgICAgMC4xODQzNTNdIHBjaSAw
MDAwOjAwOjE0LjA6IFs4MDg2OjlkMmZdIHR5cGUgMDAgY2xhc3MgMHgwYzAzMzAgY29udmVu
dGlvbmFsIFBDSSBlbmRwb2ludApbICAgIDAuMTg0Mzg1XSBwY2kgMDAwMDowMDoxNC4wOiBC
QVIgMCBbbWVtIDB4ZGM0MTAwMDAtMHhkYzQxZmZmZiA2NGJpdF0KWyAgICAwLjE4NDQxNl0g
cGNpIDAwMDA6MDA6MTQuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEM2hvdCBEM2NvbGQKWyAg
ICAwLjE4NDg2MV0gcGNpIDAwMDA6MDA6MTQuMjogWzgwODY6OWQzMV0gdHlwZSAwMCBjbGFz
cyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMC4xODQ4OTBdIHBj
aSAwMDAwOjAwOjE0LjI6IEJBUiAwIFttZW0gMHhkYzQzNDAwMC0weGRjNDM0ZmZmIDY0Yml0
XQpbICAgIDAuMTg0OTg3XSBwY2kgMDAwMDowMDoxNS4wOiBbODA4Njo5ZDYwXSB0eXBlIDAw
IGNsYXNzIDB4MTE4MDAwIGNvbnZlbnRpb25hbCBQQ0kgZW5kcG9pbnQKWyAgICAwLjE4NTAz
OF0gcGNpIDAwMDA6MDA6MTUuMDogQkFSIDAgW21lbSAweGRjNDMzMDAwLTB4ZGM0MzNmZmYg
NjRiaXRdClsgICAgMC4xODUzMjddIHBjaSAwMDAwOjAwOjE1LjE6IFs4MDg2OjlkNjFdIHR5
cGUgMDAgY2xhc3MgMHgxMTgwMDAgY29udmVudGlvbmFsIFBDSSBlbmRwb2ludApbICAgIDAu
MTg1Mzc4XSBwY2kgMDAwMDowMDoxNS4xOiBCQVIgMCBbbWVtIDB4ZGM0MzIwMDAtMHhkYzQz
MmZmZiA2NGJpdF0KWyAgICAwLjE4NTY1MF0gcGNpIDAwMDA6MDA6MTYuMDogWzgwODY6OWQz
YV0gdHlwZSAwMCBjbGFzcyAweDA3ODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50Clsg
ICAgMC4xODU2NzhdIHBjaSAwMDAwOjAwOjE2LjA6IEJBUiAwIFttZW0gMHhkYzQzMTAwMC0w
eGRjNDMxZmZmIDY0Yml0XQpbICAgIDAuMTg1NzA2XSBwY2kgMDAwMDowMDoxNi4wOiBQTUUj
IHN1cHBvcnRlZCBmcm9tIEQzaG90ClsgICAgMC4xODYwMDRdIHBjaSAwMDAwOjAwOjFjLjA6
IFs4MDg2OjlkMTBdIHR5cGUgMDEgY2xhc3MgMHgwNjA0MDAgUENJZSBSb290IFBvcnQKWyAg
ICAwLjE4NjAyMF0gcGNpIDAwMDA6MDA6MWMuMDogUENJIGJyaWRnZSB0byBbYnVzIDAxLTM5
XQpbICAgIDAuMTg2MDI0XSBwY2kgMDAwMDowMDoxYy4wOiAgIGJyaWRnZSB3aW5kb3cgW21l
bSAweGM0MDAwMDAwLTB4ZGEwZmZmZmZdClsgICAgMC4xODYwMzBdIHBjaSAwMDAwOjAwOjFj
LjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YTAwMDAwMDAtMHhjMWZmZmZmZiA2NGJpdCBw
cmVmXQpbICAgIDAuMTg2MDcxXSBwY2kgMDAwMDowMDoxYy4wOiBQTUUjIHN1cHBvcnRlZCBm
cm9tIEQwIEQzaG90IEQzY29sZApbICAgIDAuMTg2NDQ5XSBwY2kgMDAwMDowMDoxYy40OiBb
ODA4Njo5ZDE0XSB0eXBlIDAxIGNsYXNzIDB4MDYwNDAwIFBDSWUgUm9vdCBQb3J0ClsgICAg
MC4xODY0NjVdIHBjaSAwMDAwOjAwOjFjLjQ6IFBDSSBicmlkZ2UgdG8gW2J1cyAzYV0KWyAg
ICAwLjE4NjQ2OV0gcGNpIDAwMDA6MDA6MWMuNDogICBicmlkZ2Ugd2luZG93IFttZW0gMHhk
YzAwMDAwMC0weGRjMWZmZmZmXQpbICAgIDAuMTg2NTE5XSBwY2kgMDAwMDowMDoxYy40OiBQ
TUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQzaG90IEQzY29sZApbICAgIDAuMTg2ODg3XSBwY2kg
MDAwMDowMDoxYy41OiBbODA4Njo5ZDE1XSB0eXBlIDAxIGNsYXNzIDB4MDYwNDAwIFBDSWUg
Um9vdCBQb3J0ClsgICAgMC4xODY5MDNdIHBjaSAwMDAwOjAwOjFjLjU6IFBDSSBicmlkZ2Ug
dG8gW2J1cyAzYl0KWyAgICAwLjE4NjkwN10gcGNpIDAwMDA6MDA6MWMuNTogICBicmlkZ2Ug
d2luZG93IFttZW0gMHhkYzMwMDAwMC0weGRjM2ZmZmZmXQpbICAgIDAuMTg2OTU0XSBwY2kg
MDAwMDowMDoxYy41OiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQzaG90IEQzY29sZApbICAg
IDAuMTg3MzMzXSBwY2kgMDAwMDowMDoxZC4wOiBbODA4Njo5ZDE4XSB0eXBlIDAxIGNsYXNz
IDB4MDYwNDAwIFBDSWUgUm9vdCBQb3J0ClsgICAgMC4xODczNDhdIHBjaSAwMDAwOjAwOjFk
LjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAzY10KWyAgICAwLjE4NzM1MV0gcGNpIDAwMDA6MDA6
MWQuMDogICBicmlkZ2Ugd2luZG93IFttZW0gMHhkYzIwMDAwMC0weGRjMmZmZmZmXQpbICAg
IDAuMTg3NDAwXSBwY2kgMDAwMDowMDoxZC4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQz
aG90IEQzY29sZApbICAgIDAuMTg3Nzg5XSBwY2kgMDAwMDowMDoxZi4wOiBbODA4Njo5ZDU4
XSB0eXBlIDAwIGNsYXNzIDB4MDYwMTAwIGNvbnZlbnRpb25hbCBQQ0kgZW5kcG9pbnQKWyAg
ICAwLjE4ODA0NF0gcGNpIDAwMDA6MDA6MWYuMjogWzgwODY6OWQyMV0gdHlwZSAwMCBjbGFz
cyAweDA1ODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMC4xODgwODBdIHBj
aSAwMDAwOjAwOjFmLjI6IEJBUiAwIFttZW0gMHhkYzQyYzAwMC0weGRjNDJmZmZmXQpbICAg
IDAuMTg4MjU1XSBwY2kgMDAwMDowMDoxZi4zOiBbODA4Njo5ZDcxXSB0eXBlIDAwIGNsYXNz
IDB4MDQwMzgwIGNvbnZlbnRpb25hbCBQQ0kgZW5kcG9pbnQKWyAgICAwLjE4ODI5OV0gcGNp
IDAwMDA6MDA6MWYuMzogQkFSIDAgW21lbSAweGRjNDI4MDAwLTB4ZGM0MmJmZmYgNjRiaXRd
ClsgICAgMC4xODgzMDVdIHBjaSAwMDAwOjAwOjFmLjM6IEJBUiA0IFttZW0gMHhkYzQwMDAw
MC0weGRjNDBmZmZmIDY0Yml0XQpbICAgIDAuMTg4MzQyXSBwY2kgMDAwMDowMDoxZi4zOiBQ
TUUjIHN1cHBvcnRlZCBmcm9tIEQzaG90IEQzY29sZApbICAgIDAuMTg4ODY1XSBwY2kgMDAw
MDowMDoxZi40OiBbODA4Njo5ZDIzXSB0eXBlIDAwIGNsYXNzIDB4MGMwNTAwIGNvbnZlbnRp
b25hbCBQQ0kgZW5kcG9pbnQKWyAgICAwLjE4ODk5N10gcGNpIDAwMDA6MDA6MWYuNDogQkFS
IDAgW21lbSAweGRjNDMwMDAwLTB4ZGM0MzAwZmYgNjRiaXRdClsgICAgMC4xODkwMDddIHBj
aSAwMDAwOjAwOjFmLjQ6IEJBUiA0IFtpbyAgMHhmMDQwLTB4ZjA1Zl0KWyAgICAwLjE4OTI1
NV0gcGNpIDAwMDA6MDA6MWMuMDogUENJIGJyaWRnZSB0byBbYnVzIDAxLTM5XQpbICAgIDAu
MTkxMDcxXSBwY2kgMDAwMDozYTowMC4wOiBbMTY4YzowMDNlXSB0eXBlIDAwIGNsYXNzIDB4
MDI4MDAwIFBDSWUgRW5kcG9pbnQKWyAgICAwLjE5MTA3MV0gcGNpIDAwMDA6M2E6MDAuMDog
QkFSIDAgW21lbSAweGRjMDAwMDAwLTB4ZGMxZmZmZmYgNjRiaXRdClsgICAgMC4xOTEwNzFd
IHBjaSAwMDAwOjNhOjAwLjA6IFBNRSMgc3VwcG9ydGVkIGZyb20gRDAgRDNob3QgRDNjb2xk
ClsgICAgMC4xOTI0MTddIHBjaSAwMDAwOjAwOjFjLjQ6IFBDSSBicmlkZ2UgdG8gW2J1cyAz
YV0KWyAgICAwLjE5MjUwMV0gcGNpIDAwMDA6M2I6MDAuMDogWzEwZWM6NTI1YV0gdHlwZSAw
MCBjbGFzcyAweGZmMDAwMCBQQ0llIEVuZHBvaW50ClsgICAgMC4xOTI1NDVdIHBjaSAwMDAw
OjNiOjAwLjA6IEJBUiAxIFttZW0gMHhkYzMwMDAwMC0weGRjMzAwZmZmXQpbICAgIDAuMTky
NjI0XSBwY2kgMDAwMDozYjowMC4wOiBzdXBwb3J0cyBEMSBEMgpbICAgIDAuMTkyNjI1XSBw
Y2kgMDAwMDozYjowMC4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQxIEQyIEQzaG90IEQzY29s
ZApbICAgIDAuMTkyOTE5XSBwY2kgMDAwMDowMDoxYy41OiBQQ0kgYnJpZGdlIHRvIFtidXMg
M2JdClsgICAgMC4xOTMwMDBdIHBjaSAwMDAwOjNjOjAwLjA6IFsxYzVjOjEyODRdIHR5cGUg
MDAgY2xhc3MgMHgwMTA4MDIgUENJZSBFbmRwb2ludApbICAgIDAuMTkzMDM5XSBwY2kgMDAw
MDozYzowMC4wOiBCQVIgMCBbbWVtIDB4ZGMyMDAwMDAtMHhkYzIwM2ZmZiA2NGJpdF0KWyAg
ICAwLjE5MzExOV0gcGNpIDAwMDA6M2M6MDAuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBE
MSBEM2hvdApbICAgIDAuMTkzNDE5XSBwY2kgMDAwMDowMDoxZC4wOiBQQ0kgYnJpZGdlIHRv
IFtidXMgM2NdClsgICAgMC4xOTYzMjhdIEFDUEk6IFBDSTogSW50ZXJydXB0IGxpbmsgTE5L
QSBjb25maWd1cmVkIGZvciBJUlEgMTEKWyAgICAwLjE5NjMyOF0gQUNQSTogUENJOiBJbnRl
cnJ1cHQgbGluayBMTktCIGNvbmZpZ3VyZWQgZm9yIElSUSAxMApbICAgIDAuMTk2MzI4XSBB
Q1BJOiBQQ0k6IEludGVycnVwdCBsaW5rIExOS0MgY29uZmlndXJlZCBmb3IgSVJRIDExClsg
ICAgMC4xOTYzMjhdIEFDUEk6IFBDSTogSW50ZXJydXB0IGxpbmsgTE5LRCBjb25maWd1cmVk
IGZvciBJUlEgMTEKWyAgICAwLjE5NjMyOF0gQUNQSTogUENJOiBJbnRlcnJ1cHQgbGluayBM
TktFIGNvbmZpZ3VyZWQgZm9yIElSUSAxMQpbICAgIDAuMTk2MzI4XSBBQ1BJOiBQQ0k6IElu
dGVycnVwdCBsaW5rIExOS0YgY29uZmlndXJlZCBmb3IgSVJRIDExClsgICAgMC4xOTYzMjhd
IEFDUEk6IFBDSTogSW50ZXJydXB0IGxpbmsgTE5LRyBjb25maWd1cmVkIGZvciBJUlEgMTEK
WyAgICAwLjE5NjMyOF0gQUNQSTogUENJOiBJbnRlcnJ1cHQgbGluayBMTktIIGNvbmZpZ3Vy
ZWQgZm9yIElSUSAxMQpbICAgIDAuMjA2NzMyXSBBQ1BJOiBFQzogaW50ZXJydXB0IHVuYmxv
Y2tlZApbICAgIDAuMjA2NzMzXSBBQ1BJOiBFQzogZXZlbnQgdW5ibG9ja2VkClsgICAgMC4y
MDcwNzBdIEFDUEk6IEVDOiBFQ19DTUQvRUNfU0M9MHg5MzQsIEVDX0RBVEE9MHg5MzAKWyAg
ICAwLjIwNzA3MF0gQUNQSTogRUM6IEdQRT0weDE0ClsgICAgMC4yMDcwNzBdIEFDUEk6IFxf
U0JfLlBDSTAuTFBDQi5FQ0RWOiBCb290IERTRFQgRUMgaW5pdGlhbGl6YXRpb24gY29tcGxl
dGUKWyAgICAwLjIwNzA3MF0gQUNQSTogXF9TQl8uUENJMC5MUENCLkVDRFY6IEVDOiBVc2Vk
IHRvIGhhbmRsZSB0cmFuc2FjdGlvbnMgYW5kIGV2ZW50cwpbICAgIDAuMjA3MDg1XSBpb21t
dTogRGVmYXVsdCBkb21haW4gdHlwZTogVHJhbnNsYXRlZApbICAgIDAuMjA3MDg1XSBpb21t
dTogRE1BIGRvbWFpbiBUTEIgaW52YWxpZGF0aW9uIHBvbGljeTogbGF6eSBtb2RlClsgICAg
MC4yMDcyMTRdIHBwc19jb3JlOiBMaW51eFBQUyBBUEkgdmVyLiAxIHJlZ2lzdGVyZWQKWyAg
ICAwLjIwNzIxNV0gcHBzX2NvcmU6IFNvZnR3YXJlIHZlci4gNS4zLjYgLSBDb3B5cmlnaHQg
MjAwNS0yMDA3IFJvZG9sZm8gR2lvbWV0dGkgPGdpb21ldHRpQGxpbnV4Lml0PgpbICAgIDAu
MjA3MjE4XSBQVFAgY2xvY2sgc3VwcG9ydCByZWdpc3RlcmVkClsgICAgMC4yMDcyMjldIEVE
QUMgTUM6IFZlcjogMy4wLjAKWyAgICAwLjIwNzYyOV0gZWZpdmFyczogUmVnaXN0ZXJlZCBl
Zml2YXJzIG9wZXJhdGlvbnMKWyAgICAwLjIwNzY1NF0gTmV0TGFiZWw6IEluaXRpYWxpemlu
ZwpbICAgIDAuMjA3NjU0XSBOZXRMYWJlbDogIGRvbWFpbiBoYXNoIHNpemUgPSAxMjgKWyAg
ICAwLjIwNzY1NF0gTmV0TGFiZWw6ICBwcm90b2NvbHMgPSBVTkxBQkVMRUQgQ0lQU092NCBD
QUxJUFNPClsgICAgMC4yMDc2NTRdIE5ldExhYmVsOiAgdW5sYWJlbGVkIHRyYWZmaWMgYWxs
b3dlZCBieSBkZWZhdWx0ClsgICAgMC4yMDc2NTRdIFBDSTogVXNpbmcgQUNQSSBmb3IgSVJR
IHJvdXRpbmcKWyAgICAwLjIzMTIxMF0gUENJOiBwY2lfY2FjaGVfbGluZV9zaXplIHNldCB0
byA2NCBieXRlcwpbICAgIDAuMjMxNTkwXSBlODIwOiByZXNlcnZlIFJBTSBidWZmZXIgW21l
bSAweDAwMDU4MDAwLTB4MDAwNWZmZmZdClsgICAgMC4yMzE1OTJdIGU4MjA6IHJlc2VydmUg
UkFNIGJ1ZmZlciBbbWVtIDB4MDAwOWUwMDAtMHgwMDA5ZmZmZl0KWyAgICAwLjIzMTU5M10g
ZTgyMDogcmVzZXJ2ZSBSQU0gYnVmZmVyIFttZW0gMHg1NTZhYjAwMC0weDU3ZmZmZmZmXQpb
ICAgIDAuMjMxNTk0XSBlODIwOiByZXNlcnZlIFJBTSBidWZmZXIgW21lbSAweDYyMjVmMDAw
LTB4NjNmZmZmZmZdClsgICAgMC4yMzE1OTVdIGU4MjA6IHJlc2VydmUgUkFNIGJ1ZmZlciBb
bWVtIDB4NjRkZjQwMDAtMHg2N2ZmZmZmZl0KWyAgICAwLjIzMTU5Nl0gZTgyMDogcmVzZXJ2
ZSBSQU0gYnVmZmVyIFttZW0gMHg3ODYwMDAwMC0weDdiZmZmZmZmXQpbICAgIDAuMjMxNTk3
XSBlODIwOiByZXNlcnZlIFJBTSBidWZmZXIgW21lbSAweDQ4MTgwMDAwMC0weDQ4M2ZmZmZm
Zl0KWyAgICAwLjIzMTYyOF0gcGNpIDAwMDA6MDA6MDIuMDogdmdhYXJiOiBzZXR0aW5nIGFz
IGJvb3QgVkdBIGRldmljZQpbICAgIDAuMjMxNjI4XSBwY2kgMDAwMDowMDowMi4wOiB2Z2Fh
cmI6IGJyaWRnZSBjb250cm9sIHBvc3NpYmxlClsgICAgMC4yMzE2MjhdIHBjaSAwMDAwOjAw
OjAyLjA6IHZnYWFyYjogVkdBIGRldmljZSBhZGRlZDogZGVjb2Rlcz1pbyttZW0sb3ducz1p
byttZW0sbG9ja3M9bm9uZQpbICAgIDAuMjMxNjI4XSB2Z2FhcmI6IGxvYWRlZApbICAgIDAu
MjMxNjI4XSBjbG9ja3NvdXJjZTogU3dpdGNoZWQgdG8gY2xvY2tzb3VyY2UgdHNjLWVhcmx5
ClsgICAgMC4yMzE2MzZdIFZGUzogRGlzayBxdW90YXMgZHF1b3RfNi42LjAKWyAgICAwLjIz
MTY0NV0gVkZTOiBEcXVvdC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMiAob3JkZXIg
MCwgNDA5NiBieXRlcykKWyAgICAwLjIzMTY4MV0gQXBwQXJtb3I6IEFwcEFybW9yIEZpbGVz
eXN0ZW0gRW5hYmxlZApbICAgIDAuMjMxNjkzXSBwbnA6IFBuUCBBQ1BJIGluaXQKWyAgICAw
LjIzMTg5OV0gc3lzdGVtIDAwOjAwOiBbaW8gIDB4MDY4MC0weDA2OWZdIGhhcyBiZWVuIHJl
c2VydmVkClsgICAgMC4yMzE5MDJdIHN5c3RlbSAwMDowMDogW2lvICAweGZmZmZdIGhhcyBi
ZWVuIHJlc2VydmVkClsgICAgMC4yMzE5MDNdIHN5c3RlbSAwMDowMDogW2lvICAweGZmZmZd
IGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC4yMzE5MDRdIHN5c3RlbSAwMDowMDogW2lvICAw
eGZmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC4yMzE5MDVdIHN5c3RlbSAwMDowMDog
W2lvICAweDE4MDAtMHgxOGZlXSBjb3VsZCBub3QgYmUgcmVzZXJ2ZWQKWyAgICAwLjIzMTkw
N10gc3lzdGVtIDAwOjAwOiBbaW8gIDB4MTY0ZS0weDE2NGZdIGhhcyBiZWVuIHJlc2VydmVk
ClsgICAgMC4yMzIzMjRdIHN5c3RlbSAwMDowNDogW21lbSAweGZlZDEwMDAwLTB4ZmVkMTdm
ZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC4yMzIzMjZdIHN5c3RlbSAwMDowNDogW21l
bSAweGZlZDE4MDAwLTB4ZmVkMThmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC4yMzIz
MjddIHN5c3RlbSAwMDowNDogW21lbSAweGZlZDE5MDAwLTB4ZmVkMTlmZmZdIGhhcyBiZWVu
IHJlc2VydmVkClsgICAgMC4yMzIzMjldIHN5c3RlbSAwMDowNDogW21lbSAweGUwMDAwMDAw
LTB4ZWZmZmZmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC4yMzIzMzBdIHN5c3RlbSAw
MDowNDogW21lbSAweGZlZDIwMDAwLTB4ZmVkM2ZmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsg
ICAgMC4yMzIzMzFdIHN5c3RlbSAwMDowNDogW21lbSAweGZlZDkwMDAwLTB4ZmVkOTNmZmZd
IGNvdWxkIG5vdCBiZSByZXNlcnZlZApbICAgIDAuMjMyMzMzXSBzeXN0ZW0gMDA6MDQ6IFtt
ZW0gMHhmZWQ0NTAwMC0weGZlZDhmZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuMjMy
MzM0XSBzeXN0ZW0gMDA6MDQ6IFttZW0gMHhmZjAwMDAwMC0weGZmZmZmZmZmXSBoYXMgYmVl
biByZXNlcnZlZApbICAgIDAuMjMyMzM1XSBzeXN0ZW0gMDA6MDQ6IFttZW0gMHhmZWUwMDAw
MC0weGZlZWZmZmZmXSBjb3VsZCBub3QgYmUgcmVzZXJ2ZWQKWyAgICAwLjIzMjMzN10gc3lz
dGVtIDAwOjA0OiBbbWVtIDB4ZGZmZTAwMDAtMHhkZmZmZmZmZl0gaGFzIGJlZW4gcmVzZXJ2
ZWQKWyAgICAwLjIzMjM3Ml0gc3lzdGVtIDAwOjA1OiBbbWVtIDB4ZmQwMDAwMDAtMHhmZGFi
ZmZmZl0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAwLjIzMjM3NF0gc3lzdGVtIDAwOjA1OiBb
bWVtIDB4ZmRhZDAwMDAtMHhmZGFkZmZmZl0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAwLjIz
MjM3NV0gc3lzdGVtIDAwOjA1OiBbbWVtIDB4ZmRiMDAwMDAtMHhmZGZmZmZmZl0gaGFzIGJl
ZW4gcmVzZXJ2ZWQKWyAgICAwLjIzMjM3Nl0gc3lzdGVtIDAwOjA1OiBbbWVtIDB4ZmUwMDAw
MDAtMHhmZTAxZmZmZl0gY291bGQgbm90IGJlIHJlc2VydmVkClsgICAgMC4yMzIzNzhdIHN5
c3RlbSAwMDowNTogW21lbSAweGZlMDM2MDAwLTB4ZmUwM2JmZmZdIGhhcyBiZWVuIHJlc2Vy
dmVkClsgICAgMC4yMzIzNzldIHN5c3RlbSAwMDowNTogW21lbSAweGZlMDNkMDAwLTB4ZmUz
ZmZmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC4yMzIzODFdIHN5c3RlbSAwMDowNTog
W21lbSAweGZlNDEwMDAwLTB4ZmU3ZmZmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMC4y
MzI2MzZdIHN5c3RlbSAwMDowNjogW2lvICAweGZmMDAtMHhmZmZlXSBoYXMgYmVlbiByZXNl
cnZlZApbICAgIDAuMjMzNTgyXSBzeXN0ZW0gMDA6MDc6IFttZW0gMHhmZTAyOTAwMC0weGZl
MDI5ZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAuMjMzNTg1XSBzeXN0ZW0gMDA6MDc6
IFttZW0gMHhmZTAyODAwMC0weGZlMDI4ZmZmXSBoYXMgYmVlbiByZXNlcnZlZApbICAgIDAu
MjM4Mjc4XSBwbnA6IFBuUCBBQ1BJOiBmb3VuZCA4IGRldmljZXMKWyAgICAwLjI0MzY1NV0g
Y2xvY2tzb3VyY2U6IGFjcGlfcG06IG1hc2s6IDB4ZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZm
ZmZmLCBtYXhfaWRsZV9uczogMjA4NTcwMTAyNCBucwpbICAgIDAuMjQzNzA0XSBORVQ6IFJl
Z2lzdGVyZWQgUEZfSU5FVCBwcm90b2NvbCBmYW1pbHkKWyAgICAwLjI0MzgxM10gSVAgaWRl
bnRzIGhhc2ggdGFibGUgZW50cmllczogMjYyMTQ0IChvcmRlcjogOSwgMjA5NzE1MiBieXRl
cywgbGluZWFyKQpbICAgIDAuMjU0NDYzXSB0Y3BfbGlzdGVuX3BvcnRhZGRyX2hhc2ggaGFz
aCB0YWJsZSBlbnRyaWVzOiA4MTkyIChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzLCBsaW5lYXIp
ClsgICAgMC4yNTQ0ODJdIFRhYmxlLXBlcnR1cmIgaGFzaCB0YWJsZSBlbnRyaWVzOiA2NTUz
NiAob3JkZXI6IDYsIDI2MjE0NCBieXRlcywgbGluZWFyKQpbICAgIDAuMjU0NTQ4XSBUQ1Ag
ZXN0YWJsaXNoZWQgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMzEwNzIgKG9yZGVyOiA4LCAxMDQ4
NTc2IGJ5dGVzLCBsaW5lYXIpClsgICAgMC4yNTQ3NDddIFRDUCBiaW5kIGhhc2ggdGFibGUg
ZW50cmllczogNjU1MzYgKG9yZGVyOiA5LCAyMDk3MTUyIGJ5dGVzLCBsaW5lYXIpClsgICAg
MC4yNTQ5NDNdIFRDUDogSGFzaCB0YWJsZXMgY29uZmlndXJlZCAoZXN0YWJsaXNoZWQgMTMx
MDcyIGJpbmQgNjU1MzYpClsgICAgMC4yNTUwMTJdIE1QVENQIHRva2VuIGhhc2ggdGFibGUg
ZW50cmllczogMTYzODQgKG9yZGVyOiA2LCAzOTMyMTYgYnl0ZXMsIGxpbmVhcikKWyAgICAw
LjI1NTA3OF0gVURQIGhhc2ggdGFibGUgZW50cmllczogODE5MiAob3JkZXI6IDcsIDUyNDI4
OCBieXRlcywgbGluZWFyKQpbICAgIDAuMjU1MTQ1XSBVRFAtTGl0ZSBoYXNoIHRhYmxlIGVu
dHJpZXM6IDgxOTIgKG9yZGVyOiA3LCA1MjQyODggYnl0ZXMsIGxpbmVhcikKWyAgICAwLjI1
NTIyM10gTkVUOiBSZWdpc3RlcmVkIFBGX1VOSVgvUEZfTE9DQUwgcHJvdG9jb2wgZmFtaWx5
ClsgICAgMC4yNTUyMjhdIE5FVDogUmVnaXN0ZXJlZCBQRl9YRFAgcHJvdG9jb2wgZmFtaWx5
ClsgICAgMC4yNTUyMzddIHBjaSAwMDAwOjAwOjFjLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAw
eDEwMDAtMHgwZmZmXSB0byBbYnVzIDAxLTM5XSBhZGRfc2l6ZSAxMDAwClsgICAgMC4yNTUy
NDddIHBjaSAwMDAwOjAwOjFjLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDIwMDAtMHgyZmZm
XTogYXNzaWduZWQKWyAgICAwLjI1NTI1MV0gcGNpIDAwMDA6MDA6MWMuMDogUENJIGJyaWRn
ZSB0byBbYnVzIDAxLTM5XQpbICAgIDAuMjU1MjUzXSBwY2kgMDAwMDowMDoxYy4wOiAgIGJy
aWRnZSB3aW5kb3cgW2lvICAweDIwMDAtMHgyZmZmXQpbICAgIDAuMjU1MjU2XSBwY2kgMDAw
MDowMDoxYy4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweGM0MDAwMDAwLTB4ZGEwZmZmZmZd
ClsgICAgMC4yNTUyNTldIHBjaSAwMDAwOjAwOjFjLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVt
IDB4YTAwMDAwMDAtMHhjMWZmZmZmZiA2NGJpdCBwcmVmXQpbICAgIDAuMjU1MjYzXSBwY2kg
MDAwMDowMDoxYy40OiBQQ0kgYnJpZGdlIHRvIFtidXMgM2FdClsgICAgMC4yNTUyNjVdIHBj
aSAwMDAwOjAwOjFjLjQ6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4ZGMwMDAwMDAtMHhkYzFm
ZmZmZl0KWyAgICAwLjI1NTI3MF0gcGNpIDAwMDA6MDA6MWMuNTogUENJIGJyaWRnZSB0byBb
YnVzIDNiXQpbICAgIDAuMjU1MjczXSBwY2kgMDAwMDowMDoxYy41OiAgIGJyaWRnZSB3aW5k
b3cgW21lbSAweGRjMzAwMDAwLTB4ZGMzZmZmZmZdClsgICAgMC4yNTUyNzhdIHBjaSAwMDAw
OjAwOjFkLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAzY10KWyAgICAwLjI1NTI4MF0gcGNpIDAw
MDA6MDA6MWQuMDogICBicmlkZ2Ugd2luZG93IFttZW0gMHhkYzIwMDAwMC0weGRjMmZmZmZm
XQpbICAgIDAuMjU1Mjg1XSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDQgW2lvICAweDAw
MDAtMHgwY2Y3IHdpbmRvd10KWyAgICAwLjI1NTI4N10gcGNpX2J1cyAwMDAwOjAwOiByZXNv
dXJjZSA1IFtpbyAgMHgwZDAwLTB4ZmZmZiB3aW5kb3ddClsgICAgMC4yNTUyODhdIHBjaV9i
dXMgMDAwMDowMDogcmVzb3VyY2UgNiBbbWVtIDB4MDAwYTAwMDAtMHgwMDBkZmZmZiB3aW5k
b3ddClsgICAgMC4yNTUyODldIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgNyBbbWVtIDB4
N2M4MDAwMDAtMHhkZmZmZmZmZiB3aW5kb3ddClsgICAgMC4yNTUyOTBdIHBjaV9idXMgMDAw
MDowMDogcmVzb3VyY2UgOCBbbWVtIDB4ZmQwMDAwMDAtMHhmZTdmZmZmZiB3aW5kb3ddClsg
ICAgMC4yNTUyOTFdIHBjaV9idXMgMDAwMDowMTogcmVzb3VyY2UgMCBbaW8gIDB4MjAwMC0w
eDJmZmZdClsgICAgMC4yNTUyOTJdIHBjaV9idXMgMDAwMDowMTogcmVzb3VyY2UgMSBbbWVt
IDB4YzQwMDAwMDAtMHhkYTBmZmZmZl0KWyAgICAwLjI1NTI5M10gcGNpX2J1cyAwMDAwOjAx
OiByZXNvdXJjZSAyIFttZW0gMHhhMDAwMDAwMC0weGMxZmZmZmZmIDY0Yml0IHByZWZdClsg
ICAgMC4yNTUyOTVdIHBjaV9idXMgMDAwMDozYTogcmVzb3VyY2UgMSBbbWVtIDB4ZGMwMDAw
MDAtMHhkYzFmZmZmZl0KWyAgICAwLjI1NTI5Nl0gcGNpX2J1cyAwMDAwOjNiOiByZXNvdXJj
ZSAxIFttZW0gMHhkYzMwMDAwMC0weGRjM2ZmZmZmXQpbICAgIDAuMjU1Mjk3XSBwY2lfYnVz
IDAwMDA6M2M6IHJlc291cmNlIDEgW21lbSAweGRjMjAwMDAwLTB4ZGMyZmZmZmZdClsgICAg
MC4yNTU4NzNdIFBDSTogQ0xTIDAgYnl0ZXMsIGRlZmF1bHQgNjQKWyAgICAwLjI1NTkxNl0g
cGNpIDAwMDA6MDA6MWYuMTogWzgwODY6OWQyMF0gdHlwZSAwMCBjbGFzcyAweDA1ODAwMCBj
b252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMC4yNTYwNTRdIHBjaSAwMDAwOjAwOjFm
LjE6IEJBUiAwIFttZW0gMHhmZDAwMDAwMC0weGZkZmZmZmZmIDY0Yml0XQpbICAgIDAuMjU2
MTgwXSBETUFSOiBBQ1BJIGRldmljZSAiZGV2aWNlOjc5IiB1bmRlciBETUFSIGF0IGZlZDkx
MDAwIGFzIDAwOjE1LjAKWyAgICAwLjI1NjE4NF0gRE1BUjogQUNQSSBkZXZpY2UgImRldmlj
ZTo3YSIgdW5kZXIgRE1BUiBhdCBmZWQ5MTAwMCBhcyAwMDoxNS4xClsgICAgMC4yNTYyMDJd
IFBDSS1ETUE6IFVzaW5nIHNvZnR3YXJlIGJvdW5jZSBidWZmZXJpbmcgZm9yIElPIChTV0lP
VExCKQpbICAgIDAuMjU2MjA0XSBzb2Z0d2FyZSBJTyBUTEI6IG1hcHBlZCBbbWVtIDB4MDAw
MDAwMDA1ZTI1ZjAwMC0weDAwMDAwMDAwNjIyNWYwMDBdICg2NE1CKQpbICAgIDAuMjU2MjQw
XSBVbnBhY2tpbmcgaW5pdHJhbWZzLi4uClsgICAgMC4yNTYyNjBdIHNneDogRVBDIHNlY3Rp
b24gMHg3MDIwMDAwMC0weDc1ZjdmZmZmClsgICAgMC4yNTY3OThdIHNneDogU0dYIGRpc2Fi
bGVkOiBTR1ggbGF1bmNoIGNvbnRyb2wgQ1BVIGZlYXR1cmUgaXMgbm90IGF2YWlsYWJsZSwg
L2Rldi9zZ3hfZW5jbGF2ZSBkaXNhYmxlZC4KWyAgICAwLjI1NzMyMF0gSW5pdGlhbGlzZSBz
eXN0ZW0gdHJ1c3RlZCBrZXlyaW5ncwpbICAgIDAuMjU3MzMxXSBLZXkgdHlwZSBibGFja2xp
c3QgcmVnaXN0ZXJlZApbICAgIDAuMjU3NDYzXSB3b3JraW5nc2V0OiB0aW1lc3RhbXBfYml0
cz0zNiBtYXhfb3JkZXI9MjIgYnVja2V0X29yZGVyPTAKWyAgICAwLjI1Nzc1Nl0gZnVzZTog
aW5pdCAoQVBJIHZlcnNpb24gNy40MykKWyAgICAwLjI4OTA5OV0gRnJlZWluZyBpbml0cmQg
bWVtb3J5OiAxNjY2MEsKWyAgICAwLjI5MTc0M10gYWxnOiBzZWxmLXRlc3RzIGRpc2FibGVk
ClsgICAgMC4yOTYzNTRdIEtleSB0eXBlIGFzeW1tZXRyaWMgcmVnaXN0ZXJlZApbICAgIDAu
Mjk2MzU3XSBBc3ltbWV0cmljIGtleSBwYXJzZXIgJ3g1MDknIHJlZ2lzdGVyZWQKWyAgICAw
LjI5NjM4M10gQmxvY2sgbGF5ZXIgU0NTSSBnZW5lcmljIChic2cpIGRyaXZlciB2ZXJzaW9u
IDAuNCBsb2FkZWQgKG1ham9yIDI0NykKWyAgICAwLjI5NjQwOV0gaW8gc2NoZWR1bGVyIG1x
LWRlYWRsaW5lIHJlZ2lzdGVyZWQKWyAgICAwLjI5Njk2Ml0gbGVkdHJpZy1jcHU6IHJlZ2lz
dGVyZWQgdG8gaW5kaWNhdGUgYWN0aXZpdHkgb24gQ1BVcwpbICAgIDAuMjk5NTgzXSB0aGVy
bWFsIExOWFRIRVJNOjAwOiByZWdpc3RlcmVkIGFzIHRoZXJtYWxfem9uZTAKWyAgICAwLjI5
OTU4NV0gQUNQSTogdGhlcm1hbDogVGhlcm1hbCBab25lIFtUSE1dICgyNSBDKQpbICAgIDAu
Mjk5NzE4XSBTZXJpYWw6IDgyNTAvMTY1NTAgZHJpdmVyLCA0IHBvcnRzLCBJUlEgc2hhcmlu
ZyBlbmFibGVkClsgICAgMC4zMDAyMDNdIGhwZXRfYWNwaV9hZGQ6IG5vIGFkZHJlc3Mgb3Ig
aXJxcyBpbiBfQ1JTClsgICAgMC4zMTE4NDFdIHRwbV90aXMgTVNGVDAxMDE6MDA6IDIuMCBU
UE0gKGRldmljZS1pZCAweEZFLCByZXYtaWQgNCkKWyAgICAwLjM0Njc0M10gaTgwNDI6IFBO
UDogUFMvMiBDb250cm9sbGVyIFtQTlAwMzAzOlBTMkssUE5QMGYxMzpQUzJNXSBhdCAweDYw
LDB4NjQgaXJxIDEsMTIKWyAgICAwLjM0NzA4MF0gaTgwNDI6IFdhcm5pbmc6IEtleWxvY2sg
YWN0aXZlClsgICAgMC4zNDkzNTVdIHNlcmlvOiBpODA0MiBLQkQgcG9ydCBhdCAweDYwLDB4
NjQgaXJxIDEKWyAgICAwLjM0OTM1OV0gc2VyaW86IGk4MDQyIEFVWCBwb3J0IGF0IDB4NjAs
MHg2NCBpcnEgMTIKWyAgICAwLjM0OTQ1NF0gbW91c2VkZXY6IFBTLzIgbW91c2UgZGV2aWNl
IGNvbW1vbiBmb3IgYWxsIG1pY2UKWyAgICAwLjM0OTQ2N10gcnRjX2Ntb3MgMDA6MDE6IFJU
QyBjYW4gd2FrZSBmcm9tIFM0ClsgICAgMC4zNTAxNTldIHJ0Y19jbW9zIDAwOjAxOiByZWdp
c3RlcmVkIGFzIHJ0YzAKWyAgICAwLjM1MDMxNl0gcnRjX2Ntb3MgMDA6MDE6IHNldHRpbmcg
c3lzdGVtIGNsb2NrIHRvIDIwMjUtMDQtMDNUMTY6NDI6MzIgVVRDICgxNzQzNjk4NTUyKQpb
ICAgIDAuMzUwMzM5XSBydGNfY21vcyAwMDowMTogYWxhcm1zIHVwIHRvIG9uZSBtb250aCwg
eTNrLCAyNDIgYnl0ZXMgbnZyYW0KWyAgICAwLjM1MDQzOV0gaW50ZWxfcHN0YXRlOiBJbnRl
bCBQLXN0YXRlIGRyaXZlciBpbml0aWFsaXppbmcKWyAgICAwLjM1MDYxM10gaW50ZWxfcHN0
YXRlOiBIV1AgZW5hYmxlZApbICAgIDAuMzUwOTAxXSBlZmlmYjogcHJvYmluZyBmb3IgZWZp
ZmIKWyAgICAwLjM1MDkxMl0gZWZpZmI6IGZyYW1lYnVmZmVyIGF0IDB4OTAwMDAwMDAsIHVz
aW5nIDIyNTAwaywgdG90YWwgMjI1MDBrClsgICAgMC4zNTA5MTNdIGVmaWZiOiBtb2RlIGlz
IDMyMDB4MTgwMHgzMiwgbGluZWxlbmd0aD0xMjgwMCwgcGFnZXM9MQpbICAgIDAuMzUwOTE0
XSBlZmlmYjogc2Nyb2xsaW5nOiByZWRyYXcKWyAgICAwLjM1MDkxNV0gZWZpZmI6IFRydWVj
b2xvcjogc2l6ZT04Ojg6ODo4LCBzaGlmdD0yNDoxNjo4OjAKWyAgICAwLjM1MDk4Ml0gQ29u
c29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBmcmFtZSBidWZmZXIgZGV2aWNlIDIwMHg1Ngpb
ICAgIDAuMzUzNTQxXSBpbnB1dDogQVQgVHJhbnNsYXRlZCBTZXQgMiBrZXlib2FyZCBhcyAv
ZGV2aWNlcy9wbGF0Zm9ybS9pODA0Mi9zZXJpbzAvaW5wdXQvaW5wdXQwClsgICAgMC4zNTM1
NThdIGZiMDogRUZJIFZHQSBmcmFtZSBidWZmZXIgZGV2aWNlClsgICAgMC4zNTM4NjhdIE5F
VDogUmVnaXN0ZXJlZCBQRl9JTkVUNiBwcm90b2NvbCBmYW1pbHkKWyAgICAwLjM1NjY3OV0g
U2VnbWVudCBSb3V0aW5nIHdpdGggSVB2NgpbICAgIDAuMzU2NjkyXSBJbi1zaXR1IE9BTSAo
SU9BTSkgd2l0aCBJUHY2ClsgICAgMC4zNTY3MjFdIG1pcDY6IE1vYmlsZSBJUHY2ClsgICAg
MC4zNTY3MjRdIE5FVDogUmVnaXN0ZXJlZCBQRl9QQUNLRVQgcHJvdG9jb2wgZmFtaWx5Clsg
ICAgMC4zNTY3NDddIG1wbHNfZ3NvOiBNUExTIEdTTyBzdXBwb3J0ClsgICAgMC4zNTY5NjNd
IEVORVJHWV9QRVJGX0JJQVM6IFNldCB0byAnbm9ybWFsJywgd2FzICdwZXJmb3JtYW5jZScK
WyAgICAwLjM1Njk5Ml0gbWljcm9jb2RlOiBDdXJyZW50IHJldmlzaW9uOiAweDAwMDAwMGY2
ClsgICAgMC4zNTY5OTNdIG1pY3JvY29kZTogVXBkYXRlZCBlYXJseSBmcm9tOiAweDAwMDAw
MGYwClsgICAgMC4zNTcwNTFdIElQSSBzaG9ydGhhbmQgYnJvYWRjYXN0OiBlbmFibGVkClsg
ICAgMC4zNTgwMzddIHNjaGVkX2Nsb2NrOiBNYXJraW5nIHN0YWJsZSAoMzUyMDAyMDk4LCA1
ODYyNDYzKS0+KDM3MDUxMDE0MiwgLTEyNjQ1NTgxKQpbICAgIDAuMzU4MTc4XSByZWdpc3Rl
cmVkIHRhc2tzdGF0cyB2ZXJzaW9uIDEKWyAgICAwLjM1ODI1M10gTG9hZGluZyBjb21waWxl
ZC1pbiBYLjUwOSBjZXJ0aWZpY2F0ZXMKWyAgICAwLjM1OTgyNF0gRGVtb3Rpb24gdGFyZ2V0
cyBmb3IgTm9kZSAwOiBudWxsClsgICAgMC4zNTk4OTVdIEtleSB0eXBlIC5mc2NyeXB0IHJl
Z2lzdGVyZWQKWyAgICAwLjM1OTg5Nl0gS2V5IHR5cGUgZnNjcnlwdC1wcm92aXNpb25pbmcg
cmVnaXN0ZXJlZApbICAgIDAuMzYzOTk0XSBjcnlwdGQ6IG5vIHN5bWJvbCB2ZXJzaW9uIGZv
ciB0aGlzX2NwdV9vZmYKWyAgICAwLjM2NDM1M10gY3J5cHRkOiBtYXhfY3B1X3FsZW4gc2V0
IHRvIDEwMDAKWyAgICAwLjM3MTI5MV0gS2V5IHR5cGUgZW5jcnlwdGVkIHJlZ2lzdGVyZWQK
WyAgICAwLjM3MTI5N10gQXBwQXJtb3I6IEFwcEFybW9yIHNoYTI1NiBwb2xpY3kgaGFzaGlu
ZyBlbmFibGVkClsgICAgMC4zNzE2NjldIFJBUzogQ29ycmVjdGFibGUgRXJyb3JzIGNvbGxl
Y3RvciBpbml0aWFsaXplZC4KWyAgICAwLjM3NDQ5NV0gY2xrOiBEaXNhYmxpbmcgdW51c2Vk
IGNsb2NrcwpbICAgIDAuMzc1MzAwXSBGcmVlaW5nIHVudXNlZCBkZWNyeXB0ZWQgbWVtb3J5
OiAyMDM2SwpbICAgIDAuMzc1NzA5XSBGcmVlaW5nIHVudXNlZCBrZXJuZWwgaW1hZ2UgKGlu
aXRtZW0pIG1lbW9yeTogMjkxMksKWyAgICAwLjM3NTczMl0gV3JpdGUgcHJvdGVjdGluZyB0
aGUga2VybmVsIHJlYWQtb25seSBkYXRhOiAyNjYyNGsKWyAgICAwLjM3NTkyNV0gRnJlZWlu
ZyB1bnVzZWQga2VybmVsIGltYWdlICh0ZXh0L3JvZGF0YSBnYXApIG1lbW9yeTogNDhLClsg
ICAgMC4zNzYzMDFdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSAocm9kYXRhL2RhdGEg
Z2FwKSBtZW1vcnk6IDE5NzZLClsgICAgMC4zODc1MTNdIHg4Ni9tbTogQ2hlY2tlZCBXK1gg
bWFwcGluZ3M6IHBhc3NlZCwgbm8gVytYIHBhZ2VzIGZvdW5kLgpbICAgIDAuMzg3NTMzXSBS
dW4gL2luaXQgYXMgaW5pdCBwcm9jZXNzClsgICAgMC4zODc1MzVdICAgd2l0aCBhcmd1bWVu
dHM6ClsgICAgMC4zODc1MzZdICAgICAvaW5pdApbICAgIDAuMzg3NTM2XSAgIHdpdGggZW52
aXJvbm1lbnQ6ClsgICAgMC4zODc1MzddICAgICBIT01FPS8KWyAgICAwLjM4NzUzOF0gICAg
IFRFUk09bGludXgKWyAgICAwLjM4NzUzOF0gICAgIEJPT1RfSU1BR0U9L3ZtbGludXotNi4x
NC4wLTEyOTY2LWdhMmNjNmZmNWVjOGYKWyAgICAwLjQ4MDE1MF0gbnZtZSBudm1lMDogcGNp
IGZ1bmN0aW9uIDAwMDA6M2M6MDAuMApbICAgIDAuNTAwODQ5XSBudm1lIG52bWUwOiA0LzAv
MCBkZWZhdWx0L3JlYWQvcG9sbCBxdWV1ZXMKWyAgICAwLjUwNjgxNF0gIG52bWUwbjE6IHAx
IHAyIHAzIHA0ClsgICAgMC41NjEyMjBdIGRldmljZS1tYXBwZXI6IHVldmVudDogdmVyc2lv
biAxLjAuMwpbICAgIDAuNTYxNDM0XSBkZXZpY2UtbWFwcGVyOiBpb2N0bDogNC40OS4wLWlv
Y3RsICgyMDI1LTAxLTE3KSBpbml0aWFsaXNlZDogZG0tZGV2ZWxAbGlzdHMubGludXguZGV2
ClsgICAgMS4yODYxMjddIHRzYzogUmVmaW5lZCBUU0MgY2xvY2tzb3VyY2UgY2FsaWJyYXRp
b246IDI5MDQuMDA3IE1IegpbICAgIDEuMjg2MTUyXSBjbG9ja3NvdXJjZTogdHNjOiBtYXNr
OiAweGZmZmZmZmZmZmZmZmZmZmYgbWF4X2N5Y2xlczogMHgyOWRjMGM1MDA0NSwgbWF4X2lk
bGVfbnM6IDQ0MDc5NTIwODMwNCBucwpbICAgIDEuMjg2MjE4XSBjbG9ja3NvdXJjZTogU3dp
dGNoZWQgdG8gY2xvY2tzb3VyY2UgdHNjClsgICAxNS4wNDk5NDZdIFBNOiBJbWFnZSBub3Qg
Zm91bmQgKGNvZGUgLTIyKQpbICAgMTUuMTEwNjU3XSBFWFQ0LWZzIChkbS0wKTogbW91bnRl
ZCBmaWxlc3lzdGVtIDMyZTI5ODgyLWQ5NGQtNGE5Mi05ZWU0LTRkMDMwMDJiZmEyOSBybyB3
aXRoIG9yZGVyZWQgZGF0YSBtb2RlLiBRdW90YSBtb2RlOiBub25lLgpbICAgMTUuMjI0OTkw
XSBzeXN0ZW1kWzFdOiBJbnNlcnRlZCBtb2R1bGUgJ2F1dG9mczQnClsgICAxNS4yNjM5MDBd
IHN5c3RlbWRbMV06IHN5c3RlbWQgMjU3LjQtOSBydW5uaW5nIGluIHN5c3RlbSBtb2RlICgr
UEFNICtBVURJVCArU0VMSU5VWCArQVBQQVJNT1IgK0lNQSArSVBFICtTTUFDSyArU0VDQ09N
UCArR0NSWVBUIC1HTlVUTFMgK09QRU5TU0wgK0FDTCArQkxLSUQgK0NVUkwgK0VMRlVUSUxT
ICtGSURPMiArSUROMiAtSUROICtJUFRDICtLTU9EICtMSUJDUllQVFNFVFVQICtMSUJDUllQ
VFNFVFVQX1BMVUdJTlMgK0xJQkZESVNLICtQQ1JFMiArUFdRVUFMSVRZICtQMTFLSVQgK1FS
RU5DT0RFICtUUE0yICtCWklQMiArTFo0ICtYWiArWkxJQiArWlNURCArQlBGX0ZSQU1FV09S
SyArQlRGIC1YS0JDT01NT04gLVVUTVAgK1NZU1ZJTklUICtMSUJBUkNISVZFKQpbICAgMTUu
MjYzOTE2XSBzeXN0ZW1kWzFdOiBEZXRlY3RlZCBhcmNoaXRlY3R1cmUgeDg2LTY0LgpbICAg
MTUuMjY2ODc4XSBzeXN0ZW1kWzFdOiBIb3N0bmFtZSBzZXQgdG8gPGFicmV1Pi4KWyAgIDE1
LjU1ODE3NF0gc3lzdGVtZFsxXTogYnBmLXJlc3RyaWN0LWZzOiBMU00gQlBGIHByb2dyYW0g
YXR0YWNoZWQKWyAgIDE1LjYwODEzNV0gc3lzdGVtZC1zeXN2LWdlbmVyYXRvcls0NjBdOiBT
eXNWIHNlcnZpY2UgJy9ldGMvaW5pdC5kL3hsMnRwZCcgbGFja3MgYSBuYXRpdmUgc3lzdGVt
ZCB1bml0IGZpbGUsIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGluZyBhIHVuaXQgZmlsZSBmb3Ig
Y29tcGF0aWJpbGl0eS4KWyAgIDE1LjYwODEzOV0gc3lzdGVtZC1zeXN2LWdlbmVyYXRvcls0
NjBdOiBQbGVhc2UgdXBkYXRlIHBhY2thZ2UgdG8gaW5jbHVkZSBhIG5hdGl2ZSBzeXN0ZW1k
IHVuaXQgZmlsZS4KWyAgIDE1LjYwODE0MF0gc3lzdGVtZC1zeXN2LWdlbmVyYXRvcls0NjBd
OiAhIFRoaXMgY29tcGF0aWJpbGl0eSBsb2dpYyBpcyBkZXByZWNhdGVkLCBleHBlY3QgcmVt
b3ZhbCBzb29uLiAhClsgICAxNS43MTMxMDNdIHN5c3RlbWRbMV06IFF1ZXVlZCBzdGFydCBq
b2IgZm9yIGRlZmF1bHQgdGFyZ2V0IGdyYXBoaWNhbC50YXJnZXQuClsgICAxNS43MzkxMDdd
IHN5c3RlbWRbMV06IENyZWF0ZWQgc2xpY2Ugc3lzdGVtLWdldHR5LnNsaWNlIC0gU2xpY2Ug
L3N5c3RlbS9nZXR0eS4KWyAgIDE1LjczOTU0NF0gc3lzdGVtZFsxXTogQ3JlYXRlZCBzbGlj
ZSBzeXN0ZW0tbW9kcHJvYmUuc2xpY2UgLSBTbGljZSAvc3lzdGVtL21vZHByb2JlLgpbICAg
MTUuNzM5OTA0XSBzeXN0ZW1kWzFdOiBDcmVhdGVkIHNsaWNlIHN5c3RlbS1zeXN0ZW1kXHgy
ZGNyeXB0c2V0dXAuc2xpY2UgLSBFbmNyeXB0ZWQgVm9sdW1lIFVuaXRzIFNlcnZpY2UgU2xp
Y2UuClsgICAxNS43NDAyNjJdIHN5c3RlbWRbMV06IENyZWF0ZWQgc2xpY2Ugc3lzdGVtLXN5
c3RlbWRceDJkZnNjay5zbGljZSAtIFNsaWNlIC9zeXN0ZW0vc3lzdGVtZC1mc2NrLgpbICAg
MTUuNzQwNDg2XSBzeXN0ZW1kWzFdOiBDcmVhdGVkIHNsaWNlIHVzZXIuc2xpY2UgLSBVc2Vy
IGFuZCBTZXNzaW9uIFNsaWNlLgpbICAgMTUuNzQwNTUwXSBzeXN0ZW1kWzFdOiBTdGFydGVk
IHN5c3RlbWQtYXNrLXBhc3N3b3JkLWNvbnNvbGUucGF0aCAtIERpc3BhdGNoIFBhc3N3b3Jk
IFJlcXVlc3RzIHRvIENvbnNvbGUgRGlyZWN0b3J5IFdhdGNoLgpbICAgMTUuNzQwNTk0XSBz
eXN0ZW1kWzFdOiBTdGFydGVkIHN5c3RlbWQtYXNrLXBhc3N3b3JkLXdhbGwucGF0aCAtIEZv
cndhcmQgUGFzc3dvcmQgUmVxdWVzdHMgdG8gV2FsbCBEaXJlY3RvcnkgV2F0Y2guClsgICAx
NS43NDA3NzRdIHN5c3RlbWRbMV06IFNldCB1cCBhdXRvbW91bnQgcHJvYy1zeXMtZnMtYmlu
Zm10X21pc2MuYXV0b21vdW50IC0gQXJiaXRyYXJ5IEV4ZWN1dGFibGUgRmlsZSBGb3JtYXRz
IEZpbGUgU3lzdGVtIEF1dG9tb3VudCBQb2ludC4KWyAgIDE1Ljc0MDc5N10gc3lzdGVtZFsx
XTogRXhwZWN0aW5nIGRldmljZSBkZXYtZGlzay1ieVx4MmRkaXNrc2VxLTFceDJkcGFydDQu
ZGV2aWNlIC0gL2Rldi9kaXNrL2J5LWRpc2tzZXEvMS1wYXJ0NC4uLgpbICAgMTUuNzQwODA1
XSBzeXN0ZW1kWzFdOiBFeHBlY3RpbmcgZGV2aWNlIGRldi1kaXNrLWJ5XHgyZHV1aWQtMmQy
M2ZkNGNceDJkNWQwM1x4MmQ0ZTFhXHgyZDhhNDJceDJkMGU4NTlkMWYwMGQ4LmRldmljZSAt
IC9kZXYvZGlzay9ieS11dWlkLzJkMjNmZDRjLTVkMDMtNGUxYS04YTQyLTBlODU5ZDFmMDBk
OC4uLgpbICAgMTUuNzQwODEzXSBzeXN0ZW1kWzFdOiBFeHBlY3RpbmcgZGV2aWNlIGRldi1k
aXNrLWJ5XHgyZHV1aWQtNjFiZThmNTBceDJkNjljNVx4MmQ0OWE1XHgyZGJjYWRceDJkM2Y0
NTIxZTljN2I1LmRldmljZSAtIC9kZXYvZGlzay9ieS11dWlkLzYxYmU4ZjUwLTY5YzUtNDlh
NS1iY2FkLTNmNDUyMWU5YzdiNS4uLgpbICAgMTUuNzQwODI2XSBzeXN0ZW1kWzFdOiBFeHBl
Y3RpbmcgZGV2aWNlIGRldi1kaXNrLWJ5XHgyZHV1aWQtOTZCRFx4MmQ1NjUzLmRldmljZSAt
IC9kZXYvZGlzay9ieS11dWlkLzk2QkQtNTY1My4uLgpbICAgMTUuNzQwODU2XSBzeXN0ZW1k
WzFdOiBSZWFjaGVkIHRhcmdldCBpbnRlZ3JpdHlzZXR1cC50YXJnZXQgLSBMb2NhbCBJbnRl
Z3JpdHkgUHJvdGVjdGVkIFZvbHVtZXMuClsgICAxNS43NDA4ODNdIHN5c3RlbWRbMV06IFJl
YWNoZWQgdGFyZ2V0IG5zcy11c2VyLWxvb2t1cC50YXJnZXQgLSBVc2VyIGFuZCBHcm91cCBO
YW1lIExvb2t1cHMuClsgICAxNS43NDA4OTVdIHN5c3RlbWRbMV06IFJlYWNoZWQgdGFyZ2V0
IHBhdGhzLnRhcmdldCAtIFBhdGggVW5pdHMuClsgICAxNS43NDA5MTNdIHN5c3RlbWRbMV06
IFJlYWNoZWQgdGFyZ2V0IHJlbW90ZS1mcy50YXJnZXQgLSBSZW1vdGUgRmlsZSBTeXN0ZW1z
LgpbICAgMTUuNzQwOTI0XSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdldCBzbGljZXMudGFy
Z2V0IC0gU2xpY2UgVW5pdHMuClsgICAxNS43NDA5NjFdIHN5c3RlbWRbMV06IFJlYWNoZWQg
dGFyZ2V0IHZlcml0eXNldHVwLnRhcmdldCAtIExvY2FsIFZlcml0eSBQcm90ZWN0ZWQgVm9s
dW1lcy4KWyAgIDE1Ljc0MjU4MV0gc3lzdGVtZFsxXTogTGlzdGVuaW5nIG9uIHN5c3RlbWQt
Y29yZWR1bXAuc29ja2V0IC0gUHJvY2VzcyBDb3JlIER1bXAgU29ja2V0LgpbICAgMTUuNzQz
NzMyXSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gc3lzdGVtZC1jcmVkcy5zb2NrZXQgLSBD
cmVkZW50aWFsIEVuY3J5cHRpb24vRGVjcnlwdGlvbi4KWyAgIDE1Ljc0Mzg1OF0gc3lzdGVt
ZFsxXTogTGlzdGVuaW5nIG9uIHN5c3RlbWQtaW5pdGN0bC5zb2NrZXQgLSBpbml0Y3RsIENv
bXBhdGliaWxpdHkgTmFtZWQgUGlwZS4KWyAgIDE1Ljc0Mzk0N10gc3lzdGVtZFsxXTogTGlz
dGVuaW5nIG9uIHN5c3RlbWQtam91cm5hbGQtZGV2LWxvZy5zb2NrZXQgLSBKb3VybmFsIFNv
Y2tldCAoL2Rldi9sb2cpLgpbICAgMTUuNzQ0MDcwXSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcg
b24gc3lzdGVtZC1qb3VybmFsZC5zb2NrZXQgLSBKb3VybmFsIFNvY2tldHMuClsgICAxNS43
NDQxMjldIHN5c3RlbWRbMV06IHN5c3RlbWQtcGNyZXh0ZW5kLnNvY2tldCAtIFRQTSBQQ1Ig
TWVhc3VyZW1lbnRzIHdhcyBza2lwcGVkIGJlY2F1c2Ugb2YgYW4gdW5tZXQgY29uZGl0aW9u
IGNoZWNrIChDb25kaXRpb25TZWN1cml0eT1tZWFzdXJlZC11a2kpLgpbICAgMTUuNzQ0MTUy
XSBzeXN0ZW1kWzFdOiBzeXN0ZW1kLXBjcmxvY2suc29ja2V0IC0gTWFrZSBUUE0gUENSIFBv
bGljeSB3YXMgc2tpcHBlZCBiZWNhdXNlIG9mIGFuIHVubWV0IGNvbmRpdGlvbiBjaGVjayAo
Q29uZGl0aW9uU2VjdXJpdHk9bWVhc3VyZWQtdWtpKS4KWyAgIDE1Ljc0NDI0NV0gc3lzdGVt
ZFsxXTogTGlzdGVuaW5nIG9uIHN5c3RlbWQtdWRldmQtY29udHJvbC5zb2NrZXQgLSB1ZGV2
IENvbnRyb2wgU29ja2V0LgpbICAgMTUuNzQ0MzA5XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcg
b24gc3lzdGVtZC11ZGV2ZC1rZXJuZWwuc29ja2V0IC0gdWRldiBLZXJuZWwgU29ja2V0Lgpb
ICAgMTUuNzQ1Nzg3XSBzeXN0ZW1kWzFdOiBNb3VudGluZyBkZXYtaHVnZXBhZ2VzLm1vdW50
IC0gSHVnZSBQYWdlcyBGaWxlIFN5c3RlbS4uLgpbICAgMTUuNzQ2NTc2XSBzeXN0ZW1kWzFd
OiBNb3VudGluZyBkZXYtbXF1ZXVlLm1vdW50IC0gUE9TSVggTWVzc2FnZSBRdWV1ZSBGaWxl
IFN5c3RlbS4uLgpbICAgMTUuNzQ3ODg3XSBzeXN0ZW1kWzFdOiBNb3VudGluZyBydW4tbG9j
ay5tb3VudCAtIExlZ2FjeSBMb2NrcyBEaXJlY3RvcnkgL3J1bi9sb2NrLi4uClsgICAxNS43
NDkwNDldIHN5c3RlbWRbMV06IE1vdW50aW5nIHN5cy1rZXJuZWwtZGVidWcubW91bnQgLSBL
ZXJuZWwgRGVidWcgRmlsZSBTeXN0ZW0uLi4KWyAgIDE1Ljc1NDM2MF0gc3lzdGVtZFsxXTog
TW91bnRpbmcgc3lzLWtlcm5lbC10cmFjaW5nLm1vdW50IC0gS2VybmVsIFRyYWNlIEZpbGUg
U3lzdGVtLi4uClsgICAxNS43NTc2NzRdIHN5c3RlbWRbMV06IFN0YXJ0aW5nIGttb2Qtc3Rh
dGljLW5vZGVzLnNlcnZpY2UgLSBDcmVhdGUgTGlzdCBvZiBTdGF0aWMgRGV2aWNlIE5vZGVz
Li4uClsgICAxNS43NjAwNjJdIHN5c3RlbWRbMV06IFN0YXJ0aW5nIG1vZHByb2JlQGNvbmZp
Z2ZzLnNlcnZpY2UgLSBMb2FkIEtlcm5lbCBNb2R1bGUgY29uZmlnZnMuLi4KWyAgIDE1Ljc2
NDQ5N10gc3lzdGVtZFsxXTogU3RhcnRpbmcgbW9kcHJvYmVAZHJtLnNlcnZpY2UgLSBMb2Fk
IEtlcm5lbCBNb2R1bGUgZHJtLi4uClsgICAxNS43NzExMzFdIHN5c3RlbWRbMV06IFN0YXJ0
aW5nIG1vZHByb2JlQGVmaV9wc3RvcmUuc2VydmljZSAtIExvYWQgS2VybmVsIE1vZHVsZSBl
ZmlfcHN0b3JlLi4uClsgICAxNS43NzQ2NzldIHN5c3RlbWRbMV06IFN0YXJ0aW5nIG1vZHBy
b2JlQGZ1c2Uuc2VydmljZSAtIExvYWQgS2VybmVsIE1vZHVsZSBmdXNlLi4uClsgICAxNS43
NzQ3ODNdIHN5c3RlbWRbMV06IHN5c3RlbWQtZnNjay1yb290LnNlcnZpY2UgLSBGaWxlIFN5
c3RlbSBDaGVjayBvbiBSb290IERldmljZSB3YXMgc2tpcHBlZCBiZWNhdXNlIG9mIGFuIHVu
bWV0IGNvbmRpdGlvbiBjaGVjayAoQ29uZGl0aW9uUGF0aEV4aXN0cz0hL3J1bi9pbml0cmFt
ZnMvZnNjay1yb290KS4KWyAgIDE1Ljc3NDg2Nl0gc3lzdGVtZFsxXTogc3lzdGVtZC1oaWJl
cm5hdGUtY2xlYXIuc2VydmljZSAtIENsZWFyIFN0YWxlIEhpYmVybmF0ZSBTdG9yYWdlIElu
Zm8gd2FzIHNraXBwZWQgYmVjYXVzZSBvZiBhbiB1bm1ldCBjb25kaXRpb24gY2hlY2sgKENv
bmRpdGlvblBhdGhFeGlzdHM9L3N5cy9maXJtd2FyZS9lZmkvZWZpdmFycy9IaWJlcm5hdGVM
b2NhdGlvbi04Y2YyNjQ0Yi00YjBiLTQyOGYtOTM4Ny02ZDg3NjA1MGRjNjcpLgpbICAgMTUu
Nzc4MTM4XSBzeXN0ZW1kWzFdOiBTdGFydGluZyBzeXN0ZW1kLWpvdXJuYWxkLnNlcnZpY2Ug
LSBKb3VybmFsIFNlcnZpY2UuLi4KWyAgIDE1Ljc4MzA3NV0gcHN0b3JlOiBVc2luZyBjcmFz
aCBkdW1wIGNvbXByZXNzaW9uOiBkZWZsYXRlClsgICAxNS43ODUyMTZdIHN5c3RlbWRbMV06
IFN0YXJ0aW5nIHN5c3RlbWQtbW9kdWxlcy1sb2FkLnNlcnZpY2UgLSBMb2FkIEtlcm5lbCBN
b2R1bGVzLi4uClsgICAxNS43ODUyNTNdIHN5c3RlbWRbMV06IHN5c3RlbWQtcGNybWFjaGlu
ZS5zZXJ2aWNlIC0gVFBNIFBDUiBNYWNoaW5lIElEIE1lYXN1cmVtZW50IHdhcyBza2lwcGVk
IGJlY2F1c2Ugb2YgYW4gdW5tZXQgY29uZGl0aW9uIGNoZWNrIChDb25kaXRpb25TZWN1cml0
eT1tZWFzdXJlZC11a2kpLgpbICAgMTUuNzkwMDQ4XSBzeXN0ZW1kWzFdOiBTdGFydGluZyBz
eXN0ZW1kLXJlbW91bnQtZnMuc2VydmljZSAtIFJlbW91bnQgUm9vdCBhbmQgS2VybmVsIEZp
bGUgU3lzdGVtcy4uLgpbICAgMTUuNzkwMTIzXSBzeXN0ZW1kWzFdOiBzeXN0ZW1kLXRwbTIt
c2V0dXAtZWFybHkuc2VydmljZSAtIEVhcmx5IFRQTSBTUksgU2V0dXAgd2FzIHNraXBwZWQg
YmVjYXVzZSBvZiBhbiB1bm1ldCBjb25kaXRpb24gY2hlY2sgKENvbmRpdGlvblNlY3VyaXR5
PW1lYXN1cmVkLXVraSkuClsgICAxNS43OTQ4MThdIHN5c3RlbWRbMV06IFN0YXJ0aW5nIHN5
c3RlbWQtdWRldi1sb2FkLWNyZWRlbnRpYWxzLnNlcnZpY2UgLSBMb2FkIHVkZXYgUnVsZXMg
ZnJvbSBDcmVkZW50aWFscy4uLgpbICAgMTUuNzk1OTc2XSBwc3RvcmU6IFJlZ2lzdGVyZWQg
ZWZpX3BzdG9yZSBhcyBwZXJzaXN0ZW50IHN0b3JlIGJhY2tlbmQKWyAgIDE1LjgwMTk2OV0g
c3lzdGVtZFsxXTogU3RhcnRpbmcgc3lzdGVtZC11ZGV2LXRyaWdnZXIuc2VydmljZSAtIENv
bGRwbHVnIEFsbCB1ZGV2IERldmljZXMuLi4KWyAgIDE1LjgwNDM2OV0gQUNQSTogYnVzIHR5
cGUgZHJtX2Nvbm5lY3RvciByZWdpc3RlcmVkClsgICAxNS44MDYzMjddIHN5c3RlbWRbMV06
IE1vdW50ZWQgZGV2LWh1Z2VwYWdlcy5tb3VudCAtIEh1Z2UgUGFnZXMgRmlsZSBTeXN0ZW0u
ClsgICAxNS44MDY0MzRdIHN5c3RlbWRbMV06IE1vdW50ZWQgZGV2LW1xdWV1ZS5tb3VudCAt
IFBPU0lYIE1lc3NhZ2UgUXVldWUgRmlsZSBTeXN0ZW0uClsgICAxNS44MDY5NDJdIHN5c3Rl
bWRbMV06IE1vdW50ZWQgcnVuLWxvY2subW91bnQgLSBMZWdhY3kgTG9ja3MgRGlyZWN0b3J5
IC9ydW4vbG9jay4KWyAgIDE1LjgwNzAxMV0gc3lzdGVtZFsxXTogTW91bnRlZCBzeXMta2Vy
bmVsLWRlYnVnLm1vdW50IC0gS2VybmVsIERlYnVnIEZpbGUgU3lzdGVtLgpbICAgMTUuODA3
MDkyXSBzeXN0ZW1kWzFdOiBNb3VudGVkIHN5cy1rZXJuZWwtdHJhY2luZy5tb3VudCAtIEtl
cm5lbCBUcmFjZSBGaWxlIFN5c3RlbS4KWyAgIDE1LjgwNzM2NF0gc3lzdGVtZFsxXTogRmlu
aXNoZWQga21vZC1zdGF0aWMtbm9kZXMuc2VydmljZSAtIENyZWF0ZSBMaXN0IG9mIFN0YXRp
YyBEZXZpY2UgTm9kZXMuClsgICAxNS44MDc2MzVdIHN5c3RlbWRbMV06IG1vZHByb2JlQGNv
bmZpZ2ZzLnNlcnZpY2U6IERlYWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4KWyAgIDE1LjgwNzgw
NV0gc3lzdGVtZFsxXTogRmluaXNoZWQgbW9kcHJvYmVAY29uZmlnZnMuc2VydmljZSAtIExv
YWQgS2VybmVsIE1vZHVsZSBjb25maWdmcy4KWyAgIDE1LjgwODAzNl0gc3lzdGVtZFsxXTog
bW9kcHJvYmVAZHJtLnNlcnZpY2U6IERlYWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4KWyAgIDE1
LjgwODIwMF0gc3lzdGVtZFsxXTogRmluaXNoZWQgbW9kcHJvYmVAZHJtLnNlcnZpY2UgLSBM
b2FkIEtlcm5lbCBNb2R1bGUgZHJtLgpbICAgMTUuODA4NDI3XSBzeXN0ZW1kWzFdOiBtb2Rw
cm9iZUBlZmlfcHN0b3JlLnNlcnZpY2U6IERlYWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4KWyAg
IDE1LjgwODUzNl0gbHA6IGRyaXZlciBsb2FkZWQgYnV0IG5vIGRldmljZXMgZm91bmQKWyAg
IDE1LjgwODU5MV0gc3lzdGVtZFsxXTogRmluaXNoZWQgbW9kcHJvYmVAZWZpX3BzdG9yZS5z
ZXJ2aWNlIC0gTG9hZCBLZXJuZWwgTW9kdWxlIGVmaV9wc3RvcmUuClsgICAxNS44MDg4MTJd
IHN5c3RlbWRbMV06IG1vZHByb2JlQGZ1c2Uuc2VydmljZTogRGVhY3RpdmF0ZWQgc3VjY2Vz
c2Z1bGx5LgpbICAgMTUuODA4OTYxXSBzeXN0ZW1kWzFdOiBGaW5pc2hlZCBtb2Rwcm9iZUBm
dXNlLnNlcnZpY2UgLSBMb2FkIEtlcm5lbCBNb2R1bGUgZnVzZS4KWyAgIDE1LjgxMTUxOF0g
cHBkZXY6IHVzZXItc3BhY2UgcGFyYWxsZWwgcG9ydCBkcml2ZXIKWyAgIDE1LjgxMjY1Nl0g
c3lzdGVtZFsxXTogTW91bnRpbmcgc3lzLWZzLWZ1c2UtY29ubmVjdGlvbnMubW91bnQgLSBG
VVNFIENvbnRyb2wgRmlsZSBTeXN0ZW0uLi4KWyAgIDE1LjgxNDQ4NV0gc3lzdGVtZFsxXTog
TW91bnRpbmcgc3lzLWtlcm5lbC1jb25maWcubW91bnQgLSBLZXJuZWwgQ29uZmlndXJhdGlv
biBGaWxlIFN5c3RlbS4uLgpbICAgMTUuODE4MzkxXSBzeXN0ZW1kWzFdOiBTdGFydGluZyBz
eXN0ZW1kLXRtcGZpbGVzLXNldHVwLWRldi1lYXJseS5zZXJ2aWNlIC0gQ3JlYXRlIFN0YXRp
YyBEZXZpY2UgTm9kZXMgaW4gL2RldiBncmFjZWZ1bGx5Li4uClsgICAxNS44MTk0NzhdIHN5
c3RlbWRbMV06IEZpbmlzaGVkIHN5c3RlbWQtdWRldi1sb2FkLWNyZWRlbnRpYWxzLnNlcnZp
Y2UgLSBMb2FkIHVkZXYgUnVsZXMgZnJvbSBDcmVkZW50aWFscy4KWyAgIDE1LjgyMDA1NF0g
c3lzdGVtZFsxXTogTW91bnRlZCBzeXMtZnMtZnVzZS1jb25uZWN0aW9ucy5tb3VudCAtIEZV
U0UgQ29udHJvbCBGaWxlIFN5c3RlbS4KWyAgIDE1LjgyMzMwNl0gc3lzdGVtZC1qb3VybmFs
ZFs0NzRdOiBDb2xsZWN0aW5nIGF1ZGl0IG1lc3NhZ2VzIGlzIGRpc2FibGVkLgpbICAgMTUu
ODI0MTI5XSBzeXN0ZW1kWzFdOiBGaW5pc2hlZCBzeXN0ZW1kLW1vZHVsZXMtbG9hZC5zZXJ2
aWNlIC0gTG9hZCBLZXJuZWwgTW9kdWxlcy4KWyAgIDE1LjgzMDA1NV0gc3lzdGVtZFsxXTog
U3RhcnRpbmcgc3lzdGVtZC1zeXNjdGwuc2VydmljZSAtIEFwcGx5IEtlcm5lbCBWYXJpYWJs
ZXMuLi4KWyAgIDE1LjgzMDk0MF0gc3lzdGVtZFsxXTogTW91bnRlZCBzeXMta2VybmVsLWNv
bmZpZy5tb3VudCAtIEtlcm5lbCBDb25maWd1cmF0aW9uIEZpbGUgU3lzdGVtLgpbICAgMTUu
ODMzMzA1XSBFWFQ0LWZzIChkbS0wKTogcmUtbW91bnRlZCAzMmUyOTg4Mi1kOTRkLTRhOTIt
OWVlNC00ZDAzMDAyYmZhMjkgci93LgpbICAgMTUuODM0NjQzXSBzeXN0ZW1kWzFdOiBGaW5p
c2hlZCBzeXN0ZW1kLXJlbW91bnQtZnMuc2VydmljZSAtIFJlbW91bnQgUm9vdCBhbmQgS2Vy
bmVsIEZpbGUgU3lzdGVtcy4KWyAgIDE1LjgzNTAwOF0gc3lzdGVtZFsxXTogc3lzdGVtZC1o
d2RiLXVwZGF0ZS5zZXJ2aWNlIC0gUmVidWlsZCBIYXJkd2FyZSBEYXRhYmFzZSB3YXMgc2tp
cHBlZCBiZWNhdXNlIG9mIGFuIHVubWV0IGNvbmRpdGlvbiBjaGVjayAoQ29uZGl0aW9uTmVl
ZHNVcGRhdGU9L2V0YykuClsgICAxNS44MzUwNThdIHN5c3RlbWRbMV06IHN5c3RlbWQtcHN0
b3JlLnNlcnZpY2UgLSBQbGF0Zm9ybSBQZXJzaXN0ZW50IFN0b3JhZ2UgQXJjaGl2YWwgd2Fz
IHNraXBwZWQgYmVjYXVzZSBvZiBhbiB1bm1ldCBjb25kaXRpb24gY2hlY2sgKENvbmRpdGlv
bkRpcmVjdG9yeU5vdEVtcHR5PS9zeXMvZnMvcHN0b3JlKS4KWyAgIDE1LjgzNjE0N10gc3lz
dGVtZFsxXTogU3RhcnRpbmcgc3lzdGVtZC1yYW5kb20tc2VlZC5zZXJ2aWNlIC0gTG9hZC9T
YXZlIE9TIFJhbmRvbSBTZWVkLi4uClsgICAxNS44MzYxNzNdIHN5c3RlbWRbMV06IHN5c3Rl
bWQtdHBtMi1zZXR1cC5zZXJ2aWNlIC0gVFBNIFNSSyBTZXR1cCB3YXMgc2tpcHBlZCBiZWNh
dXNlIG9mIGFuIHVubWV0IGNvbmRpdGlvbiBjaGVjayAoQ29uZGl0aW9uU2VjdXJpdHk9bWVh
c3VyZWQtdWtpKS4KWyAgIDE1Ljg0MzA2NV0gc3lzdGVtZFsxXTogRmluaXNoZWQgc3lzdGVt
ZC1zeXNjdGwuc2VydmljZSAtIEFwcGx5IEtlcm5lbCBWYXJpYWJsZXMuClsgICAxNS44NDM2
MTRdIHN5c3RlbWRbMV06IEZpbmlzaGVkIHN5c3RlbWQtdG1wZmlsZXMtc2V0dXAtZGV2LWVh
cmx5LnNlcnZpY2UgLSBDcmVhdGUgU3RhdGljIERldmljZSBOb2RlcyBpbiAvZGV2IGdyYWNl
ZnVsbHkuClsgICAxNS44NDM3NTJdIHN5c3RlbWRbMV06IHN5c3RlbWQtc3lzdXNlcnMuc2Vy
dmljZSAtIENyZWF0ZSBTeXN0ZW0gVXNlcnMgd2FzIHNraXBwZWQgYmVjYXVzZSBubyB0cmln
Z2VyIGNvbmRpdGlvbiBjaGVja3Mgd2VyZSBtZXQuClsgICAxNS44NDYwMDddIHN5c3RlbWRb
MV06IFN0YXJ0aW5nIHN5c3RlbWQtdGltZXN5bmNkLnNlcnZpY2UgLSBOZXR3b3JrIFRpbWUg
U3luY2hyb25pemF0aW9uLi4uClsgICAxNS44NDc2MjRdIHN5c3RlbWRbMV06IFN0YXJ0aW5n
IHN5c3RlbWQtdG1wZmlsZXMtc2V0dXAtZGV2LnNlcnZpY2UgLSBDcmVhdGUgU3RhdGljIERl
dmljZSBOb2RlcyBpbiAvZGV2Li4uClsgICAxNS44NTU4MjFdIHN5c3RlbWRbMV06IEZpbmlz
aGVkIHN5c3RlbWQtcmFuZG9tLXNlZWQuc2VydmljZSAtIExvYWQvU2F2ZSBPUyBSYW5kb20g
U2VlZC4KWyAgIDE1Ljg1OTE2Nl0gc3lzdGVtZFsxXTogU3RhcnRlZCBzeXN0ZW1kLWpvdXJu
YWxkLnNlcnZpY2UgLSBKb3VybmFsIFNlcnZpY2UuClsgICAxNS44NzM2NjddIHN5c3RlbWQt
am91cm5hbGRbNDc0XTogUmVjZWl2ZWQgY2xpZW50IHJlcXVlc3QgdG8gZmx1c2ggcnVudGlt
ZSBqb3VybmFsLgpbICAgMTYuMDIwMTU5XSBpbnB1dDogTGlkIFN3aXRjaCBhcyAvZGV2aWNl
cy9MTlhTWVNUTTowMC9MTlhTWUJVUzowMC9QTlAwQzBEOjAwL2lucHV0L2lucHV0OQpbICAg
MTYuMDM0NzA4XSB3bWlfYnVzIHdtaV9idXMtUE5QMEMxNDowMTogW0Zpcm13YXJlIEJ1Z106
IFdRQkMgZGF0YSBibG9jayBxdWVyeSBjb250cm9sIG1ldGhvZCBub3QgZm91bmQKWyAgIDE2
LjAzNTc0OF0gQUNQSTogYnV0dG9uOiBMaWQgU3dpdGNoIFtMSUQwXQpbICAgMTYuMDM1ODEy
XSBpbnB1dDogUG93ZXIgQnV0dG9uIGFzIC9kZXZpY2VzL0xOWFNZU1RNOjAwL0xOWFNZQlVT
OjAwL1BOUDBDMEM6MDAvaW5wdXQvaW5wdXQxMApbICAgMTYuMDM2MjE5XSBBQ1BJOiBidXR0
b246IFBvd2VyIEJ1dHRvbiBbUEJUTl0KWyAgIDE2LjAzNjQzNl0gaW5wdXQ6IFNsZWVwIEJ1
dHRvbiBhcyAvZGV2aWNlcy9MTlhTWVNUTTowMC9MTlhTWUJVUzowMC9QTlAwQzBFOjAwL2lu
cHV0L2lucHV0MTEKWyAgIDE2LjAzNzIxNl0gQUNQSTogQUM6IEFDIEFkYXB0ZXIgW0FDXSAo
b24tbGluZSkKWyAgIDE2LjA0MTk2N10gaW50ZWxfcG1jX2NvcmUgSU5UMzNBMTowMDogIGlu
aXRpYWxpemVkClsgICAxNi4wNDIyMzNdIEFDUEk6IGJ1dHRvbjogU2xlZXAgQnV0dG9uIFtT
QlROXQpbICAgMTYuMDQyOTgwXSBpbnB1dDogUG93ZXIgQnV0dG9uIGFzIC9kZXZpY2VzL0xO
WFNZU1RNOjAwL0xOWFBXUkJOOjAwL2lucHV0L2lucHV0MTIKWyAgIDE2LjA0MzY0NV0gaW5w
dXQ6IEludGVsIFZpcnR1YWwgQnV0dG9ucyBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6
MDA6MWYuMC9QTlAwQzA5OjAwL0lOVDMzRDY6MDAvaW5wdXQvaW5wdXQxMwpbICAgMTYuMDQ0
NjM1XSBBQ1BJOiBidXR0b246IFBvd2VyIEJ1dHRvbiBbUFdSRl0KWyAgIDE2LjA4MTU2MF0g
aGlkOiByYXcgSElEIGV2ZW50cyBkcml2ZXIgKEMpIEppcmkgS29zaW5hClsgICAxNi4wODI0
NDFdIEFDUEk6IGJhdHRlcnk6IFNsb3QgW0JBVDBdIChiYXR0ZXJ5IHByZXNlbnQpClsgICAx
Ni4wOTEzOTNdIGludGVsLWxwc3MgMDAwMDowMDoxNS4wOiBlbmFibGluZyBkZXZpY2UgKDAw
MDAgLT4gMDAwMikKWyAgIDE2LjA5MTYwNF0gaWRtYTY0IGlkbWE2NC4wOiBGb3VuZCBJbnRl
bCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgIDE2LjA5ODk5MV0gaW5wdXQ6IEludGVsIEhJ
RCBldmVudHMgYXMgL2RldmljZXMvcGxhdGZvcm0vSU5UMzNENTowMC9pbnB1dC9pbnB1dDE1
ClsgICAxNi4xMDAyMTZdIEFDUEk6IGJ1cyB0eXBlIFVTQiByZWdpc3RlcmVkClsgICAxNi4x
MDAyNDZdIHJ0c3hfcGNpIDAwMDA6M2I6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+
IDAwMDIpClsgICAxNi4xMDAzNjJdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFj
ZSBkcml2ZXIgdXNiZnMKWyAgIDE2LjEwMDg0Nl0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcg
aW50ZXJmYWNlIGRyaXZlciBodWIKWyAgIDE2LjEwMDg2NV0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgZGV2aWNlIGRyaXZlciB1c2IKWyAgIDE2LjEwMDk0N10gaW50ZWwtaGlkIElOVDMz
RDU6MDA6IHBsYXRmb3JtIHN1cHBvcnRzIDUgYnV0dG9uIGFycmF5ClsgICAxNi4xMDU2MTRd
IEFkZGluZyA4Mzg3OTA0ayBzd2FwIG9uIC9kZXYvbnZtZTBuMXA0LiAgUHJpb3JpdHk6LTIg
ZXh0ZW50czoxIGFjcm9zczo4Mzg3OTA0ayBTUwpbICAgMTYuMTExMzIzXSBpbnB1dDogSW50
ZWwgSElEIDUgYnV0dG9uIGFycmF5IGFzIC9kZXZpY2VzL3BsYXRmb3JtL0lOVDMzRDU6MDAv
aW5wdXQvaW5wdXQxNgpbICAgMTYuMTMxMzA3XSBtZWlfbWUgMDAwMDowMDoxNi4wOiBlbmFi
bGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKWyAgIDE2LjEzNDQ5MF0gaTgwMV9zbWJ1cyAw
MDAwOjAwOjFmLjQ6IFNQRCBXcml0ZSBEaXNhYmxlIGlzIHNldApbICAgMTYuMTM0NTA4XSBp
ODAxX3NtYnVzIDAwMDA6MDA6MWYuNDogU01CdXMgdXNpbmcgUENJIGludGVycnVwdApbICAg
MTYuMTM5MTA2XSB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IHhIQ0kgSG9zdCBDb250cm9sbGVy
ClsgICAxNi4xMzkxMTddIHhoY2lfaGNkIDAwMDA6MDA6MTQuMDogbmV3IFVTQiBidXMgcmVn
aXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAxClsgICAxNi4xNDAzMjddIHhoY2lfaGNk
IDAwMDA6MDA6MTQuMDogaGNjIHBhcmFtcyAweDIwMDA3N2MxIGhjaSB2ZXJzaW9uIDB4MTAw
IHF1aXJrcyAweDAwMDAwMDAwODExMDk4MTAKWyAgIDE2LjE2MTQ3Nl0gaW5wdXQ6IFBDIFNw
ZWFrZXIgYXMgL2RldmljZXMvcGxhdGZvcm0vcGNzcGtyL2lucHV0L2lucHV0MTcKWyAgIDE2
LjE2NzgzN10geGhjaV9oY2QgMDAwMDowMDoxNC4wOiB4SENJIEhvc3QgQ29udHJvbGxlcgpb
ICAgMTYuMTY3ODUzXSB4aGNpX2hjZCAwMDAwOjAwOjE0LjA6IG5ldyBVU0IgYnVzIHJlZ2lz
dGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iZXIgMgpbICAgMTYuMTY3ODU3XSB4aGNpX2hjZCAw
MDAwOjAwOjE0LjA6IEhvc3Qgc3VwcG9ydHMgVVNCIDMuMCBTdXBlclNwZWVkClsgICAxNi4x
Njc5ODFdIHVzYiB1c2IxOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MWQ2Yiwg
aWRQcm9kdWN0PTAwMDIsIGJjZERldmljZT0gNi4xNApbICAgMTYuMTY3OTg1XSB1c2IgdXNi
MTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTMsIFByb2R1Y3Q9MiwgU2VyaWFsTnVt
YmVyPTEKWyAgIDE2LjE2Nzk4N10gdXNiIHVzYjE6IFByb2R1Y3Q6IHhIQ0kgSG9zdCBDb250
cm9sbGVyClsgICAxNi4xNjc5ODldIHVzYiB1c2IxOiBNYW51ZmFjdHVyZXI6IExpbnV4IDYu
MTQuMC0xMjk2Ni1nYTJjYzZmZjVlYzhmIHhoY2ktaGNkClsgICAxNi4xNjc5OTBdIHVzYiB1
c2IxOiBTZXJpYWxOdW1iZXI6IDAwMDA6MDA6MTQuMApbICAgMTYuMTY4NTI5XSBodWIgMS0w
OjEuMDogVVNCIGh1YiBmb3VuZApbICAgMTYuMTY4NzQwXSBodWIgMS0wOjEuMDogMTIgcG9y
dHMgZGV0ZWN0ZWQKWyAgIDE2LjE2OTAzMV0gY2ZnODAyMTE6IExvYWRpbmcgY29tcGlsZWQt
aW4gWC41MDkgY2VydGlmaWNhdGVzIGZvciByZWd1bGF0b3J5IGRhdGFiYXNlClsgICAxNi4x
NzI1NzJdIExvYWRlZCBYLjUwOSBjZXJ0ICdzZm9yc2hlZTogMDBiMjhkZGY0N2FlZjljZWE3
JwpbICAgMTYuMTcyNzA5XSBMb2FkZWQgWC41MDkgY2VydCAnd2VuczogNjFjMDM4NjUxYWFi
ZGNmOTRiZDBhYzdmZjA2YzcyNDhkYjE4YzYwMCcKWyAgIDE2LjE3NTA2MV0gY2ZnODAyMTE6
IGxvYWRlZCByZWd1bGF0b3J5LmRiIGlzIG1hbGZvcm1lZCBvciBzaWduYXR1cmUgaXMgbWlz
c2luZy9pbnZhbGlkClsgICAxNi4xNzU2MTBdIHVzYiB1c2IyOiBOZXcgVVNCIGRldmljZSBm
b3VuZCwgaWRWZW5kb3I9MWQ2YiwgaWRQcm9kdWN0PTAwMDMsIGJjZERldmljZT0gNi4xNApb
ICAgMTYuMTc1NjEzXSB1c2IgdXNiMjogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTMs
IFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTEKWyAgIDE2LjE3NTYxNV0gdXNiIHVzYjI6IFBy
b2R1Y3Q6IHhIQ0kgSG9zdCBDb250cm9sbGVyClsgICAxNi4xNzU2MTZdIHVzYiB1c2IyOiBN
YW51ZmFjdHVyZXI6IExpbnV4IDYuMTQuMC0xMjk2Ni1nYTJjYzZmZjVlYzhmIHhoY2ktaGNk
ClsgICAxNi4xNzU2MTddIHVzYiB1c2IyOiBTZXJpYWxOdW1iZXI6IDAwMDA6MDA6MTQuMApb
ICAgMTYuMTc1ODU5XSBodWIgMi0wOjEuMDogVVNCIGh1YiBmb3VuZApbICAgMTYuMTc1ODkz
XSBodWIgMi0wOjEuMDogNiBwb3J0cyBkZXRlY3RlZApbICAgMTYuMjA0Njc5XSBpbnRlbC1s
cHNzIDAwMDA6MDA6MTUuMTogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpClsgICAx
Ni4yMDYxMTldIHByb2NfdGhlcm1hbCAwMDAwOjAwOjA0LjA6IGVuYWJsaW5nIGRldmljZSAo
MDAwMCAtPiAwMDAyKQpbICAgMTYuMjA3NjIwXSBSQVBMIFBNVTogQVBJIHVuaXQgaXMgMl4t
MzIgSm91bGVzLCA1IGZpeGVkIGNvdW50ZXJzLCA2NTUzNjAgbXMgb3ZmbCB0aW1lcgpbICAg
MTYuMjA3NjI0XSBSQVBMIFBNVTogaHcgdW5pdCBvZiBkb21haW4gcHAwLWNvcmUgMl4tMTQg
Sm91bGVzClsgICAxNi4yMDc2MjZdIFJBUEwgUE1VOiBodyB1bml0IG9mIGRvbWFpbiBwYWNr
YWdlIDJeLTE0IEpvdWxlcwpbICAgMTYuMjA3NjI3XSBSQVBMIFBNVTogaHcgdW5pdCBvZiBk
b21haW4gZHJhbSAyXi0xNCBKb3VsZXMKWyAgIDE2LjIwNzYyOF0gUkFQTCBQTVU6IGh3IHVu
aXQgb2YgZG9tYWluIHBwMS1ncHUgMl4tMTQgSm91bGVzClsgICAxNi4yMDc2MjldIFJBUEwg
UE1VOiBodyB1bml0IG9mIGRvbWFpbiBwc3lzIDJeLTE0IEpvdWxlcwpbICAgMTYuMjE0MjIy
XSBpZG1hNjQgaWRtYTY0LjE6IEZvdW5kIEludGVsIGludGVncmF0ZWQgRE1BIDY0LWJpdApb
ICAgMTYuMjI2MDM1XSBpbnRlbF9yYXBsX2NvbW1vbjogRm91bmQgUkFQTCBkb21haW4gcGFj
a2FnZQpbICAgMTYuMjI2MDM5XSBpbnRlbF9yYXBsX2NvbW1vbjogRm91bmQgUkFQTCBkb21h
aW4gZHJhbQpbICAgMTYuNDIxOTA5XSB1c2IgMS0zOiBuZXcgZnVsbC1zcGVlZCBVU0IgZGV2
aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNkClsgICAxNi41NTkyNDVdIHVzYiAxLTM6IE5l
dyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wY2YzLCBpZFByb2R1Y3Q9ZTMwMCwgYmNk
RGV2aWNlPSAwLjAxClsgICAxNi41NTkyNDhdIHVzYiAxLTM6IE5ldyBVU0IgZGV2aWNlIHN0
cmluZ3M6IE1mcj0wLCBQcm9kdWN0PTAsIFNlcmlhbE51bWJlcj0wClsgICAxNi42NTI0NDFd
IGludGVsX3JhcGxfY29tbW9uOiBGb3VuZCBSQVBMIGRvbWFpbiBwYWNrYWdlClsgICAxNi42
NTI0NDVdIGludGVsX3JhcGxfY29tbW9uOiBGb3VuZCBSQVBMIGRvbWFpbiBjb3JlClsgICAx
Ni42NTI0NDddIGludGVsX3JhcGxfY29tbW9uOiBGb3VuZCBSQVBMIGRvbWFpbiB1bmNvcmUK
WyAgIDE2LjY1MjQ0OF0gaW50ZWxfcmFwbF9jb21tb246IEZvdW5kIFJBUEwgZG9tYWluIGRy
YW0KWyAgIDE2LjY1MjQ1MF0gaW50ZWxfcmFwbF9jb21tb246IEZvdW5kIFJBUEwgZG9tYWlu
IHBzeXMKWyAgIDE2LjY1NjcyMV0gc3RhY2tkZXBvdDogYWxsb2NhdGluZyBoYXNoIHRhYmxl
IG9mIDEwNDg1NzYgZW50cmllcyB2aWEga3ZjYWxsb2MKWyAgIDE2LjY1OTU2MF0gaTkxNSAw
MDAwOjAwOjAyLjA6IFtkcm1dIEZvdW5kIGthYnlsYWtlL3VsdCAoZGV2aWNlIElEIDU5MTYp
IGludGVncmF0ZWQgZGlzcGxheSB2ZXJzaW9uIDkuMDAgc3RlcHBpbmcgQjAKWyAgIDE2LjY2
MTA0OV0gaVRDT192ZW5kb3Jfc3VwcG9ydDogdmVuZG9yLXN1cHBvcnQ9MApbICAgMTYuNjYz
ODEzXSBpVENPX3dkdCBpVENPX3dkdDogRm91bmQgYSBJbnRlbCBQQ0ggVENPIGRldmljZSAo
VmVyc2lvbj00LCBUQ09CQVNFPTB4MDQwMCkKWyAgIDE2LjY2NDM4Nl0gaVRDT193ZHQgaVRD
T193ZHQ6IGluaXRpYWxpemVkLiBoZWFydGJlYXQ9MzAgc2VjIChub3dheW91dD0wKQpbICAg
MTYuNjY2MjU0XSBDb25zb2xlOiBzd2l0Y2hpbmcgdG8gY29sb3VyIGR1bW15IGRldmljZSA4
MHgyNQpbICAgMTYuNjY2NTEyXSBhdGgxMGtfcGNpIDAwMDA6M2E6MDAuMDogZW5hYmxpbmcg
ZGV2aWNlICgwMDAwIC0+IDAwMDIpClsgICAxNi42NjY4MThdIGk5MTUgMDAwMDowMDowMi4w
OiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUKWyAgIDE2LjY2ODk3MV0gc25kX2hk
YV9pbnRlbCAwMDAwOjAwOjFmLjM6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQpb
ICAgMTYuNjcwNzg2XSBhdGgxMGtfcGNpIDAwMDA6M2E6MDAuMDogcGNpIGlycSBtc2kgb3Bl
cl9pcnFfbW9kZSAyIGlycV9tb2RlIDAgcmVzZXRfbW9kZSAwClsgICAxNi42NzgwNDBdIHVz
YiAxLTQ6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDMgdXNpbmcgeGhjaV9o
Y2QKWyAgIDE2LjY4MzE0NV0gaTkxNSAwMDAwOjAwOjAyLjA6IHZnYWFyYjogVkdBIGRlY29k
ZXMgY2hhbmdlZDogb2xkZGVjb2Rlcz1pbyttZW0sZGVjb2Rlcz1pbyttZW06b3ducz1pbytt
ZW0KWyAgIDE2LjY4NDQwMl0gaTkxNSAwMDAwOjAwOjAyLjA6IFtkcm1dIEZpbmlzaGVkIGxv
YWRpbmcgRE1DIGZpcm13YXJlIGk5MTUva2JsX2RtY192ZXIxXzA0LmJpbiAodjEuNCkKWyAg
IDE2Ljc1OTk4N10gbWVpX2hkY3AgMDAwMDowMDoxNi4wLWI2MzhhYjdlLTk0ZTItNGVhMi1h
NTUyLWQxYzU0YjYyN2YwNDogYm91bmQgMDAwMDowMDowMi4wIChvcHMgaTkxNV9oZGNwX29w
cyBbaTkxNV0pClsgICAxNi43NzU3NjRdIFtkcm1dIEluaXRpYWxpemVkIGk5MTUgMS42LjAg
Zm9yIDAwMDA6MDA6MDIuMCBvbiBtaW5vciAwClsgICAxNi43OTQ4MDhdIEFDUEk6IHZpZGVv
OiBWaWRlbyBEZXZpY2UgW0dGWDBdIChtdWx0aS1oZWFkOiB5ZXMgIHJvbTogbm8gIHBvc3Q6
IG5vKQpbICAgMTYuNzk4NjA5XSBpbnB1dDogVmlkZW8gQnVzIGFzIC9kZXZpY2VzL0xOWFNZ
U1RNOjAwL0xOWFNZQlVTOjAwL1BOUDBBMDg6MDAvTE5YVklERU86MDAvaW5wdXQvaW5wdXQx
OApbICAgMTYuODEzOTMzXSBzbmRfaGRhX2ludGVsIDAwMDA6MDA6MWYuMzogYm91bmQgMDAw
MDowMDowMi4wIChvcHMgaW50ZWxfYXVkaW9fY29tcG9uZW50X2JpbmRfb3BzIFtpOTE1XSkK
WyAgIDE2LjgxNjQyMl0gdXNiIDEtNDogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9y
PTA0ZjMsIGlkUHJvZHVjdD0yMjM0LCBiY2REZXZpY2U9MTEuMTEKWyAgIDE2LjgxNjQyNl0g
dXNiIDEtNDogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTQsIFByb2R1Y3Q9MTQsIFNl
cmlhbE51bWJlcj0wClsgICAxNi44MTY0MjhdIHVzYiAxLTQ6IFByb2R1Y3Q6IFRvdWNoc2Ny
ZWVuClsgICAxNi44MTY0MzBdIHVzYiAxLTQ6IE1hbnVmYWN0dXJlcjogRUxBTgpbICAgMTYu
ODQ1NjExXSBFWFQ0LWZzIChudm1lMG4xcDIpOiBtb3VudGVkIGZpbGVzeXN0ZW0gMmQyM2Zk
NGMtNWQwMy00ZTFhLThhNDItMGU4NTlkMWYwMGQ4IHIvdyB3aXRoIG9yZGVyZWQgZGF0YSBt
b2RlLiBRdW90YSBtb2RlOiBub25lLgpbICAgMTYuODU2MjAyXSBpbnB1dDogRGVsbCBXTUkg
aG90a2V5cyBhcyAvZGV2aWNlcy9wbGF0Zm9ybS9QTlAwQzE0OjAxL3dtaV9idXMvd21pX2J1
cy1QTlAwQzE0OjAxLzlEQkI1OTk0LUE5OTctMTFEQS1CMDEyLUI2MjJBMUVGNTQ5Mi9pbnB1
dC9pbnB1dDE5ClsgICAxNi44NzE3NTBdIHNuZF9oZGFfY29kZWNfcmVhbHRlayBoZGF1ZGlv
QzBEMDogQUxDMzI0NjogcGlja2VkIGZpeHVwICAocGluIG1hdGNoKQpbICAgMTYuODkwMzMw
XSBpbnB1dDogRExMMDc1QjowMSAwNkNCOjc2QUYgTW91c2UgYXMgL2RldmljZXMvcGNpMDAw
MDowMC8wMDAwOjAwOjE1LjEvaTJjX2Rlc2lnbndhcmUuMS9pMmMtNC9pMmMtRExMMDc1Qjow
MS8wMDE4OjA2Q0I6NzZBRi4wMDAxL2lucHV0L2lucHV0MjAKWyAgIDE2Ljg5MTI0NV0gaW5w
dXQ6IERMTDA3NUI6MDEgMDZDQjo3NkFGIFRvdWNocGFkIGFzIC9kZXZpY2VzL3BjaTAwMDA6
MDAvMDAwMDowMDoxNS4xL2kyY19kZXNpZ253YXJlLjEvaTJjLTQvaTJjLURMTDA3NUI6MDEv
MDAxODowNkNCOjc2QUYuMDAwMS9pbnB1dC9pbnB1dDIxClsgICAxNi44OTE0NzJdIGhpZC1n
ZW5lcmljIDAwMTg6MDZDQjo3NkFGLjAwMDE6IGlucHV0LGhpZHJhdzA6IEkyQyBISUQgdjEu
MDAgTW91c2UgW0RMTDA3NUI6MDEgMDZDQjo3NkFGXSBvbiBpMmMtRExMMDc1QjowMQpbICAg
MTYuOTA2NDEzXSBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgaGRhdWRpb0MwRDA6IGF1dG9jb25m
aWcgZm9yIEFMQzMyNDY6IGxpbmVfb3V0cz0xICgweDE0LzB4MC8weDAvMHgwLzB4MCkgdHlw
ZTpzcGVha2VyClsgICAxNi45MDY0MTldIHNuZF9oZGFfY29kZWNfcmVhbHRlayBoZGF1ZGlv
QzBEMDogICAgc3BlYWtlcl9vdXRzPTAgKDB4MC8weDAvMHgwLzB4MC8weDApClsgICAxNi45
MDY0MjFdIHNuZF9oZGFfY29kZWNfcmVhbHRlayBoZGF1ZGlvQzBEMDogICAgaHBfb3V0cz0x
ICgweDIxLzB4MC8weDAvMHgwLzB4MCkKWyAgIDE2LjkwNjQyM10gc25kX2hkYV9jb2RlY19y
ZWFsdGVrIGhkYXVkaW9DMEQwOiAgICBtb25vOiBtb25vX291dD0weDAKWyAgIDE2LjkwNjQy
NV0gc25kX2hkYV9jb2RlY19yZWFsdGVrIGhkYXVkaW9DMEQwOiAgICBpbnB1dHM6ClsgICAx
Ni45MDY0MjZdIHNuZF9oZGFfY29kZWNfcmVhbHRlayBoZGF1ZGlvQzBEMDogICAgICBJbnRl
cm5hbCBNaWM9MHgxMgpbICAgMTYuOTA2NDI4XSBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgaGRh
dWRpb0MwRDA6ICAgICAgSGVhZHNldCBNaWM9MHgxOQpbICAgMTYuOTA2NDI5XSBzbmRfaGRh
X2NvZGVjX3JlYWx0ZWsgaGRhdWRpb0MwRDA6ICAgICAgSGVhZHBob25lIE1pYz0weDFhClsg
ICAxNi45MTcwNzNdIGF0aDEwa19wY2kgMDAwMDozYTowMC4wOiBxY2E2MTc0IGh3My4yIHRh
cmdldCAweDA1MDMwMDAwIGNoaXBfaWQgMHgwMDM0MGFmZiBzdWIgMWE1NjoxNTM1ClsgICAx
Ni45MTcwNzldIGF0aDEwa19wY2kgMDAwMDozYTowMC4wOiBrY29uZmlnIGRlYnVnIDAgZGVi
dWdmcyAwIHRyYWNpbmcgMCBkZnMgMCB0ZXN0bW9kZSAwClsgICAxNi45MTcxNjddIGF0aDEw
a19wY2kgMDAwMDozYTowMC4wOiBmaXJtd2FyZSB2ZXIgV0xBTi5STS40LjQuMS0wMDMwOS0g
YXBpIDYgZmVhdHVyZXMgd293bGFuLGlnbm9yZS1vdHAsbWZwIGNyYzMyIDA3OTNiY2YyClsg
ICAxNi45MzM4OTBdIHVzYiAxLTU6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVy
IDQgdXNpbmcgeGhjaV9oY2QKWyAgIDE2LjkzNjg1NV0gQUNQSTogYmF0dGVyeTogbmV3IGhv
b2s6IERlbGwgUHJpbWFyeSBCYXR0ZXJ5IEV4dGVuc2lvbgpbICAgMTYuOTYzNjkyXSBhdWRp
dDogdHlwZT0xNDAwIGF1ZGl0KDE3NDM2OTg1NjkuMTA3OjIpOiBhcHBhcm1vcj0iU1RBVFVT
IiBvcGVyYXRpb249InByb2ZpbGVfbG9hZCIgcHJvZmlsZT0idW5jb25maW5lZCIgbmFtZT0i
UXRXZWJFbmdpbmVQcm9jZXNzIiBwaWQ9NjQ2IGNvbW09ImFwcGFybW9yX3BhcnNlciIKWyAg
IDE2Ljk2Mzk4Nl0gYXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNzQzNjk4NTY5LjEwNzozKTog
YXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9InVu
Y29uZmluZWQiIG5hbWU9IkRpc2NvcmQiIHBpZD02NDQgY29tbT0iYXBwYXJtb3JfcGFyc2Vy
IgpbICAgMTYuOTY0MjgzXSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE3NDM2OTg1NjkuMTA3
OjQpOiBhcHBhcm1vcj0iU1RBVFVTIiBvcGVyYXRpb249InByb2ZpbGVfbG9hZCIgcHJvZmls
ZT0idW5jb25maW5lZCIgbmFtZT00RDZGNkU2NzZGNDQ0MjIwNDM2RjZENzA2MTczNzMgcGlk
PTY0NSBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgICAxNi45NjQ5OTVdIGF1ZGl0OiB0eXBl
PTE0MDAgYXVkaXQoMTc0MzY5ODU2OS4xMDc6NSk6IGFwcGFybW9yPSJTVEFUVVMiIG9wZXJh
dGlvbj0icHJvZmlsZV9sb2FkIiBwcm9maWxlPSJ1bmNvbmZpbmVkIiBuYW1lPSIxcGFzc3dv
cmQiIHBpZD02NDMgY29tbT0iYXBwYXJtb3JfcGFyc2VyIgpbICAgMTYuOTY4NzI1XSBhdWRp
dDogdHlwZT0xNDAwIGF1ZGl0KDE3NDM2OTg1NjkuMTExOjYpOiBhcHBhcm1vcj0iU1RBVFVT
IiBvcGVyYXRpb249InByb2ZpbGVfbG9hZCIgcHJvZmlsZT0idW5jb25maW5lZCIgbmFtZT0i
YmFsZW5hLWV0Y2hlciIgcGlkPTY0OSBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgICAxNi45
Njg3MzJdIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTc0MzY5ODU2OS4xMTE6Nyk6IGFwcGFy
bW9yPSJTVEFUVVMiIG9wZXJhdGlvbj0icHJvZmlsZV9sb2FkIiBwcm9maWxlPSJ1bmNvbmZp
bmVkIiBuYW1lPSJicmF2ZSIgcGlkPTY1MCBjb21tPSJhcHBhcm1vcl9wYXJzZXIiClsgICAx
Ni45NjkyNjldIGF1ZGl0OiB0eXBlPTE0MDAgYXVkaXQoMTc0MzY5ODU2OS4xMTE6OCk6IGFw
cGFybW9yPSJTVEFUVVMiIG9wZXJhdGlvbj0icHJvZmlsZV9sb2FkIiBwcm9maWxlPSJ1bmNv
bmZpbmVkIiBuYW1lPSJidWlsZGFoIiBwaWQ9NjUxIGNvbW09ImFwcGFybW9yX3BhcnNlciIK
WyAgIDE2Ljk3MTQ3N10gYXVkaXQ6IHR5cGU9MTQwMCBhdWRpdCgxNzQzNjk4NTY5LjExNTo5
KTogYXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0aW9uPSJwcm9maWxlX2xvYWQiIHByb2ZpbGU9
InVuY29uZmluZWQiIG5hbWU9ImNoLWNoZWNrbnMiIHBpZD02NTQgY29tbT0iYXBwYXJtb3Jf
cGFyc2VyIgpbICAgMTYuOTcxNzY5XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE3NDM2OTg1
NjkuMTE1OjEwKTogYXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0aW9uPSJwcm9maWxlX2xvYWQi
IHByb2ZpbGU9InVuY29uZmluZWQiIG5hbWU9ImJ1c3lib3giIHBpZD02NTIgY29tbT0iYXBw
YXJtb3JfcGFyc2VyIgpbICAgMTYuOTcxODM3XSBhdWRpdDogdHlwZT0xNDAwIGF1ZGl0KDE3
NDM2OTg1NjkuMTE1OjExKTogYXBwYXJtb3I9IlNUQVRVUyIgb3BlcmF0aW9uPSJwcm9maWxl
X2xvYWQiIHByb2ZpbGU9InVuY29uZmluZWQiIG5hbWU9ImNhbSIgcGlkPTY1MyBjb21tPSJh
cHBhcm1vcl9wYXJzZXIiClsgICAxNi45ODY4MjFdIGF0aDEwa19wY2kgMDAwMDozYTowMC4w
OiBib2FyZF9maWxlIGFwaSAyIGJtaV9pZCBOL0EgY3JjMzIgZDI4NjNmOTEKWyAgIDE3LjAw
NDc4MV0gaW5wdXQ6IERMTDA3NUI6MDEgMDZDQjo3NkFGIE1vdXNlIGFzIC9kZXZpY2VzL3Bj
aTAwMDA6MDAvMDAwMDowMDoxNS4xL2kyY19kZXNpZ253YXJlLjEvaTJjLTQvaTJjLURMTDA3
NUI6MDEvMDAxODowNkNCOjc2QUYuMDAwMS9pbnB1dC9pbnB1dDI0ClsgICAxNy4wMDUwMzRd
IGlucHV0OiBETEwwNzVCOjAxIDA2Q0I6NzZBRiBUb3VjaHBhZCBhcyAvZGV2aWNlcy9wY2kw
MDAwOjAwLzAwMDA6MDA6MTUuMS9pMmNfZGVzaWdud2FyZS4xL2kyYy00L2kyYy1ETEwwNzVC
OjAxLzAwMTg6MDZDQjo3NkFGLjAwMDEvaW5wdXQvaW5wdXQyNQpbICAgMTcuMDA1OTk5XSBo
aWQtbXVsdGl0b3VjaCAwMDE4OjA2Q0I6NzZBRi4wMDAxOiBpbnB1dCxoaWRyYXcwOiBJMkMg
SElEIHYxLjAwIE1vdXNlIFtETEwwNzVCOjAxIDA2Q0I6NzZBRl0gb24gaTJjLURMTDA3NUI6
MDEKWyAgIDE3LjA5NDA2MV0gYXRoMTBrX3BjaSAwMDAwOjNhOjAwLjA6IGh0dC12ZXIgMy44
NyB3bWktb3AgNCBodHQtb3AgMyBjYWwgb3RwIG1heC1zdGEgMzIgcmF3IDAgaHdjcnlwdG8g
MQpbICAgMTcuMTIwNTgwXSBpbnB1dDogSERBIERpZ2l0YWwgUENCZWVwIGFzIC9kZXZpY2Vz
L3BjaTAwMDA6MDAvMDAwMDowMDoxZi4zL3NvdW5kL2NhcmQwL2lucHV0MjMKWyAgIDE3LjEy
MDk4M10gaW5wdXQ6IEhEQSBJbnRlbCBQQ0ggSGVhZHBob25lIE1pYyBhcyAvZGV2aWNlcy9w
Y2kwMDAwOjAwLzAwMDA6MDA6MWYuMy9zb3VuZC9jYXJkMC9pbnB1dDI3ClsgICAxNy4xMjEx
NzBdIGlucHV0OiBIREEgSW50ZWwgUENIIEhETUkvRFAscGNtPTMgYXMgL2RldmljZXMvcGNp
MDAwMDowMC8wMDAwOjAwOjFmLjMvc291bmQvY2FyZDAvaW5wdXQyOApbICAgMTcuMTIxMjE2
XSBpbnB1dDogSERBIEludGVsIFBDSCBIRE1JL0RQLHBjbT03IGFzIC9kZXZpY2VzL3BjaTAw
MDA6MDAvMDAwMDowMDoxZi4zL3NvdW5kL2NhcmQwL2lucHV0MjkKWyAgIDE3LjEyMTI2NF0g
aW5wdXQ6IEhEQSBJbnRlbCBQQ0ggSERNSS9EUCxwY209OCBhcyAvZGV2aWNlcy9wY2kwMDAw
OjAwLzAwMDA6MDA6MWYuMy9zb3VuZC9jYXJkMC9pbnB1dDMwClsgICAxNy4xNjQwMTFdIHVz
YiAxLTU6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wYzQ1LCBpZFByb2R1Y3Q9
NjcwYywgYmNkRGV2aWNlPTU2LjI2ClsgICAxNy4xNjQwMTddIHVzYiAxLTU6IE5ldyBVU0Ig
ZGV2aWNlIHN0cmluZ3M6IE1mcj0yLCBQcm9kdWN0PTEsIFNlcmlhbE51bWJlcj0wClsgICAx
Ny4xNjQwMTldIHVzYiAxLTU6IFByb2R1Y3Q6IEludGVncmF0ZWRfV2ViY2FtX0hEClsgICAx
Ny4xNjQwMjFdIHVzYiAxLTU6IE1hbnVmYWN0dXJlcjogQ04wOUdURk1MT0cwMDhDOEI3RldB
MDEKWyAgIDE3LjE3MTk0MV0gYXRoOiBFRVBST00gcmVnZG9tYWluOiAweDZjClsgICAxNy4x
NzE5NDVdIGF0aDogRUVQUk9NIGluZGljYXRlcyB3ZSBzaG91bGQgZXhwZWN0IGEgZGlyZWN0
IHJlZ3BhaXIgbWFwClsgICAxNy4xNzE5NDhdIGF0aDogQ291bnRyeSBhbHBoYTIgYmVpbmcg
dXNlZDogMDAKWyAgIDE3LjE3MTk0OV0gYXRoOiBSZWdwYWlyIHVzZWQ6IDB4NmMKWyAgIDE3
LjIzMjE1OF0gbnZtZSBudm1lMDogdXNpbmcgdW5jaGVja2VkIGRhdGEgYnVmZmVyClsgICAx
Ny4yODA2MzBdIG1jOiBMaW51eCBtZWRpYSBpbnRlcmZhY2U6IHYwLjEwClsgICAxNy4yOTI1
MTBdIGlucHV0OiBFTEFOIFRvdWNoc2NyZWVuIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAw
MDowMDoxNC4wL3VzYjEvMS00LzEtNDoxLjAvMDAwMzowNEYzOjIyMzQuMDAwMi9pbnB1dC9p
bnB1dDMxClsgICAxNy4yOTI3MzRdIGlucHV0OiBFTEFOIFRvdWNoc2NyZWVuIFVOS05PV04g
YXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE0LjAvdXNiMS8xLTQvMS00OjEuMC8w
MDAzOjA0RjM6MjIzNC4wMDAyL2lucHV0L2lucHV0MzIKWyAgIDE3LjI5Mjg1OF0gaW5wdXQ6
IEVMQU4gVG91Y2hzY3JlZW4gVU5LTk9XTiBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6
MDA6MTQuMC91c2IxLzEtNC8xLTQ6MS4wLzAwMDM6MDRGMzoyMjM0LjAwMDIvaW5wdXQvaW5w
dXQzMwpbICAgMTcuMjkzMDMzXSBoaWQtbXVsdGl0b3VjaCAwMDAzOjA0RjM6MjIzNC4wMDAy
OiBpbnB1dCxoaWRkZXYwLGhpZHJhdzE6IFVTQiBISUQgdjEuMTAgRGV2aWNlIFtFTEFOIFRv
dWNoc2NyZWVuXSBvbiB1c2ItMDAwMDowMDoxNC4wLTQvaW5wdXQwClsgICAxNy4yOTMwNzVd
IHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXNiaGlkClsgICAx
Ny4yOTMwNzddIHVzYmhpZDogVVNCIEhJRCBjb3JlIGRyaXZlcgpbICAgMTcuMzM1MDk3XSBC
bHVldG9vdGg6IENvcmUgdmVyIDIuMjIKWyAgIDE3LjMzNTExOV0gTkVUOiBSZWdpc3RlcmVk
IFBGX0JMVUVUT09USCBwcm90b2NvbCBmYW1pbHkKWyAgIDE3LjMzNTEyMF0gQmx1ZXRvb3Ro
OiBIQ0kgZGV2aWNlIGFuZCBjb25uZWN0aW9uIG1hbmFnZXIgaW5pdGlhbGl6ZWQKWyAgIDE3
LjMzNTEyNV0gQmx1ZXRvb3RoOiBIQ0kgc29ja2V0IGxheWVyIGluaXRpYWxpemVkClsgICAx
Ny4zMzUxMjddIEJsdWV0b290aDogTDJDQVAgc29ja2V0IGxheWVyIGluaXRpYWxpemVkClsg
ICAxNy4zMzUxMzFdIEJsdWV0b290aDogU0NPIHNvY2tldCBsYXllciBpbml0aWFsaXplZApb
ICAgMTcuMzU4MDc4XSB2aWRlb2RldjogTGludXggdmlkZW8gY2FwdHVyZSBpbnRlcmZhY2U6
IHYyLjAwClsgICAxNy4zNjU5NzldIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFj
ZSBkcml2ZXIgYnR1c2IKWyAgIDE3LjM3MTExMl0gQmx1ZXRvb3RoOiBoY2kwOiB1c2luZyBy
YW1wYXRjaCBmaWxlOiBxY2EvcmFtcGF0Y2hfdXNiXzAwMDAwMzAyLmJpbgpbICAgMTcuMzcx
MTE3XSBCbHVldG9vdGg6IGhjaTA6IFFDQTogcGF0Y2ggcm9tZSAweDMwMiBidWlsZCAweDNl
OCwgZmlybXdhcmUgcm9tZSAweDMwMiBidWlsZCAweDExMQpbICAgMTcuMzgxNTI2XSB1c2Ig
MS01OiBGb3VuZCBVVkMgMS4wMCBkZXZpY2UgSW50ZWdyYXRlZF9XZWJjYW1fSEQgKDBjNDU6
NjcwYykKWyAgIDE3LjczMzg3OF0gQmx1ZXRvb3RoOiBoY2kwOiB1c2luZyBOVk0gZmlsZTog
cWNhL252bV91c2JfMDAwMDAzMDIuYmluClsgICAxNy43NTk1NjVdIEJsdWV0b290aDogaGNp
MDogSENJIEVuaGFuY2VkIFNldHVwIFN5bmNocm9ub3VzIENvbm5lY3Rpb24gY29tbWFuZCBp
cyBhZHZlcnRpc2VkLCBidXQgbm90IHN1cHBvcnRlZC4KWyAgIDE4LjE1ODA0Nl0gdXNiY29y
ZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1dmN2aWRlbwpbICAgMjAuNjM2
NTY4XSByZmtpbGw6IGlucHV0IGhhbmRsZXIgZGlzYWJsZWQKWyAgIDIzLjI3NDM0Nl0gd2xh
bjA6IGF1dGhlbnRpY2F0ZSB3aXRoIDg4OjcxOmIxOjgxOjkzOjFiIChsb2NhbCBhZGRyZXNz
PTljOmI2OmQwOmQxOjZhOmIxKQpbICAgMjMuMjc0MzUxXSB3bGFuMDogc2VuZCBhdXRoIHRv
IDg4OjcxOmIxOjgxOjkzOjFiICh0cnkgMS8zKQpbICAgMjMuMjc1ODM4XSB3bGFuMDogYXV0
aGVudGljYXRlZApbICAgMjMuMjc3OTAxXSB3bGFuMDogYXNzb2NpYXRlIHdpdGggODg6NzE6
YjE6ODE6OTM6MWIgKHRyeSAxLzMpClsgICAyMy4zMTE2NzhdIHdsYW4wOiBSWCBBc3NvY1Jl
c3AgZnJvbSA4ODo3MTpiMTo4MTo5MzoxYiAoY2FwYWI9MHgxMDExIHN0YXR1cz0wIGFpZD0x
KQpbICAgMjMuMzE0MjY4XSB3bGFuMDogYXNzb2NpYXRlZApbICAgMjMuMzYyMTYwXSB3bGFu
MDogTGltaXRpbmcgVFggcG93ZXIgdG8gMjMgKDIzIC0gMCkgZEJtIGFzIGFkdmVydGlzZWQg
YnkgODg6NzE6YjE6ODE6OTM6MWIKWyAgIDI2LjIzNzEyM10gcmZraWxsOiBpbnB1dCBoYW5k
bGVyIGVuYWJsZWQKWyAgIDI3Ljk5MTY2NV0gcmZraWxsOiBpbnB1dCBoYW5kbGVyIGRpc2Fi
bGVkClsgICAyOS45ODU0ODVdIFNDU0kgc3Vic3lzdGVtIGluaXRpYWxpemVkClsgICAzNS41
NjY5MzhdIHBjaSAwMDAwOjAxOjAwLjA6IFs4MDg2OjE1NzZdIHR5cGUgMDEgY2xhc3MgMHgw
NjA0MDAgUENJZSBTd2l0Y2ggVXBzdHJlYW0gUG9ydApbICAgMzUuNTY2OTY5XSBwY2kgMDAw
MDowMTowMC4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDItMzldClsgICAzNS41NjY5NzldIHBj
aSAwMDAwOjAxOjAwLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YzQwMDAwMDAtMHhkYTBm
ZmZmZl0KWyAgIDM1LjU2Njk5MF0gcGNpIDAwMDA6MDE6MDAuMDogICBicmlkZ2Ugd2luZG93
IFttZW0gMHhhMDAwMDAwMC0weGMxZmZmZmZmIDY0Yml0IHByZWZdClsgICAzNS41NjcwMDJd
IHBjaSAwMDAwOjAxOjAwLjA6IGVuYWJsaW5nIEV4dGVuZGVkIFRhZ3MKWyAgIDM1LjU2NzM5
NF0gcGNpIDAwMDA6MDE6MDAuMDogc3VwcG9ydHMgRDEgRDIKWyAgIDM1LjU2NzM5Nl0gcGNp
IDAwMDA6MDE6MDAuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBEMSBEMiBEM2hvdCBEM2Nv
bGQKWyAgIDM1LjU2NzQ3OV0gcGNpIDAwMDA6MDE6MDAuMDogMTUuNzUyIEdiL3MgYXZhaWxh
YmxlIFBDSWUgYmFuZHdpZHRoLCBsaW1pdGVkIGJ5IDguMCBHVC9zIFBDSWUgeDIgbGluayBh
dCAwMDAwOjAwOjFjLjAgKGNhcGFibGUgb2YgMzEuNTA0IEdiL3Mgd2l0aCA4LjAgR1QvcyBQ
Q0llIHg0IGxpbmspClsgICAzNS42MzM3NzJdIHBjaSAwMDAwOjAyOjAwLjA6IFs4MDg2OjE1
NzZdIHR5cGUgMDEgY2xhc3MgMHgwNjA0MDAgUENJZSBTd2l0Y2ggRG93bnN0cmVhbSBQb3J0
ClsgICAzNS42MzM4MTRdIHBjaSAwMDAwOjAyOjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAw
M10KWyAgIDM1LjYzMzgyNV0gcGNpIDAwMDA6MDI6MDAuMDogICBicmlkZ2Ugd2luZG93IFtt
ZW0gMHhkYTAwMDAwMC0weGRhMGZmZmZmXQpbICAgMzUuNjMzODUyXSBwY2kgMDAwMDowMjow
MC4wOiBlbmFibGluZyBFeHRlbmRlZCBUYWdzClsgICAzNS42MzQ3OThdIHBjaSAwMDAwOjAy
OjAwLjA6IHN1cHBvcnRzIEQxIEQyClsgICAzNS42MzQ4MDhdIHBjaSAwMDAwOjAyOjAwLjA6
IFBNRSMgc3VwcG9ydGVkIGZyb20gRDAgRDEgRDIgRDNob3QgRDNjb2xkClsgICAzNS42MzU3
NzBdIHBjaSAwMDAwOjAyOjAxLjA6IFs4MDg2OjE1NzZdIHR5cGUgMDEgY2xhc3MgMHgwNjA0
MDAgUENJZSBTd2l0Y2ggRG93bnN0cmVhbSBQb3J0ClsgICAzNS42MzU4MDJdIHBjaSAwMDAw
OjAyOjAxLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwNC0zOF0KWyAgIDM1LjYzNTgxM10gcGNp
IDAwMDA6MDI6MDEuMDogICBicmlkZ2Ugd2luZG93IFttZW0gMHhjNDAwMDAwMC0weGQ5ZWZm
ZmZmXQpbICAgMzUuNjM1ODI1XSBwY2kgMDAwMDowMjowMS4wOiAgIGJyaWRnZSB3aW5kb3cg
W21lbSAweGEwMDAwMDAwLTB4YzFmZmZmZmYgNjRiaXQgcHJlZl0KWyAgIDM1LjYzNTg0MV0g
cGNpIDAwMDA6MDI6MDEuMDogZW5hYmxpbmcgRXh0ZW5kZWQgVGFncwpbICAgMzUuNjM2NDY2
XSBwY2kgMDAwMDowMjowMS4wOiBzdXBwb3J0cyBEMSBEMgpbICAgMzUuNjM2NDY5XSBwY2kg
MDAwMDowMjowMS4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQxIEQyIEQzaG90IEQzY29s
ZApbICAgMzUuNjM2NzE3XSBwY2kgMDAwMDowMjowMi4wOiBbODA4NjoxNTc2XSB0eXBlIDAx
IGNsYXNzIDB4MDYwNDAwIFBDSWUgU3dpdGNoIERvd25zdHJlYW0gUG9ydApbICAgMzUuNjM2
NzQ5XSBwY2kgMDAwMDowMjowMi4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMzldClsgICAzNS42
MzY3NTldIHBjaSAwMDAwOjAyOjAyLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4ZDlmMDAw
MDAtMHhkOWZmZmZmZl0KWyAgIDM1LjYzNjc4NF0gcGNpIDAwMDA6MDI6MDIuMDogZW5hYmxp
bmcgRXh0ZW5kZWQgVGFncwpbICAgMzUuNjM2ODgzXSBwY2kgMDAwMDowMjowMi4wOiBzdXBw
b3J0cyBEMSBEMgpbICAgMzUuNjM2ODg1XSBwY2kgMDAwMDowMjowMi4wOiBQTUUjIHN1cHBv
cnRlZCBmcm9tIEQwIEQxIEQyIEQzaG90IEQzY29sZApbICAgMzUuNjM3MDkzXSBwY2kgMDAw
MDowMTowMC4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDItMzldClsgICAzNS42MzcxNjldIHBj
aSAwMDAwOjAyOjAwLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwM10KWyAgIDM1LjYzNzIzM10g
cGNpIDAwMDA6MDI6MDEuMDogUENJIGJyaWRnZSB0byBbYnVzIDA0LTM4XQpbICAgMzUuNjM3
MzQzXSBwY2kgMDAwMDozOTowMC4wOiBbODA4NjoxNWI1XSB0eXBlIDAwIGNsYXNzIDB4MGMw
MzMwIFBDSWUgRW5kcG9pbnQKWyAgIDM1LjYzNzQwNF0gcGNpIDAwMDA6Mzk6MDAuMDogQkFS
IDAgW21lbSAweGQ5ZjAwMDAwLTB4ZDlmMGZmZmZdClsgICAzNS42Mzc0MjRdIHBjaSAwMDAw
OjM5OjAwLjA6IGVuYWJsaW5nIEV4dGVuZGVkIFRhZ3MKWyAgIDM1LjYzNzU1MF0gcGNpIDAw
MDA6Mzk6MDAuMDogc3VwcG9ydHMgRDEgRDIKWyAgIDM1LjYzNzU1Ml0gcGNpIDAwMDA6Mzk6
MDAuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBEMSBEMiBEM2hvdCBEM2NvbGQKWyAgIDM1
LjYzNzgxNl0gcGNpIDAwMDA6MDI6MDIuMDogUENJIGJyaWRnZSB0byBbYnVzIDM5XQpbICAg
MzUuNjM3ODU4XSBwY2lfYnVzIDAwMDA6MDI6IEFsbG9jYXRpbmcgcmVzb3VyY2VzClsgICAz
NS42Mzc4ODJdIHBjaSAwMDAwOjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAt
MHgwZmZmXSB0byBbYnVzIDA0LTM4XSBhZGRfc2l6ZSAxMDAwClsgICAzNS42Mzc4ODZdIHBj
aSAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZmXSB0byBb
YnVzIDM5XSBhZGRfc2l6ZSAxMDAwClsgICAzNS42Mzc4ODldIHBjaSAwMDAwOjAxOjAwLjA6
IEFzc2lnbmVkIGJyaWRnZSB3aW5kb3cgW21lbSAweGEwMDAwMDAwLTB4YzFmZmZmZmYgNjRi
aXQgcHJlZl0gdG8gW2J1cyAwMi0zOV0gY2Fubm90IGZpdCAweDIwMDAwMCByZXF1aXJlZCBm
b3IgMDAwMDowMjowMi4wIGJyaWRnaW5nIHRvIFtidXMgMzldClsgICAzNS42Mzc4OTRdIHBj
aSAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMDAwMDAwIDY0Yml0IHBy
ZWZdIHRvIFtidXMgMzldIHJlcXVpcmVzIHJlbGF4ZWQgYWxpZ25tZW50IHJ1bGVzClsgICAz
NS42Mzc4OTddIHBjaSAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMTAw
MDAwLTB4MDAwZmZmZmYgNjRiaXQgcHJlZl0gdG8gW2J1cyAzOV0gYWRkX3NpemUgMjAwMDAw
IGFkZF9hbGlnbiAxMDAwMDAKWyAgIDM1LjYzNzkwMF0gcGNpIDAwMDA6MDE6MDAuMDogYnJp
ZGdlIHdpbmRvdyBbaW8gIDB4MTAwMC0weDBmZmZdIHRvIFtidXMgMDItMzldIGFkZF9zaXpl
IDIwMDAKWyAgIDM1LjYzNzkwNV0gcGNpIDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRvdyBb
aW8gIHNpemUgMHgyMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAgMzUuNjM3OTA3
XSBwY2kgMDAwMDowMTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDIwMDBdOiBm
YWlsZWQgdG8gYXNzaWduClsgICAzNS42Mzc5MTBdIHBjaSAwMDAwOjAxOjAwLjA6IGJyaWRn
ZSB3aW5kb3cgW2lvICBzaXplIDB4MjAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAg
IDM1LjYzNzkxMl0gcGNpIDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUg
MHgyMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAgMzUuNjM3OTE2XSBwY2kgMDAwMDowMjow
Mi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHByZWZdOiBj
YW4ndCBhc3NpZ247IG5vIHNwYWNlClsgICAzNS42Mzc5MThdIHBjaSAwMDAwOjAyOjAyLjA6
IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAwMDAgNjRiaXQgcHJlZl06IGZhaWxl
ZCB0byBhc3NpZ24KWyAgIDM1LjYzNzkyMF0gcGNpIDAwMDA6MDI6MDEuMDogYnJpZGdlIHdp
bmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAgMzUu
NjM3OTIyXSBwY2kgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEw
MDBdOiBmYWlsZWQgdG8gYXNzaWduClsgICAzNS42Mzc5MjRdIHBjaSAwMDAwOjAyOjAyLjA6
IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3Bh
Y2UKWyAgIDM1LjYzNzkyNl0gcGNpIDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8g
IHNpemUgMHgxMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAgMzUuNjM3OTI5XSBwY2kgMDAw
MDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHBy
ZWZdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgICAzNS42Mzc5MzFdIHBjaSAwMDAwOjAy
OjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAwMDAgNjRiaXQgcHJlZl06
IGZhaWxlZCB0byBhc3NpZ24KWyAgIDM1LjYzNzkzNF0gcGNpIDAwMDA6MDI6MDIuMDogYnJp
ZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpb
ICAgMzUuNjM3OTM2XSBwY2kgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6
ZSAweDEwMDBdOiBmYWlsZWQgdG8gYXNzaWduClsgICAzNS42Mzc5MzhdIHBjaSAwMDAwOjAy
OjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsg
bm8gc3BhY2UKWyAgIDM1LjYzNzkzOV0gcGNpIDAwMDA6MDI6MDEuMDogYnJpZGdlIHdpbmRv
dyBbaW8gIHNpemUgMHgxMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAgMzUuNjM3OTQyXSBw
Y2kgMDAwMDowMjowMC4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDNdClsgICAzNS42Mzc5NDdd
IHBjaSAwMDAwOjAyOjAwLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4ZGEwMDAwMDAtMHhk
YTBmZmZmZl0KWyAgIDM1LjYzNzk1N10gcGNpIDAwMDA6MDI6MDEuMDogUENJIGJyaWRnZSB0
byBbYnVzIDA0LTM4XQpbICAgMzUuNjM3OTYyXSBwY2kgMDAwMDowMjowMS4wOiAgIGJyaWRn
ZSB3aW5kb3cgW21lbSAweGM0MDAwMDAwLTB4ZDllZmZmZmZdClsgICAzNS42Mzc5NjZdIHBj
aSAwMDAwOjAyOjAxLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YTAwMDAwMDAtMHhjMWZm
ZmZmZiA2NGJpdCBwcmVmXQpbICAgMzUuNjM3OTc0XSBwY2kgMDAwMDowMjowMi4wOiBQQ0kg
YnJpZGdlIHRvIFtidXMgMzldClsgICAzNS42Mzc5NzldIHBjaSAwMDAwOjAyOjAyLjA6ICAg
YnJpZGdlIHdpbmRvdyBbbWVtIDB4ZDlmMDAwMDAtMHhkOWZmZmZmZl0KWyAgIDM1LjYzNzk4
N10gcGNpIDAwMDA6MDE6MDAuMDogUENJIGJyaWRnZSB0byBbYnVzIDAyLTM5XQpbICAgMzUu
NjM3OTkyXSBwY2kgMDAwMDowMTowMC4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweGM0MDAw
MDAwLTB4ZGEwZmZmZmZdClsgICAzNS42Mzc5OTddIHBjaSAwMDAwOjAxOjAwLjA6ICAgYnJp
ZGdlIHdpbmRvdyBbbWVtIDB4YTAwMDAwMDAtMHhjMWZmZmZmZiA2NGJpdCBwcmVmXQpbICAg
MzUuNjM4ODA3XSB4aGNpX2hjZCAwMDAwOjM5OjAwLjA6IHhIQ0kgSG9zdCBDb250cm9sbGVy
ClsgICAzNS42Mzg4MTRdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogbmV3IFVTQiBidXMgcmVn
aXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAzClsgICAzNS42NDIxNzBdIHhoY2lfaGNk
IDAwMDA6Mzk6MDAuMDogaGNjIHBhcmFtcyAweDIwMDA3N2MxIGhjaSB2ZXJzaW9uIDB4MTEw
IHF1aXJrcyAweDAwMDAwMDAyMDAwMDk4MTAKWyAgIDM1LjY0NDQ2Ml0geGhjaV9oY2QgMDAw
MDozOTowMC4wOiB4SENJIEhvc3QgQ29udHJvbGxlcgpbICAgMzUuNjQ0OTk5XSB4aGNpX2hj
ZCAwMDAwOjM5OjAwLjA6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBu
dW1iZXIgNApbICAgMzUuNjQ1MDA0XSB4aGNpX2hjZCAwMDAwOjM5OjAwLjA6IEhvc3Qgc3Vw
cG9ydHMgVVNCIDMuMSBFbmhhbmNlZCBTdXBlclNwZWVkClsgICAzNS42NDUwNDddIHVzYiB1
c2IzOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MWQ2YiwgaWRQcm9kdWN0PTAw
MDIsIGJjZERldmljZT0gNi4xNApbICAgMzUuNjQ1MDUwXSB1c2IgdXNiMzogTmV3IFVTQiBk
ZXZpY2Ugc3RyaW5nczogTWZyPTMsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTEKWyAgIDM1
LjY0NTA1Ml0gdXNiIHVzYjM6IFByb2R1Y3Q6IHhIQ0kgSG9zdCBDb250cm9sbGVyClsgICAz
NS42NDUwNTRdIHVzYiB1c2IzOiBNYW51ZmFjdHVyZXI6IExpbnV4IDYuMTQuMC0xMjk2Ni1n
YTJjYzZmZjVlYzhmIHhoY2ktaGNkClsgICAzNS42NDUwNTZdIHVzYiB1c2IzOiBTZXJpYWxO
dW1iZXI6IDAwMDA6Mzk6MDAuMApbICAgMzUuNjQ2NDY1XSBodWIgMy0wOjEuMDogVVNCIGh1
YiBmb3VuZApbICAgMzUuNjQ2NDc2XSBodWIgMy0wOjEuMDogMiBwb3J0cyBkZXRlY3RlZApb
ICAgMzUuNjQ3ODg1XSB1c2IgdXNiNDogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9y
PTFkNmIsIGlkUHJvZHVjdD0wMDAzLCBiY2REZXZpY2U9IDYuMTQKWyAgIDM1LjY0Nzg5MF0g
dXNiIHVzYjQ6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0zLCBQcm9kdWN0PTIsIFNl
cmlhbE51bWJlcj0xClsgICAzNS42NDc4OTJdIHVzYiB1c2I0OiBQcm9kdWN0OiB4SENJIEhv
c3QgQ29udHJvbGxlcgpbICAgMzUuNjQ3ODk0XSB1c2IgdXNiNDogTWFudWZhY3R1cmVyOiBM
aW51eCA2LjE0LjAtMTI5NjYtZ2EyY2M2ZmY1ZWM4ZiB4aGNpLWhjZApbICAgMzUuNjQ3ODk2
XSB1c2IgdXNiNDogU2VyaWFsTnVtYmVyOiAwMDAwOjM5OjAwLjAKWyAgIDM1LjY0ODAyM10g
aHViIDQtMDoxLjA6IFVTQiBodWIgZm91bmQKWyAgIDM1LjY0ODAzNl0gaHViIDQtMDoxLjA6
IDIgcG9ydHMgZGV0ZWN0ZWQKWyAgIDM1LjY1OTYzM10gcGNpX2J1cyAwMDAwOjAyOiBBbGxv
Y2F0aW5nIHJlc291cmNlcwpbICAgMzUuNjU5NjYzXSBwY2llcG9ydCAwMDAwOjAyOjAxLjA6
IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZmXSB0byBbYnVzIDA0LTM4XSBhZGRf
c2l6ZSAxMDAwClsgICAzNS42NTk2NjhdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdl
IHdpbmRvdyBbaW8gIDB4MTAwMC0weDBmZmZdIHRvIFtidXMgMzldIGFkZF9zaXplIDEwMDAK
WyAgIDM1LjY1OTY3MV0gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBBc3NpZ25lZCBicmlkZ2Ug
d2luZG93IFttZW0gMHhhMDAwMDAwMC0weGMxZmZmZmZmIDY0Yml0IHByZWZdIHRvIFtidXMg
MDItMzldIGNhbm5vdCBmaXQgMHgyMDAwMDAgcmVxdWlyZWQgZm9yIDAwMDA6MDI6MDIuMCBi
cmlkZ2luZyB0byBbYnVzIDM5XQpbICAgMzUuNjU5Njc1XSBwY2llcG9ydCAwMDAwOjAyOjAy
LjA6IGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMDAwMDAwIDY0Yml0IHByZWZdIHRvIFtidXMg
MzldIHJlcXVpcmVzIHJlbGF4ZWQgYWxpZ25tZW50IHJ1bGVzClsgICAzNS42NTk2NzddIHBj
aWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbbWVtIDB4MDAxMDAwMDAtMHgw
MDBmZmZmZiA2NGJpdCBwcmVmXSB0byBbYnVzIDM5XSBhZGRfc2l6ZSAyMDAwMDAgYWRkX2Fs
aWduIDEwMDAwMApbICAgMzUuNjU5NjgxXSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRn
ZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZmXSB0byBbYnVzIDAyLTM5XSBhZGRfc2l6ZSAy
MDAwClsgICAzNS42NTk2ODVdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRv
dyBbaW8gIHNpemUgMHgyMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAgMzUuNjU5
Njg4XSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4
MjAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgIDM1LjY1OTY5MF0gcGNpZXBvcnQgMDAwMDow
MTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDIwMDBdOiBjYW4ndCBhc3NpZ247
IG5vIHNwYWNlClsgICAzNS42NTk2OTJdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdl
IHdpbmRvdyBbaW8gIHNpemUgMHgyMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAgMzUuNjU5
Njk3XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4
MDAyMDAwMDAgNjRiaXQgcHJlZl06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgIDM1LjY1
OTY5OV0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAw
eDAwMjAwMDAwIDY0Yml0IHByZWZdOiBmYWlsZWQgdG8gYXNzaWduClsgICAzNS42NTk3MDJd
IHBjaWVwb3J0IDAwMDA6MDI6MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAw
XTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAgMzUuNjU5NzA0XSBwY2llcG9ydCAwMDAw
OjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBh
c3NpZ24KWyAgIDM1LjY1OTcwNl0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2lu
ZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgICAzNS42
NTk3MDhdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUg
MHgxMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAgMzUuNjU5NzExXSBwY2llcG9ydCAwMDAw
OjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAwMDAgNjRiaXQgcHJl
Zl06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgIDM1LjY1OTcxM10gcGNpZXBvcnQgMDAw
MDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHBy
ZWZdOiBmYWlsZWQgdG8gYXNzaWduClsgICAzNS42NTk3MTZdIHBjaWVwb3J0IDAwMDA6MDI6
MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBu
byBzcGFjZQpbICAgMzUuNjU5NzE3XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3
aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgIDM1LjY1OTcx
OF0gcGNpZXBvcnQgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEw
MDBdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgICAzNS42NTk3MjBdIHBjaWVwb3J0IDAw
MDA6MDI6MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogZmFpbGVkIHRv
IGFzc2lnbgpbICAgMzUuODk3ODgyXSB1c2IgMy0xOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2
aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNkClsgICAzNi4wMzYyMThdIHVzYiAzLTE6IE5l
dyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0yMTA5LCBpZFByb2R1Y3Q9MjgxNywgYmNk
RGV2aWNlPSA1LmUzClsgICAzNi4wMzYyMjRdIHVzYiAzLTE6IE5ldyBVU0IgZGV2aWNlIHN0
cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0zClsgICAzNi4wMzYyMjdd
IHVzYiAzLTE6IFByb2R1Y3Q6IFVTQjIuMCBIdWIgICAgICAgICAgICAgClsgICAzNi4wMzYy
MjhdIHVzYiAzLTE6IE1hbnVmYWN0dXJlcjogVklBIExhYnMsIEluYy4gICAgICAgICAKWyAg
IDM2LjAzNjIzMF0gdXNiIDMtMTogU2VyaWFsTnVtYmVyOiAwMDAwMDAwMDAKWyAgIDM2LjA0
MzA3MV0gaHViIDMtMToxLjA6IFVTQiBodWIgZm91bmQKWyAgIDM2LjA0MzI0MV0gaHViIDMt
MToxLjA6IDUgcG9ydHMgZGV0ZWN0ZWQKWyAgIDM2LjE2NTk2NF0gdXNiIDQtMTogbmV3IFN1
cGVyU3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4aGNpX2hjZApbICAgMzYuMjEw
NjA1XSB1c2IgNC0xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MjEwOSwgaWRQ
cm9kdWN0PTA4MTcsIGJjZERldmljZT0gNS5lMwpbICAgMzYuMjEwNjEwXSB1c2IgNC0xOiBO
ZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9
MwpbICAgMzYuMjEwNjEyXSB1c2IgNC0xOiBQcm9kdWN0OiBVU0IzLjAgSHViICAgICAgICAg
ICAgIApbICAgMzYuMjEwNjEzXSB1c2IgNC0xOiBNYW51ZmFjdHVyZXI6IFZJQSBMYWJzLCBJ
bmMuICAgICAgICAgClsgICAzNi4yMTA2MTRdIHVzYiA0LTE6IFNlcmlhbE51bWJlcjogMDAw
MDAwMDAwClsgICAzNi4yMTE5MTBdIGh1YiA0LTE6MS4wOiBVU0IgaHViIGZvdW5kClsgICAz
Ni4yMTE5OTFdIGh1YiA0LTE6MS4wOiA0IHBvcnRzIGRldGVjdGVkClsgICAzNi43NDQwMTdd
IHdsYW4wOiBkZWF1dGhlbnRpY2F0aW5nIGZyb20gODg6NzE6YjE6ODE6OTM6MWIgYnkgbG9j
YWwgY2hvaWNlIChSZWFzb246IDM9REVBVVRIX0xFQVZJTkcpClsgICAzNi43NzM5MjFdIHVz
YiAzLTEuMTogbmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMyB1c2luZyB4aGNp
X2hjZApbICAgMzYuOTEyMzk5XSB1c2IgMy0xLjE6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBp
ZFZlbmRvcj0yMTA5LCBpZFByb2R1Y3Q9MjgxNywgYmNkRGV2aWNlPSA3LmI0ClsgICAzNi45
MTI0MDVdIHVzYiAzLTEuMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1
Y3Q9MiwgU2VyaWFsTnVtYmVyPTMKWyAgIDM2LjkxMjQwN10gdXNiIDMtMS4xOiBQcm9kdWN0
OiBVU0IyLjAgSHViICAgICAgICAgICAgIApbICAgMzYuOTEyNDA5XSB1c2IgMy0xLjE6IE1h
bnVmYWN0dXJlcjogVklBIExhYnMsIEluYy4gICAgICAgICAKWyAgIDM2LjkxMjQxMF0gdXNi
IDMtMS4xOiBTZXJpYWxOdW1iZXI6IDAwMDAwMDAwMApbICAgMzYuOTEzNzMwXSBodWIgMy0x
LjE6MS4wOiBVU0IgaHViIGZvdW5kClsgICAzNi45MTM5NDBdIGh1YiAzLTEuMToxLjA6IDQg
cG9ydHMgZGV0ZWN0ZWQKWyAgIDM3LjAwOTg4Nl0gdXNiIDQtMS4xOiBuZXcgU3VwZXJTcGVl
ZCBVU0IgZGV2aWNlIG51bWJlciAzIHVzaW5nIHhoY2lfaGNkClsgICAzNy4wNjU5MDJdIHVz
YiA0LTEuMTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTIxMDksIGlkUHJvZHVj
dD0wODE3LCBiY2REZXZpY2U9IDcuYjQKWyAgIDM3LjA2NTkwOV0gdXNiIDQtMS4xOiBOZXcg
VVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mwpb
ICAgMzcuMDY1OTExXSB1c2IgNC0xLjE6IFByb2R1Y3Q6IFVTQjMuMCBIdWIgICAgICAgICAg
ICAgClsgICAzNy4wNjU5MTNdIHVzYiA0LTEuMTogTWFudWZhY3R1cmVyOiBWSUEgTGFicywg
SW5jLiAgICAgICAgIApbICAgMzcuMDY1OTE1XSB1c2IgNC0xLjE6IFNlcmlhbE51bWJlcjog
MDAwMDAwMDAwClsgICAzNy4xMTU1NDldIGh1YiA0LTEuMToxLjA6IFVTQiBodWIgZm91bmQK
WyAgIDM3LjExNTk1NF0gaHViIDQtMS4xOjEuMDogNCBwb3J0cyBkZXRlY3RlZApbICAgMzcu
MTg1ODk4XSB1c2IgMy0xLjM6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDQg
dXNpbmcgeGhjaV9oY2QKWyAgIDM3LjM0MjAyOF0gdXNiIDMtMS4zOiBOZXcgVVNCIGRldmlj
ZSBmb3VuZCwgaWRWZW5kb3I9MGJkYSwgaWRQcm9kdWN0PTU0MDksIGJjZERldmljZT0gMS40
MQpbICAgMzcuMzQyMDM0XSB1c2IgMy0xLjM6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1m
cj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0wClsgICAzNy4zNDIwMzZdIHVzYiAzLTEu
MzogUHJvZHVjdDogNC1Qb3J0IFVTQiAyLjAgSHViClsgICAzNy4zNDIwMzddIHVzYiAzLTEu
MzogTWFudWZhY3R1cmVyOiBHZW5lcmljClsgICAzNy4zNDM3NDldIGh1YiAzLTEuMzoxLjA6
IFVTQiBodWIgZm91bmQKWyAgIDM3LjM0NDkwNV0gaHViIDMtMS4zOjEuMDogNCBwb3J0cyBk
ZXRlY3RlZApbICAgMzcuNDAyNDU2XSB1c2IgNC0xLjM6IG5ldyBTdXBlclNwZWVkIFVTQiBk
ZXZpY2UgbnVtYmVyIDQgdXNpbmcgeGhjaV9oY2QKWyAgIDM3LjQzNDAyNl0gdXNiIDQtMS4z
OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MGJkYSwgaWRQcm9kdWN0PTA0MDks
IGJjZERldmljZT0gMS40MQpbICAgMzcuNDM0MDMzXSB1c2IgNC0xLjM6IE5ldyBVU0IgZGV2
aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0wClsgICAzNy40
MzQwMzVdIHVzYiA0LTEuMzogUHJvZHVjdDogNC1Qb3J0IFVTQiAzLjAgSHViClsgICAzNy40
MzQwMzhdIHVzYiA0LTEuMzogTWFudWZhY3R1cmVyOiBHZW5lcmljClsgICAzNy40NDEyMTZd
IGh1YiA0LTEuMzoxLjA6IFVTQiBodWIgZm91bmQKWyAgIDM3LjQ0MzUwMF0gaHViIDQtMS4z
OjEuMDogMiBwb3J0cyBkZXRlY3RlZApbICAgMzcuNTE3OTg1XSB1c2IgNC0xLjQ6IG5ldyBT
dXBlclNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDUgdXNpbmcgeGhjaV9oY2QKWyAgIDM3LjUz
NTc3M10gdXNiIDQtMS40OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDU4Ziwg
aWRQcm9kdWN0PTg0NjgsIGJjZERldmljZT0gMS4wMApbICAgMzcuNTM1NzgwXSB1c2IgNC0x
LjQ6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51
bWJlcj0zClsgICAzNy41MzU3ODJdIHVzYiA0LTEuNDogUHJvZHVjdDogTWFzcyBTdG9yYWdl
IERldmljZQpbICAgMzcuNTM1NzgzXSB1c2IgNC0xLjQ6IE1hbnVmYWN0dXJlcjogR2VuZXJp
YwpbICAgMzcuNTM1Nzg1XSB1c2IgNC0xLjQ6IFNlcmlhbE51bWJlcjogMDU4Rjg0Njg4NDYx
ClsgICAzNy41NTI1MzFdIHVzYi1zdG9yYWdlIDQtMS40OjEuMDogVVNCIE1hc3MgU3RvcmFn
ZSBkZXZpY2UgZGV0ZWN0ZWQKWyAgIDM3LjU1MjcxMl0gc2NzaSBob3N0MDogdXNiLXN0b3Jh
Z2UgNC0xLjQ6MS4wClsgICAzNy41NTI5MDFdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGlu
dGVyZmFjZSBkcml2ZXIgdXNiLXN0b3JhZ2UKWyAgIDM3LjcwODUyMV0gUE06IHN1c3BlbmQg
ZW50cnkgKGRlZXApClsgICAzNy45Njk4OTJdIEZpbGVzeXN0ZW1zIHN5bmM6IDAuMjYxIHNl
Y29uZHMKWyAgIDM3Ljk5MjEwNl0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMKWyAg
IDM4LjI4NjAzMl0gdXNiIDMtMS4zLjM6IG5ldyBsb3ctc3BlZWQgVVNCIGRldmljZSBudW1i
ZXIgNiB1c2luZyB4aGNpX2hjZApbICAgMzguMzM0MjcwXSBGcmVlemluZyB1c2VyIHNwYWNl
IHByb2Nlc3NlcyBjb21wbGV0ZWQgKGVsYXBzZWQgMC4zNDIgc2Vjb25kcykKWyAgIDM4LjMz
NDI4OV0gT09NIGtpbGxlciBkaXNhYmxlZC4KWyAgIDM4LjMzNDI5M10gRnJlZXppbmcgcmVt
YWluaW5nIGZyZWV6YWJsZSB0YXNrcwpbICAgMzguMzk3NDQ3XSB1c2IgMy0xLjMuMzogTmV3
IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTQxM2MsIGlkUHJvZHVjdD0yMTEzLCBiY2RE
ZXZpY2U9IDEuMDgKWyAgIDM4LjM5NzQ2Nl0gdXNiIDMtMS4zLjM6IE5ldyBVU0IgZGV2aWNl
IHN0cmluZ3M6IE1mcj0wLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0wClsgICAzOC4zOTc0
NzRdIHVzYiAzLTEuMy4zOiBQcm9kdWN0OiBEZWxsIEtCMjE2IFdpcmVkIEtleWJvYXJkClsg
ICAzOC40MDkzMTJdIGlucHV0OiBEZWxsIEtCMjE2IFdpcmVkIEtleWJvYXJkIGFzIC9kZXZp
Y2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxYy4wLzAwMDA6MDE6MDAuMC8wMDAwOjAyOjAyLjAv
MDAwMDozOTowMC4wL3VzYjMvMy0xLzMtMS4zLzMtMS4zLjMvMy0xLjMuMzoxLjAvMDAwMzo0
MTNDOjIxMTMuMDAwMy9pbnB1dC9pbnB1dDM1ClsgICAzOC40NjIxMzRdIHVzYiA0LTEuMS4z
OiBuZXcgU3VwZXJTcGVlZCBVU0IgZGV2aWNlIG51bWJlciA2IHVzaW5nIHhoY2lfaGNkClsg
ICAzOC40NjI5MDRdIGhpZC1nZW5lcmljIDAwMDM6NDEzQzoyMTEzLjAwMDM6IGlucHV0LGhp
ZHJhdzI6IFVTQiBISUQgdjEuMTEgS2V5Ym9hcmQgW0RlbGwgS0IyMTYgV2lyZWQgS2V5Ym9h
cmRdIG9uIHVzYi0wMDAwOjM5OjAwLjAtMS4zLjMvaW5wdXQwClsgICAzOC40NjgzODldIGlu
cHV0OiBEZWxsIEtCMjE2IFdpcmVkIEtleWJvYXJkIFN5c3RlbSBDb250cm9sIGFzIC9kZXZp
Y2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxYy4wLzAwMDA6MDE6MDAuMC8wMDAwOjAyOjAyLjAv
MDAwMDozOTowMC4wL3VzYjMvMy0xLzMtMS4zLzMtMS4zLjMvMy0xLjMuMzoxLjEvMDAwMzo0
MTNDOjIxMTMuMDAwNC9pbnB1dC9pbnB1dDM2ClsgICAzOC40Nzk0NTJdIHVzYiA0LTEuMS4z
OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MGJkYSwgaWRQcm9kdWN0PTgxNTMs
IGJjZERldmljZT0zMC4wMApbICAgMzguNDc5NDcwXSB1c2IgNC0xLjEuMzogTmV3IFVTQiBk
ZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTYKWyAgIDM4
LjQ3OTQ3OF0gdXNiIDQtMS4xLjM6IFByb2R1Y3Q6IFVTQiAxMC8xMDAvMTAwMCBMQU4KWyAg
IDM4LjQ3OTQ4NF0gdXNiIDQtMS4xLjM6IE1hbnVmYWN0dXJlcjogUmVhbHRlawpbICAgMzgu
NDc5NDg5XSB1c2IgNC0xLjEuMzogU2VyaWFsTnVtYmVyOiAwMDAwMDEKWyAgIDM4LjUyMjQ0
N10gaW5wdXQ6IERlbGwgS0IyMTYgV2lyZWQgS2V5Ym9hcmQgQ29uc3VtZXIgQ29udHJvbCBh
cyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWMuMC8wMDAwOjAxOjAwLjAvMDAwMDow
MjowMi4wLzAwMDA6Mzk6MDAuMC91c2IzLzMtMS8zLTEuMy8zLTEuMy4zLzMtMS4zLjM6MS4x
LzAwMDM6NDEzQzoyMTEzLjAwMDQvaW5wdXQvaW5wdXQzNwpbICAgMzguNTIyNzI0XSBoaWQt
Z2VuZXJpYyAwMDAzOjQxM0M6MjExMy4wMDA0OiBpbnB1dCxoaWRyYXczOiBVU0IgSElEIHYx
LjExIERldmljZSBbRGVsbCBLQjIxNiBXaXJlZCBLZXlib2FyZF0gb24gdXNiLTAwMDA6Mzk6
MDAuMC0xLjMuMy9pbnB1dDEKWyAgIDM4LjYxMDEyMl0gdXNiIDMtMS4zLjQ6IG5ldyBsb3ct
c3BlZWQgVVNCIGRldmljZSBudW1iZXIgNyB1c2luZyB4aGNpX2hjZApbICAgMzguNzE5NTky
XSB1c2IgMy0xLjMuNDogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTFiY2YsIGlk
UHJvZHVjdD0wMDA1LCBiY2REZXZpY2U9IDAuMTQKWyAgIDM4LjcxOTYxM10gdXNiIDMtMS4z
LjQ6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0wLCBQcm9kdWN0PTIsIFNlcmlhbE51
bWJlcj0wClsgICAzOC43MTk2MjJdIHVzYiAzLTEuMy40OiBQcm9kdWN0OiBVU0IgT3B0aWNh
bCBNb3VzZQpbICAgMzguNzMxMDkxXSBpbnB1dDogVVNCIE9wdGljYWwgTW91c2UgYXMgL2Rl
dmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjFjLjAvMDAwMDowMTowMC4wLzAwMDA6MDI6MDIu
MC8wMDAwOjM5OjAwLjAvdXNiMy8zLTEvMy0xLjMvMy0xLjMuNC8zLTEuMy40OjEuMC8wMDAz
OjFCQ0Y6MDAwNS4wMDA1L2lucHV0L2lucHV0MzgKWyAgIDM4LjczMTQ0OV0gaGlkLWdlbmVy
aWMgMDAwMzoxQkNGOjAwMDUuMDAwNTogaW5wdXQsaGlkcmF3NDogVVNCIEhJRCB2MS4xMCBN
b3VzZSBbVVNCIE9wdGljYWwgTW91c2VdIG9uIHVzYi0wMDAwOjM5OjAwLjAtMS4zLjQvaW5w
dXQwClsgICAzOS4yMTQyMDRdIEZyZWV6aW5nIHJlbWFpbmluZyBmcmVlemFibGUgdGFza3Mg
Y29tcGxldGVkIChlbGFwc2VkIDAuODc5IHNlY29uZHMpClsgICAzOS4yMTQzNDBdIHByaW50
azogU3VzcGVuZGluZyBjb25zb2xlKHMpICh1c2Ugbm9fY29uc29sZV9zdXNwZW5kIHRvIGRl
YnVnKQpbICAgMzkuNzk0NjcyXSBBQ1BJOiBFQzogaW50ZXJydXB0IGJsb2NrZWQKWyAgIDM5
LjgyMTU1Ml0gQUNQSTogUE06IFByZXBhcmluZyB0byBlbnRlciBzeXN0ZW0gc2xlZXAgc3Rh
dGUgUzMKWyAgIDM5LjgyNzEzNV0gQUNQSTogRUM6IGV2ZW50IGJsb2NrZWQKWyAgIDM5Ljgy
NzEzN10gQUNQSTogRUM6IEVDIHN0b3BwZWQKWyAgIDM5LjgyNzEzOF0gQUNQSTogUE06IFNh
dmluZyBwbGF0Zm9ybSBOVlMgbWVtb3J5ClsgICAzOS44Mjg5NTddIERpc2FibGluZyBub24t
Ym9vdCBDUFVzIC4uLgpbICAgMzkuODMwOTk3XSBzbXBib290OiBDUFUgMyBpcyBub3cgb2Zm
bGluZQpbICAgMzkuODMzNDk4XSBzbXBib290OiBDUFUgMiBpcyBub3cgb2ZmbGluZQpbICAg
MzkuODM1NDA4XSBzbXBib290OiBDUFUgMSBpcyBub3cgb2ZmbGluZQpbICAgMzkuODQyOTQz
XSBBQ1BJOiBQTTogTG93LWxldmVsIHJlc3VtZSBjb21wbGV0ZQpbICAgMzkuODQyOTg2XSBB
Q1BJOiBFQzogRUMgc3RhcnRlZApbICAgMzkuODQyOTg3XSBBQ1BJOiBQTTogUmVzdG9yaW5n
IHBsYXRmb3JtIE5WUyBtZW1vcnkKWyAgIDM5Ljg0NDkyOF0gRW5hYmxpbmcgbm9uLWJvb3Qg
Q1BVcyAuLi4KWyAgIDM5Ljg0NDk1NV0gc21wYm9vdDogQm9vdGluZyBOb2RlIDAgUHJvY2Vz
c29yIDEgQVBJQyAweDIKWyAgIDM5Ljg0NTY3NF0gQ1BVMSBpcyB1cApbICAgMzkuODQ1Njkw
XSBzbXBib290OiBCb290aW5nIE5vZGUgMCBQcm9jZXNzb3IgMiBBUElDIDB4MQpbICAgMzku
ODQ2NDM2XSBDUFUyIGlzIHVwClsgICAzOS44NDY0NTNdIHNtcGJvb3Q6IEJvb3RpbmcgTm9k
ZSAwIFByb2Nlc3NvciAzIEFQSUMgMHgzClsgICAzOS44NDcxNTRdIENQVTMgaXMgdXAKWyAg
IDM5Ljg1MDA0Nl0gQUNQSTogUE06IFdha2luZyB1cCBmcm9tIHN5c3RlbSBzbGVlcCBzdGF0
ZSBTMwpbICAgNDAuMTQxMTYyXSBBQ1BJOiBFQzogaW50ZXJydXB0IHVuYmxvY2tlZApbICAg
NDAuMTU2NTkyXSBBQ1BJOiBFQzogZXZlbnQgdW5ibG9ja2VkClsgICA0MC4xNTgwNDZdIHho
Y2lfaGNkIDAwMDA6Mzk6MDAuMDogeEhDIGVycm9yIGluIHJlc3VtZSwgVVNCU1RTIDB4NDEx
LCBSZWluaXQKWyAgIDQwLjE1ODA1Ml0gdXNiIHVzYjM6IHJvb3QgaHViIGxvc3QgcG93ZXIg
b3Igd2FzIHJlc2V0ClsgICA0MC4xNTgwNTNdIHVzYiB1c2I0OiByb290IGh1YiBsb3N0IHBv
d2VyIG9yIHdhcyByZXNldApbICAgNDAuMTcxODk3XSBudm1lIG52bWUwOiA0LzAvMCBkZWZh
dWx0L3JlYWQvcG9sbCBxdWV1ZXMKWyAgIDQwLjQyNjIwNV0gdXNiIDMtMTogcmVzZXQgaGln
aC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNkClsgICA0MC40OTgx
NjZdIHVzYiAxLTU6IHJlc2V0IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgNCB1c2lu
ZyB4aGNpX2hjZApbICAgNDAuNjg3MzY2XSB1c2IgNC0xOiByZXNldCBTdXBlclNwZWVkIFVT
QiBkZXZpY2UgbnVtYmVyIDIgdXNpbmcgeGhjaV9oY2QKWyAgIDQwLjc1NDE4MV0gdXNiIDEt
MzogcmVzZXQgZnVsbC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nIHhoY2lfaGNk
ClsgICA0MS4wMTAyMjJdIHVzYiAxLTQ6IHJlc2V0IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBu
dW1iZXIgMyB1c2luZyB4aGNpX2hjZApbICAgNDEuMzEwMTcxXSB1c2IgMy0xLjM6IHJlc2V0
IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgNCB1c2luZyB4aGNpX2hjZApbICAgNDEu
NTkwMTcyXSB1c2IgMy0xLjE6IHJlc2V0IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIg
MyB1c2luZyB4aGNpX2hjZApbICAgNDEuNzk4ODI2XSB1c2IgNC0xLjM6IHJlc2V0IFN1cGVy
U3BlZWQgVVNCIGRldmljZSBudW1iZXIgNCB1c2luZyB4aGNpX2hjZApbICAgNDEuODk0MjA3
XSB1c2IgNC0xLjQ6IHJlc2V0IFN1cGVyU3BlZWQgVVNCIGRldmljZSBudW1iZXIgNSB1c2lu
ZyB4aGNpX2hjZApbICAgNDEuOTgyMzE5XSB1c2IgNC0xLjE6IHJlc2V0IFN1cGVyU3BlZWQg
VVNCIGRldmljZSBudW1iZXIgMyB1c2luZyB4aGNpX2hjZApbICAgNDIuMjgyMTc1XSB1c2Ig
My0xLjMuNDogcmVzZXQgbG93LXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDcgdXNpbmcgeGhj
aV9oY2QKWyAgIDQyLjgxODIxOF0gdXNiIDMtMS4zLjM6IHJlc2V0IGxvdy1zcGVlZCBVU0Ig
ZGV2aWNlIG51bWJlciA2IHVzaW5nIHhoY2lfaGNkClsgICA0My4xNzAyMTZdIHVzYiA0LTEu
MS4zOiByZXNldCBTdXBlclNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDYgdXNpbmcgeGhjaV9o
Y2QKWyAgIDQzLjE5MjMwNF0gT09NIGtpbGxlciBlbmFibGVkLgpbICAgNDMuMTkyMzA2XSBS
ZXN0YXJ0aW5nIHRhc2tzIC4uLiBkb25lLgpbICAgNDMuMTkyODk0XSByYW5kb206IGNybmcg
cmVzZWVkZWQgb24gc3lzdGVtIHJlc3VtcHRpb24KWyAgIDQzLjE5NDcyMl0gc2NzaSAwOjA6
MDowOiBEaXJlY3QtQWNjZXNzICAgICBHZW5lcmljLSBTRC9NTUMgICAgICAgICAgIDEuMDAg
UFE6IDAgQU5TSTogNgpbICAgNDMuMTk2MDY0XSBtZWlfaGRjcCAwMDAwOjAwOjE2LjAtYjYz
OGFiN2UtOTRlMi00ZWEyLWE1NTItZDFjNTRiNjI3ZjA0OiBib3VuZCAwMDAwOjAwOjAyLjAg
KG9wcyBpOTE1X2hkY3Bfb3BzIFtpOTE1XSkKWyAgIDQzLjE5NjQ2Ml0gc2NzaSAwOjA6MDox
OiBEaXJlY3QtQWNjZXNzICAgICBHZW5lcmljLSBNaWNybyBTRC9NMiAgICAgIDEuMDggUFE6
IDAgQU5TSTogNgpbICAgNDMuMjE3NDQwXSBwY2lfYnVzIDAwMDA6MDI6IEFsbG9jYXRpbmcg
cmVzb3VyY2VzClsgICA0My4yMTc0NTldIHBjaWVwb3J0IDAwMDA6MDI6MDEuMDogYnJpZGdl
IHdpbmRvdyBbaW8gIDB4MTAwMC0weDBmZmZdIHRvIFtidXMgMDQtMzhdIGFkZF9zaXplIDEw
MDAKWyAgIDQzLjIxNzQ2NF0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93
IFtpbyAgMHgxMDAwLTB4MGZmZl0gdG8gW2J1cyAzOV0gYWRkX3NpemUgMTAwMApbICAgNDMu
MjE3NDY4XSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IEFzc2lnbmVkIGJyaWRnZSB3aW5kb3cg
W21lbSAweGEwMDAwMDAwLTB4YzFmZmZmZmYgNjRiaXQgcHJlZl0gdG8gW2J1cyAwMi0zOV0g
Y2Fubm90IGZpdCAweDIwMDAwMCByZXF1aXJlZCBmb3IgMDAwMDowMjowMi4wIGJyaWRnaW5n
IHRvIFtidXMgMzldClsgICA0My4yMTc0NzJdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJp
ZGdlIHdpbmRvdyBbbWVtIDB4MDAwMDAwMDAgNjRiaXQgcHJlZl0gdG8gW2J1cyAzOV0gcmVx
dWlyZXMgcmVsYXhlZCBhbGlnbm1lbnQgcnVsZXMKWyAgIDQzLjIxNzQ3NV0gcGNpZXBvcnQg
MDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gMHgwMDEwMDAwMC0weDAwMGZmZmZm
IDY0Yml0IHByZWZdIHRvIFtidXMgMzldIGFkZF9zaXplIDIwMDAwMCBhZGRfYWxpZ24gMTAw
MDAwClsgICA0My4yMTc0NzhdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRv
dyBbaW8gIDB4MTAwMC0weDBmZmZdIHRvIFtidXMgMDItMzldIGFkZF9zaXplIDIwMDAKWyAg
IDQzLjIxNzQ4M10gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAg
c2l6ZSAweDIwMDBdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgICA0My4yMTc0ODZdIHBj
aWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgyMDAwXTog
ZmFpbGVkIHRvIGFzc2lnbgpbICAgNDMuMjE3NDg4XSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6
IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MjAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3Bh
Y2UKWyAgIDQzLjIxNzQ5MF0gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBicmlkZ2Ugd2luZG93
IFtpbyAgc2l6ZSAweDIwMDBdOiBmYWlsZWQgdG8gYXNzaWduClsgICA0My4yMTc0OTVdIHBj
aWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbbWVtIHNpemUgMHgwMDIwMDAw
MCA2NGJpdCBwcmVmXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAgNDMuMjE3NDk3XSBw
Y2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAw
MDAgNjRiaXQgcHJlZl06IGZhaWxlZCB0byBhc3NpZ24KWyAgIDQzLjIxNzQ5OV0gcGNpZXBv
cnQgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBjYW4n
dCBhc3NpZ247IG5vIHNwYWNlClsgICA0My4yMTc1MDFdIHBjaWVwb3J0IDAwMDA6MDI6MDEu
MDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpb
ICAgNDMuMjE3NTAyXSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lv
ICBzaXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgIDQzLjIxNzUwNF0g
cGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBd
OiBmYWlsZWQgdG8gYXNzaWduClsgICA0My4yMTc1MDddIHBjaWVwb3J0IDAwMDA6MDI6MDIu
MDogYnJpZGdlIHdpbmRvdyBbbWVtIHNpemUgMHgwMDIwMDAwMCA2NGJpdCBwcmVmXTogY2Fu
J3QgYXNzaWduOyBubyBzcGFjZQpbICAgNDMuMjE3NTA5XSBwY2llcG9ydCAwMDAwOjAyOjAy
LjA6IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAwMDAgNjRiaXQgcHJlZl06IGZh
aWxlZCB0byBhc3NpZ24KWyAgIDQzLjIxNzUxMV0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBi
cmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNl
ClsgICA0My4yMTc1MTJdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBb
aW8gIHNpemUgMHgxMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAgNDMuMjE3NTE0XSBwY2ll
cG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGNh
bid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgIDQzLjIxNzUxNV0gcGNpZXBvcnQgMDAwMDowMjow
MS4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBmYWlsZWQgdG8gYXNzaWdu
ClsgICA0My4yMjIxNzNdIHBjaV9idXMgMDAwMDowMjogQWxsb2NhdGluZyByZXNvdXJjZXMK
WyAgIDQzLjIyMjUzMV0gcGNpZXBvcnQgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtp
byAgMHgxMDAwLTB4MGZmZl0gdG8gW2J1cyAwNC0zOF0gYWRkX3NpemUgMTAwMApbICAgNDMu
MjIyNTM3XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEw
MDAtMHgwZmZmXSB0byBbYnVzIDM5XSBhZGRfc2l6ZSAxMDAwClsgICA0My4yMjI1NDFdIHBj
aWVwb3J0IDAwMDA6MDE6MDAuMDogQXNzaWduZWQgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YTAw
MDAwMDAtMHhjMWZmZmZmZiA2NGJpdCBwcmVmXSB0byBbYnVzIDAyLTM5XSBjYW5ub3QgZml0
IDB4MjAwMDAwIHJlcXVpcmVkIGZvciAwMDAwOjAyOjAyLjAgYnJpZGdpbmcgdG8gW2J1cyAz
OV0KWyAgIDQzLjIyMjU0NV0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93
IFttZW0gMHgwMDAwMDAwMCA2NGJpdCBwcmVmXSB0byBbYnVzIDM5XSByZXF1aXJlcyByZWxh
eGVkIGFsaWdubWVudCBydWxlcwpbICAgNDMuMjIyNTQ3XSBwY2llcG9ydCAwMDAwOjAyOjAy
LjA6IGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMTAwMDAwLTB4MDAwZmZmZmYgNjRiaXQgcHJl
Zl0gdG8gW2J1cyAzOV0gYWRkX3NpemUgMjAwMDAwIGFkZF9hbGlnbiAxMDAwMDAKWyAgIDQz
LjIyMjU1MV0gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgMHgx
MDAwLTB4MGZmZl0gdG8gW2J1cyAwMi0zOV0gYWRkX3NpemUgMjAwMApbICAgNDMuMjIyNTU1
XSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MjAw
MF06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgIDQzLjIyMjU1N10gcGNpZXBvcnQgMDAw
MDowMTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDIwMDBdOiBmYWlsZWQgdG8g
YXNzaWduClsgICA0My4yMjI1NjBdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdp
bmRvdyBbaW8gIHNpemUgMHgyMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAgNDMu
MjIyNTYxXSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXpl
IDB4MjAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgIDQzLjIyMjU2Nl0gcGNpZXBvcnQgMDAw
MDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHBy
ZWZdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgICA0My4yMjI1NjhdIHBjaWVwb3J0IDAw
MDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbbWVtIHNpemUgMHgwMDIwMDAwMCA2NGJpdCBw
cmVmXTogZmFpbGVkIHRvIGFzc2lnbgpbICAgNDMuMjIyNTcwXSBwY2llcG9ydCAwMDAwOjAy
OjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsg
bm8gc3BhY2UKWyAgIDQzLjIyMjU3Ml0gcGNpZXBvcnQgMDAwMDowMjowMS4wOiBicmlkZ2Ug
d2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBmYWlsZWQgdG8gYXNzaWduClsgICA0My4yMjI1
NzRdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgx
MDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAgNDMuMjIyNTc1XSBwY2llcG9ydCAw
MDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0
byBhc3NpZ24KWyAgIDQzLjIyMjU3OF0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ug
d2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHByZWZdOiBjYW4ndCBhc3NpZ247
IG5vIHNwYWNlClsgICA0My4yMjI1NzldIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdl
IHdpbmRvdyBbbWVtIHNpemUgMHgwMDIwMDAwMCA2NGJpdCBwcmVmXTogZmFpbGVkIHRvIGFz
c2lnbgpbICAgNDMuMjIyNTgxXSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5k
b3cgW2lvICBzaXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgIDQzLjIy
MjU4M10gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAw
eDEwMDBdOiBmYWlsZWQgdG8gYXNzaWduClsgICA0My4yMjI1ODVdIHBjaWVwb3J0IDAwMDA6
MDI6MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWdu
OyBubyBzcGFjZQpbICAgNDMuMjIyNTg2XSBwY2llcG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRn
ZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgIDQzLjI0
ODM3NV0gUE06IHN1c3BlbmQgZXhpdApbICAgNDMuMjkwMTg1XSB1c2IgMy0xLjU6IG5ldyBo
aWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDggdXNpbmcgeGhjaV9oY2QKWyAgIDQzLjMz
MDMxNV0gd2FybmluZzogYGF0b3AnIHVzZXMgd2lyZWxlc3MgZXh0ZW5zaW9ucyB3aGljaCB3
aWxsIHN0b3Agd29ya2luZyBmb3IgV2ktRmkgNyBoYXJkd2FyZTsgdXNlIG5sODAyMTEKWyAg
IDQzLjM5MTE4N10gdXNiIDMtMS41OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9
MjEwOSwgaWRQcm9kdWN0PTg4MTcsIGJjZERldmljZT0gMC4wMQpbICAgNDMuMzkxMTkzXSB1
c2IgMy0xLjU6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNl
cmlhbE51bWJlcj0zClsgICA0My4zOTExOTVdIHVzYiAzLTEuNTogUHJvZHVjdDogVVNCIEJp
bGxib2FyZCBEZXZpY2UgICAKWyAgIDQzLjM5MTE5N10gdXNiIDMtMS41OiBNYW51ZmFjdHVy
ZXI6IFZJQSBMYWJzLCBJbmMuICAgICAgICAgClsgICA0My4zOTExOThdIHVzYiAzLTEuNTog
U2VyaWFsTnVtYmVyOiAwMDAwMDAwMDAwMDAwMDAxClsgICA0My41MTQ4MzBdIEJsdWV0b290
aDogaGNpMDogSENJIEVuaGFuY2VkIFNldHVwIFN5bmNocm9ub3VzIENvbm5lY3Rpb24gY29t
bWFuZCBpcyBhZHZlcnRpc2VkLCBidXQgbm90IHN1cHBvcnRlZC4KWyAgIDQ4LjQwNTg1MV0g
d2xhbjA6IGF1dGhlbnRpY2F0ZSB3aXRoIDg4OjcxOmIxOjgxOjkzOjFiIChsb2NhbCBhZGRy
ZXNzPTljOmI2OmQwOmQxOjZhOmIxKQpbICAgNDguNDA1ODU4XSB3bGFuMDogc2VuZCBhdXRo
IHRvIDg4OjcxOmIxOjgxOjkzOjFiICh0cnkgMS8zKQpbICAgNDguNDA5MjI4XSB3bGFuMDog
YXV0aGVudGljYXRlZApbICAgNDguNDEwMTY2XSB3bGFuMDogYXNzb2NpYXRlIHdpdGggODg6
NzE6YjE6ODE6OTM6MWIgKHRyeSAxLzMpClsgICA0OC40NDI0NjNdIHdsYW4wOiBSWCBBc3Nv
Y1Jlc3AgZnJvbSA4ODo3MTpiMTo4MTo5MzoxYiAoY2FwYWI9MHgxMDExIHN0YXR1cz0wIGFp
ZD0xKQpbICAgNDguNDQ0ODU1XSB3bGFuMDogYXNzb2NpYXRlZApbICAgNDguNTM4MTM3XSB3
bGFuMDogTGltaXRpbmcgVFggcG93ZXIgdG8gMjMgKDIzIC0gMCkgZEJtIGFzIGFkdmVydGlz
ZWQgYnkgODg6NzE6YjE6ODE6OTM6MWIKWyAgIDY4Ljc2NjE3OV0gd2xhbjA6IGRlYXV0aGVu
dGljYXRpbmcgZnJvbSA4ODo3MTpiMTo4MTo5MzoxYiBieSBsb2NhbCBjaG9pY2UgKFJlYXNv
bjogMz1ERUFVVEhfTEVBVklORykKWyAgIDc0Ljg5ODQ4NV0gdXNiIDQtMS40OiByZXNldCBT
dXBlclNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDUgdXNpbmcgeGhjaV9oY2QKWyAgIDc0Ljkx
NjI0MV0gc2QgMDowOjA6MDogW3NkYV0gTWVkaWEgcmVtb3ZlZCwgc3RvcHBlZCBwb2xsaW5n
ClsgICA3NC45MTY2MzRdIHNkIDA6MDowOjA6IFtzZGFdIEF0dGFjaGVkIFNDU0kgcmVtb3Zh
YmxlIGRpc2sKWyAgIDk4LjgwMzA4MV0gUE06IHN1c3BlbmQgZW50cnkgKGRlZXApClsgICA5
OC44MTM5OTldIEZpbGVzeXN0ZW1zIHN5bmM6IDAuMDEwIHNlY29uZHMKWyAgIDk4LjgxOTIy
Nl0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMKWyAgMTA1LjUzNDE3Nl0geGhjaV9o
Y2QgMDAwMDozOTowMC4wOiBXQVJOIFNldCBUUiBEZXEgUHRyIGNtZCBmYWlsZWQgZHVlIHRv
IGluY29ycmVjdCBzbG90IG9yIGVwIHN0YXRlLgpbICAxMDUuNjA2NDM3XSB1c2IgNC0xLjQ6
IHJlc2V0IFN1cGVyU3BlZWQgVVNCIGRldmljZSBudW1iZXIgNSB1c2luZyB4aGNpX2hjZApb
ICAxMTguODIyMjcwXSBGcmVlemluZyB1c2VyIHNwYWNlIHByb2Nlc3NlcyBmYWlsZWQgYWZ0
ZXIgMjAuMDAzIHNlY29uZHMgKDIgdGFza3MgcmVmdXNpbmcgdG8gZnJlZXplLCB3cV9idXN5
PTApOgpbICAxMTguODIyMjgxXSB0YXNrOnN5c3RlbWQtam91cm5hbCBzdGF0ZTpEIHN0YWNr
OjAgICAgIHBpZDo0NzQgICB0Z2lkOjQ3NCAgIHBwaWQ6MSAgICAgIHRhc2tfZmxhZ3M6MHg0
MDAxMDAgZmxhZ3M6MHgwMDAwMDAwNgpbICAxMTguODIyMjg1XSBDYWxsIFRyYWNlOgpbICAx
MTguODIyMjg3XSAgPFRBU0s+ClsgIDExOC44MjIyOTFdICBfX3NjaGVkdWxlKzB4NTM3LzB4
YmIwClsgIDExOC44MjIyOTddICBzY2hlZHVsZSsweDI3LzB4ZDAKWyAgMTE4LjgyMjMwMF0g
IHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQrMHgxNS8weDIwClsgIDExOC44MjIzMDJdICBf
X211dGV4X2xvY2suY29uc3Rwcm9wLjArMHg0YjQvMHg4OTAKWyAgMTE4LjgyMjMwNl0gIHVl
dmVudF9zaG93KzB4OTkvMHgxNTAKWyAgMTE4LjgyMjMwOV0gIGRldl9hdHRyX3Nob3crMHgx
OS8weDQwClsgIDExOC44MjIzMTJdICBzeXNmc19rZl9zZXFfc2hvdysweGNkLzB4MTEwClsg
IDExOC44MjIzMTVdICBzZXFfcmVhZF9pdGVyKzB4MTE2LzB4NDAwClsgIDExOC44MjIzMThd
ICB2ZnNfcmVhZCsweDI5OS8weDM2MApbICAxMTguODIyMzIxXSAga3N5c19yZWFkKzB4NmIv
MHhlMApbICAxMTguODIyMzIzXSAgZG9fc3lzY2FsbF82NCsweDgyLzB4OWIwClsgIDExOC44
MjIzMjddICA/IGFyY2hfZXhpdF90b191c2VyX21vZGVfcHJlcGFyZS5pc3JhLjArMHgxNi8w
eDkwClsgIDExOC44MjIzMzFdICA/IHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUrMHgzNy8w
eDFhMApbICAxMTguODIyMzMzXSAgPyBkb19zeXNjYWxsXzY0KzB4OGUvMHg5YjAKWyAgMTE4
LjgyMjMzNl0gID8gX19tZW1jZ19zbGFiX2ZyZWVfaG9vaysweGY5LzB4MTQwClsgIDExOC44
MjIzMzldICA/IF9feDY0X3N5c19jbG9zZSsweDNkLzB4ODAKWyAgMTE4LjgyMjM0MV0gID8g
a21lbV9jYWNoZV9mcmVlKzB4MjM2LzB4NDYwClsgIDExOC44MjIzNDRdICA/IGFyY2hfZXhp
dF90b191c2VyX21vZGVfcHJlcGFyZS5pc3JhLjArMHgxNi8weDkwClsgIDExOC44MjIzNDZd
ICA/IHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUrMHgzNy8weDFhMApbICAxMTguODIyMzQ4
XSAgPyBkb19zeXNjYWxsXzY0KzB4OGUvMHg5YjAKWyAgMTE4LjgyMjM1MF0gIGVudHJ5X1NZ
U0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDRiLzB4NTMKWyAgMTE4LjgyMjM1Ml0gUklQOiAw
MDMzOjB4N2YyM2I1ZWE0OWVlClsgIDExOC44MjIzODJdIFJTUDogMDAyYjowMDAwN2ZmZDYz
OGExMjk4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAwMDAKWyAg
MTE4LjgyMjM4NV0gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdmMjNiNjQ0MDk4
MCBSQ1g6IDAwMDA3ZjIzYjVlYTQ5ZWUKWyAgMTE4LjgyMjM4Nl0gUkRYOiAwMDAwMDAwMDAw
MDAxMDA4IFJTSTogMDAwMDU1OTNiZjFlZjI2MCBSREk6IDAwMDAwMDAwMDAwMDAwMzAKWyAg
MTE4LjgyMjM4N10gUkJQOiAwMDAwMDAwMDAwMDAwMDMwIFIwODogMDAwMDAwMDAwMDAwMDAw
MCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKWyAgMTE4LjgyMjM4OF0gUjEwOiAwMDAwMDAwMDAw
MDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDI0NiBSMTI6IDAwMDAwMDAwMDAwMDEwMDcKWyAg
MTE4LjgyMjM5MF0gUjEzOiAwMDAwMDAwMDAwMDAxMDA4IFIxNDogZmZmZmZmZmZmZmZmZmZm
ZiBSMTU6IDAwMDAwMDAwMDAwMDAwMDIKWyAgMTE4LjgyMjM5Ml0gIDwvVEFTSz4KWyAgMTE4
LjgyMjQzMF0gdGFzazoodWRldi13b3JrZXIpICAgc3RhdGU6RCBzdGFjazowICAgICBwaWQ6
MjQ1MyAgdGdpZDoyNDUzICBwcGlkOjUyMCAgICB0YXNrX2ZsYWdzOjB4NDAwMTQwIGZsYWdz
OjB4MDAwMDQwMDYKWyAgMTE4LjgyMjQzM10gQ2FsbCBUcmFjZToKWyAgMTE4LjgyMjQzNF0g
IDxUQVNLPgpbICAxMTguODIyNDM1XSAgX19zY2hlZHVsZSsweDUzNy8weGJiMApbICAxMTgu
ODIyNDM4XSAgc2NoZWR1bGUrMHgyNy8weGQwClsgIDExOC44MjI0NDBdICBhc3luY19zeW5j
aHJvbml6ZV9jb29raWVfZG9tYWluKzB4MTE2LzB4MTYwClsgIDExOC44MjI0NDRdICA/IHBy
ZXBhcmVfdG9fc3dhaXRfZXhjbHVzaXZlKzB4YjAvMHhiMApbICAxMTguODIyNDUwXSAgZG9f
aW5pdF9tb2R1bGUrMHgxZmQvMHgyNzAKWyAgMTE4LjgyMjQ1M10gIGluaXRfbW9kdWxlX2Zy
b21fZmlsZSsweDg1LzB4YzAKWyAgMTE4LjgyMjQ1NV0gIF9feDY0X3N5c19maW5pdF9tb2R1
bGUrMHgxNjgvMHgzYzAKWyAgMTE4LjgyMjQ1OF0gIGRvX3N5c2NhbGxfNjQrMHg4Mi8weDli
MApbICAxMTguODIyNDYxXSAgPyBfX2NvdW50X21lbWNnX2V2ZW50cysweDk5LzB4MTMwClsg
IDExOC44MjI0NjNdICA/IGNvdW50X21lbWNnX2V2ZW50cy5jb25zdHByb3AuMCsweDFhLzB4
MzAKWyAgMTE4LjgyMjQ2N10gID8gaGFuZGxlX21tX2ZhdWx0KzB4MWNlLzB4MmQwClsgIDEx
OC44MjI0NjldICA/IGRvX3VzZXJfYWRkcl9mYXVsdCsweDIwZC8weDY4MApbICAxMTguODIy
NDczXSAgPyBhcmNoX2V4aXRfdG9fdXNlcl9tb2RlX3ByZXBhcmUuaXNyYS4wKzB4MTYvMHg5
MApbICAxMTguODIyNDc2XSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NGIv
MHg1MwpbICAxMTguODIyNDc3XSBSSVA6IDAwMzM6MHg3ZjhlZTU5MTg3NzkKWyAgMTE4Ljgy
MjQ4Ml0gUlNQOiAwMDJiOjAwMDA3ZmZkNmFjYTQ4MjggRUZMQUdTOiAwMDAwMDI0NiBPUklH
X1JBWDogMDAwMDAwMDAwMDAwMDEzOQpbICAxMTguODIyNDg0XSBSQVg6IGZmZmZmZmZmZmZm
ZmZmZGEgUkJYOiAwMDAwNTVkMDFkYTBhNDMwIFJDWDogMDAwMDdmOGVlNTkxODc3OQpbICAx
MTguODIyNDg1XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwN2Y4ZWU1ZWZlNDRk
IFJESTogMDAwMDAwMDAwMDAwMDAxMQpbICAxMTguODIyNDg2XSBSQlA6IDAwMDAwMDAwMDAw
MDAwMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDU1ZDAxZDk3MWYwMApbICAx
MTguODIyNDg3XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2
IFIxMjogMDAwMDdmOGVlNWVmZTQ0ZApbICAxMTguODIyNDg4XSBSMTM6IDAwMDAwMDAwMDAw
MjAwMDAgUjE0OiAwMDAwNTVkMDFkYTk1YWIwIFIxNTogMDAwMDAwMDAwMDAwMDAwMApbICAx
MTguODIyNDkwXSAgPC9UQVNLPgpbICAxMTguODIyNTY0XSBPT00ga2lsbGVyIGVuYWJsZWQu
ClsgIDExOC44MjI1NjVdIFJlc3RhcnRpbmcgdGFza3MgLi4uIGRvbmUuClsgIDExOC44MjM0
MjhdIHJhbmRvbTogY3JuZyByZXNlZWRlZCBvbiBzeXN0ZW0gcmVzdW1wdGlvbgpbICAxMTgu
ODU2MzA4XSBQTTogc3VzcGVuZCBleGl0ClsgIDExOC44NTYzNzFdIFBNOiBzdXNwZW5kIGVu
dHJ5IChzMmlkbGUpClsgIDExOC44NjE3OTddIEZpbGVzeXN0ZW1zIHN5bmM6IDAuMDA1IHNl
Y29uZHMKWyAgMTE4Ljg2NDcyMF0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMKWyAg
MTMzLjQ3MjAzOV0gdXNiIDMtMTogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMgpb
ICAxMzMuNDcyMDQ0XSB1c2IgMy0xLjE6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVy
IDMKWyAgMTMzLjQ3MzA1N10gdXNiIDMtMS4zOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51
bWJlciA0ClsgIDEzMy40NzMwNjBdIHVzYiAzLTEuMy4zOiBVU0IgZGlzY29ubmVjdCwgZGV2
aWNlIG51bWJlciA2ClsgIDEzMy40NzQ0NjVdIHVzYiAzLTEuMy40OiBVU0IgZGlzY29ubmVj
dCwgZGV2aWNlIG51bWJlciA3ClsgIDEzMy40NzYxODldIHVzYiAzLTEuNTogVVNCIGRpc2Nv
bm5lY3QsIGRldmljZSBudW1iZXIgOApbICAxMzMuNTI4MTQzXSB4aGNpX2hjZCAwMDAwOjM5
OjAwLjA6IHhIQ0kgaG9zdCBjb250cm9sbGVyIG5vdCByZXNwb25kaW5nLCBhc3N1bWUgZGVh
ZApbICAxMzMuNTI4MTU5XSB4aGNpX2hjZCAwMDAwOjM5OjAwLjA6IEhDIGRpZWQ7IGNsZWFu
aW5nIHVwClsgIDEzMy41Nzc5MDNdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogcmVtb3ZlLCBz
dGF0ZSAxClsgIDEzMy41Nzc5MDddIHVzYiB1c2I0OiBVU0IgZGlzY29ubmVjdCwgZGV2aWNl
IG51bWJlciAxClsgIDEzMy42NTQxNzFdIHVzYiA0LTE6IFVTQiBkaXNjb25uZWN0LCBkZXZp
Y2UgbnVtYmVyIDIKWyAgMTMzLjY1NDE3NV0gdXNiIDQtMS4xOiBVU0IgZGlzY29ubmVjdCwg
ZGV2aWNlIG51bWJlciAzClsgIDEzMy42NTQxNzddIHVzYiA0LTEuMS4zOiBVU0IgZGlzY29u
bmVjdCwgZGV2aWNlIG51bWJlciA2ClsgIDEzMy42NTYxNzldIHVzYiA0LTEuMzogVVNCIGRp
c2Nvbm5lY3QsIGRldmljZSBudW1iZXIgNApbICAxMzMuNjU3MjYxXSB1c2IgNC0xLjQ6IFVT
QiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDUKWyAgMTMzLjY2MjIyMV0gc2QgMDowOjA6
MTogW3NkYl0gUmVhZCBDYXBhY2l0eSgxMCkgZmFpbGVkOiBSZXN1bHQ6IGhvc3RieXRlPTB4
MDEgZHJpdmVyYnl0ZT1EUklWRVJfT0sKWyAgMTMzLjY2MjIyM10gc2QgMDowOjA6MTogW3Nk
Yl0gU2Vuc2Ugbm90IGF2YWlsYWJsZS4KWyAgMTMzLjY2MjI0OV0gc2QgMDowOjA6MTogW3Nk
Yl0gMCA1MTItYnl0ZSBsb2dpY2FsIGJsb2NrczogKDAgQi8wIEIpClsgIDEzMy42NjIyNTBd
IHNkIDA6MDowOjE6IFtzZGJdIDAtYnl0ZSBwaHlzaWNhbCBibG9ja3MKWyAgMTMzLjY2MjI1
NF0gc2QgMDowOjA6MTogW3NkYl0gVGVzdCBXUCBmYWlsZWQsIGFzc3VtZSBXcml0ZSBFbmFi
bGVkClsgIDEzMy42NjIyNTddIHNkIDA6MDowOjE6IFtzZGJdIEFza2luZyBmb3IgY2FjaGUg
ZGF0YSBmYWlsZWQKWyAgMTMzLjY2MjI2MF0gc2QgMDowOjA6MTogW3NkYl0gQXNzdW1pbmcg
ZHJpdmUgY2FjaGU6IHdyaXRlIHRocm91Z2gKWyAgMTMzLjY2MjQ0MF0gc2QgMDowOjA6MTog
W3NkYl0gQXR0YWNoZWQgU0NTSSByZW1vdmFibGUgZGlzawpbICAxMzMuNjcwMzMzXSBGcmVl
emluZyB1c2VyIHNwYWNlIHByb2Nlc3NlcyBjb21wbGV0ZWQgKGVsYXBzZWQgMTQuODA1IHNl
Y29uZHMpClsgIDEzMy42NzAzMzZdIE9PTSBraWxsZXIgZGlzYWJsZWQuClsgIDEzMy42NzAz
MzddIEZyZWV6aW5nIHJlbWFpbmluZyBmcmVlemFibGUgdGFza3MKWyAgMTMzLjc1NDc1N10g
eGhjaV9oY2QgMDAwMDozOTowMC4wOiBVU0IgYnVzIDQgZGVyZWdpc3RlcmVkClsgIDEzMy43
NTQ3NjZdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogcmVtb3ZlLCBzdGF0ZSAxClsgIDEzMy43
NTQ3NjhdIHVzYiB1c2IzOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAxClsgIDEz
My43NTQ4OTFdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogSG9zdCBoYWx0IGZhaWxlZCwgLTE5
ClsgIDEzMy43NTQ4OTRdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogSG9zdCBub3QgYWNjZXNz
aWJsZSwgcmVzZXQgZmFpbGVkLgpbICAxMzMuNzU1MDMxXSB4aGNpX2hjZCAwMDAwOjM5OjAw
LjA6IFVTQiBidXMgMyBkZXJlZ2lzdGVyZWQKWyAgMTMzLjc2MjI4NF0gRnJlZXppbmcgcmVt
YWluaW5nIGZyZWV6YWJsZSB0YXNrcyBjb21wbGV0ZWQgKGVsYXBzZWQgMC4wOTEgc2Vjb25k
cykKWyAgMTMzLjc2NjQ1OF0gcGNpX2J1cyAwMDAwOjAyOiBBbGxvY2F0aW5nIHJlc291cmNl
cwpbICAxMzMuNzY2NDcwXSBwY2llcG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cg
W2lvICAweDEwMDAtMHgwZmZmXSB0byBbYnVzIDA0LTM4XSBhZGRfc2l6ZSAxMDAwClsgIDEz
My43NjY0NzRdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIDB4
MTAwMC0weDBmZmZdIHRvIFtidXMgMzldIGFkZF9zaXplIDEwMDAKWyAgMTMzLjc2NjQ3Nl0g
cGNpZXBvcnQgMDAwMDowMTowMC4wOiBBc3NpZ25lZCBicmlkZ2Ugd2luZG93IFttZW0gMHhh
MDAwMDAwMC0weGMxZmZmZmZmIDY0Yml0IHByZWZdIHRvIFtidXMgMDItMzldIGNhbm5vdCBm
aXQgMHgyMDAwMDAgcmVxdWlyZWQgZm9yIDAwMDA6MDI6MDIuMCBicmlkZ2luZyB0byBbYnVz
IDM5XQpbICAxMzMuNzY2NDc4XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5k
b3cgW21lbSAweDAwMDAwMDAwIDY0Yml0IHByZWZdIHRvIFtidXMgMzldIHJlcXVpcmVzIHJl
bGF4ZWQgYWxpZ25tZW50IHJ1bGVzClsgIDEzMy43NjY0ODBdIHBjaWVwb3J0IDAwMDA6MDI6
MDIuMDogYnJpZGdlIHdpbmRvdyBbbWVtIDB4MDAxMDAwMDAtMHgwMDBmZmZmZiA2NGJpdCBw
cmVmXSB0byBbYnVzIDM5XSBhZGRfc2l6ZSAyMDAwMDAgYWRkX2FsaWduIDEwMDAwMApbICAx
MzMuNzY2NDgyXSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAw
eDEwMDAtMHgwZmZmXSB0byBbYnVzIDAyLTM5XSBhZGRfc2l6ZSAyMDAwClsgIDEzMy43NjY0
ODZdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgy
MDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAxMzMuNzY2NDg3XSBwY2llcG9ydCAw
MDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MjAwMF06IGZhaWxlZCB0
byBhc3NpZ24KWyAgMTMzLjc2NjQ4OV0gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBicmlkZ2Ug
d2luZG93IFtpbyAgc2l6ZSAweDIwMDBdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgIDEz
My43NjY0OTBdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNp
emUgMHgyMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAxMzMuNzY2NDkzXSBwY2llcG9ydCAw
MDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAwMDAgNjRiaXQg
cHJlZl06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgMTMzLjc2NjQ5NV0gcGNpZXBvcnQg
MDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0
IHByZWZdOiBmYWlsZWQgdG8gYXNzaWduClsgIDEzMy43NjY0OTZdIHBjaWVwb3J0IDAwMDA6
MDI6MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWdu
OyBubyBzcGFjZQpbICAxMzMuNzY2NDk3XSBwY2llcG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRn
ZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgMTMzLjc2
NjQ5OF0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAw
eDEwMDBdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgIDEzMy43NjY0OTldIHBjaWVwb3J0
IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogZmFpbGVk
IHRvIGFzc2lnbgpbICAxMzMuNzY2NTAxXSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRn
ZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAwMDAgNjRiaXQgcHJlZl06IGNhbid0IGFzc2ln
bjsgbm8gc3BhY2UKWyAgMTMzLjc2NjUwMl0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlk
Z2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHByZWZdOiBmYWlsZWQgdG8g
YXNzaWduClsgIDEzMy43NjY1MDNdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdp
bmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAxMzMu
NzY2NTA0XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXpl
IDB4MTAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgMTMzLjc2NjUwNV0gcGNpZXBvcnQgMDAw
MDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBjYW4ndCBhc3Np
Z247IG5vIHNwYWNlClsgIDEzMy43NjY1MDZdIHBjaWVwb3J0IDAwMDA6MDI6MDEuMDogYnJp
ZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAxMzMu
NzY2NTE1XSBwcmludGs6IFN1c3BlbmRpbmcgY29uc29sZShzKSAodXNlIG5vX2NvbnNvbGVf
c3VzcGVuZCB0byBkZWJ1ZykKWyAgMTMzLjk0NDk4N10gQUNQSTogRUM6IGludGVycnVwdCBi
bG9ja2VkClsgIDEzMy45NDc3NDFdIGludGVsX3BjaF90aGVybWFsIDAwMDA6MDA6MTQuMjog
Q1BVLVBDSCBpcyBjb29sIFs0N0NdClsgIDEzNS42NjIzNTVdIHR5cGVjIHBvcnQwLXBhcnRu
ZXI6IFBNOiBwYXJlbnQgcG9ydDAgc2hvdWxkIG5vdCBiZSBzbGVlcGluZwpbICAxMzguNTMx
MTM5XSBBQ1BJOiBFQzogaW50ZXJydXB0IHVuYmxvY2tlZApbICAxMzguNzU3NzA3XSB1c2Ig
MS0zOiByZXNldCBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDIgdXNpbmcgeGhjaV9o
Y2QKWyAgMTM4LjkwNDg4MF0gT09NIGtpbGxlciBlbmFibGVkLgpbICAxMzguOTA0ODgxXSBS
ZXN0YXJ0aW5nIHRhc2tzIC4uLiBkb25lLgpbICAxMzguOTA1NjYyXSByYW5kb206IGNybmcg
cmVzZWVkZWQgb24gc3lzdGVtIHJlc3VtcHRpb24KWyAgMTM4LjkwODkyM10gbWVpX2hkY3Ag
MDAwMDowMDoxNi4wLWI2MzhhYjdlLTk0ZTItNGVhMi1hNTUyLWQxYzU0YjYyN2YwNDogYm91
bmQgMDAwMDowMDowMi4wIChvcHMgaTkxNV9oZGNwX29wcyBbaTkxNV0pClsgIDEzOC45MTM0
ODVdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGRldmljZSBkcml2ZXIgcjgxNTItY2Znc2Vs
ZWN0b3IKWyAgMTM4LjkxMzUwNF0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNl
IGRyaXZlciByODE1MgpbICAxMzguOTE1MjE1XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBp
bnRlcmZhY2UgZHJpdmVyIGNkY19ldGhlcgpbICAxMzguOTI5OTA3XSBwY2kgMDAwMDozOTow
MC4wOiBbODA4NjoxNWI1XSB0eXBlIDAwIGNsYXNzIDB4MGMwMzMwIFBDSWUgRW5kcG9pbnQK
WyAgMTM4LjkyOTk4N10gcGNpIDAwMDA6Mzk6MDAuMDogQkFSIDAgW21lbSAweGQ5ZjAwMDAw
LTB4ZDlmMGZmZmZdClsgIDEzOC45MzAwMTZdIHBjaSAwMDAwOjM5OjAwLjA6IGVuYWJsaW5n
IEV4dGVuZGVkIFRhZ3MKWyAgMTM4LjkzMDI0NF0gcGNpIDAwMDA6Mzk6MDAuMDogc3VwcG9y
dHMgRDEgRDIKWyAgMTM4LjkzMDI0N10gcGNpIDAwMDA6Mzk6MDAuMDogUE1FIyBzdXBwb3J0
ZWQgZnJvbSBEMCBEMSBEMiBEM2hvdCBEM2NvbGQKWyAgMTM4LjkzMTAzNV0gdXNiY29yZTog
cmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciByODE1M19lY20KWyAgMTM4Ljk2Mzkz
NF0gQmx1ZXRvb3RoOiBoY2kwOiBIQ0kgRW5oYW5jZWQgU2V0dXAgU3luY2hyb25vdXMgQ29u
bmVjdGlvbiBjb21tYW5kIGlzIGFkdmVydGlzZWQsIGJ1dCBub3Qgc3VwcG9ydGVkLgpbICAx
MzguOTY0MjIzXSBQTTogc3VzcGVuZCBleGl0ClsgIDEzOC45NjY1NDldIHBjaWVwb3J0IDAw
MDA6MDI6MDIuMDogQVNQTTogY3VycmVudCBjb21tb24gY2xvY2sgY29uZmlndXJhdGlvbiBp
cyBpbmNvbnNpc3RlbnQsIHJlY29uZmlndXJpbmcKWyAgMTM4Ljk3MjEzMV0gcGNpX2J1cyAw
MDAwOjAyOiBBbGxvY2F0aW5nIHJlc291cmNlcwpbICAxMzguOTcyMTUzXSBwY2llcG9ydCAw
MDAwOjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZmXSB0byBbYnVz
IDA0LTM4XSBhZGRfc2l6ZSAxMDAwClsgIDEzOC45NzIxNTldIHBjaWVwb3J0IDAwMDA6MDI6
MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIDB4MTAwMC0weDBmZmZdIHRvIFtidXMgMzldIGFk
ZF9zaXplIDEwMDAKWyAgMTM4Ljk3MjE2Ml0gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBBc3Np
Z25lZCBicmlkZ2Ugd2luZG93IFttZW0gMHhhMDAwMDAwMC0weGMxZmZmZmZmIDY0Yml0IHBy
ZWZdIHRvIFtidXMgMDItMzldIGNhbm5vdCBmaXQgMHgyMDAwMDAgcmVxdWlyZWQgZm9yIDAw
MDA6MDI6MDIuMCBicmlkZ2luZyB0byBbYnVzIDM5XQpbICAxMzguOTcyMTY2XSBwY2llcG9y
dCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMDAwMDAwIDY0Yml0IHBy
ZWZdIHRvIFtidXMgMzldIHJlcXVpcmVzIHJlbGF4ZWQgYWxpZ25tZW50IHJ1bGVzClsgIDEz
OC45NzIxNjldIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbbWVtIDB4
MDAxMDAwMDAtMHgwMDBmZmZmZiA2NGJpdCBwcmVmXSB0byBbYnVzIDM5XSBhZGRfc2l6ZSAy
MDAwMDAgYWRkX2FsaWduIDEwMDAwMApbICAxMzguOTcyMTcyXSBwY2llcG9ydCAwMDAwOjAx
OjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZmXSB0byBbYnVzIDAyLTM5
XSBhZGRfc2l6ZSAyMDAwClsgIDEzOC45NzIxNzddIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDog
YnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgyMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFj
ZQpbICAxMzguOTcyMTc5XSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cg
W2lvICBzaXplIDB4MjAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgMTM4Ljk3MjE4Ml0gcGNp
ZXBvcnQgMDAwMDowMTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDIwMDBdOiBj
YW4ndCBhc3NpZ247IG5vIHNwYWNlClsgIDEzOC45NzIxODRdIHBjaWVwb3J0IDAwMDA6MDE6
MDAuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgyMDAwXTogZmFpbGVkIHRvIGFzc2ln
bgpbICAxMzguOTcyMTg5XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cg
W21lbSBzaXplIDB4MDAyMDAwMDAgNjRiaXQgcHJlZl06IGNhbid0IGFzc2lnbjsgbm8gc3Bh
Y2UKWyAgMTM4Ljk3MjE5MV0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93
IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHByZWZdOiBmYWlsZWQgdG8gYXNzaWduClsg
IDEzOC45NzIxOTRdIHBjaWVwb3J0IDAwMDA6MDI6MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8g
IHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAxMzguOTcyMTk1XSBw
Y2llcG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06
IGZhaWxlZCB0byBhc3NpZ24KWyAgMTM4Ljk3MjE5N10gcGNpZXBvcnQgMDAwMDowMjowMi4w
OiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBjYW4ndCBhc3NpZ247IG5vIHNw
YWNlClsgIDEzOC45NzIxOTldIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRv
dyBbaW8gIHNpemUgMHgxMDAwXTogZmFpbGVkIHRvIGFzc2lnbgpbICAxMzguOTcyMjAyXSBw
Y2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSBzaXplIDB4MDAyMDAw
MDAgNjRiaXQgcHJlZl06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgMTM4Ljk3MjIwNF0g
cGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAw
MDAwIDY0Yml0IHByZWZdOiBmYWlsZWQgdG8gYXNzaWduClsgIDEzOC45NzIyMDZdIHBjaWVw
b3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2Fu
J3QgYXNzaWduOyBubyBzcGFjZQpbICAxMzguOTcyMjA4XSBwY2llcG9ydCAwMDAwOjAyOjAy
LjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBhc3NpZ24K
WyAgMTM4Ljk3MjIxMF0gcGNpZXBvcnQgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtp
byAgc2l6ZSAweDEwMDBdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgIDEzOC45NzIyMTJd
IHBjaWVwb3J0IDAwMDA6MDI6MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAw
XTogZmFpbGVkIHRvIGFzc2lnbgpbICAxMzguOTgxMjA0XSB4aGNpX2hjZCAwMDAwOjM5OjAw
LjA6IHhIQ0kgSG9zdCBDb250cm9sbGVyClsgIDEzOC45ODE4MDBdIHhoY2lfaGNkIDAwMDA6
Mzk6MDAuMDogbmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAz
ClsgIDEzOC45ODI5MzhdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogaGNjIHBhcmFtcyAweDIw
MDA3N2MxIGhjaSB2ZXJzaW9uIDB4MTEwIHF1aXJrcyAweDAwMDAwMDAyMDAwMDk4MTAKWyAg
MTM5LjAwMDczMl0geGhjaV9oY2QgMDAwMDozOTowMC4wOiB4SENJIEhvc3QgQ29udHJvbGxl
cgpbICAxMzkuMDAwNzQwXSB4aGNpX2hjZCAwMDAwOjM5OjAwLjA6IG5ldyBVU0IgYnVzIHJl
Z2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iZXIgNApbICAxMzkuMDAwNzQ0XSB4aGNpX2hj
ZCAwMDAwOjM5OjAwLjA6IEhvc3Qgc3VwcG9ydHMgVVNCIDMuMSBFbmhhbmNlZCBTdXBlclNw
ZWVkClsgIDEzOS4wMDA3ODRdIHVzYiB1c2IzOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRW
ZW5kb3I9MWQ2YiwgaWRQcm9kdWN0PTAwMDIsIGJjZERldmljZT0gNi4xNApbICAxMzkuMDAw
Nzg2XSB1c2IgdXNiMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTMsIFByb2R1Y3Q9
MiwgU2VyaWFsTnVtYmVyPTEKWyAgMTM5LjAwMDc4OF0gdXNiIHVzYjM6IFByb2R1Y3Q6IHhI
Q0kgSG9zdCBDb250cm9sbGVyClsgIDEzOS4wMDA3OTBdIHVzYiB1c2IzOiBNYW51ZmFjdHVy
ZXI6IExpbnV4IDYuMTQuMC0xMjk2Ni1nYTJjYzZmZjVlYzhmIHhoY2ktaGNkClsgIDEzOS4w
MDA3OTFdIHVzYiB1c2IzOiBTZXJpYWxOdW1iZXI6IDAwMDA6Mzk6MDAuMApbICAxMzkuMDAx
Nzk5XSBodWIgMy0wOjEuMDogVVNCIGh1YiBmb3VuZApbICAxMzkuMDAxODE3XSBodWIgMy0w
OjEuMDogMiBwb3J0cyBkZXRlY3RlZApbICAxMzkuMDAyNDM3XSB1c2IgdXNiNDogTmV3IFVT
QiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTFkNmIsIGlkUHJvZHVjdD0wMDAzLCBiY2REZXZp
Y2U9IDYuMTQKWyAgMTM5LjAwMjQ0MV0gdXNiIHVzYjQ6IE5ldyBVU0IgZGV2aWNlIHN0cmlu
Z3M6IE1mcj0zLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0xClsgIDEzOS4wMDI0NDNdIHVz
YiB1c2I0OiBQcm9kdWN0OiB4SENJIEhvc3QgQ29udHJvbGxlcgpbICAxMzkuMDAyNDQ1XSB1
c2IgdXNiNDogTWFudWZhY3R1cmVyOiBMaW51eCA2LjE0LjAtMTI5NjYtZ2EyY2M2ZmY1ZWM4
ZiB4aGNpLWhjZApbICAxMzkuMDAyNDQ3XSB1c2IgdXNiNDogU2VyaWFsTnVtYmVyOiAwMDAw
OjM5OjAwLjAKWyAgMTM5LjAwMjU4M10gaHViIDQtMDoxLjA6IFVTQiBodWIgZm91bmQKWyAg
MTM5LjAwMjU5NF0gaHViIDQtMDoxLjA6IDIgcG9ydHMgZGV0ZWN0ZWQKWyAgMTM5LjI1NzY4
OF0gdXNiIDMtMTogbmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4
aGNpX2hjZApbICAxMzkuMzk2MzAwXSB1c2IgMy0xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwg
aWRWZW5kb3I9MjEwOSwgaWRQcm9kdWN0PTI4MTcsIGJjZERldmljZT0gNS5lMwpbICAxMzku
Mzk2MzA2XSB1c2IgMy0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVj
dD0yLCBTZXJpYWxOdW1iZXI9MwpbICAxMzkuMzk2MzA4XSB1c2IgMy0xOiBQcm9kdWN0OiBV
U0IyLjAgSHViICAgICAgICAgICAgIApbICAxMzkuMzk2MzA5XSB1c2IgMy0xOiBNYW51ZmFj
dHVyZXI6IFZJQSBMYWJzLCBJbmMuICAgICAgICAgClsgIDEzOS4zOTYzMTBdIHVzYiAzLTE6
IFNlcmlhbE51bWJlcjogMDAwMDAwMDAwClsgIDEzOS4zOTc5MTldIGh1YiAzLTE6MS4wOiBV
U0IgaHViIGZvdW5kClsgIDEzOS4zOTc5ODVdIGh1YiAzLTE6MS4wOiA1IHBvcnRzIGRldGVj
dGVkClsgIDEzOS41MjA1NDRdIHVzYiA0LTE6IG5ldyBTdXBlclNwZWVkIFVTQiBkZXZpY2Ug
bnVtYmVyIDIgdXNpbmcgeGhjaV9oY2QKWyAgMTM5LjU2MjU0Ml0gdXNiIDQtMTogTmV3IFVT
QiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTIxMDksIGlkUHJvZHVjdD0wODE3LCBiY2REZXZp
Y2U9IDUuZTMKWyAgMTM5LjU2MjU0Nl0gdXNiIDQtMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMKWyAgMTM5LjU2MjU0OF0gdXNi
IDQtMTogUHJvZHVjdDogVVNCMy4wIEh1YiAgICAgICAgICAgICAKWyAgMTM5LjU2MjU0OV0g
dXNiIDQtMTogTWFudWZhY3R1cmVyOiBWSUEgTGFicywgSW5jLiAgICAgICAgIApbICAxMzku
NTYyNTUwXSB1c2IgNC0xOiBTZXJpYWxOdW1iZXI6IDAwMDAwMDAwMApbICAxMzkuNTY0MTM2
XSBodWIgNC0xOjEuMDogVVNCIGh1YiBmb3VuZApbICAxMzkuNTY0MjM2XSBodWIgNC0xOjEu
MDogNCBwb3J0cyBkZXRlY3RlZApbICAxNDAuMTA5Njg2XSB1c2IgMy0xLjE6IG5ldyBoaWdo
LXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDMgdXNpbmcgeGhjaV9oY2QKWyAgMTQwLjI0ODE1
NF0gdXNiIDMtMS4xOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MjEwOSwgaWRQ
cm9kdWN0PTI4MTcsIGJjZERldmljZT0gNy5iNApbICAxNDAuMjQ4MTU4XSB1c2IgMy0xLjE6
IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJl
cj0zClsgIDE0MC4yNDgxNjBdIHVzYiAzLTEuMTogUHJvZHVjdDogVVNCMi4wIEh1YiAgICAg
ICAgICAgICAKWyAgMTQwLjI0ODE2MV0gdXNiIDMtMS4xOiBNYW51ZmFjdHVyZXI6IFZJQSBM
YWJzLCBJbmMuICAgICAgICAgClsgIDE0MC4yNDgxNjJdIHVzYiAzLTEuMTogU2VyaWFsTnVt
YmVyOiAwMDAwMDAwMDAKWyAgMTQwLjI0OTE3OF0gaHViIDMtMS4xOjEuMDogVVNCIGh1YiBm
b3VuZApbICAxNDAuMjQ5MzQzXSBodWIgMy0xLjE6MS4wOiA0IHBvcnRzIGRldGVjdGVkClsg
IDE0MC4zNDIxNzRdIHVzYiA0LTEuMTogbmV3IFN1cGVyU3BlZWQgVVNCIGRldmljZSBudW1i
ZXIgMyB1c2luZyB4aGNpX2hjZApbICAxNDAuNDAxNDA0XSB1c2IgNC0xLjE6IE5ldyBVU0Ig
ZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0yMTA5LCBpZFByb2R1Y3Q9MDgxNywgYmNkRGV2aWNl
PSA3LmI0ClsgIDE0MC40MDE0MDldIHVzYiA0LTEuMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5n
czogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTMKWyAgMTQwLjQwMTQxMV0gdXNi
IDQtMS4xOiBQcm9kdWN0OiBVU0IzLjAgSHViICAgICAgICAgICAgIApbICAxNDAuNDAxNDEy
XSB1c2IgNC0xLjE6IE1hbnVmYWN0dXJlcjogVklBIExhYnMsIEluYy4gICAgICAgICAKWyAg
MTQwLjQwMTQxM10gdXNiIDQtMS4xOiBTZXJpYWxOdW1iZXI6IDAwMDAwMDAwMApbICAxNDAu
NDUxNDAyXSBodWIgNC0xLjE6MS4wOiBVU0IgaHViIGZvdW5kClsgIDE0MC40NTE1MDBdIGh1
YiA0LTEuMToxLjA6IDQgcG9ydHMgZGV0ZWN0ZWQKWyAgMTQwLjUyNTcyMV0gdXNiIDMtMS4z
OiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA0IHVzaW5nIHhoY2lfaGNkClsg
IDE0MC42ODIyNTBdIHVzYiAzLTEuMzogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9y
PTBiZGEsIGlkUHJvZHVjdD01NDA5LCBiY2REZXZpY2U9IDEuNDEKWyAgMTQwLjY4MjI1Nl0g
dXNiIDMtMS4zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBT
ZXJpYWxOdW1iZXI9MApbICAxNDAuNjgyMjU4XSB1c2IgMy0xLjM6IFByb2R1Y3Q6IDQtUG9y
dCBVU0IgMi4wIEh1YgpbICAxNDAuNjgyMjU5XSB1c2IgMy0xLjM6IE1hbnVmYWN0dXJlcjog
R2VuZXJpYwpbICAxNDAuNjg0MDY1XSBodWIgMy0xLjM6MS4wOiBVU0IgaHViIGZvdW5kClsg
IDE0MC42ODUxNzJdIGh1YiAzLTEuMzoxLjA6IDQgcG9ydHMgZGV0ZWN0ZWQKWyAgMTQwLjc0
NjI5N10gdXNiIDQtMS4zOiBuZXcgU3VwZXJTcGVlZCBVU0IgZGV2aWNlIG51bWJlciA0IHVz
aW5nIHhoY2lfaGNkClsgIDE0MC43NzcyNjJdIHVzYiA0LTEuMzogTmV3IFVTQiBkZXZpY2Ug
Zm91bmQsIGlkVmVuZG9yPTBiZGEsIGlkUHJvZHVjdD0wNDA5LCBiY2REZXZpY2U9IDEuNDEK
WyAgMTQwLjc3NzI2Nl0gdXNiIDQtMS4zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9
MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MApbICAxNDAuNzc3MjY4XSB1c2IgNC0xLjM6
IFByb2R1Y3Q6IDQtUG9ydCBVU0IgMy4wIEh1YgpbICAxNDAuNzc3MjcwXSB1c2IgNC0xLjM6
IE1hbnVmYWN0dXJlcjogR2VuZXJpYwpbICAxNDAuNzg1MjY5XSBodWIgNC0xLjM6MS4wOiBV
U0IgaHViIGZvdW5kClsgIDE0MC43ODY2MThdIGh1YiA0LTEuMzoxLjA6IDIgcG9ydHMgZGV0
ZWN0ZWQKWyAgMTQwLjg2MTc5MV0gdXNiIDQtMS40OiBuZXcgU3VwZXJTcGVlZCBVU0IgZGV2
aWNlIG51bWJlciA1IHVzaW5nIHhoY2lfaGNkClsgIDE0MC44Nzk2NzNdIHVzYiA0LTEuNDog
TmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTA1OGYsIGlkUHJvZHVjdD04NDY4LCBi
Y2REZXZpY2U9IDEuMDAKWyAgMTQwLjg3OTY3OF0gdXNiIDQtMS40OiBOZXcgVVNCIGRldmlj
ZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MwpbICAxNDAuODc5
NjgxXSB1c2IgNC0xLjQ6IFByb2R1Y3Q6IE1hc3MgU3RvcmFnZSBEZXZpY2UKWyAgMTQwLjg3
OTY4Ml0gdXNiIDQtMS40OiBNYW51ZmFjdHVyZXI6IEdlbmVyaWMKWyAgMTQwLjg3OTY4NF0g
dXNiIDQtMS40OiBTZXJpYWxOdW1iZXI6IDA1OEY4NDY4ODQ2MQpbICAxNDAuODgxOTQ2XSB1
c2Itc3RvcmFnZSA0LTEuNDoxLjA6IFVTQiBNYXNzIFN0b3JhZ2UgZGV2aWNlIGRldGVjdGVk
ClsgIDE0MC44ODIxMDJdIHNjc2kgaG9zdDA6IHVzYi1zdG9yYWdlIDQtMS40OjEuMApbICAx
NDAuOTQ5NjkzXSB1c2IgMy0xLjEuMzogbmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1i
ZXIgNSB1c2luZyB4aGNpX2hjZApbICAxNDEuNjgxNzYwXSB1c2IgMy0xLjMuMzogbmV3IGxv
dy1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciA2IHVzaW5nIHhoY2lfaGNkClsgIDE0MS43OTIz
NDVdIHVzYiAzLTEuMy4zOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9NDEzYywg
aWRQcm9kdWN0PTIxMTMsIGJjZERldmljZT0gMS4wOApbICAxNDEuNzkyMzUyXSB1c2IgMy0x
LjMuMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTAsIFByb2R1Y3Q9MiwgU2VyaWFs
TnVtYmVyPTAKWyAgMTQxLjc5MjM1NF0gdXNiIDMtMS4zLjM6IFByb2R1Y3Q6IERlbGwgS0Iy
MTYgV2lyZWQgS2V5Ym9hcmQKWyAgMTQxLjgwMjIzOF0gaW5wdXQ6IERlbGwgS0IyMTYgV2ly
ZWQgS2V5Ym9hcmQgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjFjLjAvMDAwMDow
MTowMC4wLzAwMDA6MDI6MDIuMC8wMDAwOjM5OjAwLjAvdXNiMy8zLTEvMy0xLjMvMy0xLjMu
My8zLTEuMy4zOjEuMC8wMDAzOjQxM0M6MjExMy4wMDA2L2lucHV0L2lucHV0NDEKWyAgMTQx
Ljg1Nzc1M10gdXNiIDQtMS4xLjM6IG5ldyBTdXBlclNwZWVkIFVTQiBkZXZpY2UgbnVtYmVy
IDYgdXNpbmcgeGhjaV9oY2QKWyAgMTQxLjg3NDQyMV0gdXNiIDQtMS4xLjM6IE5ldyBVU0Ig
ZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wYmRhLCBpZFByb2R1Y3Q9ODE1MywgYmNkRGV2aWNl
PTMwLjAwClsgIDE0MS44NzQ0MjZdIHVzYiA0LTEuMS4zOiBOZXcgVVNCIGRldmljZSBzdHJp
bmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9NgpbICAxNDEuODc0NDI4XSB1
c2IgNC0xLjEuMzogUHJvZHVjdDogVVNCIDEwLzEwMC8xMDAwIExBTgpbICAxNDEuODc0NDM2
XSB1c2IgNC0xLjEuMzogTWFudWZhY3R1cmVyOiBSZWFsdGVrClsgIDE0MS44NzQ0MzhdIHVz
YiA0LTEuMS4zOiBTZXJpYWxOdW1iZXI6IDAwMDAwMQpbICAxNDEuODk3ODc0XSBoaWQtZ2Vu
ZXJpYyAwMDAzOjQxM0M6MjExMy4wMDA2OiBpbnB1dCxoaWRyYXcyOiBVU0IgSElEIHYxLjEx
IEtleWJvYXJkIFtEZWxsIEtCMjE2IFdpcmVkIEtleWJvYXJkXSBvbiB1c2ItMDAwMDozOTow
MC4wLTEuMy4zL2lucHV0MApbICAxNDEuOTAyMzkxXSBpbnB1dDogRGVsbCBLQjIxNiBXaXJl
ZCBLZXlib2FyZCBTeXN0ZW0gQ29udHJvbCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6
MDA6MWMuMC8wMDAwOjAxOjAwLjAvMDAwMDowMjowMi4wLzAwMDA6Mzk6MDAuMC91c2IzLzMt
MS8zLTEuMy8zLTEuMy4zLzMtMS4zLjM6MS4xLzAwMDM6NDEzQzoyMTEzLjAwMDcvaW5wdXQv
aW5wdXQ0MgpbICAxNDEuOTUwMTE3XSByODE1Mi1jZmdzZWxlY3RvciA0LTEuMS4zOiByZXNl
dCBTdXBlclNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDYgdXNpbmcgeGhjaV9oY2QKWyAgMTQx
Ljk1Nzg3Ml0gaW5wdXQ6IERlbGwgS0IyMTYgV2lyZWQgS2V5Ym9hcmQgQ29uc3VtZXIgQ29u
dHJvbCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWMuMC8wMDAwOjAxOjAwLjAv
MDAwMDowMjowMi4wLzAwMDA6Mzk6MDAuMC91c2IzLzMtMS8zLTEuMy8zLTEuMy4zLzMtMS4z
LjM6MS4xLzAwMDM6NDEzQzoyMTEzLjAwMDcvaW5wdXQvaW5wdXQ0MwpbICAxNDEuOTU3OTc4
XSBoaWQtZ2VuZXJpYyAwMDAzOjQxM0M6MjExMy4wMDA3OiBpbnB1dCxoaWRyYXczOiBVU0Ig
SElEIHYxLjExIERldmljZSBbRGVsbCBLQjIxNiBXaXJlZCBLZXlib2FyZF0gb24gdXNiLTAw
MDA6Mzk6MDAuMC0xLjMuMy9pbnB1dDEKWyAgMTQyLjAxNDU5M10gcjgxNTIgNC0xLjEuMzox
LjAgZXRoMDogdjEuMTIuMTMKWyAgMTQyLjQ4MjEyOV0gdXNiIDQtMS40OiByZXNldCBTdXBl
clNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDUgdXNpbmcgeGhjaV9oY2QKWyAgMTQyLjUxNDQ3
N10gc2NzaSAwOjA6MDowOiBEaXJlY3QtQWNjZXNzICAgICBHZW5lcmljLSBTRC9NTUMgICAg
ICAgICAgIDEuMDAgUFE6IDAgQU5TSTogNgpbICAxNDIuNTY5NzMxXSB1c2IgMy0xLjU6IG5l
dyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDcgdXNpbmcgeGhjaV9oY2QKWyAgMTQy
LjY1OTA3OV0gdXNiIDMtMS41OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MjEw
OSwgaWRQcm9kdWN0PTg4MTcsIGJjZERldmljZT0gMC4wMQpbICAxNDIuNjU5MDg2XSB1c2Ig
My0xLjU6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlh
bE51bWJlcj0zClsgIDE0Mi42NTkwODldIHVzYiAzLTEuNTogUHJvZHVjdDogVVNCIEJpbGxi
b2FyZCBEZXZpY2UgICAKWyAgMTQyLjY1OTA5MV0gdXNiIDMtMS41OiBNYW51ZmFjdHVyZXI6
IFZJQSBMYWJzLCBJbmMuICAgICAgICAgClsgIDE0Mi42NTkwOTNdIHVzYiAzLTEuNTogU2Vy
aWFsTnVtYmVyOiAwMDAwMDAwMDAwMDAwMDAxClsgIDE0Mi43Mjk3NDFdIHVzYiAzLTEuMy40
OiBuZXcgbG93LXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDggdXNpbmcgeGhjaV9oY2QKWyAg
MTQyLjgzODUyOF0gdXNiIDMtMS4zLjQ6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRv
cj0xYmNmLCBpZFByb2R1Y3Q9MDAwNSwgYmNkRGV2aWNlPSAwLjE0ClsgIDE0Mi44Mzg1MzZd
IHVzYiAzLTEuMy40OiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MCwgUHJvZHVjdD0y
LCBTZXJpYWxOdW1iZXI9MApbICAxNDIuODM4NTM5XSB1c2IgMy0xLjMuNDogUHJvZHVjdDog
VVNCIE9wdGljYWwgTW91c2UKWyAgMTQyLjg0Nzg3M10gaW5wdXQ6IFVTQiBPcHRpY2FsIE1v
dXNlIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxYy4wLzAwMDA6MDE6MDAuMC8w
MDAwOjAyOjAyLjAvMDAwMDozOTowMC4wL3VzYjMvMy0xLzMtMS4zLzMtMS4zLjQvMy0xLjMu
NDoxLjAvMDAwMzoxQkNGOjAwMDUuMDAwOC9pbnB1dC9pbnB1dDQ0ClsgIDE0Mi44NDgwNTVd
IGhpZC1nZW5lcmljIDAwMDM6MUJDRjowMDA1LjAwMDg6IGlucHV0LGhpZHJhdzQ6IFVTQiBI
SUQgdjEuMTAgTW91c2UgW1VTQiBPcHRpY2FsIE1vdXNlXSBvbiB1c2ItMDAwMDozOTowMC4w
LTEuMy40L2lucHV0MApbICAxNDIuOTAyMjkxXSByODE1MiA0LTEuMS4zOjEuMCBlbngwMGUw
NGNlYWJjNDE6IHJlbmFtZWQgZnJvbSBldGgwClsgIDE0My44NDIwMTddIHBjaV9idXMgMDAw
MDowMjogQWxsb2NhdGluZyByZXNvdXJjZXMKWyAgMTQzLjg0MjAzN10gcGNpZXBvcnQgMDAw
MDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtpbyAgMHgxMDAwLTB4MGZmZl0gdG8gW2J1cyAw
NC0zOF0gYWRkX3NpemUgMTAwMApbICAxNDMuODQyMDQwXSBwY2llcG9ydCAwMDAwOjAyOjAy
LjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAtMHgwZmZmXSB0byBbYnVzIDM5XSBhZGRf
c2l6ZSAxMDAwClsgIDE0My44NDIwNDJdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogQXNzaWdu
ZWQgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YTAwMDAwMDAtMHhjMWZmZmZmZiA2NGJpdCBwcmVm
XSB0byBbYnVzIDAyLTM5XSBjYW5ub3QgZml0IDB4MjAwMDAwIHJlcXVpcmVkIGZvciAwMDAw
OjAyOjAyLjAgYnJpZGdpbmcgdG8gW2J1cyAzOV0KWyAgMTQzLjg0MjA0NV0gcGNpZXBvcnQg
MDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gMHgwMDAwMDAwMCA2NGJpdCBwcmVm
XSB0byBbYnVzIDM5XSByZXF1aXJlcyByZWxheGVkIGFsaWdubWVudCBydWxlcwpbICAxNDMu
ODQyMDQ3XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW21lbSAweDAw
MTAwMDAwLTB4MDAwZmZmZmYgNjRiaXQgcHJlZl0gdG8gW2J1cyAzOV0gYWRkX3NpemUgMjAw
MDAwIGFkZF9hbGlnbiAxMDAwMDAKWyAgMTQzLjg0MjA0OV0gcGNpZXBvcnQgMDAwMDowMTow
MC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgMHgxMDAwLTB4MGZmZl0gdG8gW2J1cyAwMi0zOV0g
YWRkX3NpemUgMjAwMApbICAxNDMuODQyMDUyXSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJy
aWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MjAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UK
WyAgMTQzLjg0MjA1NF0gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBicmlkZ2Ugd2luZG93IFtp
byAgc2l6ZSAweDIwMDBdOiBmYWlsZWQgdG8gYXNzaWduClsgIDE0My44NDIwNTVdIHBjaWVw
b3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgyMDAwXTogY2Fu
J3QgYXNzaWduOyBubyBzcGFjZQpbICAxNDMuODQyMDU2XSBwY2llcG9ydCAwMDAwOjAxOjAw
LjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MjAwMF06IGZhaWxlZCB0byBhc3NpZ24K
WyAgMTQzLjg0MjA1OV0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFtt
ZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHByZWZdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNl
ClsgIDE0My44NDIwNjBdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBb
bWVtIHNpemUgMHgwMDIwMDAwMCA2NGJpdCBwcmVmXTogZmFpbGVkIHRvIGFzc2lnbgpbICAx
NDMuODQyMDYxXSBwY2llcG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBz
aXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgMTQzLjg0MjA2Ml0gcGNp
ZXBvcnQgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBm
YWlsZWQgdG8gYXNzaWduClsgIDE0My44NDIwNjNdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDog
YnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFj
ZQpbICAxNDMuODQyMDY0XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cg
W2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgMTQzLjg0MjA2Nl0gcGNp
ZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAw
IDY0Yml0IHByZWZdOiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgIDE0My44NDIwNjddIHBj
aWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbbWVtIHNpemUgMHgwMDIwMDAw
MCA2NGJpdCBwcmVmXTogZmFpbGVkIHRvIGFzc2lnbgpbICAxNDMuODQyMDY4XSBwY2llcG9y
dCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGNhbid0
IGFzc2lnbjsgbm8gc3BhY2UKWyAgMTQzLjg0MjA2OV0gcGNpZXBvcnQgMDAwMDowMjowMi4w
OiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBmYWlsZWQgdG8gYXNzaWduClsg
IDE0My44NDIwNzBdIHBjaWVwb3J0IDAwMDA6MDI6MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8g
IHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAxNDMuODQyMDcxXSBw
Y2llcG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06
IGZhaWxlZCB0byBhc3NpZ24KWyAgMTQ0LjEyNjgxMV0gd2xhbjA6IGF1dGhlbnRpY2F0ZSB3
aXRoIDg4OjcxOmIxOjgxOjkzOjFiIChsb2NhbCBhZGRyZXNzPTljOmI2OmQwOmQxOjZhOmIx
KQpbICAxNDQuMTI2ODE3XSB3bGFuMDogc2VuZCBhdXRoIHRvIDg4OjcxOmIxOjgxOjkzOjFi
ICh0cnkgMS8zKQpbICAxNDQuMTI4NDAxXSB3bGFuMDogYXV0aGVudGljYXRlZApbICAxNDQu
MTI5NzI3XSB3bGFuMDogYXNzb2NpYXRlIHdpdGggODg6NzE6YjE6ODE6OTM6MWIgKHRyeSAx
LzMpClsgIDE0NC4xNjE2NDRdIHdsYW4wOiBSWCBBc3NvY1Jlc3AgZnJvbSA4ODo3MTpiMTo4
MTo5MzoxYiAoY2FwYWI9MHgxMDExIHN0YXR1cz0wIGFpZD0xKQpbICAxNDQuMTY0NDAwXSB3
bGFuMDogYXNzb2NpYXRlZApbICAxNDQuMTc4ODA3XSB3bGFuMDogTGltaXRpbmcgVFggcG93
ZXIgdG8gMjMgKDIzIC0gMCkgZEJtIGFzIGFkdmVydGlzZWQgYnkgODg6NzE6YjE6ODE6OTM6
MWIKWyAgMTQ0LjgyNjA0MV0gcjgxNTIgNC0xLjEuMzoxLjAgZW54MDBlMDRjZWFiYzQxOiBj
YXJyaWVyIG9uClsgIDE3My4zNjIwMzhdIHVzYiA0LTEuNDogcmVzZXQgU3VwZXJTcGVlZCBV
U0IgZGV2aWNlIG51bWJlciA1IHVzaW5nIHhoY2lfaGNkClsgIDE3My4zODM4MTVdIHNkIDA6
MDowOjA6IFtzZGFdIE1lZGlhIHJlbW92ZWQsIHN0b3BwZWQgcG9sbGluZwpbICAxNzMuMzg0
MDMzXSBzZCAwOjA6MDowOiBbc2RhXSBBdHRhY2hlZCBTQ1NJIHJlbW92YWJsZSBkaXNrClsg
IDE3Ni42Mjg2MDhdIHdsYW4wOiBkZWF1dGhlbnRpY2F0aW5nIGZyb20gODg6NzE6YjE6ODE6
OTM6MWIgYnkgbG9jYWwgY2hvaWNlIChSZWFzb246IDM9REVBVVRIX0xFQVZJTkcpClsgIDIw
NC4wMDYwMTNdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogV0FSTiBTZXQgVFIgRGVxIFB0ciBj
bWQgZmFpbGVkIGR1ZSB0byBpbmNvcnJlY3Qgc2xvdCBvciBlcCBzdGF0ZS4KWyAgMjA0LjA4
MjM0M10gdXNiIDQtMS40OiByZXNldCBTdXBlclNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDUg
dXNpbmcgeGhjaV9oY2QKWyAgMjM0LjczODA1OV0geGhjaV9oY2QgMDAwMDozOTowMC4wOiBX
QVJOIFNldCBUUiBEZXEgUHRyIGNtZCBmYWlsZWQgZHVlIHRvIGluY29ycmVjdCBzbG90IG9y
IGVwIHN0YXRlLgpbICAyMzQuODEwMjgzXSB1c2IgNC0xLjQ6IHJlc2V0IFN1cGVyU3BlZWQg
VVNCIGRldmljZSBudW1iZXIgNSB1c2luZyB4aGNpX2hjZApbICAyNjUuNDUyMTE5XSB4aGNp
X2hjZCAwMDAwOjM5OjAwLjA6IFdBUk4gU2V0IFRSIERlcSBQdHIgY21kIGZhaWxlZCBkdWUg
dG8gaW5jb3JyZWN0IHNsb3Qgb3IgZXAgc3RhdGUuClsgIDI2NS41MjgzMDRdIHVzYiA0LTEu
NDogcmVzZXQgU3VwZXJTcGVlZCBVU0IgZGV2aWNlIG51bWJlciA1IHVzaW5nIHhoY2lfaGNk
ClsgIDI3NS42ODMzODBdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogV0FSTiBTZXQgVFIgRGVx
IFB0ciBjbWQgZmFpbGVkIGR1ZSB0byBpbmNvcnJlY3Qgc2xvdCBvciBlcCBzdGF0ZS4KWyAg
Mjc1Ljc1NTgxM10gdXNiIDQtMS40OiByZXNldCBTdXBlclNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDUgdXNpbmcgeGhjaV9oY2QKWyAgMjg1Ljk0MjgzNF0geGhjaV9oY2QgMDAwMDozOTow
MC4wOiBXQVJOIFNldCBUUiBEZXEgUHRyIGNtZCBmYWlsZWQgZHVlIHRvIGluY29ycmVjdCBz
bG90IG9yIGVwIHN0YXRlLgpbICAyODYuMDE1MTM0XSB1c2IgNC0xLjQ6IHJlc2V0IFN1cGVy
U3BlZWQgVVNCIGRldmljZSBudW1iZXIgNSB1c2luZyB4aGNpX2hjZApbICAzMDQuNjUyMTY3
XSB1c2IgMy0xOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAyClsgIDMwNC42NTIx
NzRdIHVzYiAzLTEuMTogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMwpbICAzMDQu
NjUzMjk4XSB1c2IgMy0xLjM6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDQKWyAg
MzA0LjY1MzMwNF0gdXNiIDMtMS4zLjM6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVy
IDYKWyAgMzA0LjcwOTcyN10geGhjaV9oY2QgMDAwMDozOTowMC4wOiB4SENJIGhvc3QgY29u
dHJvbGxlciBub3QgcmVzcG9uZGluZywgYXNzdW1lIGRlYWQKWyAgMzA0LjcwOTc0Nl0geGhj
aV9oY2QgMDAwMDozOTowMC4wOiBIQyBkaWVkOyBjbGVhbmluZyB1cApbICAzMDQuNzA5NzYy
XSByODE1MiA0LTEuMS4zOjEuMCBlbngwMGUwNGNlYWJjNDE6IFN0b3Agc3VibWl0dGluZyBp
bnRyLCBzdGF0dXMgLTEwOApbICAzMDQuNzU5NTA3XSB4aGNpX2hjZCAwMDAwOjM5OjAwLjA6
IHJlbW92ZSwgc3RhdGUgMQpbICAzMDQuNzU5NTEwXSB1c2IgdXNiNDogVVNCIGRpc2Nvbm5l
Y3QsIGRldmljZSBudW1iZXIgMQpbICAzMDQuODE0MTAyXSB1c2IgNC0xOiBVU0IgZGlzY29u
bmVjdCwgZGV2aWNlIG51bWJlciAyClsgIDMwNC44MTQxMTFdIHVzYiA0LTEuMTogVVNCIGRp
c2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMwpbICAzMDQuODE0MTE0XSByODE1Mi1jZmdzZWxl
Y3RvciA0LTEuMS4zOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciA2ClsgIDMwNC44
NjczNzldIHVzYiA0LTEuMzogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgNApbICAz
MDQuODY3ODM1XSB1c2IgNC0xLjQ6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDUK
WyAgMzA0Ljk0OTc1OF0geGhjaV9oY2QgMDAwMDozOTowMC4wOiBVU0IgYnVzIDQgZGVyZWdp
c3RlcmVkClsgIDMwNC45NDk3NzFdIHhoY2lfaGNkIDAwMDA6Mzk6MDAuMDogcmVtb3ZlLCBz
dGF0ZSAxClsgIDMwNC45NDk3NzRdIHVzYiB1c2IzOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNl
IG51bWJlciAxClsgIDMwNS4wMDI0NDFdIHVzYiAzLTEuMy40OiBVU0IgZGlzY29ubmVjdCwg
ZGV2aWNlIG51bWJlciA4ClsgIDMwNS4wNTQ3MjVdIHVzYiAzLTEuNTogVVNCIGRpc2Nvbm5l
Y3QsIGRldmljZSBudW1iZXIgNwpbICAzMDUuMDU1NDU2XSB4aGNpX2hjZCAwMDAwOjM5OjAw
LjA6IEhvc3QgaGFsdCBmYWlsZWQsIC0xOQpbICAzMDUuMDU1NDYwXSB4aGNpX2hjZCAwMDAw
OjM5OjAwLjA6IEhvc3Qgbm90IGFjY2Vzc2libGUsIHJlc2V0IGZhaWxlZC4KWyAgMzA1LjA1
NTYyM10geGhjaV9oY2QgMDAwMDozOTowMC4wOiBVU0IgYnVzIDMgZGVyZWdpc3RlcmVkClsg
IDMwNS4wNzQ0NzhdIHBjaV9idXMgMDAwMDowMjogQWxsb2NhdGluZyByZXNvdXJjZXMKWyAg
MzA1LjA3NDQ5M10gcGNpZXBvcnQgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2luZG93IFtpbyAg
MHgxMDAwLTB4MGZmZl0gdG8gW2J1cyAwNC0zOF0gYWRkX3NpemUgMTAwMApbICAzMDUuMDc0
NDk5XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lvICAweDEwMDAt
MHgwZmZmXSB0byBbYnVzIDM5XSBhZGRfc2l6ZSAxMDAwClsgIDMwNS4wNzQ1MDJdIHBjaWVw
b3J0IDAwMDA6MDE6MDAuMDogQXNzaWduZWQgYnJpZGdlIHdpbmRvdyBbbWVtIDB4YTAwMDAw
MDAtMHhjMWZmZmZmZiA2NGJpdCBwcmVmXSB0byBbYnVzIDAyLTM5XSBjYW5ub3QgZml0IDB4
MjAwMDAwIHJlcXVpcmVkIGZvciAwMDAwOjAyOjAyLjAgYnJpZGdpbmcgdG8gW2J1cyAzOV0K
WyAgMzA1LjA3NDUwNl0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFtt
ZW0gMHgwMDAwMDAwMCA2NGJpdCBwcmVmXSB0byBbYnVzIDM5XSByZXF1aXJlcyByZWxheGVk
IGFsaWdubWVudCBydWxlcwpbICAzMDUuMDc0NTA5XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6
IGJyaWRnZSB3aW5kb3cgW21lbSAweDAwMTAwMDAwLTB4MDAwZmZmZmYgNjRiaXQgcHJlZl0g
dG8gW2J1cyAzOV0gYWRkX3NpemUgMjAwMDAwIGFkZF9hbGlnbiAxMDAwMDAKWyAgMzA1LjA3
NDUxMl0gcGNpZXBvcnQgMDAwMDowMTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgMHgxMDAw
LTB4MGZmZl0gdG8gW2J1cyAwMi0zOV0gYWRkX3NpemUgMjAwMApbICAzMDUuMDc0NTE3XSBw
Y2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MjAwMF06
IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgMzA1LjA3NDUxOV0gcGNpZXBvcnQgMDAwMDow
MTowMC4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDIwMDBdOiBmYWlsZWQgdG8gYXNz
aWduClsgIDMwNS4wNzQ1MjFdIHBjaWVwb3J0IDAwMDA6MDE6MDAuMDogYnJpZGdlIHdpbmRv
dyBbaW8gIHNpemUgMHgyMDAwXTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAzMDUuMDc0
NTIzXSBwY2llcG9ydCAwMDAwOjAxOjAwLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4
MjAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgMzA1LjA3NDUyOF0gcGNpZXBvcnQgMDAwMDow
MjowMi4wOiBicmlkZ2Ugd2luZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHByZWZd
OiBjYW4ndCBhc3NpZ247IG5vIHNwYWNlClsgIDMwNS4wNzQ1MzBdIHBjaWVwb3J0IDAwMDA6
MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbbWVtIHNpemUgMHgwMDIwMDAwMCA2NGJpdCBwcmVm
XTogZmFpbGVkIHRvIGFzc2lnbgpbICAzMDUuMDc0NTMyXSBwY2llcG9ydCAwMDAwOjAyOjAx
LjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsgbm8g
c3BhY2UKWyAgMzA1LjA3NDUzNF0gcGNpZXBvcnQgMDAwMDowMjowMS4wOiBicmlkZ2Ugd2lu
ZG93IFtpbyAgc2l6ZSAweDEwMDBdOiBmYWlsZWQgdG8gYXNzaWduClsgIDMwNS4wNzQ1MzZd
IHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAw
XTogY2FuJ3QgYXNzaWduOyBubyBzcGFjZQpbICAzMDUuMDc0NTM4XSBwY2llcG9ydCAwMDAw
OjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBh
c3NpZ24KWyAgMzA1LjA3NDU0MV0gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2lu
ZG93IFttZW0gc2l6ZSAweDAwMjAwMDAwIDY0Yml0IHByZWZdOiBjYW4ndCBhc3NpZ247IG5v
IHNwYWNlClsgIDMwNS4wNzQ1NDNdIHBjaWVwb3J0IDAwMDA6MDI6MDIuMDogYnJpZGdlIHdp
bmRvdyBbbWVtIHNpemUgMHgwMDIwMDAwMCA2NGJpdCBwcmVmXTogZmFpbGVkIHRvIGFzc2ln
bgpbICAzMDUuMDc0NTQ1XSBwY2llcG9ydCAwMDAwOjAyOjAyLjA6IGJyaWRnZSB3aW5kb3cg
W2lvICBzaXplIDB4MTAwMF06IGNhbid0IGFzc2lnbjsgbm8gc3BhY2UKWyAgMzA1LjA3NDU0
N10gcGNpZXBvcnQgMDAwMDowMjowMi4wOiBicmlkZ2Ugd2luZG93IFtpbyAgc2l6ZSAweDEw
MDBdOiBmYWlsZWQgdG8gYXNzaWduClsgIDMwNS4wNzQ1NDldIHBjaWVwb3J0IDAwMDA6MDI6
MDEuMDogYnJpZGdlIHdpbmRvdyBbaW8gIHNpemUgMHgxMDAwXTogY2FuJ3QgYXNzaWduOyBu
byBzcGFjZQpbICAzMDUuMDc0NTUxXSBwY2llcG9ydCAwMDAwOjAyOjAxLjA6IGJyaWRnZSB3
aW5kb3cgW2lvICBzaXplIDB4MTAwMF06IGZhaWxlZCB0byBhc3NpZ24KWyAgMzA5Ljg0MDY5
MF0gcGNpZXBvcnQgMDAwMDowMjowMC4wOiBVbmFibGUgdG8gY2hhbmdlIHBvd2VyIHN0YXRl
IGZyb20gRDNob3QgdG8gRDAsIGRldmljZSBpbmFjY2Vzc2libGUKWyAgMzA5Ljg0MjcyNF0g
cGNpX2J1cyAwMDAwOjAzOiBidXNuX3JlczogW2J1cyAwM10gaXMgcmVsZWFzZWQKWyAgMzA5
Ljg0MjkyOF0gcGNpX2J1cyAwMDAwOjA0OiBidXNuX3JlczogW2J1cyAwNC0zOF0gaXMgcmVs
ZWFzZWQKWyAgMzA5Ljg0MzA1OV0gcGNpX2J1cyAwMDAwOjM5OiBidXNuX3JlczogW2J1cyAz
OV0gaXMgcmVsZWFzZWQKWyAgMzA5Ljg0MzE4OV0gcGNpX2J1cyAwMDAwOjAyOiBidXNuX3Jl
czogW2J1cyAwMi0zOV0gaXMgcmVsZWFzZWQKWyAgMzQ3LjM3Nzc2OF0gd2xhbjA6IGF1dGhl
bnRpY2F0ZSB3aXRoIDg4OjcxOmIxOjgxOjkzOjFiIChsb2NhbCBhZGRyZXNzPTljOmI2OmQw
OmQxOjZhOmIxKQpbICAzNDcuMzc3Nzc0XSB3bGFuMDogc2VuZCBhdXRoIHRvIDg4OjcxOmIx
OjgxOjkzOjFiICh0cnkgMS8zKQpbICAzNDcuMzc5MTIwXSB3bGFuMDogYXV0aGVudGljYXRl
ZApbICAzNDcuMzgxMDgyXSB3bGFuMDogYXNzb2NpYXRlIHdpdGggODg6NzE6YjE6ODE6OTM6
MWIgKHRyeSAxLzMpClsgIDM0Ny40MTU5NzJdIHdsYW4wOiBSWCBBc3NvY1Jlc3AgZnJvbSA4
ODo3MTpiMTo4MTo5MzoxYiAoY2FwYWI9MHgxMDExIHN0YXR1cz0wIGFpZD0zKQpbICAzNDcu
NDE4NjI3XSB3bGFuMDogYXNzb2NpYXRlZApbICAzNDcuNDUzMjc1XSB3bGFuMDogTGltaXRp
bmcgVFggcG93ZXIgdG8gMjMgKDIzIC0gMCkgZEJtIGFzIGFkdmVydGlzZWQgYnkgODg6NzE6
YjE6ODE6OTM6MWIK

--------------oejv6gGTqF8qlgEPhAyEdYyv--
