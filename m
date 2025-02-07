Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A14C32C8B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921626; cv=none; b=VCICFHZG2OK13BBXHDIy94tU0Zj3cYYZlIDPV8S9UOEg5r4ZZcoEVNNrjP5HinPr5La1ar+SRVSgfzbmlp88Zdj5ldqXpXh19/64uAMLS8Q3gvWb23thfEg8HnFbXF1nXp4X6Wn7G1U6aBhlu4l6L66EN3HM30Ui90/cUyt7dTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921626; c=relaxed/simple;
	bh=jGVrZbjgx90KuQmbHW3zarSEzuGeCaEX8+AYEligJjc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Cd8JOyV1x3fyE8165CgOZ25rh5qzC2xPG3mueTnQIY7yrJupg5+8lWQWheKwGSDWvvFC1kQEZQbviWwz3uboK2yCpph+3DD00U8rcYOgPIsc3OgbGyilT/KVfwJv5dGn8Tm/xHUdIvolRZPIHDl/NW2L3mDenvTE9DtbARyhWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so37697545ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921623; x=1739526423;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw6gO3Cy+hlaNrVIGCpcfv/1uSHhESR6XUS/Wdd3AD8=;
        b=YATcpGSCWYjC/NFStaPAD0ldHY75wzZBDs86lh5c9nTsGfiiqJHXiURw/NPv+z4XWh
         21Dr3ddxpIbvPfbt8wdzepGqCRSNCTUZLcmLQon7M/C08DGvbz5K7x5eyz4R3qUDAVyG
         PNwZUh1gLRGoeKZ/9lm3RqpCKgVEjOAVPEzRqnECuTMxXr5Z8yn5RVVspQDgYRCxj6Cs
         ggY4gApsL69cCg2UR9txgmCsqG4TlHJcRSJ4HD6tHUneJMLB4+peZ314crmo8JzuYjfR
         yGLwn6HXrZPtEChZ4mk62t+CknLTRawEggwDgRn22l8VeES+wjV5hAYbhk/3f2BmiQrL
         pPgA==
X-Forwarded-Encrypted: i=1; AJvYcCVjAzTKEZtCB26N6NsXFq/9lu7LcsthfiqKHd6IXBuf8u67kl3ICCPUfrPt0eBBFX6lzaHKMlhQTKEUehw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJmL5IC+0emM6/qFwximrHkR4u0Q79AUploPqmzQzZT4hlKUuI
	IP4q65Ut61/UYWClGkmqnovPrZsJFNFoSs7No1S4FJowWyWA6pppPXxwoQWIgR9iToXSFy39HSH
	loG9cBQJyF5RqZTG5nZOqS1pQCg9ts2kG+4lFjM7dbqW955CtXTC9JEM=
X-Google-Smtp-Source: AGHT+IH+Uf1UQOgoAfTyBfZSsH0Ukc91jYUqb06cN6HzXACMYSVKF+NcoO8oZhikJ13H1mobCt2U2ITwnupAStJKmu6EqGc6MZmH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1907:b0:3d1:98e:4916 with SMTP id
 e9e14a558f8ab-3d13dd5f1edmr18226455ab.9.1738921623084; Fri, 07 Feb 2025
 01:47:03 -0800 (PST)
Date: Fri, 07 Feb 2025 01:47:03 -0800
In-Reply-To: <20250207091034.3303042-1-luyun@kylinos.cn>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a5d697.050a0220.2b1e6.001c.GAE@google.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in mas_preallocate (2)
From: syzbot <syzbot+882589c97d51a9de68eb@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, liam.howlett@oracle.com, 
	linux-kernel@vger.kernel.org, luyun@kylinos.cn, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

nclude/linux/blkdev.h:756 [inline]
 loop_add+0x81d/0xaf0 drivers/block/loop.c:2096
 loop_init+0x168/0x220 drivers/block/loop.c:2288
 do_one_initcall+0x248/0x870 init/main.c:1257
 do_initcall_level+0x157/0x210 init/main.c:1319
 do_initcalls+0x3f/0x80 init/main.c:1335
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888141f75b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888141f75b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888141f75c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff888141f75c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888141f75d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


Warning: Permanently added '10.128.0.174' (ED25519) to the list of known ho=
sts.
2025/02/07 09:46:10 ignoring optional flag "sandboxArg"=3D"0"
2025/02/07 09:46:11 parsed 1 programs
[   64.680788][ T5831] cgroup: Unknown subsys name 'net'
[   64.809551][ T5831] cgroup: Unknown subsys name 'cpuset'
[   64.817337][ T5831] cgroup: Unknown subsys name 'rlimit'
[   66.046132][ T5831] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   68.468278][ T5846] soft_limit_in_bytes is deprecated and will be remove=
d. Please report your usecase to linux-mm@kvack.org if you depend on this f=
unctionality.
[   68.794988][ T1121] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   68.816430][ T1121] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   68.872503][ T5849] chnl_net:caif_netlink_parms(): no params data found
[   68.925704][ T5860] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   68.933807][ T5860] BUG: KASAN: slab-use-after-free in binder_add_device=
+0x5f/0xa0
[   68.941551][ T5860] Write of size 8 at addr ffff888141f75c08 by task syz=
-executor/5860
[   68.949594][ T5860]=20
[   68.952007][ T5860] CPU: 0 UID: 0 PID: 5860 Comm: syz-executor Not taint=
ed 6.14.0-rc1-syzkaller-00081-gbb066fe812d6-dirty #0
[   68.952018][ T5860] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[   68.952027][ T5860] Call Trace:
[   68.952031][ T5860]  <TASK>
[   68.952036][ T5860]  dump_stack_lvl+0x241/0x360
[   68.952050][ T5860]  ? __pfx_dump_stack_lvl+0x10/0x10
[   68.952059][ T5860]  ? __pfx__printk+0x10/0x10
[   68.952068][ T5860]  ? _printk+0xd5/0x120
[   68.952075][ T5860]  ? __virt_addr_valid+0x183/0x530
[   68.952089][ T5860]  ? __virt_addr_valid+0x183/0x530
[   68.952101][ T5860]  print_report+0x169/0x550
[   68.952110][ T5860]  ? __virt_addr_valid+0x183/0x530
[   68.952122][ T5860]  ? __virt_addr_valid+0x183/0x530
[   68.952133][ T5860]  ? __virt_addr_valid+0x45f/0x530
[   68.952145][ T5860]  ? __phys_addr+0xba/0x170
[   68.952157][ T5860]  ? binder_add_device+0x5f/0xa0
[   68.952171][ T5860]  kasan_report+0x143/0x180
[   68.952179][ T5860]  ? binder_add_device+0x5f/0xa0
[   68.952192][ T5860]  binder_add_device+0x5f/0xa0
[   68.952205][ T5860]  binderfs_binder_device_create+0x7bf/0x9c0
[   68.952219][ T5860]  binderfs_fill_super+0x944/0xd90
[   68.952233][ T5860]  ? __pfx_binderfs_fill_super+0x10/0x10
[   68.952248][ T5860]  ? shrinker_register+0x160/0x230
[   68.952261][ T5860]  ? sget_fc+0x909/0x9c0
[   68.952272][ T5860]  ? __pfx_set_anon_super_fc+0x10/0x10
[   68.952283][ T5860]  ? __pfx_binderfs_fill_super+0x10/0x10
[   68.952295][ T5860]  get_tree_nodev+0xb7/0x140
[   68.952307][ T5860]  vfs_get_tree+0x90/0x2b0
[   68.952319][ T5860]  do_new_mount+0x2be/0xb40
[   68.952329][ T5860]  ? __pfx_do_new_mount+0x10/0x10
[   68.952340][ T5860]  __se_sys_mount+0x2d6/0x3c0
[   68.952349][ T5860]  ? lockdep_hardirqs_on_prepare+0x43d/0x780
[   68.952362][ T5860]  ? __pfx___se_sys_mount+0x10/0x10
[   68.952371][ T5860]  ? do_syscall_64+0x100/0x230
[   68.952382][ T5860]  ? __x64_sys_mount+0x20/0xc0
[   68.952391][ T5860]  do_syscall_64+0xf3/0x230
[   68.952400][ T5860]  ? clear_bhb_loop+0x35/0x90
[   68.952412][ T5860]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   68.952424][ T5860] RIP: 0033:0x7f91065816ba
[   68.952436][ T5860] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1=
a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[   68.952443][ T5860] RSP: 002b:00007ffc27214878 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000a5
[   68.952459][ T5860] RAX: ffffffffffffffda RBX: 00007f91065f3d49 RCX: 000=
07f91065816ba
[   68.952465][ T5860] RDX: 00007f91065ff2fa RSI: 00007f91065f3d49 RDI: 000=
07f91065ff2fa
[   68.952471][ T5860] RBP: 00007f91065f3f58 R08: 0000000000000000 R09: 000=
00000000001ff
[   68.952478][ T5860] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f91065de068
[   68.952483][ T5860] R13: 00007f91065de048 R14: 0000000000000009 R15: 000=
0000000000000
[   68.952492][ T5860]  </TASK>
[   68.952495][ T5860]=20
[   69.224959][ T5860] Allocated by task 5845:
[   69.229271][ T5860]  kasan_save_track+0x3f/0x80
[   69.234027][ T5860]  __kasan_kmalloc+0x98/0xb0
[   69.238601][ T5860]  __kmalloc_cache_noprof+0x243/0x390
[   69.243955][ T5860]  binderfs_binder_device_create+0x16c/0x9c0
[   69.249920][ T5860]  binderfs_fill_super+0x944/0xd90
[   69.255009][ T5860]  get_tree_nodev+0xb7/0x140
[   69.259583][ T5860]  vfs_get_tree+0x90/0x2b0
[   69.263978][ T5860]  do_new_mount+0x2be/0xb40
[   69.268461][ T5860]  __se_sys_mount+0x2d6/0x3c0
[   69.273112][ T5860]  do_syscall_64+0xf3/0x230
[   69.277601][ T5860]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   69.283493][ T5860]=20
[   69.285813][ T5860] Freed by task 5845:
[   69.289778][ T5860]  kasan_save_track+0x3f/0x80
[   69.294458][ T5860]  kasan_save_free_info+0x40/0x50
[   69.299465][ T5860]  __kasan_slab_free+0x59/0x70
[   69.304204][ T5860]  kfree+0x196/0x430
[   69.308074][ T5860]  evict+0x4e8/0x9a0
[   69.311958][ T5860]  __dentry_kill+0x20d/0x630
[   69.316551][ T5860]  shrink_kill+0xa9/0x2c0
[   69.320870][ T5860]  shrink_dentry_list+0x2c0/0x5b0
[   69.325897][ T5860]  shrink_dcache_parent+0xcb/0x3b0
[   69.331002][ T5860]  do_one_tree+0x23/0xe0
[   69.335228][ T5860]  shrink_dcache_for_umount+0xb4/0x180
[   69.340680][ T5860]  generic_shutdown_super+0x6a/0x2d0
[   69.345948][ T5860]  kill_litter_super+0x76/0xb0
[   69.350695][ T5860]  binderfs_kill_super+0x44/0x90
[   69.355617][ T5860]  deactivate_locked_super+0xc4/0x130
[   69.360969][ T5860]  cleanup_mnt+0x41f/0x4b0
[   69.365365][ T5860]  task_work_run+0x24f/0x310
[   69.369937][ T5860]  do_exit+0xa2a/0x28e0
[   69.374165][ T5860]  do_group_exit+0x207/0x2c0
[   69.378743][ T5860]  get_signal+0x16b2/0x1750
[   69.383248][ T5860]  arch_do_signal_or_restart+0x96/0x860
[   69.388777][ T5860]  syscall_exit_to_user_mode+0xce/0x340
[   69.394300][ T5860]  do_syscall_64+0x100/0x230
[   69.398869][ T5860]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   69.404744][ T5860]=20
[   69.407051][ T5860] The buggy address belongs to the object at ffff88814=
1f75c00
[   69.407051][ T5860]  which belongs to the cache kmalloc-512 of size 512
[   69.421095][ T5860] The buggy address is located 8 bytes inside of
[   69.421095][ T5860]  freed 512-byte region [ffff888141f75c00, ffff888141=
f75e00)
[   69.434789][ T5860]=20
[   69.437103][ T5860] The buggy address belongs to the physical page:
[   69.443496][ T5860] page: refcount:0 mapcount:0 mapping:0000000000000000=
 index:0x0 pfn:0x141f74
[   69.452336][ T5860] head: order:2 mapcount:0 entire_mapcount:0 nr_pages_=
mapped:0 pincount:0
[   69.460916][ T5860] flags: 0x57ff00000000040(head|node=3D1|zone=3D2|last=
cpupid=3D0x7ff)
[   69.468547][ T5860] page_type: f5(slab)
[   69.472507][ T5860] raw: 057ff00000000040 ffff88801ac41c80 dead000000000=
100 dead000000000122
[   69.481069][ T5860] raw: 0000000000000000 0000000000100010 00000000f5000=
000 0000000000000000
[   69.489641][ T5860] head: 057ff00000000040 ffff88801ac41c80 dead00000000=
0100 dead000000000122
[   69.498304][ T5860] head: 0000000000000000 0000000000100010 00000000f500=
0000 0000000000000000
[   69.506956][ T5860] head: 057ff00000000002 ffffea000507dd01 ffffffffffff=
ffff 0000000000000000
[   69.515611][ T5860] head: 0000000000000004 0000000000000000 00000000ffff=
ffff 0000000000000000
[   69.524263][ T5860] page dumped because: kasan: bad access detected
[   69.530662][ T5860] page_owner tracks the page as allocated
[   69.536373][ T5860] page last allocated via order 2, migratetype Unmovab=
le, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COM=
P|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 6980091527, free_ts 0
[   69.555979][ T5860]  post_alloc_hook+0x1f4/0x240
[   69.560735][ T5860]  get_page_from_freelist+0x365c/0x37a0
[   69.566268][ T5860]  __alloc_frozen_pages_noprof+0x292/0x710
[   69.572058][ T5860]  alloc_pages_mpol+0x311/0x660
[   69.576894][ T5860]  allocate_slab+0x8f/0x3a0
[   69.581421][ T5860]  ___slab_alloc+0xc27/0x14a0
[   69.586100][ T5860]  __slab_alloc+0x58/0xa0
[   69.590410][ T5860]  __kmalloc_cache_noprof+0x27b/0x390
[   69.595761][ T5860]  wbt_init+0x78/0x510
[   69.599806][ T5860]  blk_register_queue+0x350/0x3d0
[   69.604815][ T5860]  add_disk_fwnode+0x66d/0xfc0
[   69.609561][ T5860]  loop_add+0x81d/0xaf0
[   69.613712][ T5860]  loop_init+0x168/0x220
[   69.617930][ T5860]  do_one_initcall+0x248/0x870
[   69.622673][ T5860]  do_initcall_level+0x157/0x210
[   69.627600][ T5860]  do_initcalls+0x3f/0x80
[   69.631925][ T5860] page_owner free stack trace missing
[   69.637266][ T5860]=20
[   69.639569][ T5860] Memory state around the buggy address:
[   69.645183][ T5860]  ffff888141f75b00: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   69.653231][ T5860]  ffff888141f75b80: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   69.661270][ T5860] >ffff888141f75c00: fa fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   69.669303][ T5860]                       ^
[   69.673603][ T5860]  ffff888141f75c80: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   69.681641][ T5860]  ffff888141f75d00: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   69.689675][ T5860] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   69.699154][ T5860] Kernel panic - not syncing: KASAN: panic_on_warn set=
 ...
[   69.706351][ T5860] CPU: 0 UID: 0 PID: 5860 Comm: syz-executor Not taint=
ed 6.14.0-rc1-syzkaller-00081-gbb066fe812d6-dirty #0
[   69.717706][ T5860] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[   69.727751][ T5860] Call Trace:
[   69.731103][ T5860]  <TASK>
[   69.734019][ T5860]  dump_stack_lvl+0x241/0x360
[   69.738689][ T5860]  ? __pfx_dump_stack_lvl+0x10/0x10
[   69.743874][ T5860]  ? __pfx__printk+0x10/0x10
[   69.748452][ T5860]  ? preempt_schedule+0xe1/0xf0
[   69.753295][ T5860]  ? vscnprintf+0x5d/0x90
[   69.757616][ T5860]  panic+0x349/0x880
[   69.761527][ T5860]  ? check_panic_on_warn+0x21/0xb0
[   69.766629][ T5860]  ? __pfx_panic+0x10/0x10
[   69.771036][ T5860]  ? _raw_spin_unlock_irqrestore+0x130/0x140
[   69.777003][ T5860]  ? __pfx__raw_spin_unlock_irqrestore+0x10/0x10
[   69.783317][ T5860]  ? print_report+0x502/0x550
[   69.787979][ T5860]  check_panic_on_warn+0x86/0xb0
[   69.792906][ T5860]  ? binder_add_device+0x5f/0xa0
[   69.797834][ T5860]  end_report+0x77/0x160
[   69.802063][ T5860]  kasan_report+0x154/0x180
[   69.806550][ T5860]  ? binder_add_device+0x5f/0xa0
[   69.811479][ T5860]  binder_add_device+0x5f/0xa0
[   69.816238][ T5860]  binderfs_binder_device_create+0x7bf/0x9c0
[   69.822211][ T5860]  binderfs_fill_super+0x944/0xd90
[   69.827314][ T5860]  ? __pfx_binderfs_fill_super+0x10/0x10
[   69.832942][ T5860]  ? shrinker_register+0x160/0x230
[   69.838040][ T5860]  ? sget_fc+0x909/0x9c0
[   69.842268][ T5860]  ? __pfx_set_anon_super_fc+0x10/0x10
[   69.847713][ T5860]  ? __pfx_binderfs_fill_super+0x10/0x10
[   69.853334][ T5860]  get_tree_nodev+0xb7/0x140
[   69.857913][ T5860]  vfs_get_tree+0x90/0x2b0
[   69.862321][ T5860]  do_new_mount+0x2be/0xb40
[   69.866830][ T5860]  ? __pfx_do_new_mount+0x10/0x10
[   69.871841][ T5860]  __se_sys_mount+0x2d6/0x3c0
[   69.876509][ T5860]  ? lockdep_hardirqs_on_prepare+0x43d/0x780
[   69.882478][ T5860]  ? __pfx___se_sys_mount+0x10/0x10
[   69.887668][ T5860]  ? do_syscall_64+0x100/0x230
[   69.892418][ T5860]  ? __x64_sys_mount+0x20/0xc0
[   69.897173][ T5860]  do_syscall_64+0xf3/0x230
[   69.901664][ T5860]  ? clear_bhb_loop+0x35/0x90
[   69.906331][ T5860]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   69.912306][ T5860] RIP: 0033:0x7f91065816ba
[   69.916709][ T5860] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1=
a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[   69.936560][ T5860] RSP: 002b:00007ffc27214878 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000a5
[   69.944958][ T5860] RAX: ffffffffffffffda RBX: 00007f91065f3d49 RCX: 000=
07f91065816ba
[   69.952915][ T5860] RDX: 00007f91065ff2fa RSI: 00007f91065f3d49 RDI: 000=
07f91065ff2fa
[   69.960870][ T5860] RBP: 00007f91065f3f58 R08: 0000000000000000 R09: 000=
00000000001ff
[   69.968828][ T5860] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f91065de068
[   69.976793][ T5860] R13: 00007f91065de048 R14: 0000000000000009 R15: 000=
0000000000000
[   69.984760][ T5860]  </TASK>
[   69.988002][ T5860] Kernel Offset: disabled
[   69.992328][ T5860] Rebooting in 86400 seconds..


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
 -ffile-prefix-map=3D/tmp/go-build3133803738=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 29f61fceff
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
/syzkaller/prog.GitRevision=3D29f61fceff5d68b408b9086bff96ca036b503584 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20241205-000301'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"29f61fceff5d68b408b9086bff96ca036b=
503584\"
/usr/bin/ld: /tmp/cc3sNiex.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D108121b0580000


Tested on:

commit:         bb066fe8 Merge tag 'pci-v6.14-fixes-2' of git://git.ke..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=3De1a4da81be23f09=
e
dashboard link: https://syzkaller.appspot.com/bug?extid=3D882589c97d51a9de6=
8eb
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10f8e4a45800=
00

