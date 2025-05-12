Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667424A08
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052166; cv=none; b=iMLqqg7st6ABjhQyNuCWxJOmf+30gln91YhEyCMVt5ipg/UVpSGjoNb6MKUWDQ+W7zClO86nTC0cL6mtbFYc90pTuQmjFr8Du+sxkgsjtQMzlsUN79e6wpDu+4ndtgvBGw+CR5kg4h2Ofdeq1FeWoWHNbmlcQEdw+MUXBo9eLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052166; c=relaxed/simple;
	bh=AqGs5QBrstoVUKcG9ZiPn27GRd91XWv1PB1xSMPmZVU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sw3Sh7r2imOfvM6EqW6Tlrheq/u5LAkHvx19ESI8nnBKjvED40240vrp29VxJRjgkHSUjS2zUHRRaKOoVDp6rE54j3wGMQ/VlkZEOiN6JlrNJcPl8mJ1kxXZVLVKRPk+KwINWbvFkzOW1N3I6GK1yCGCcNvSSnYSMI2Ss4f1APw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d81bc8ec0cso75790825ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747052163; x=1747656963;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LBCP940cz4vwiH8hfsP5hxt+L/A4mcy7JtZ3NKe4M8=;
        b=fAgw8LWR66v4yD6GXRE4Np5v5YURtwMcNFSh2nFNBZ8wyPS+3oi2/VytJc+JtJ8Nhu
         t6K/dVYz3sOREhsvrzihveckJDqz2x9rnANnT+TTj8u8xP3SjowY7egdjeV9PQy/e4wo
         lpGjPIalnVzP6fbY9cume/vZjT7EDmnOZ4gV3N1qD6WpI9GqtUD7TVM/VJ84y98ySlgn
         YdqmUNDaTibmFls/MejpfM0ge3v0qcYwvX09fubxkI6WmZfA7rN3FPyQP0Cs6+tV9UZ6
         YFH8Phpk9tUYVQpxzA2S7op1KN83FB/3DTWM7a8R+unxejIrve3blN/k9iCZdHe40TwQ
         RQ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVT7GGTqzVAzSShnznws0kelQjXXtShbBtjP0slBObo1bCc7WSGrqmMtIeGOozYjxyxsC5JPg3ipiqOOG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAHPg9kjbvFWf2UJ19QxBmWhQfewGnSVVPdW5nooxDZQqWVck7
	zwwgOBR7MQfJB8G4O2LM4yIAlBnwHA9IgIq4pxIJ50N4iZhF2sXxVyDinWOiaeN6d6MDqPKQODs
	IrMYUS5BkJEGjuOSbsZ2vR/ALZJQGkRWsz6bGKYPAzq9J7dwvnx8iszI=
X-Google-Smtp-Source: AGHT+IHy6GYD48uBtn0fIlPE0vgLqeJBNfpJVhh3TVcm761EXXT4eoMt0kgcpBHYY+p5fMqHC9ICEYsLluSya1fw/46K3BZEtOGz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca45:0:b0:3d9:4172:eecf with SMTP id
 e9e14a558f8ab-3da7e1e1b07mr151991205ab.3.1747052163505; Mon, 12 May 2025
 05:16:03 -0700 (PDT)
Date: Mon, 12 May 2025 05:16:03 -0700
In-Reply-To: <20250512103556.1921-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6821e683.050a0220.f2294.005a.GAE@google.com>
Subject: Re: [syzbot] [fs?] [efi?] BUG: unable to handle kernel paging request
 in alloc_fs_context
From: syzbot <syzbot+52cd651546d11d2af06b@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

1a0db80
[   50.686008][    C1] x20: 100000023ea8e403 x19: 0000000000000001 x18: 1ff=
fe0003386f276
[   50.688206][    C1] x17: ffff80010d10c000 x16: ffff80008051bab8 x15: 000=
0000000000001
[   50.690427][    C1] x14: 1ffff00012dfb9d3 x13: 0000000000000000 x12: 000=
0000000000000
[   50.692586][    C1] x11: ffff700012dfb9d4 x10: 0000000000ff0100 x9 : 000=
0000000000000
[   50.694762][    C1] x8 : ffff0000c1a0db80 x7 : ffff800080c2b0a4 x6 : 000=
0000000000000
[   50.697084][    C1] x5 : 0000000000000001 x4 : ffff800080017ae0 x3 : fff=
f8000802595f4
[   50.699307][    C1] x2 : 0000000000001000 x1 : 0000000000000100 x0 : 000=
0000000000000
[   50.701519][    C1] Call trace:
[   50.702384][    C1]  __apply_to_page_range+0xdb4/0x13e4 (P)
[   50.703979][    C1]  apply_to_page_range+0x4c/0x64
[   50.705324][    C1]  __change_memory_common+0xac/0x3f8
[   50.706701][    C1]  set_memory_valid+0x68/0x7c
[   50.707998][    C1]  kfence_guarded_free+0x278/0x5a8
[   50.709452][    C1]  __kfence_free+0x104/0x198
[   50.710773][    C1]  kfree+0x268/0x474
[   50.711881][    C1]  kfree_const+0x4c/0x5c
[   50.713049][    C1]  kernfs_free_rcu+0x44/0x10c
[   50.714419][    C1]  rcu_core+0x848/0x17a4
[   50.715638][    C1]  rcu_core_si+0x10/0x1c
[   50.716822][    C1]  handle_softirqs+0x328/0xc88
[   50.718177][    C1]  __do_softirq+0x14/0x20
[   50.719375][    C1]  ____do_softirq+0x14/0x20
[   50.720644][    C1]  call_on_irq_stack+0x24/0x30
[   50.721954][    C1]  do_softirq_own_stack+0x20/0x2c
[   50.723366][    C1]  __irq_exit_rcu+0x1b0/0x478
[   50.724682][    C1]  irq_exit_rcu+0x14/0x84
[   50.725924][    C1]  el1_interrupt+0x38/0x54
[   50.727207][    C1]  el1h_64_irq_handler+0x18/0x24
[   50.728623][    C1]  el1h_64_irq+0x6c/0x70
[   50.729813][    C1]  arch_local_irq_enable+0x8/0xc (P)
[   50.731273][    C1]  do_idle+0x1d8/0x454
[   50.732429][    C1]  cpu_startup_entry+0x5c/0x74
[   50.733755][    C1]  secondary_start_kernel+0x1b8/0x1e0
[   50.735283][    C1]  __secondary_switched+0xc0/0xc4
[   50.736649][    C1] irq event stamp: 183085
[   50.737808][    C1] hardirqs last  enabled at (183084): [<ffff80008add92=
60>] _raw_spin_unlock_irqrestore+0x38/0x98
[   50.740790][    C1] hardirqs last disabled at (183085): [<ffff80008adb36=
f0>] el1_dbg+0x24/0x80
[   50.743274][    C1] softirqs last  enabled at (183056): [<ffff8000803ce7=
1c>] handle_softirqs+0xaf8/0xc88
[   50.745975][    C1] softirqs last disabled at (183063): [<ffff800080020e=
fc>] __do_softirq+0x14/0x20
[   50.748444][    C1] ---[ end trace 0000000000000000 ]---
[   50.812816][ T6497] cgroup: Unknown subsys name 'cpuset'
[   50.816645][ T6497] cgroup: Unknown subsys name 'rlimit'
[   51.050390][    C1] ------------[ cut here ]------------
[   51.050431][    C1] WARNING: CPU: 1 PID: 0 at ./arch/arm64/include/asm/p=
gtable.h:82 __apply_to_page_range+0xdb4/0x13e4
[   51.054712][    C1] Modules linked in:
[   51.055752][    C1] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G     =
   W           6.15.0-rc5-syzkaller-00074-gac57c6b0f09c-dirty #0 PREEMPT=20
[   51.059187][    C1] Tainted: [W]=3DWARN
[   51.060165][    C1] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[   51.062773][    C1] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[   51.064825][    C1] pc : __apply_to_page_range+0xdb4/0x13e4
[   51.066326][    C1] lr : __apply_to_page_range+0xdb4/0x13e4
[   51.067828][    C1] sp : ffff8000800178e0
[   51.068927][    C1] x29: ffff800080017a00 x28: ffff0001ffab6fff x27: fff=
f0001fec50fe8
[   51.071091][    C1] x26: ffff0001ffab7000 x25: dfff800000000000 x24: fff=
f0001ffab6000
[   51.073228][    C1] x23: ffff0001fea8e5b0 x22: 0000000000000100 x21: fff=
f0000c1a0db80
[   51.075383][    C1] x20: 100000023ea8e403 x19: 0000000000000001 x18: 1ff=
fe0003386f276
[   51.077521][    C1] x17: 0000000000a000ae x16: ffff80008051bab8 x15: 000=
0000000000001
[   51.079741][    C1] x14: 1ffff00012dfb9d3 x13: 0000000000000000 x12: 000=
0000000000000
[   51.081960][    C1] x11: ffff700012dfb9d4 x10: 0000000000ff0100 x9 : 000=
0000000000000
[   51.084085][    C1] x8 : ffff0000c1a0db80 x7 : ffff800080c2b0a4 x6 : 000=
0000000000000
[   51.086325][    C1] x5 : 0000000000000001 x4 : ffff800080017ae0 x3 : fff=
f8000802595f4
[   51.088580][    C1] x2 : 0000000000001000 x1 : 0000000000000100 x0 : 000=
0000000000000
[   51.090693][    C1] Call trace:
[   51.091603][    C1]  __apply_to_page_range+0xdb4/0x13e4 (P)
[   51.093081][    C1]  apply_to_page_range+0x4c/0x64
[   51.094442][    C1]  __change_memory_common+0xac/0x3f8
[   51.096008][    C1]  set_memory_valid+0x68/0x7c
[   51.097312][    C1]  kfence_guarded_free+0x278/0x5a8
[   51.098643][    C1]  __kfence_free+0x104/0x198
[   51.099879][    C1]  kfree+0x268/0x474
[   51.100930][    C1]  kfree_const+0x4c/0x5c
[   51.102050][    C1]  kernfs_free_rcu+0x44/0x10c
[   51.103361][    C1]  rcu_core+0x848/0x17a4
[   51.104517][    C1]  rcu_core_si+0x10/0x1c
[   51.105679][    C1]  handle_softirqs+0x328/0xc88
[   51.107031][    C1]  __do_softirq+0x14/0x20
[   51.108222][    C1]  ____do_softirq+0x14/0x20
[   51.109457][    C1]  call_on_irq_stack+0x24/0x30
[   51.110782][    C1]  do_softirq_own_stack+0x20/0x2c
[   51.112116][    C1]  __irq_exit_rcu+0x1b0/0x478
[   51.113392][    C1]  irq_exit_rcu+0x14/0x84
[   51.114620][    C1]  el1_interrupt+0x38/0x54
[   51.115842][    C1]  el1h_64_irq_handler+0x18/0x24
[   51.117189][    C1]  el1h_64_irq+0x6c/0x70
[   51.118353][    C1]  arch_local_irq_enable+0x8/0xc (P)
[   51.119867][    C1]  do_idle+0x1d8/0x454
[   51.121024][    C1]  cpu_startup_entry+0x5c/0x74
[   51.122337][    C1]  secondary_start_kernel+0x1b8/0x1e0
[   51.123823][    C1]  __secondary_switched+0xc0/0xc4
[   51.125178][    C1] irq event stamp: 184981
[   51.126326][    C1] hardirqs last  enabled at (184980): [<ffff80008add92=
60>] _raw_spin_unlock_irqrestore+0x38/0x98
[   51.129228][    C1] hardirqs last disabled at (184981): [<ffff80008adb36=
f0>] el1_dbg+0x24/0x80
[   51.131633][    C1] softirqs last  enabled at (184782): [<ffff8000803ce7=
1c>] handle_softirqs+0xaf8/0xc88
[   51.134331][    C1] softirqs last disabled at (184797): [<ffff800080020e=
fc>] __do_softirq+0x14/0x20
[   51.136877][    C1] ---[ end trace 0000000000000000 ]---
[   51.243748][ T6497] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k SS
[   51.690075][    C0] ------------[ cut here ]------------
[   51.690111][    C0] WARNING: CPU: 0 PID: 6491 at ./arch/arm64/include/as=
m/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4
[   51.694504][    C0] Modules linked in:
[   51.695522][    C0] CPU: 0 UID: 0 PID: 6491 Comm: syz-execprog Tainted: =
G        W           6.15.0-rc5-syzkaller-00074-gac57c6b0f09c-dirty #0 PREE=
MPT=20
[   51.699101][    C0] Tainted: [W]=3DWARN
[   51.700080][    C0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[   51.702686][    C0] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[   51.704754][    C0] pc : __apply_to_page_range+0xdb4/0x13e4
[   51.706283][    C0] lr : __apply_to_page_range+0xdb4/0x13e4
[   51.707787][    C0] sp : ffff8000800078a0
[   51.708883][    C0] x29: ffff8000800079c0 x28: ffff0001ffabafff x27: fff=
f0001fec50fe8
[   51.711000][    C0] x26: ffff0001ffabb000 x25: dfff800000000000 x24: fff=
f0001ffaba000
[   51.713161][    C0] x23: ffff0001fea8e5d0 x22: 0000000000000100 x21: fff=
f0000cbe1bd00
[   51.715296][    C0] x20: 100000023ea8e403 x19: 0000000000000001 x18: 000=
0000000000000
[   51.717395][    C0] x17: ffff80010d0e8000 x16: ffff80008051bab8 x15: 000=
0000000000001
[   51.719486][    C0] x14: 1ffff00012dfb9de x13: 0000000000000000 x12: 000=
0000000000000
[   51.721692][    C0] x11: ffff700012dfb9df x10: 0000000000ff0100 x9 : 000=
0000000000000
[   51.723778][    C0] x8 : ffff0000cbe1bd00 x7 : ffff800080c2b0a4 x6 : 000=
0000000000000
[   51.725938][    C0] x5 : 0000000000000001 x4 : ffff800080007aa0 x3 : fff=
f8000802595f4
[   51.728091][    C0] x2 : 0000000000001000 x1 : 0000000000000100 x0 : 000=
0000000000000
[   51.730331][    C0] Call trace:
[   51.731253][    C0]  __apply_to_page_range+0xdb4/0x13e4 (P)
[   51.732812][    C0]  apply_to_page_range+0x4c/0x64
[   51.734169][    C0]  __change_memory_common+0xac/0x3f8
[   51.735625][    C0]  set_memory_valid+0x68/0x7c
[   51.736923][    C0]  kfence_guarded_free+0x278/0x5a8
[   51.738333][    C0]  __kfence_free+0x104/0x198
[   51.739625][    C0]  kmem_cache_free+0x250/0x550
[   51.740976][    C0]  ptlock_free+0x54/0x6c
[   51.742137][    C0]  __tlb_remove_table+0x30/0x274
[   51.743585][    C0]  tlb_remove_table_rcu+0x8c/0x19c
[   51.744997][    C0]  rcu_core+0x848/0x17a4
[   51.746179][    C0]  rcu_core_si+0x10/0x1c
[   51.747292][    C0]  handle_softirqs+0x328/0xc88
[   51.748528][    C0]  __do_softirq+0x14/0x20
[   51.749673][    C0]  ____do_softirq+0x14/0x20
[   51.750870][    C0]  call_on_irq_stack+0x24/0x30
[   51.752212][    C0]  do_softirq_own_stack+0x20/0x2c
[   51.753708][    C0]  __irq_exit_rcu+0x1b0/0x478
[   51.754990][    C0]  irq_exit_rcu+0x14/0x84
[   51.756184][    C0]  el0_interrupt+0x70/0x1cc
[   51.757440][    C0]  __el0_irq_handler_common+0x18/0x24
[   51.758933][    C0]  el0t_64_irq_handler+0x10/0x1c
[   51.760272][    C0]  el0t_64_irq+0x198/0x19c
[   51.761565][    C0] irq event stamp: 286065
[   51.762786][    C0] hardirqs last  enabled at (286064): [<ffff80008add92=
60>] _raw_spin_unlock_irqrestore+0x38/0x98
[   51.765644][    C0] hardirqs last disabled at (286065): [<ffff80008adb36=
f0>] el1_dbg+0x24/0x80
[   51.768096][    C0] softirqs last  enabled at (283478): [<ffff8000801fbf=
10>] local_bh_enable+0x10/0x34
[   51.770695][    C0] softirqs last disabled at (286021): [<ffff800080020e=
fc>] __do_softirq+0x14/0x20
[   51.773251][    C0] ---[ end trace 0000000000000000 ]---
[   51.774951][    C0] ------------[ cut here ]------------
[   51.774972][    C0] WARNING: CPU: 0 PID: 6491 at ./arch/arm64/include/as=
m/pgtable.h:82 __apply_to_page_range+0xdb4/0x13e4
[   51.779515][    C0] Modules linked in:
[   51.780538][    C0] CPU: 0 UID: 0 PID: 6491 Comm: syz-execprog Tainted: =
G        W           6.15.0-rc5-syzkaller-00074-gac57c6b0f09c-dirty #0 PREE=
MPT=20
[   51.784203][    C0] Tainted: [W]=3DWARN
[   51.785252][    C0] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 02/12/2025
[   51.787997][    C0] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
[   51.790115][    C0] pc : __apply_to_page_range+0xdb4/0x13e4
[   51.791695][    C0] lr : __apply_to_page_range+0xdb4/0x13e4
[   51.793255][    C0] sp : ffff8000800078a0
[   51.794412][    C0] x29: ffff8000800079c0 x28: ffff0001ffabcfff x27: fff=
f0001fec50fe8
[   51.796586][    C0] x26: ffff0001ffabd000 x25: dfff800000000000 x24: fff=
f0001ffabc000
[   51.798868][    C0] x23: ffff0001fea8e5e0 x22: 0000000000000100 x21: fff=
f0000cbe1bd00
[   51.800997][    C0] x20: 100000023ea8e403 x19: 0000000000000001 x18: 000=
0000000000000
[   51.803201][    C0] x17: ffff80010d0e8000 x16: ffff80008051bab8 x15: 000=
0000000000001
[   51.805436][    C0] x14: 1ffff00012dfb9de x13: 0000000000000000 x12: 000=
0000000000000
[   51.807588][    C0] x11: ffff700012dfb9df x10: 0000000000ff0100 x9 : 000=
0000000000000
[   51.809768][    C0] x8 : ffff0000cbe1bd00 x7 : ffff800080c2b0a4 x6 : 000=
0000000000000
[   51.811888][    C0] x5 : 0000000000000001 x4 : ffff800080007aa0 x3 : fff=
f8000802595f4
[   51.814041][    C0] x2 : 0000000000001000 x1 : 0000000000000100 x0 : 000=
0000000000000
[   51.816212][    C0] Call trace:
[   51.817092][    C0]  __apply_to_page_range+0xdb4/0x13e4 (P)
[   51.818619][    C0]  apply_to_page_range+0x4c/0x64
[   51.820066][    C0]  __change_memory_common+0xac/0x3f8
[   51.821458][    C0]  set_memory_valid+0x68/0x7c
[   51.822766][    C0]  kfence_guarded_free+0x278/0x5a8
[   51.824160][    C0]  __kfence_free+0x104/0x198
[   51.825411][    C0]  kmem_cache_free+0x250/0x550
[   51.826691][    C0]  ptlock_free+0x54/0x6c
[   51.827867][    C0]  __tlb_remove_table+0x30/0x274
[   51.829272][    C0]  tlb_remove_table_rcu+0x8c/0x19c
[   51.830704][    C0]  rcu_core+0x848/0x17a4
[   51.831879][    C0]  rcu_core_si+0x10/0x1c
[   51.833075][    C0]  handle_softirqs+0x328/0xc88
[   51.834388][    C0]  __do_softirq+0x14/0x20
[   51.835549][    C0]  ____do_softirq+0x14/0x20
[   51.836791][    C0]  call_on_irq_stack+0x24/0x30
[   51.838086][    C0]  do_softirq_own_stack+0x20/0x2c
[   51.839483][    C0]  __irq_exit_rcu+0x1b0/0x478
[   51.840787][    C0]  irq_exit_rcu+0x14/0x84
[   51.841957][    C0]  el0_interrupt+0x70/0x1cc
[   51.843202][    C0]  __el0_irq_handler_common+0x18/0x24
[   51.844787][    C0]  el0t_64_irq_handler+0x10/0x1c
[   51.846102][    C0]  el0t_64_irq+0x198/0x19c
[   51.847396][    C0] irq event stamp: 286155
[   51.848596][    C0] hardirqs last  enabled at (286154): [<ffff80008add92=
60>] _raw_spin_unlock_irqrestore+0x38/0x98
[   51.851518][    C0] hardirqs last disabled at (286155): [<ffff80008adb36=
f0>] el1_dbg+0x24/0x80
[   51.853934][    C0] softirqs last  enabled at (283478): [<ffff8000801fbf=
10>] local_bh_enable+0x10/0x34
[   51.856474][    C0] softirqs last disabled at (286021): [<ffff800080020e=
fc>] __do_softirq+0x14/0x20
[   51.858941][    C0] ---[ end trace 0000000000000000 ]---


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
 -ffile-prefix-map=3D/tmp/go-build2619555960=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at 77908e5f2ae
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
GOOS=3Dlinux GOARCH=3Darm64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3D77908e5f2ae80bee6d434bca762a25a0a5fc6a83 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250509-090543'" -o ./b=
in/linux_arm64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_arm64
aarch64-linux-gnu-g++ -o ./bin/linux_arm64/syz-executor executor/executor.c=
c \
	-O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wframe-l=
arger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-format-ove=
rflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -stati=
c-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH_arm6=
4=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"77908e5f2ae80bee6d434bca762a25a0a5=
fc6a83\"
/usr/lib/gcc-cross/aarch64-linux-gnu/12/../../../../aarch64-linux-gnu/bin/l=
d: /tmp/cc7JM2Ed.o: in function `Connection::Connect(char const*, char cons=
t*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0xd8): warning: Using 'gethostbyname' in statically linked applicati=
ons requires at runtime the shared libraries from the glibc version used fo=
r linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D1270ccd4580000


Tested on:

commit:         ac57c6b0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it for-kernelci
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dea4635ffd6ad5b4=
a
dashboard link: https://syzkaller.appspot.com/bug?extid=3D52cd651546d11d2af=
06b
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-=
1~exp1~20250402004600.97), Debian LLD 20.1.2
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D16d1a2f45800=
00

