Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DD38385
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746883899; cv=none; b=IFpol3zZC3kue5qkzmyS29HgHC1HzwXLNHwvCvOY8cGRIQCax7kna+LXu4TsadyJWDDxrUSp+/Rkdc3n4r1tu7ecqNzV0LrBrVxBgSWswqfKLOVbwi6q08u6XTWh7N3q1DPAwu+jMrPAfJIvup7zAgaNI2iqQxjS0tJlmAO3m3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746883899; c=relaxed/simple;
	bh=9ZwPwjMp0Hxfd9fdkEM02NqZ4uA2RlXeCJBasucJVUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUgDZMWy6wYLdZWgMwv6gGxEdty0r/b4uR7je6EQGAYMamW+z0JssWRaUoKR9U2+4/gzaapQy/wdJ2gnmfb82FazprEi2/siJ9hYrRWkCsSU/s9LIZ/Z1nxEDaNphVXOXDoRpkcOH/n/X5lap44153wT8b4HHew19TsgWwsSL28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYwJkCYS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYwJkCYS"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so3897424e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 06:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746883895; x=1747488695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL6Fvfai1PHeZtCNEsUTgX9mVLqB3qkTgLU0KE2btZ0=;
        b=lYwJkCYSFpPCtgmxp9ByZ8vjfv0OD19kj7aFZYEp5f0HlRJaaARN6Kk2PloTCjFU6b
         RYQ9mQWIzr6+sMs67pLp42COdyUo42BcBjOWoYfI0jK2XewUZ9A3fY2n2kkLPC7Nin7V
         nWSxAnO4sN+DPVGUe9a6uuyFQQ0pKvlCpaNtrS1kDHzxsm1Wjb+VJYMxNahjXAggd2J5
         TGQoVuay0OxF77CYAZzXMAVep/i5UYFsakCCRbzP+98vweZmUNULWT1qW+W8Bm86TiYJ
         QEFOKnntgNU9t8R0r8weQ4izlGzCExN2Dr7EG9HeVuCAC7LmYJ5kLfjMnDvq2o1U7W7Z
         2sZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746883895; x=1747488695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VL6Fvfai1PHeZtCNEsUTgX9mVLqB3qkTgLU0KE2btZ0=;
        b=E0YGAm2PgLvAy09Kd7+3NV1bVzV4lec6AggTj2DHuwQyQJVQd/ssIv0OAnOPyXQ9kj
         oPikDK0pIJLupoEcsoMlXINcjsmFSny5Uegx9R9iT8BcC6tmj8wa/i/2FjnapXtVyH8h
         0a0FGT+034CZDg+5YpZIxQFAgtAUa9BtBAh1Lp/0klqbcBwiN84ieaRroJsba7hzHmO1
         Zq7HqiKTBPzP7B8IONUd2lfXRczaj71vgaAF43xehLiShXMOOoRrXgIVddjOU6ELVACK
         PY53CkzC0PDvkQs6375lHcrjxkzqOKUU8hCS8egDOlonl68gqhF4DEbqD3p+yKifXR5o
         B9VA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ETcJExUarwKGqX7P2bu+dog2KccFFNLzUQ58rTlXS9Yhc02FpSUIxzzs46g74m20xJ6LMFaBGOpOqaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkPTdUDpoQoosq00fT4l6+XcbxtWtlXxbNjh7k4Qik605DXEw
	vsZ7K670XqY85MzKTVZLkRGdO0Rlmy6X0DSqrBGOJfPGWVpY9S3JUrXpS08WxRJ88gTuk2Fkxsv
	s6Y5nY9Ybm+U5jvMrrk7bdh4TdjY=
X-Gm-Gg: ASbGncvOcVu++CeMxq7P34Tkdphv/7vEDGICEjfNfyKw4eQVY71iqxv1TxYiYw2W1Ju
	07UbZlvKM1temvYf1qlbp3kRRFmBDuG9rVOlvOLlIgD6iBISxLyi/iKPDxs7fIRPyWj1tR/DDgf
	/QSKtl7TADTWLdJt4FAB/n2KaTHsLeU4s1LvRy6/7Rsb37KIXLy7Kyz5sV+CAKdx5Ab6k=
X-Google-Smtp-Source: AGHT+IFY0BGu3g/pTCRin6LTOeTXMCua6Lm2Xlw5vkLw5gm3jByMT586BMqriqHE2or/QSURE0M3Qibzc3UQrMUNS98=
X-Received: by 2002:a05:6512:4381:b0:54d:6981:4b83 with SMTP id
 2adb3069b0e04-54fc67cb105mr2839818e87.24.1746883894661; Sat, 10 May 2025
 06:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_C2C42D3D6D8894E8E82EECD6CD707A026F0A@qq.com> <681e0719.050a0220.a19a9.0133.GAE@google.com>
In-Reply-To: <681e0719.050a0220.a19a9.0133.GAE@google.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sat, 10 May 2025 22:31:18 +0900
X-Gm-Features: AX0GCFv_W-UqIc_TgES5ohi93JS7gaBXJWp4lMS50iimPEYwJ5GZ8KACHRpbRYI
Message-ID: <CAKFNMokMnXoRuz=GvNRoyaqKLDEJEymQEK7MdvD3BzA03=qZcQ@mail.gmail.com>
Subject: Re: [syzbot] [nilfs?] possible deadlock in nilfs_segctor_construct
To: syzbot <syzbot+81394db39b0e2ed2db06@syzkaller.appspotmail.com>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org, 
	eadavis@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 9:46=E2=80=AFPM syzbot
<syzbot+81394db39b0e2ed2db06@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch but the reproducer is still triggeri=
ng an issue:
> possible deadlock in nilfs_mdt_get_block
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> WARNING: possible circular locking dependency detected
> 6.15.0-rc5-syzkaller-00136-g9c69f8884904-dirty #0 Not tainted
> ------------------------------------------------------
> segctord/5927 is trying to acquire lock:
> ffff88803ffcc610 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mdt_create_block =
fs/nilfs2/mdt.c:80 [inline]
> ffff88803ffcc610 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mdt_get_block+0x1=
93/0xab0 fs/nilfs2/mdt.c:258
>
> but task is already holding lock:
> ffff8880422660a0 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}, at: nilfs_bmap_p=
ropagate+0x2f/0x130 fs/nilfs2/bmap.c:328
>
> which lock already depends on the new lock.
>
>
> the existing dependency chain (in reverse order) is:
>
> -> #2 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
>        down_read+0x46/0x2e0 kernel/locking/rwsem.c:1524
>        nilfs_bmap_lookup_at_level+0x92/0x3d0 fs/nilfs2/bmap.c:65
>        nilfs_bmap_lookup fs/nilfs2/bmap.h:182 [inline]
>        nilfs_mdt_submit_block+0x3a3/0x830 fs/nilfs2/mdt.c:144
>        nilfs_mdt_read_block+0x46/0x320 fs/nilfs2/mdt.c:178
>        nilfs_mdt_get_block+0x11f/0xab0 fs/nilfs2/mdt.c:254
>        nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
>        nilfs_palloc_get_desc_block fs/nilfs2/alloc.c:296 [inline]
>        nilfs_palloc_prepare_alloc_entry+0x3a3/0xf40 fs/nilfs2/alloc.c:607
>        nilfs_ifile_create_inode+0x111/0x2e0 fs/nilfs2/ifile.c:61
>        nilfs_new_inode+0x1ed/0x750 fs/nilfs2/inode.c:321
>        nilfs_create+0x100/0x2f0 fs/nilfs2/namei.c:98
>        lookup_open fs/namei.c:3701 [inline]
>        open_last_lookups fs/namei.c:3800 [inline]
>        path_openat+0x14f1/0x3830 fs/namei.c:4036
>        do_filp_open+0x1fa/0x410 fs/namei.c:4066
>        do_sys_openat2+0x121/0x1c0 fs/open.c:1429
>        do_sys_open fs/open.c:1444 [inline]
>        __do_sys_openat fs/open.c:1460 [inline]
>        __se_sys_openat fs/open.c:1455 [inline]
>        __x64_sys_openat+0x138/0x170 fs/open.c:1455
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> -> #1 (&nilfs->ns_segctor_sem){++++}-{4:4}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
>        down_read+0x46/0x2e0 kernel/locking/rwsem.c:1524
>        nilfs_transaction_begin+0x365/0x710 fs/nilfs2/segment.c:221
>        nilfs_create+0xc9/0x2f0 fs/nilfs2/namei.c:95
>        lookup_open fs/namei.c:3701 [inline]
>        open_last_lookups fs/namei.c:3800 [inline]
>        path_openat+0x14f1/0x3830 fs/namei.c:4036
>        do_filp_open+0x1fa/0x410 fs/namei.c:4066
>        do_sys_openat2+0x121/0x1c0 fs/open.c:1429
>        do_sys_open fs/open.c:1444 [inline]
>        __do_sys_openat fs/open.c:1460 [inline]
>        __se_sys_openat fs/open.c:1455 [inline]
>        __x64_sys_openat+0x138/0x170 fs/open.c:1455
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> -> #0 (sb_internal#2){.+.+}-{0:0}:
>        check_prev_add kernel/locking/lockdep.c:3166 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3285 [inline]
>        validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
>        __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
>        percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
>        __sb_start_write include/linux/fs.h:1783 [inline]
>        sb_start_intwrite include/linux/fs.h:1966 [inline]
>        nilfs_transaction_begin+0x268/0x710 fs/nilfs2/segment.c:218
>        nilfs_mdt_create_block fs/nilfs2/mdt.c:80 [inline]
>        nilfs_mdt_get_block+0x193/0xab0 fs/nilfs2/mdt.c:258
>        nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
>        nilfs_palloc_get_entry_block+0x8c/0xa0 fs/nilfs2/alloc.c:355
>        nilfs_dat_prepare_entry fs/nilfs2/dat.c:45 [inline]
>        nilfs_dat_prepare_alloc fs/nilfs2/dat.c:82 [inline]
>        nilfs_dat_prepare_update+0xb1/0x300 fs/nilfs2/dat.c:250
>        nilfs_direct_propagate+0x1ac/0x370 fs/nilfs2/direct.c:279
>        nilfs_bmap_propagate+0x77/0x130 fs/nilfs2/bmap.c:329
>        nilfs_collect_file_data+0x4f/0xd0 fs/nilfs2/segment.c:589
>        nilfs_segctor_apply_buffers+0x161/0x330 fs/nilfs2/segment.c:1010
>        nilfs_segctor_scan_file+0x68e/0x8e0 fs/nilfs2/segment.c:1059
>        nilfs_segctor_collect_blocks fs/nilfs2/segment.c:1267 [inline]
>        nilfs_segctor_collect fs/nilfs2/segment.c:1547 [inline]
>        nilfs_segctor_do_construct+0x1eac/0x6970 fs/nilfs2/segment.c:2122
>        nilfs_segctor_construct+0x17b/0x690 fs/nilfs2/segment.c:2478
>        nilfs_segctor_thread_construct fs/nilfs2/segment.c:2585 [inline]
>        nilfs_segctor_thread+0x6cd/0xe00 fs/nilfs2/segment.c:2700
>        kthread+0x70e/0x8a0 kernel/kthread.c:464
>        ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> other info that might help us debug this:
>
> Chain exists of:
>   sb_internal#2 --> &nilfs->ns_segctor_sem --> &nilfs_bmap_mdt_lock_key
>
>  Possible unsafe locking scenario:
>
>        CPU0                    CPU1
>        ----                    ----
>   lock(&nilfs_bmap_mdt_lock_key);
>                                lock(&nilfs->ns_segctor_sem);
>                                lock(&nilfs_bmap_mdt_lock_key);
>   rlock(sb_internal#2);
>
>  *** DEADLOCK ***
>
> 1 lock held by segctord/5927:
>  #0: ffff8880422660a0 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}, at: nilfs_b=
map_propagate+0x2f/0x130 fs/nilfs2/bmap.c:328
>
> stack backtrace:
> CPU: 0 UID: 0 PID: 5927 Comm: segctord Not tainted 6.15.0-rc5-syzkaller-0=
0136-g9c69f8884904-dirty #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2~bpo12+1 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2079
>  check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2211
>  check_prev_add kernel/locking/lockdep.c:3166 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3285 [inline]
>  validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
>  __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
>  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
>  percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
>  __sb_start_write include/linux/fs.h:1783 [inline]
>  sb_start_intwrite include/linux/fs.h:1966 [inline]
>  nilfs_transaction_begin+0x268/0x710 fs/nilfs2/segment.c:218
>  nilfs_mdt_create_block fs/nilfs2/mdt.c:80 [inline]
>  nilfs_mdt_get_block+0x193/0xab0 fs/nilfs2/mdt.c:258
>  nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
>  nilfs_palloc_get_entry_block+0x8c/0xa0 fs/nilfs2/alloc.c:355
>  nilfs_dat_prepare_entry fs/nilfs2/dat.c:45 [inline]
>  nilfs_dat_prepare_alloc fs/nilfs2/dat.c:82 [inline]
>  nilfs_dat_prepare_update+0xb1/0x300 fs/nilfs2/dat.c:250
>  nilfs_direct_propagate+0x1ac/0x370 fs/nilfs2/direct.c:279
>  nilfs_bmap_propagate+0x77/0x130 fs/nilfs2/bmap.c:329
>  nilfs_collect_file_data+0x4f/0xd0 fs/nilfs2/segment.c:589
>  nilfs_segctor_apply_buffers+0x161/0x330 fs/nilfs2/segment.c:1010
>  nilfs_segctor_scan_file+0x68e/0x8e0 fs/nilfs2/segment.c:1059
>  nilfs_segctor_collect_blocks fs/nilfs2/segment.c:1267 [inline]
>  nilfs_segctor_collect fs/nilfs2/segment.c:1547 [inline]
>  nilfs_segctor_do_construct+0x1eac/0x6970 fs/nilfs2/segment.c:2122
>  nilfs_segctor_construct+0x17b/0x690 fs/nilfs2/segment.c:2478
>  nilfs_segctor_thread_construct fs/nilfs2/segment.c:2585 [inline]
>  nilfs_segctor_thread+0x6cd/0xe00 fs/nilfs2/segment.c:2700
>  kthread+0x70e/0x8a0 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
>
>
> Tested on:
>
> commit:         9c69f888 Merge tag 'bcachefs-2025-05-08' of git://evil..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D11a694d458000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D91c351a0f6229=
e67
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D81394db39b0e2ed=
2db06
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd=
6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10c7476858=
0000
>
>

This reports a different circular lock dependency than all other
reports in this issue, so it appears to be a separate issue. I'd like
to dig deeper.

Ryusuke Konishi
