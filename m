Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EABE151985
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756445; cv=none; b=GSVKwZ59E+V9m4jsv1NQ2YzPdYxx85vqXy6chlVnvAM29Us59MruK449HmG3dbX8Y/OwwfCrD0JAfi2ymBNKSHDA0VQrl3qGZ2dR4istFUfWqkvjKXDc+s+PVN2yrXZOR6BHn3fslIGq1vqoGT3NS0IQybTe/DRn5U0aRh2X4Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756445; c=relaxed/simple;
	bh=+yRQUJihDV9tvG5LnxmsycoiL/pGNzPjIvZE0nE9VuA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=msSjc7kHzzVadFkespLvNVoaQtxGVQrxknvCJG9yG2PcDOMpj0SPPep87uCfMR2XgazrSuUbfiD4IFt1Rb07TmnWGlfv1hy933qCMJS+jUfweymnIULPRMNzsSKSNqbOM9z4o7CHssuKkiLWhRpCji5O7SKqBfGIlbh9L9tSL98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so37805965ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738756442; x=1739361242;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42Lvz+0jZBp+gFYclYnbOkw0qx2nF5nn+F/WopuPd+Y=;
        b=St26vQfe8CYGFlej4XvLLxa7O7IOE/4KGLz7MTUHHg5I+3j+EHojfJPu3ehoEIAm+p
         BzfwhDnb2tTEIELQOii7UHQYqc0HySBDXVCeRrHygha+R46eucvKyamrXu5LJt43bUjM
         ljRgtDQ71WbBsuspvA4qsPFHAeSS+RSbUIVpMlSiV/I6N/JaBldgZeyIuMLEMb9ciIzB
         /LtTQh4CAsEYYWiUR5xapuUzqUhA2f4qx6qZ22niyEEKkv/9RkkGpqjYj4Q3T83g3eV0
         LDZ8yqCcQUwN4/DQ5YT1bmiOn/Lgoq4ydCnK5v3aiurAwFzP8rGRobiBQ9OCWkdtUj3K
         0ZhA==
X-Forwarded-Encrypted: i=1; AJvYcCW+A+djOLU6hB6aFpPLLpqwBhTDoblP0u2nh3lXbb9dBOIUahvYL6qmLBBLf2TggAJ0EWiklcFtAOUfIcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzghlNwVuiTISwL6aG76eTtKTeqHvKRzJ54bLhh+7CRL/TvXOZr
	j+bEBIwBHSberoqKofERKOH7tHjU0vzGQogccA2KN1SpGwrZeh/dpBtc01CBJN9ZaocRtq0rJqq
	xbcsUhDUAPgbajMP+uiHVcT7YrmnCnL/c4f2Hk3MElaHcVy2K2Geu69M=
X-Google-Smtp-Source: AGHT+IGM+F/4tiRWGTYMlA3pJ5kP4+/0bcEk4Zny68aSxiVwD3XKmanT33kAs5I4YZ+MBX5iR9pfbiVqjFqSHECNuf+g69K0lQR8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1705:b0:3a7:87f2:b010 with SMTP id
 e9e14a558f8ab-3d04f4052damr24601615ab.5.1738756442054; Wed, 05 Feb 2025
 03:54:02 -0800 (PST)
Date: Wed, 05 Feb 2025 03:54:02 -0800
In-Reply-To: <20250205113426.1976-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a3515a.050a0220.50516.0041.GAE@google.com>
Subject: Re: [syzbot] [net?] general protection fault in ip6_pol_route (3)
From: syzbot <syzbot+3201be560ebfa39bc6bd@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

 79.765602][ T5343]=20
[   79.766558][ T5343] The buggy address belongs to the physical page:
[   79.769019][ T5343] page: refcount:0 mapcount:0 mapping:0000000000000000=
 index:0x0 pfn:0x4f464
[   79.772366][ T5343] head: order:1 mapcount:0 entire_mapcount:0 nr_pages_=
mapped:0 pincount:0
[   79.775598][ T5343] anon flags: 0x4fff00000000040(head|node=3D1|zone=3D1=
|lastcpupid=3D0x7ff)
[   79.778676][ T5343] page_type: f5(slab)
[   79.780232][ T5343] raw: 04fff00000000040 ffff88801ac41c80 0000000000000=
000 dead000000000001
[   79.783372][ T5343] raw: 0000000000000000 0000000000080008 00000000f5000=
000 0000000000000000
[   79.786627][ T5343] head: 04fff00000000040 ffff88801ac41c80 000000000000=
0000 dead000000000001
[   79.789858][ T5343] head: 0000000000000000 0000000000080008 00000000f500=
0000 0000000000000000
[   79.793129][ T5343] head: 04fff00000000001 ffffea00013d1901 ffffffffffff=
ffff 0000000000000000
[   79.796507][ T5343] head: 0000000000000002 0000000000000000 00000000ffff=
ffff 0000000000000000
[   79.799785][ T5343] page dumped because: kasan: bad access detected
[   79.802261][ T5343] page_owner tracks the page as allocated
[   79.804507][ T5343] page last allocated via order 1, migratetype Unmovab=
le, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COM=
P|__GFP_NOMEMALLOC), pid 5329, tgid 5329 (syz-executor), ts 78415084094, fr=
ee_ts 78169759446
[   79.812368][ T5343]  post_alloc_hook+0x1f4/0x240
[   79.814298][ T5343]  get_page_from_freelist+0x365c/0x37a0
[   79.816463][ T5343]  __alloc_frozen_pages_noprof+0x292/0x710
[   79.818703][ T5343]  alloc_pages_mpol+0x311/0x660
[   79.820563][ T5343]  allocate_slab+0x8f/0x3a0
[   79.822338][ T5343]  ___slab_alloc+0xc27/0x14a0
[   79.824253][ T5343]  __slab_alloc+0x58/0xa0
[   79.825926][ T5343]  __kmalloc_cache_noprof+0x27b/0x390
[   79.827981][ T5343]  binderfs_fill_super+0x58e/0xd90
[   79.829916][ T5343]  get_tree_nodev+0xb7/0x140
[   79.831720][ T5343]  vfs_get_tree+0x90/0x2b0
[   79.833832][ T5343]  do_new_mount+0x2be/0xb40
[   79.835650][ T5343]  __se_sys_mount+0x2d6/0x3c0
[   79.837488][ T5343]  do_syscall_64+0xf3/0x230
[   79.839249][ T5343]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   79.841466][ T5343] page last free pid 80 tgid 80 stack trace:
[   79.843812][ T5343]  free_unref_folios+0xe40/0x18b0
[   79.845786][ T5343]  shrink_folio_list+0x41a7/0x5ac0
[   79.847791][ T5343]  evict_folios+0x45fd/0x56a0
[   79.849591][ T5343]  try_to_shrink_lruvec+0x713/0x9b0
[   79.851656][ T5343]  shrink_one+0x3b9/0x850
[   79.853309][ T5343]  shrink_node+0x37c5/0x3e50
[   79.855093][ T5343]  kswapd+0x20f3/0x3b10
[   79.856715][ T5343]  kthread+0x7a9/0x920
[   79.858297][ T5343]  ret_from_fork+0x4b/0x80
[   79.859943][ T5343]  ret_from_fork_asm+0x1a/0x30
[   79.861728][ T5343]=20
[   79.862691][ T5343] Memory state around the buggy address:
[   79.864899][ T5343]  ffff88804f464700: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   79.868793][ T5343]  ffff88804f464780: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   79.871847][ T5343] >ffff88804f464800: fa fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   79.875096][ T5343]                       ^
[   79.876814][ T5343]  ffff88804f464880: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   79.879777][ T5343]  ffff88804f464900: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   79.882810][ T5343] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   80.174438][ T1033] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   80.177606][ T1033] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   80.241533][ T1068] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   80.255404][ T1068] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   80.841220][ T5343] Kernel panic - not syncing: KASAN: panic_on_warn set=
 ...
[   80.844058][ T5343] CPU: 0 UID: 0 PID: 5343 Comm: syz-executor Not taint=
ed 6.14.0-rc1-syzkaller-g5c8c229261f1-dirty #0
[   80.848035][ T5343] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[   80.852045][ T5343] Call Trace:
[   80.853331][ T5343]  <TASK>
[   80.854460][ T5343]  dump_stack_lvl+0x241/0x360
[   80.856209][ T5343]  ? __pfx_dump_stack_lvl+0x10/0x10
[   80.858174][ T5343]  ? __pfx__printk+0x10/0x10
[   80.859914][ T5343]  ? preempt_schedule+0xe1/0xf0
[   80.861752][ T5343]  ? vscnprintf+0x5d/0x90
[   80.863363][ T5343]  panic+0x349/0x880
[   80.864858][ T5343]  ? check_panic_on_warn+0x21/0xb0
[   80.866780][ T5343]  ? __pfx_panic+0x10/0x10
[   80.868454][ T5343]  ? _raw_spin_unlock_irqrestore+0x130/0x140
[   80.870716][ T5343]  ? __pfx__raw_spin_unlock_irqrestore+0x10/0x10
[   80.873049][ T5343]  ? print_report+0x502/0x550
[   80.874886][ T5343]  check_panic_on_warn+0x86/0xb0
[   80.876762][ T5343]  ? binder_add_device+0x5f/0xa0
[   80.878699][ T5343]  end_report+0x77/0x160
[   80.880307][ T5343]  kasan_report+0x154/0x180
[   80.882054][ T5343]  ? binder_add_device+0x5f/0xa0
[   80.883951][ T5343]  binder_add_device+0x5f/0xa0
[   80.885778][ T5343]  binderfs_binder_device_create+0x7bf/0x9c0
[   80.888011][ T5343]  binderfs_fill_super+0x944/0xd90
[   80.889968][ T5343]  ? __pfx_binderfs_fill_super+0x10/0x10
[   80.892086][ T5343]  ? shrinker_register+0x160/0x230
[   80.893912][ T5343]  ? sget_fc+0x909/0x9c0
[   80.895358][ T5343]  ? __pfx_set_anon_super_fc+0x10/0x10
[   80.897187][ T5343]  ? __pfx_binderfs_fill_super+0x10/0x10
[   80.899300][ T5343]  get_tree_nodev+0xb7/0x140
[   80.901061][ T5343]  vfs_get_tree+0x90/0x2b0
[   80.902772][ T5343]  do_new_mount+0x2be/0xb40
[   80.904510][ T5343]  ? __pfx_do_new_mount+0x10/0x10
[   80.906387][ T5343]  __se_sys_mount+0x2d6/0x3c0
[   80.908141][ T5343]  ? lockdep_hardirqs_on_prepare+0x43d/0x780
[   80.910345][ T5343]  ? __pfx___se_sys_mount+0x10/0x10
[   80.912308][ T5343]  ? do_syscall_64+0x100/0x230
[   80.914126][ T5343]  ? __x64_sys_mount+0x20/0xc0
[   80.915911][ T5343]  do_syscall_64+0xf3/0x230
[   80.917629][ T5343]  ? clear_bhb_loop+0x35/0x90
[   80.919384][ T5343]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   80.921583][ T5343] RIP: 0033:0x7fc18af7feba
[   80.923238][ T5343] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1=
a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[   80.930263][ T5343] RSP: 002b:00007fffe7bd7398 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000a5
[   80.933382][ T5343] RAX: ffffffffffffffda RBX: 00007fc18aff1b21 RCX: 000=
07fc18af7feba
[   80.936291][ T5343] RDX: 00007fc18affcfa8 RSI: 00007fc18aff1b21 RDI: 000=
07fc18affcfa8
[   80.939200][ T5343] RBP: 0000000000000000 R08: 0000000000000000 R09: 000=
0000000000000
[   80.942081][ T5343] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07fc18b005050
[   80.944983][ T5343] R13: 00007fffe7bd7418 R14: 0000000000000009 R15: 000=
0000000000000
[   80.947863][ T5343]  </TASK>
[   80.949295][ T5343] Kernel Offset: disabled
[   80.950938][ T5343] Rebooting in 86400 seconds..

VM DIAGNOSIS:
11:53:19  Registers:
info registers vcpu 0

CPU#0
RAX=3D000000000000007a RBX=3Dffffffff9a718760 RCX=3D0000000000000000 RDX=3D=
00000000000003f8
RSI=3D0000000000000000 RDI=3D0000000000000020 RBP=3D0000000000000000 RSP=3D=
ffffc9000d3171d0
R8 =3Dffffffff856cbbeb R9 =3D1ffff110067ff046 R10=3Ddffffc0000000000 R11=3D=
ffffffff856cbba0
R12=3Ddffffc0000000000 R13=3D000000000000007a R14=3D000000000000007a R15=3D=
00000000000003f8
RIP=3Dffffffff856cbc1e RFL=3D00000002 [-------] CPL=3D0 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 ffffffff 00c00000
CS =3D0010 0000000000000000 ffffffff 00a09b00 DPL=3D0 CS64 [-RA]
SS =3D0018 0000000000000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
DS =3D0000 0000000000000000 ffffffff 00c00000
FS =3D0000 000055558166b500 ffffffff 00c00000
GS =3D0000 ffff88801fc00000 ffffffff 00c00000
LDT=3D0000 0000000000000000 ffffffff 00c00000
TR =3D0040 fffffe0000003000 00004087 00008b00 DPL=3D0 TSS64-busy
GDT=3D     fffffe0000001000 0000007f
IDT=3D     fffffe0000000000 00000fff
CR0=3D80050033 CR2=3D00007fc18ae4af90 CR3=3D000000004f316000 CR4=3D00352ef0
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000=20
DR6=3D00000000fffe0ff0 DR7=3D0000000000000400
EFER=3D0000000000000d01
FCW=3D037f FSW=3D0000 [ST=3D0] FTW=3D00 MXCSR=3D00001f80
FPR0=3D0000000000000000 0000 FPR1=3D0000000000000000 0000
FPR2=3D0000000000000000 0000 FPR3=3D0000000000000000 0000
FPR4=3D0000000000000000 0000 FPR5=3D0000000000000000 0000
FPR6=3D0000000000000000 0000 FPR7=3D0000000000000000 0000
Opmask00=3D00000000ffffff80 Opmask01=3D000000000000000f Opmask02=3D00000000=
ffffffef Opmask03=3D0000000000000000
Opmask04=3D0000000000000000 Opmask05=3D0000000000000000 Opmask06=3D00000000=
00000000 Opmask07=3D0000000000000000
ZMM00=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM01=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 00007fffe7bd73b0 0000003000000010
ZMM02=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM03=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM04=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM05=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM06=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM07=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM08=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM09=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM10=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM11=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM12=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM13=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM14=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM15=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM16=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM17=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 2525252525252525 2525252525252525 2525252525252525 2525252525252525
ZMM18=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 6573726170206f74 2064656c69616600 277325273d727473 0035333535362030
ZMM19=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 4056574455054a51 054140494c444300 0256000218575156 0010161010130515
ZMM20=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM21=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM22=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM23=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM24=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM25=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM26=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM27=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM28=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM29=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM30=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000
ZMM31=3D0000000000000000 0000000000000000 0000000000000000 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000 0000000000000000


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
 -ffile-prefix-map=3D/tmp/go-build102701335=3D/tmp/go-build -gno-record-gcc=
-switches'

git status (err=3D<nil>)
HEAD detached at 4dfba277487
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
/syzkaller/prog.GitRevision=3D4dfba277487a7023ab9f5783302da4a9b5e9bef8 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20241113-111659'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"4dfba277487a7023ab9f5783302da4a9b5=
e9bef8\"
/usr/bin/ld: /tmp/ccOQNa87.o: in function `test_cover_filter()':
executor.cc:(.text+0x1426b): warning: the use of `tempnam' is dangerous, be=
tter use `mkstemp'
/usr/bin/ld: /tmp/ccOQNa87.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D131f44a4580000


Tested on:

commit:         5c8c2292 Merge tag 'kthreads-fixes-2025-02-04' of git:..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd256a021904f1cd=
7
dashboard link: https://syzkaller.appspot.com/bug?extid=3D3201be560ebfa39bc=
6bd
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debia=
n) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D109493df9800=
00

