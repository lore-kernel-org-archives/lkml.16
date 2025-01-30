Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4E1DDC22
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246447; cv=none; b=JiN9qUbRwG74mH8r49kSeHM9CoVXb+eAUVzHcAk1lCTweWR6ObSYynIs6knKmDXXVEzErM6PjXjc9I9jHiI0OnpijSKx0oYCezakeP+lWdsyv9o/1MdjpR528y0XjxA48HS8JKGqLYJuRxkqR6XPirvVkvtmBgFttyAZ98k2FKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246447; c=relaxed/simple;
	bh=acDwQg3tI1HllFHI25c8tP/JvLnfcakKXjnbwUjUZXo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=H0oNHZ5+ABhAbX2CURVDM4NbMHLbk1M9W+he8k2qbVliJq0e5786y+d7Rs5IqRzpbSqUT93+RLlc6TWRpERroCEdaYDgJNgln4gUv+eZd2cYMu2PiYVVvB+DXb4DePGxKfvRhcwOMLJbhWvk30HHkwX1FQQ+SfzEGbKRdHEPQZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so16330395ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738246444; x=1738851244;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq8t8O+gNNi5rnj7GRLwo+U9k47Wzny+dCcUo65dejM=;
        b=cy6UKdiQJQgLq/MXd/WtL/nJKQE3U5/BeJRwGDQL9J/i+Po5Q/cTKh444SJCvtOKsd
         sLzl0SFfBOUOqHioVzWcd8PGcMyL/LkR7uLyeyLU2gY43IEs6R3YMgQ5O+Nhb5P5ZxDQ
         MomFRZBsnP8TTMfZYDwIuRCHAoOpitkSLiXn8sO1wLFXQ1k7MR6pcikou18WIGYrslhL
         yj19rhhmn18Ohup5H6sbI+srtUcPKLMOh92aYbGTDciCR755ncQiXj8BILOme8tvmlPC
         DZAwtEzBwOs9OKFba3nDg4b0mBE2kou1LXOUQfce0V+vrB7+7T0x7ze7A0M18cn0Iuli
         9uaQ==
X-Gm-Message-State: AOJu0YxKzmU+miDdKMiDYVwr7y+k7xEhs1U+LT3MdIpvDDCfJhKk+KS3
	UBrrC74NRgGsM+yP8CyfiLI2y0pt8T3KCqnCUdN1vVrkBNXg/+pupu3WOp6rRis/yeZwoctc4DX
	DJJpQ242/YEPiiWDAj05Au2f/ZdOCy4p8pEORxfCHmv62P1j+K1Xwvl4=
X-Google-Smtp-Source: AGHT+IGq7D28aCsgGL2+9HVoqnLz1ksIsj2zKFTTPWBa6ToE1AukldwU1mMtNCE4Fh/YL1syUjWHvIBPFVHMYwb6ffHDdOR9O/j1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b4c:b0:3cf:ce7c:b8b1 with SMTP id
 e9e14a558f8ab-3cffe447945mr82929845ab.18.1738246444466; Thu, 30 Jan 2025
 06:14:04 -0800 (PST)
Date: Thu, 30 Jan 2025 06:14:04 -0800
In-Reply-To: <20250130102012.640564-1-n.zhandarovich@fintech.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679b892c.050a0220.d7c5a.0017.GAE@google.com>
Subject: Re: [syzbot] [usb?] UBSAN: array-index-out-of-bounds in usbhid_parse
From: syzbot <syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, n.zhandarovich@fintech.ru, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

 61.124748][   T29] audit: type=3D1400 audit(1738246367.103:107): avc:  den=
ied  { mounton } for  pid=3D5824 comm=3D"syz-executor" path=3D"/root/syzkal=
ler.PSkP8X/syz-tmp" dev=3D"sda1" ino=3D1933 scontext=3Droot:sysadm_r:sysadm=
_t tcontext=3Droot:object_r:user_home_t tclass=3Ddir permissive=3D1
[   61.149125][   T29] audit: type=3D1400 audit(1738246367.103:108): avc:  =
denied  { mount } for  pid=3D5824 comm=3D"syz-executor" name=3D"/" dev=3D"t=
mpfs" ino=3D1 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_=
r:tmpfs_t tclass=3Dfilesystem permissive=3D1
[   61.172056][   T29] audit: type=3D1400 audit(1738246367.103:109): avc:  =
denied  { mounton } for  pid=3D5824 comm=3D"syz-executor" path=3D"/root/syz=
kaller.PSkP8X/syz-tmp/newroot/dev" dev=3D"tmpfs" ino=3D3 scontext=3Droot:sy=
sadm_r:sysadm_t tcontext=3Droot:object_r:user_tmpfs_t tclass=3Ddir permissi=
ve=3D1
[   61.199012][   T29] audit: type=3D1400 audit(1738246367.103:110): avc:  =
denied  { mount } for  pid=3D5824 comm=3D"syz-executor" name=3D"/" dev=3D"p=
roc" ino=3D1 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r=
:proc_t tclass=3Dfilesystem permissive=3D1
[   61.220940][   T29] audit: type=3D1400 audit(1738246367.113:111): avc:  =
denied  { mounton } for  pid=3D5824 comm=3D"syz-executor" path=3D"/root/syz=
kaller.PSkP8X/syz-tmp/newroot/sys/kernel/debug" dev=3D"debugfs" ino=3D1 sco=
ntext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r:debugfs_t tclas=
s=3Ddir permissive=3D1
[   61.226696][ T5824] soft_limit_in_bytes is deprecated and will be remove=
d. Please report your usecase to linux-mm@kvack.org if you depend on this f=
unctionality.
[   61.248122][   T29] audit: type=3D1400 audit(1738246367.113:112): avc:  =
denied  { mounton } for  pid=3D5824 comm=3D"syz-executor" path=3D"/root/syz=
kaller.PSkP8X/syz-tmp/newroot/proc/sys/fs/binfmt_misc" dev=3D"proc" ino=3D4=
910 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r:sysctl_f=
s_t tclass=3Ddir permissive=3D1
[   61.407846][ T5829] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   61.415938][ T5829] BUG: KASAN: slab-use-after-free in binder_add_device=
+0xa4/0xb0
[   61.423696][ T5829] Write of size 8 at addr ffff888033ad8c08 by task syz=
-executor/5829
[   61.431852][ T5829]=20
[   61.434171][ T5829] CPU: 1 UID: 0 PID: 5829 Comm: syz-executor Not taint=
ed 6.13.0-syzkaller-09485-g72deda0abee6-dirty #0
[   61.434185][ T5829] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[   61.434196][ T5829] Call Trace:
[   61.434201][ T5829]  <TASK>
[   61.434206][ T5829]  dump_stack_lvl+0x116/0x1f0
[   61.434227][ T5829]  print_report+0xc3/0x620
[   61.434239][ T5829]  ? __virt_addr_valid+0x5e/0x590
[   61.434250][ T5829]  ? __phys_addr+0xc6/0x150
[   61.434261][ T5829]  kasan_report+0xd9/0x110
[   61.434271][ T5829]  ? binder_add_device+0xa4/0xb0
[   61.434284][ T5829]  ? binder_add_device+0xa4/0xb0
[   61.434296][ T5829]  binder_add_device+0xa4/0xb0
[   61.434308][ T5829]  binderfs_binder_device_create.isra.0+0x95f/0xb70
[   61.434325][ T5829]  binderfs_fill_super+0x8d6/0x1360
[   61.434341][ T5829]  ? __pfx_binderfs_fill_super+0x10/0x10
[   61.434360][ T5829]  ? shrinker_register+0x1a8/0x260
[   61.434375][ T5829]  ? sget_fc+0x808/0xc20
[   61.434390][ T5829]  ? __pfx_set_anon_super_fc+0x10/0x10
[   61.434405][ T5829]  ? __pfx_binderfs_fill_super+0x10/0x10
[   61.434418][ T5829]  get_tree_nodev+0xda/0x190
[   61.434433][ T5829]  vfs_get_tree+0x8b/0x340
[   61.434446][ T5829]  path_mount+0x14e6/0x1f10
[   61.434458][ T5829]  ? kmem_cache_free+0x2e2/0x4d0
[   61.434468][ T5829]  ? __pfx_path_mount+0x10/0x10
[   61.434479][ T5829]  ? putname+0x13c/0x180
[   61.434491][ T5829]  __x64_sys_mount+0x28f/0x310
[   61.434502][ T5829]  ? __pfx___x64_sys_mount+0x10/0x10
[   61.434514][ T5829]  do_syscall_64+0xcd/0x250
[   61.434528][ T5829]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   61.434543][ T5829] RIP: 0033:0x7f92ed5816ba
[   61.434553][ T5829] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1=
a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[   61.434566][ T5829] RSP: 002b:00007f92ed86ff68 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000a5
[   61.434577][ T5829] RAX: ffffffffffffffda RBX: 00007f92ed5f3d49 RCX: 000=
07f92ed5816ba
[   61.434584][ T5829] RDX: 00007f92ed5ff2fa RSI: 00007f92ed5f3d49 RDI: 000=
07f92ed5ff2fa
[   61.434591][ T5829] RBP: 00007f92ed5f3f58 R08: 0000000000000000 R09: 000=
0000000000100
[   61.434597][ T5829] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f92ed5de068
[   61.434603][ T5829] R13: 00007f92ed5de048 R14: 0000000000000009 R15: 000=
0000000000000
[   61.434612][ T5829]  </TASK>
[   61.434616][ T5829]=20
[   61.662253][ T5829] Allocated by task 5824:
[   61.666566][ T5829]  kasan_save_stack+0x33/0x60
[   61.671232][ T5829]  kasan_save_track+0x14/0x30
[   61.675901][ T5829]  __kasan_kmalloc+0xaa/0xb0
[   61.680489][ T5829]  binderfs_binder_device_create.isra.0+0x17a/0xb70
[   61.687072][ T5829]  binderfs_fill_super+0x8d6/0x1360
[   61.692351][ T5829]  get_tree_nodev+0xda/0x190
[   61.697019][ T5829]  vfs_get_tree+0x8b/0x340
[   61.701427][ T5829]  path_mount+0x14e6/0x1f10
[   61.705952][ T5829]  __x64_sys_mount+0x28f/0x310
[   61.710702][ T5829]  do_syscall_64+0xcd/0x250
[   61.715192][ T5829]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   61.721074][ T5829]=20
[   61.723377][ T5829] Freed by task 5824:
[   61.727338][ T5829]  kasan_save_stack+0x33/0x60
[   61.732087][ T5829]  kasan_save_track+0x14/0x30
[   61.736952][ T5829]  kasan_save_free_info+0x3b/0x60
[   61.741970][ T5829]  __kasan_slab_free+0x51/0x70
[   61.746718][ T5829]  kfree+0x2c4/0x4d0
[   61.750815][ T5829]  binderfs_evict_inode+0x1e0/0x250
[   61.756001][ T5829]  evict+0x409/0x960
[   61.759886][ T5829]  iput+0x52a/0x890
[   61.763678][ T5829]  dentry_unlink_inode+0x29c/0x480
[   61.768789][ T5829]  __dentry_kill+0x1d0/0x600
[   61.773365][ T5829]  shrink_dentry_list+0x140/0x5d0
[   61.778385][ T5829]  shrink_dcache_parent+0xe2/0x530
[   61.783483][ T5829]  shrink_dcache_for_umount+0xa1/0x3e0
[   61.788936][ T5829]  generic_shutdown_super+0x6c/0x390
[   61.794210][ T5829]  kill_litter_super+0x70/0xa0
[   61.798990][ T5829]  binderfs_kill_super+0x3b/0xa0
[   61.804029][ T5829]  deactivate_locked_super+0xbe/0x1a0
[   61.809396][ T5829]  deactivate_super+0xde/0x100
[   61.814448][ T5829]  cleanup_mnt+0x222/0x450
[   61.818866][ T5829]  task_work_run+0x14e/0x250
[   61.823450][ T5829]  do_exit+0xad8/0x2d70
[   61.827590][ T5829]  do_group_exit+0xd3/0x2a0
[   61.832085][ T5829]  get_signal+0x24ed/0x26c0
[   61.836576][ T5829]  arch_do_signal_or_restart+0x90/0x7e0
[   61.842192][ T5829]  syscall_exit_to_user_mode+0x150/0x2a0
[   61.847808][ T5829]  do_syscall_64+0xda/0x250
[   61.852298][ T5829]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   61.858209][ T5829]=20
[   61.860544][ T5829] The buggy address belongs to the object at ffff88803=
3ad8c00
[   61.860544][ T5829]  which belongs to the cache kmalloc-512 of size 512
[   61.874601][ T5829] The buggy address is located 8 bytes inside of
[   61.874601][ T5829]  freed 512-byte region [ffff888033ad8c00, ffff888033=
ad8e00)
[   61.888229][ T5829]=20
[   61.890535][ T5829] The buggy address belongs to the physical page:
[   61.896943][ T5829] page: refcount:0 mapcount:0 mapping:0000000000000000=
 index:0x0 pfn:0x33ad8
[   61.905689][ T5829] head: order:2 mapcount:0 entire_mapcount:0 nr_pages_=
mapped:0 pincount:0
[   61.914167][ T5829] flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastc=
pupid=3D0x7ff)
[   61.921715][ T5829] page_type: f5(slab)
[   61.925679][ T5829] raw: 00fff00000000040 ffff88801b041c80 dead000000000=
100 dead000000000122
[   61.934259][ T5829] raw: 0000000000000000 0000000000100010 00000000f5000=
000 0000000000000000
[   61.942830][ T5829] head: 00fff00000000040 ffff88801b041c80 dead00000000=
0100 dead000000000122
[   61.951499][ T5829] head: 0000000000000000 0000000000100010 00000000f500=
0000 0000000000000000
[   61.960156][ T5829] head: 00fff00000000002 ffffea0000ceb601 ffffffffffff=
ffff 0000000000000000
[   61.968812][ T5829] head: 0000000000000004 0000000000000000 00000000ffff=
ffff 0000000000000000
[   61.977484][ T5829] page dumped because: kasan: bad access detected
[   61.983891][ T5829] page_owner tracks the page as allocated
[   61.989672][ T5829] page last allocated via order 2, migratetype Unmovab=
le, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COM=
P|__GFP_NOMEMALLOC), pid 5204, tgid 5204 (udevd), ts 20443550863, free_ts 1=
9532985486
[   62.010416][ T5829]  post_alloc_hook+0x181/0x1b0
[   62.015177][ T5829]  get_page_from_freelist+0xfce/0x2f80
[   62.020624][ T5829]  __alloc_frozen_pages_noprof+0x221/0x2470
[   62.026501][ T5829]  alloc_pages_mpol+0x1fc/0x540
[   62.031336][ T5829]  new_slab+0x23d/0x330
[   62.035480][ T5829]  ___slab_alloc+0xc5d/0x1720
[   62.040177][ T5829]  __slab_alloc.constprop.0+0x56/0xb0
[   62.045542][ T5829]  __kmalloc_cache_noprof+0xfa/0x410
[   62.050830][ T5829]  kernfs_fop_open+0x28b/0xdb0
[   62.055588][ T5829]  do_dentry_open+0x735/0x1c40
[   62.060366][ T5829]  vfs_open+0x82/0x3f0
[   62.064419][ T5829]  path_openat+0x1e88/0x2d80
[   62.068988][ T5829]  do_filp_open+0x20c/0x470
[   62.073484][ T5829]  do_sys_openat2+0x17a/0x1e0
[   62.078160][ T5829]  __x64_sys_openat+0x175/0x210
[   62.082997][ T5829]  do_syscall_64+0xcd/0x250
[   62.087498][ T5829] page last free pid 5205 tgid 5205 stack trace:
[   62.093813][ T5829]  free_frozen_pages+0x6db/0xfb0
[   62.098734][ T5829]  rcu_core+0x79d/0x14d0
[   62.102960][ T5829]  handle_softirqs+0x213/0x8f0
[   62.107713][ T5829]  __irq_exit_rcu+0x109/0x170
[   62.112387][ T5829]  irq_exit_rcu+0x9/0x30
[   62.116624][ T5829]  sysvec_apic_timer_interrupt+0xa4/0xc0
[   62.122243][ T5829]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   62.128212][ T5829]=20
[   62.130521][ T5829] Memory state around the buggy address:
[   62.136131][ T5829]  ffff888033ad8b00: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   62.144174][ T5829]  ffff888033ad8b80: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   62.152216][ T5829] >ffff888033ad8c00: fa fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   62.160266][ T5829]                       ^
[   62.164578][ T5829]  ffff888033ad8c80: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   62.172621][ T5829]  ffff888033ad8d00: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   62.180658][ T5829] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   62.199606][ T5829] Kernel panic - not syncing: KASAN: panic_on_warn set=
 ...
[   62.206872][ T5829] CPU: 1 UID: 0 PID: 5829 Comm: syz-executor Not taint=
ed 6.13.0-syzkaller-09485-g72deda0abee6-dirty #0
[   62.217884][ T5829] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[   62.227922][ T5829] Call Trace:
[   62.231187][ T5829]  <TASK>
[   62.234103][ T5829]  dump_stack_lvl+0x3d/0x1f0
[   62.238731][ T5829]  panic+0x71d/0x800
[   62.242615][ T5829]  ? __pfx_panic+0x10/0x10
[   62.247018][ T5829]  ? irqentry_exit+0x3b/0x90
[   62.251593][ T5829]  ? lockdep_hardirqs_on+0x7c/0x110
[   62.256789][ T5829]  ? preempt_schedule_thunk+0x1a/0x30
[   62.262169][ T5829]  ? preempt_schedule_common+0x44/0xc0
[   62.267619][ T5829]  ? check_panic_on_warn+0x1f/0xb0
[   62.272717][ T5829]  check_panic_on_warn+0xab/0xb0
[   62.277728][ T5829]  end_report+0x117/0x180
[   62.282070][ T5829]  kasan_report+0xe9/0x110
[   62.286521][ T5829]  ? binder_add_device+0xa4/0xb0
[   62.291449][ T5829]  ? binder_add_device+0xa4/0xb0
[   62.296389][ T5829]  binder_add_device+0xa4/0xb0
[   62.301141][ T5829]  binderfs_binder_device_create.isra.0+0x95f/0xb70
[   62.307722][ T5829]  binderfs_fill_super+0x8d6/0x1360
[   62.313001][ T5829]  ? __pfx_binderfs_fill_super+0x10/0x10
[   62.318631][ T5829]  ? shrinker_register+0x1a8/0x260
[   62.323733][ T5829]  ? sget_fc+0x808/0xc20
[   62.327964][ T5829]  ? __pfx_set_anon_super_fc+0x10/0x10
[   62.333409][ T5829]  ? __pfx_binderfs_fill_super+0x10/0x10
[   62.339029][ T5829]  get_tree_nodev+0xda/0x190
[   62.343610][ T5829]  vfs_get_tree+0x8b/0x340
[   62.348123][ T5829]  path_mount+0x14e6/0x1f10
[   62.352612][ T5829]  ? kmem_cache_free+0x2e2/0x4d0
[   62.357536][ T5829]  ? __pfx_path_mount+0x10/0x10
[   62.362372][ T5829]  ? putname+0x13c/0x180
[   62.366603][ T5829]  __x64_sys_mount+0x28f/0x310
[   62.371360][ T5829]  ? __pfx___x64_sys_mount+0x10/0x10
[   62.376630][ T5829]  do_syscall_64+0xcd/0x250
[   62.381121][ T5829]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   62.387019][ T5829] RIP: 0033:0x7f92ed5816ba
[   62.391443][ T5829] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1=
a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[   62.411242][ T5829] RSP: 002b:00007f92ed86ff68 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000a5
[   62.419651][ T5829] RAX: ffffffffffffffda RBX: 00007f92ed5f3d49 RCX: 000=
07f92ed5816ba
[   62.427605][ T5829] RDX: 00007f92ed5ff2fa RSI: 00007f92ed5f3d49 RDI: 000=
07f92ed5ff2fa
[   62.435561][ T5829] RBP: 00007f92ed5f3f58 R08: 0000000000000000 R09: 000=
0000000000100
[   62.443515][ T5829] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f92ed5de068
[   62.451492][ T5829] R13: 00007f92ed5de048 R14: 0000000000000009 R15: 000=
0000000000000
[   62.459483][ T5829]  </TASK>
[   62.462725][ T5829] Kernel Offset: disabled
[   62.467031][ T5829] Rebooting in 86400 seconds..


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
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.22.7'
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
 -ffile-prefix-map=3D/tmp/go-build3526199464=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at b50eb251af
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
go fmt ./sys/... >/dev/null
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Db50eb251af3b122fb1b2c574dde0c3d16f6a8cfd -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20241203-163055'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"b50eb251af3b122fb1b2c574dde0c3d16f=
6a8cfd\"
/usr/bin/ld: /tmp/ccVS4jTw.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D10b9a324580000


Tested on:

commit:         72deda0a Merge tag 'soundwire-6.14-rc1' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd1d4677fc8e4506=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc52569baf0c843f35=
495
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10fa0b645800=
00

