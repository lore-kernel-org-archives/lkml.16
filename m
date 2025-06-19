Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E122441A7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335605; cv=none; b=KgtBBpRQbVTM4FcrqojUZmhad87lHEHkWW7ULe2fwRzStalv27akH57dP7iXkKv6OW9zCVoLHUrgZXgmShmOkVJLdVXbv1epU6Uv0iODF9c6xPF3nxjttJmFxpebOWKfQEnvebsVLQXfDstyQDoMITiDL6iwghVBzTNu/gE7efA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335605; c=relaxed/simple;
	bh=tKy3XR1FmU8e+cvMQgxQLdO1ioLwCIlPvA2/f+OC7yI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=l5vrIQAeKvZDgka2rh1ZLNvTF2jMZDY7vWw3Knd3nV1Qz4WQRIpP/IHkQs7WIdDpt5xiCbzrJud9t5RNqesTij+3j09ddjhwzlh/UUB9FWGSGQqOuQwv/Pua1hsl9yIpblhIuLALK7b8zybd4SLWPk0jtDguoBGLlwVPvn/YvvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ddc4908c4dso9143305ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335602; x=1750940402;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvEyw85x9gBO5ukHpe5cz8OetgNcM91K+MseWkGIaVU=;
        b=m6jTVpofCoC/aUB0nM5CBZEkZ0p4Cqg2pYG705/rf/ypu5o6RIzz0/BLyfgd7MfMrs
         3p1lfYmsZa3Iux/T6Gt1WO5TilRqBnF+43ZQxczC3QkfA4wePK6gLH+KcStbFz3DuBxR
         FBgiHnH/YoYcErFy6Nsu5X6v9LyJDxQs9qhFiYqNEqD1w7yJQOQCrj6mmrGKHyqDs9Dz
         ij473e4daz3Yn2vfWSkEjzOdyui+SWqUIyTNSydO5WXDFgsBlLL0/l3AezNtEMz6aHYz
         atCbTLZBA5IbN/qkmzqzH1qIqijzGd4GoLgHuyW4Ru6tHoAsNLhXo8VLT9Pm81lQolMl
         cGSA==
X-Forwarded-Encrypted: i=1; AJvYcCUJbcJ0A8MyQd4BipWZJGDiKY2dX8JLE8iXEZL4gBocAHvsuvCOXfQlGonw3MEnCVlwIVmBGXle1zBIbyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJN1m9GIXyvhk4bvwaszX3MXWRkAAvLda+XEDHdz3ArIL27SK
	U/a9+3Po7yefESuBxgjED31N/sE24EsUuRRYl+oafRCzo4i52rhtq5A+5mbsOIlJ1ef91ITQ5xX
	vs/JclK+IneidMq47OQWRo7eDDD3GivkdOB9PYtFA2CoqWMonuVkeV7r/uvg=
X-Google-Smtp-Source: AGHT+IG7bhiidhxMTEel1ljTnshYTpoWgitFL1reUCJkSOjo4ASL1JABZGxq9tS3juGGLX8KKNmSq6nLt3UBPmkKRZ/I162noLAb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1522:b0:3de:2102:f1d8 with SMTP id
 e9e14a558f8ab-3de2102f53dmr141975055ab.18.1750335602394; Thu, 19 Jun 2025
 05:20:02 -0700 (PDT)
Date: Thu, 19 Jun 2025 05:20:02 -0700
In-Reply-To: <20250619105754.1184-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68540072.a00a0220.137b3.000a.GAE@google.com>
Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
From: syzbot <syzbot+8e4be574cb8c40140a2a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

8.060206][    T1] tipc: Started in single node mode
[   18.066277][    T1] NET: Registered PF_SMC protocol family
[   18.072296][    T1] 9pnet: Installing 9P2000 support
[   18.078212][    T1] NET: Registered PF_CAIF protocol family
[   18.088922][    T1] NET: Registered PF_IEEE802154 protocol family
[   18.096048][    T1] Key type dns_resolver registered
[   18.101198][    T1] Key type ceph registered
[   18.106486][    T1] libceph: loaded (mon/osd proto 15/24)
[   18.114157][    T1] batman_adv: B.A.T.M.A.N. advanced 2025.2 (compatibil=
ity version 15) loaded
[   18.123195][    T1] openvswitch: Open vSwitch switching datapath
[   18.131604][    T1] NET: Registered PF_VSOCK protocol family
[   18.137780][    T1] mpls_gso: MPLS GSO support
[   18.164145][    T1] IPI shorthand broadcast: enabled
[   19.716421][    T1] sched_clock: Marking stable (19680020590, 33543153)-=
>(19712331250, 1232493)
[   19.728186][    T1] registered taskstats version 1
[   19.753013][    T1] Loading compiled-in X.509 certificates
[   19.781618][    T1] Loaded X.509 cert 'Build time autogenerated kernel k=
ey: 296561ebce14783e289c94f2cfb024577813ccec'
[   20.094263][    T1] zswap: loaded using pool 842/zsmalloc
[   20.103313][    T1] Demotion targets for Node 0: null
[   20.108630][    T1] Demotion targets for Node 1: null
[   20.113924][    T1] debug_vm_pgtable: [debug_vm_pgtable         ]: Valid=
ating architecture page table helpers
[   22.585672][    T1] Key type .fscrypt registered
[   22.590444][    T1] Key type fscrypt-provisioning registered
[   22.603902][    T1] kAFS: Red Hat AFS client v0.1 registering.
[   22.631354][    T1] Btrfs loaded, assert=3Don, ref-verify=3Don, zoned=3D=
yes, fsverity=3Dyes
[   22.639931][    T1] Key type big_key registered
[   22.644686][    T1] Key type encrypted registered
[   22.649515][    T1] AppArmor: AppArmor sha256 policy hashing enabled
[   22.656219][    T1] ima: No TPM chip found, activating TPM-bypass!
[   22.662702][    T1] Loading compiled-in module X.509 certificates
[   22.688107][    T1] Loaded X.509 cert 'Build time autogenerated kernel k=
ey: 296561ebce14783e289c94f2cfb024577813ccec'
[   22.698982][    T1] ima: Allocated hash algorithm: sha256
[   22.704992][    T1] ima: No architecture policies found
[   22.710910][    T1] evm: Initialising EVM extended attributes:
[   22.716913][    T1] evm: security.selinux (disabled)
[   22.722101][    T1] evm: security.SMACK64 (disabled)
[   22.727229][    T1] evm: security.SMACK64EXEC (disabled)
[   22.732666][    T1] evm: security.SMACK64TRANSMUTE (disabled)
[   22.738556][    T1] evm: security.SMACK64MMAP (disabled)
[   22.744015][    T1] evm: security.apparmor
[   22.748242][    T1] evm: security.ima
[   22.752019][    T1] evm: security.capability
[   22.756425][    T1] evm: HMAC attrs: 0x1
[   22.762722][    T1] PM:   Magic number: 13:316:178
[   22.767792][    T1] video4linux video66: hash matches
[   22.773689][    T1] tty ttyr4: hash matches
[   22.778110][    T1] acpi device:0e: hash matches
[   22.782870][    T1]  platform: hash matches
[   22.787384][    T1] netconsole: network logging started
[   22.793382][    T1] gtp: GTP module loaded (pdp ctx size 128 bytes)
[   22.805238][    T1] rdma_rxe: loaded
[   22.809949][    T1] cfg80211: Loading compiled-in X.509 certificates for=
 regulatory database
[   22.821056][    T1] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   22.829173][    T1] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06=
c7248db18c600'
[   22.839864][    T1] clk: Disabling unused clocks
[   22.845005][    T1] ALSA device list:
[   22.847438][   T43] platform regulatory.0: Direct firmware load for regu=
latory.db failed with error -2
[   22.848817][    T1]   #0: Dummy 1
[   22.848828][    T1]   #1: Loopback 1
[   22.858367][   T43] platform regulatory.0: Falling back to sysfs fallbac=
k for: regulatory.db
[   22.861771][    T1]   #2: Virtual MIDI Card 1
[   22.882507][    T1] md: Waiting for all devices to be available before a=
utodetect
[   22.890180][    T1] md: If you don't use raid, use raid=3Dnoautodetect
[   22.896709][    T1] md: Autodetecting RAID arrays.
[   22.901709][    T1] md: autorun ...
[   22.905358][    T1] md: ... autorun DONE.
[   23.036082][    T1] EXT4-fs (sda1): orphan cleanup on readonly fs
[   23.044467][    T1] EXT4-fs (sda1): mounted filesystem 4f91c6db-4997-4bb=
4-91b8-7e83a20c1bf1 ro with ordered data mode. Quota mode: none.
[   23.057100][    T1] VFS: Mounted root (ext4 filesystem) readonly on devi=
ce 8:1.
[   23.089367][    T1] devtmpfs: mounted
[   23.166388][    T1] Freeing unused kernel image (initmem) memory: 26276K
[   23.179409][    T1] Write protecting the kernel read-only data: 210944k
[   23.198386][    T1] Freeing unused kernel image (text/rodata gap) memory=
: 948K
[   23.209141][    T1] Freeing unused kernel image (rodata/data gap) memory=
: 492K
[   23.312697][    T1] x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[   23.320966][    T1] x86/mm: Checking user space page tables
[   23.408798][    T1] x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[   23.421580][    T1] Failed to set sysctl parameter 'max_rcu_stall_to_pan=
ic=3D1': parameter not found
[   23.431499][    T1] Run /sbin/init as init process
[   23.909158][ T5168] mount (5168) used greatest stack depth: 24104 bytes =
left
[   23.976839][ T5169] EXT4-fs (sda1): re-mounted 4f91c6db-4997-4bb4-91b8-7=
e83a20c1bf1 r/w.
mount: mounting devtmpfs on /dev failed: Device or resource busy
mount: mounting smackfs on /sys/fs/smackfs failed: No such file or director=
y
mount: mounting selinuxfs on /sys/fs/selinux failed: No such file or direct=
ory
[   24.177307][ T5173] mount (5173) used greatest stack depth: 21736 bytes =
left
Starting syslogd: OK
Starting acpid: OK
Starting klogd: OK
Running sysctl: OK
Populating /dev using udev: [   25.289404][ T5203] udevd[5203]: starting ve=
rsion 3.2.14
[   25.593118][ T5204] udevd[5204]: starting eudev-3.2.14
[   25.599909][ T5203] udevd (5203) used greatest stack depth: 20200 bytes =
left
[   25.951253][ T5204] ------------[ cut here ]------------
[   25.957028][ T5204] WARNING: ./include/linux/rwsem.h:203 at vms_complete=
_munmap_vmas+0x725/0x9f0, CPU#0: udevd/5204
[   25.967794][ T5204] Modules linked in:
[   25.971808][ T5204] CPU: 0 UID: 0 PID: 5204 Comm: udevd Not tainted 6.16=
.0-rc2-next-20250619-syzkaller-03877-g2c923c845768-dirty #0 PREEMPT(full)=
=20
[   25.985130][ T5204] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 05/07/2025
[   25.995263][ T5204] RIP: 0010:vms_complete_munmap_vmas+0x725/0x9f0
[   26.001611][ T5204] Code: ff 48 8b 7c 24 30 48 c7 c6 ff ff ff ff e8 c3 c=
9 4f 09 48 85 c0 74 7c 49 89 c5 e8 96 ba aa ff e9 f8 fd ff ff e8 8c ba aa f=
f 90 <0f> 0b 90 e9 55 fe ff ff 48 c7 c1 30 bd a1 8f 80 e1 07 80 c1 03 38
[   26.021362][ T5204] RSP: 0018:ffffc9000394fa58 EFLAGS: 00010293
[   26.027502][ T5204] RAX: ffffffff8215ae04 RBX: ffff8880257fc010 RCX: fff=
f88807eb5da00
[   26.035552][ T5204] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000000
[   26.043540][ T5204] RBP: 0000000000000000 R08: ffff88807eb5da00 R09: 000=
0000000000002
[   26.051593][ T5204] R10: 0000000000000003 R11: 0000000000000000 R12: dff=
ffc0000000000
[   26.059856][ T5204] R13: ffff8880257fc000 R14: ffffc9000394fc50 R15: 1ff=
ffffff1f437a6
[   26.067859][ T5204] FS:  00007f55163fc880(0000) GS:ffff888125c28000(0000=
) knlGS:0000000000000000
[   26.076810][ T5204] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.083393][ T5204] CR2: 00007f5516482d00 CR3: 00000000327c6000 CR4: 000=
00000003526f0
[   26.091446][ T5204] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[   26.099463][ T5204] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[   26.107481][ T5204] Call Trace:
[   26.110771][ T5204]  <TASK>
[   26.113748][ T5204]  do_vmi_align_munmap+0x358/0x420
[   26.118969][ T5204]  ? __pfx_filemap_map_pages+0x10/0x10
[   26.124484][ T5204]  ? __pfx_do_vmi_align_munmap+0x10/0x10
[   26.130163][ T5204]  do_vmi_munmap+0x253/0x2e0
[   26.134804][ T5204]  __vm_munmap+0x23b/0x3d0
[   26.139239][ T5204]  ? __pfx___vm_munmap+0x10/0x10
[   26.144251][ T5204]  __x64_sys_munmap+0x60/0x70
[   26.148947][ T5204]  do_syscall_64+0xfa/0x3b0
[   26.153473][ T5204]  ? lockdep_hardirqs_on+0x9c/0x150
[   26.158726][ T5204]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   26.164829][ T5204]  ? clear_bhb_loop+0x60/0xb0
[   26.169517][ T5204]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   26.175448][ T5204] RIP: 0033:0x7f5515d1e097
[   26.179885][ T5204] Code: 73 01 c3 48 8b 0d 61 2d 0d 00 f7 d8 64 89 01 4=
8 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 0b 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 31 2d 0d 00 f7 d8 64 89 01 48
[   26.199536][ T5204] RSP: 002b:00007ffe3dfc7708 EFLAGS: 00000206 ORIG_RAX=
: 000000000000000b
[   26.208009][ T5204] RAX: ffffffffffffffda RBX: 000055e9c90a2bf0 RCX: 000=
07f5515d1e097
[   26.216011][ T5204] RDX: 0000000000000000 RSI: 00000000009480e8 RDI: 000=
07f5515200000
[   26.224020][ T5204] RBP: 000055e9c90a2910 R08: 000055e9c90a4670 R09: 000=
0000000000006
[   26.232131][ T5204] R10: 3fffffffffffffff R11: 0000000000000206 R12: 000=
055e9b3063588
[   26.240149][ T5204] R13: 000055e9b3064100 R14: 0000000000000001 R15: 000=
0000000000000
[   26.248180][ T5204]  </TASK>
[   26.251207][ T5204] Kernel panic - not syncing: kernel: panic_on_warn se=
t ...
[   26.258491][ T5204] CPU: 0 UID: 0 PID: 5204 Comm: udevd Not tainted 6.16=
.0-rc2-next-20250619-syzkaller-03877-g2c923c845768-dirty #0 PREEMPT(full)=
=20
[   26.271771][ T5204] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 05/07/2025
[   26.281834][ T5204] Call Trace:
[   26.285130][ T5204]  <TASK>
[   26.288070][ T5204]  dump_stack_lvl+0x99/0x250
[   26.292702][ T5204]  ? __asan_memcpy+0x40/0x70
[   26.297308][ T5204]  ? __pfx_dump_stack_lvl+0x10/0x10
[   26.302522][ T5204]  ? __pfx__printk+0x10/0x10
[   26.307141][ T5204]  panic+0x2db/0x790
[   26.311054][ T5204]  ? __pfx_panic+0x10/0x10
[   26.315504][ T5204]  __warn+0x334/0x4c0
[   26.319495][ T5204]  ? vms_complete_munmap_vmas+0x725/0x9f0
[   26.325227][ T5204]  ? vms_complete_munmap_vmas+0x725/0x9f0
[   26.330953][ T5204]  report_bug+0x2be/0x4f0
[   26.335295][ T5204]  ? vms_complete_munmap_vmas+0x725/0x9f0
[   26.341005][ T5204]  ? vms_complete_munmap_vmas+0x725/0x9f0
[   26.346711][ T5204]  ? vms_complete_munmap_vmas+0x727/0x9f0
[   26.352423][ T5204]  handle_bug+0x84/0x160
[   26.356655][ T5204]  exc_invalid_op+0x1a/0x50
[   26.361143][ T5204]  asm_exc_invalid_op+0x1a/0x20
[   26.365974][ T5204] RIP: 0010:vms_complete_munmap_vmas+0x725/0x9f0
[   26.372295][ T5204] Code: ff 48 8b 7c 24 30 48 c7 c6 ff ff ff ff e8 c3 c=
9 4f 09 48 85 c0 74 7c 49 89 c5 e8 96 ba aa ff e9 f8 fd ff ff e8 8c ba aa f=
f 90 <0f> 0b 90 e9 55 fe ff ff 48 c7 c1 30 bd a1 8f 80 e1 07 80 c1 03 38
[   26.391882][ T5204] RSP: 0018:ffffc9000394fa58 EFLAGS: 00010293
[   26.397939][ T5204] RAX: ffffffff8215ae04 RBX: ffff8880257fc010 RCX: fff=
f88807eb5da00
[   26.405896][ T5204] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000=
0000000000000
[   26.413940][ T5204] RBP: 0000000000000000 R08: ffff88807eb5da00 R09: 000=
0000000000002
[   26.421915][ T5204] R10: 0000000000000003 R11: 0000000000000000 R12: dff=
ffc0000000000
[   26.429895][ T5204] R13: ffff8880257fc000 R14: ffffc9000394fc50 R15: 1ff=
ffffff1f437a6
[   26.437863][ T5204]  ? vms_complete_munmap_vmas+0x724/0x9f0
[   26.443590][ T5204]  ? vms_complete_munmap_vmas+0x724/0x9f0
[   26.449326][ T5204]  do_vmi_align_munmap+0x358/0x420
[   26.454423][ T5204]  ? __pfx_filemap_map_pages+0x10/0x10
[   26.459875][ T5204]  ? __pfx_do_vmi_align_munmap+0x10/0x10
[   26.465511][ T5204]  do_vmi_munmap+0x253/0x2e0
[   26.470128][ T5204]  __vm_munmap+0x23b/0x3d0
[   26.474530][ T5204]  ? __pfx___vm_munmap+0x10/0x10
[   26.479472][ T5204]  __x64_sys_munmap+0x60/0x70
[   26.484136][ T5204]  do_syscall_64+0xfa/0x3b0
[   26.488624][ T5204]  ? lockdep_hardirqs_on+0x9c/0x150
[   26.493810][ T5204]  ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   26.499855][ T5204]  ? clear_bhb_loop+0x60/0xb0
[   26.504527][ T5204]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   26.510417][ T5204] RIP: 0033:0x7f5515d1e097
[   26.514823][ T5204] Code: 73 01 c3 48 8b 0d 61 2d 0d 00 f7 d8 64 89 01 4=
8 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 0b 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 31 2d 0d 00 f7 d8 64 89 01 48
[   26.534422][ T5204] RSP: 002b:00007ffe3dfc7708 EFLAGS: 00000206 ORIG_RAX=
: 000000000000000b
[   26.542831][ T5204] RAX: ffffffffffffffda RBX: 000055e9c90a2bf0 RCX: 000=
07f5515d1e097
[   26.550793][ T5204] RDX: 0000000000000000 RSI: 00000000009480e8 RDI: 000=
07f5515200000
[   26.558745][ T5204] RBP: 000055e9c90a2910 R08: 000055e9c90a4670 R09: 000=
0000000000006
[   26.566697][ T5204] R10: 3fffffffffffffff R11: 0000000000000206 R12: 000=
055e9b3063588
[   26.574660][ T5204] R13: 000055e9b3064100 R14: 0000000000000001 R15: 000=
0000000000000
[   26.582623][ T5204]  </TASK>
[   26.585847][ T5204] Kernel Offset: disabled
[   26.590156][ T5204] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build3755319018=3D/tmp/go-build -gno-record-gc=
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
/usr/bin/ld: /tmp/cc5ohoFQ.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D129d850c580000


Tested on:

commit:         2c923c84 Add linux-next specific files for 20250619
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D58afc4b78b52b7e=
3
dashboard link: https://syzkaller.appspot.com/bug?extid=3D8e4be574cb8c40140=
a2a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-=
1~exp1~20250514183223.118), Debian LLD 20.1.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D1707b5d45800=
00

