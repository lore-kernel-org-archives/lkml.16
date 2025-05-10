Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B5A18E02A
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746884992; cv=none; b=uYXfGvd3GEjIlufJP+Mor9slIjnyPD5SdQHJ9FUrrBdGWL4akKfb7LHLufS3YSxalnvBCyJWbIk7mD7ByG5YctLZ7kCfxeh2nKTeua9OK/X0303xV76vvkUubR9WBI3Gth1RPe56kpmSj3fgfk8UL59gERXUKRWHKxtDviAhjQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746884992; c=relaxed/simple;
	bh=Hx5aPIPo7yr/6PBq5dEMB4kf8AiywM8t0LriTMvw8P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frzd+VQ9ziYIkOCh6XyDcs91CvzlgQwJ/XV90an8DvRCGyydvyZYZb4mvQKdymEFcR1pTGyTicZ7hBmebee5+yNQWghBzNyPhX494Tn5vxH1XUYlxuPW9L3TrPLdXt+LE89GpyaDC509RE/rjwEwBIuFzawvvKcM1ZL+Bz/oYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZSRVxos; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZSRVxos"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-548409cd2a8so3703572e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746884988; x=1747489788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TrYI6B+HX/GJbjWrdK1nI39G3aDvB6IEAZj1qnnnjA=;
        b=DZSRVxosgsmxZcO8nl0yCsWXwppGjxFlzM3B9Ev4qFjl5KLItQBP9gVBWtCZIE4WJI
         pGL3/5gXxDAAITJVlF8kMZN3G/UR2ypLOYUC8Y091N0937Q0ZrAewNU8iwZGdjZ5i/kV
         rnnqXj57XffRyLQ57xgrKhdpaeXsJ2VXZKz2TzrZJSxWZbjdA7bijNyDQ1P7n0N5zQi8
         aoGrkog3xtwdlpA7x5ArbyOkUVGETvEZ/ZqR/YivXs3+U375qqyX0xaW0CzUwzJ91qnE
         k0PwWT48MOGuXCodZIe19YXD1sLS7qaBwchZmz8WvUJsHcLm2Cr7OFUyWx5h+jtWxdkk
         AK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746884988; x=1747489788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TrYI6B+HX/GJbjWrdK1nI39G3aDvB6IEAZj1qnnnjA=;
        b=rTXnULeQp/LiTQIH0v6lteSW+dT3chFmrIYGdW5pbIUB28WpFpU1TRBJ55FrWCuNfc
         mHf5/V+1NapSs0UnJXQTDuW+g5MdBaf7tPgVHiDSuyI0PO6VweCYR6OEhMo2sKRWM4Bb
         6pc3CpM7tXFeRRQeJPKRJu+VD4H/pJ6jNKxiy0Il5h+P5NRwhOCD2oWRglIjrvcczbkU
         dM/jExeWNObrtwsgA2Be1JWhnYa4ngF4QCe7+PY9dLogcPaG83h58pHP0Mjrjun2WdsS
         ywN5FQKqMXIoF64W+W+hsllFRPYcgrcpeHXphri8KLhZigWF5fDV8pmvX23gLbeeBYpa
         actw==
X-Forwarded-Encrypted: i=1; AJvYcCWLJAFCukUnLzN7WIEg8i2EbHcnmrKZ+/Xhxxh9tY7xCQL6z0MIh+UJwsgI522FnO1U2VHpL9kGu1O78Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLCUEpTpyA0SwD6PWXPn7jjDDPsOfd69SGiQPQWHq3c+p0izV
	IAC+1N4JjXb16BbzIDXH/EQYraov0DoJlGx8Ge+JCnej210vbnEQScVqm3ZNrIhKG5QiOJZy6jq
	bqgqjuo5GH7CjRGYNFXHY76G6T2o=
X-Gm-Gg: ASbGncsUM6dETi7J6U22ctPMq+1EjS/znbYfutLklHNjl4tKDLPUNX56G7V/cqGYJNH
	ho7l008gNusyhm51N22popF9bOL6lErNLS0BltwzQR1dfCLnpEOj7CzzexMR0S4VFSWiuVI6Bd7
	qkocisXYtpRQQcsXMBL2lGhFwg4bepQfkOL2334Gx4tG+SK/BRXoV37KYI7kzEm5ijX7Q=
X-Google-Smtp-Source: AGHT+IG0hHnT4unJXxVD0WVY3hWzqdbrtFglV1IYeqS6ZJDZvAubC3EHxUMABdLg9Hm/nSKuXhv5AX5pqvNvCDXfvd4=
X-Received: by 2002:a05:6512:680f:b0:54f:c51c:71ca with SMTP id
 2adb3069b0e04-54fc67ad5cfmr2497217e87.7.1746884988115; Sat, 10 May 2025
 06:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_C2C42D3D6D8894E8E82EECD6CD707A026F0A@qq.com>
 <681e0719.050a0220.a19a9.0133.GAE@google.com> <CAKFNMokMnXoRuz=GvNRoyaqKLDEJEymQEK7MdvD3BzA03=qZcQ@mail.gmail.com>
In-Reply-To: <CAKFNMokMnXoRuz=GvNRoyaqKLDEJEymQEK7MdvD3BzA03=qZcQ@mail.gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sat, 10 May 2025 22:49:31 +0900
X-Gm-Features: AX0GCFscRpiVPiUcJl6p4xJ2jKPpU9-UADVLlM4Xxzh9v3LghDzm1TgEMHpNKUk
Message-ID: <CAKFNMomJJm7cM5K5bjpPV_wcyUfi5Qvuasob=weB_7MMRtOQxw@mail.gmail.com>
Subject: Re: [syzbot] [nilfs?] possible deadlock in nilfs_segctor_construct
To: syzbot <syzbot+81394db39b0e2ed2db06@syzkaller.appspotmail.com>
Cc: eadavis@qq.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 10:31=E2=80=AFPM Ryusuke Konishi wrote:
>
> On Sat, May 10, 2025 at 9:46=E2=80=AFPM syzbot
> <syzbot+81394db39b0e2ed2db06@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer is still trigge=
ring an issue:
> > possible deadlock in nilfs_mdt_get_block
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > WARNING: possible circular locking dependency detected
> > 6.15.0-rc5-syzkaller-00136-g9c69f8884904-dirty #0 Not tainted
> > ------------------------------------------------------
> > segctord/5927 is trying to acquire lock:
> > ffff88803ffcc610 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mdt_create_bloc=
k fs/nilfs2/mdt.c:80 [inline]
> > ffff88803ffcc610 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mdt_get_block+0=
x193/0xab0 fs/nilfs2/mdt.c:258
> >
> > but task is already holding lock:
> > ffff8880422660a0 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}, at: nilfs_bmap=
_propagate+0x2f/0x130 fs/nilfs2/bmap.c:328
> >
> > which lock already depends on the new lock.
> >
> >
> > the existing dependency chain (in reverse order) is:
> >
> > -> #2 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}:
> >        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
> >        down_read+0x46/0x2e0 kernel/locking/rwsem.c:1524
> >        nilfs_bmap_lookup_at_level+0x92/0x3d0 fs/nilfs2/bmap.c:65
> >        nilfs_bmap_lookup fs/nilfs2/bmap.h:182 [inline]
> >        nilfs_mdt_submit_block+0x3a3/0x830 fs/nilfs2/mdt.c:144
> >        nilfs_mdt_read_block+0x46/0x320 fs/nilfs2/mdt.c:178
> >        nilfs_mdt_get_block+0x11f/0xab0 fs/nilfs2/mdt.c:254
> >        nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
> >        nilfs_palloc_get_desc_block fs/nilfs2/alloc.c:296 [inline]
> >        nilfs_palloc_prepare_alloc_entry+0x3a3/0xf40 fs/nilfs2/alloc.c:6=
07
> >        nilfs_ifile_create_inode+0x111/0x2e0 fs/nilfs2/ifile.c:61
> >        nilfs_new_inode+0x1ed/0x750 fs/nilfs2/inode.c:321
> >        nilfs_create+0x100/0x2f0 fs/nilfs2/namei.c:98
> >        lookup_open fs/namei.c:3701 [inline]
> >        open_last_lookups fs/namei.c:3800 [inline]
> >        path_openat+0x14f1/0x3830 fs/namei.c:4036
> >        do_filp_open+0x1fa/0x410 fs/namei.c:4066
> >        do_sys_openat2+0x121/0x1c0 fs/open.c:1429
> >        do_sys_open fs/open.c:1444 [inline]
> >        __do_sys_openat fs/open.c:1460 [inline]
> >        __se_sys_openat fs/open.c:1455 [inline]
> >        __x64_sys_openat+0x138/0x170 fs/open.c:1455
> >        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >        do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
> >        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > -> #1 (&nilfs->ns_segctor_sem){++++}-{4:4}:
> >        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
> >        down_read+0x46/0x2e0 kernel/locking/rwsem.c:1524
> >        nilfs_transaction_begin+0x365/0x710 fs/nilfs2/segment.c:221
> >        nilfs_create+0xc9/0x2f0 fs/nilfs2/namei.c:95
> >        lookup_open fs/namei.c:3701 [inline]
> >        open_last_lookups fs/namei.c:3800 [inline]
> >        path_openat+0x14f1/0x3830 fs/namei.c:4036
> >        do_filp_open+0x1fa/0x410 fs/namei.c:4066
> >        do_sys_openat2+0x121/0x1c0 fs/open.c:1429
> >        do_sys_open fs/open.c:1444 [inline]
> >        __do_sys_openat fs/open.c:1460 [inline]
> >        __se_sys_openat fs/open.c:1455 [inline]
> >        __x64_sys_openat+0x138/0x170 fs/open.c:1455
> >        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >        do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
> >        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > -> #0 (sb_internal#2){.+.+}-{0:0}:
> >        check_prev_add kernel/locking/lockdep.c:3166 [inline]
> >        check_prevs_add kernel/locking/lockdep.c:3285 [inline]
> >        validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
> >        __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
> >        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
> >        percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
> >        __sb_start_write include/linux/fs.h:1783 [inline]
> >        sb_start_intwrite include/linux/fs.h:1966 [inline]
> >        nilfs_transaction_begin+0x268/0x710 fs/nilfs2/segment.c:218
> >        nilfs_mdt_create_block fs/nilfs2/mdt.c:80 [inline]
> >        nilfs_mdt_get_block+0x193/0xab0 fs/nilfs2/mdt.c:258
> >        nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
> >        nilfs_palloc_get_entry_block+0x8c/0xa0 fs/nilfs2/alloc.c:355
> >        nilfs_dat_prepare_entry fs/nilfs2/dat.c:45 [inline]
> >        nilfs_dat_prepare_alloc fs/nilfs2/dat.c:82 [inline]
> >        nilfs_dat_prepare_update+0xb1/0x300 fs/nilfs2/dat.c:250
> >        nilfs_direct_propagate+0x1ac/0x370 fs/nilfs2/direct.c:279
> >        nilfs_bmap_propagate+0x77/0x130 fs/nilfs2/bmap.c:329
> >        nilfs_collect_file_data+0x4f/0xd0 fs/nilfs2/segment.c:589
> >        nilfs_segctor_apply_buffers+0x161/0x330 fs/nilfs2/segment.c:1010
> >        nilfs_segctor_scan_file+0x68e/0x8e0 fs/nilfs2/segment.c:1059
> >        nilfs_segctor_collect_blocks fs/nilfs2/segment.c:1267 [inline]
> >        nilfs_segctor_collect fs/nilfs2/segment.c:1547 [inline]
> >        nilfs_segctor_do_construct+0x1eac/0x6970 fs/nilfs2/segment.c:212=
2
> >        nilfs_segctor_construct+0x17b/0x690 fs/nilfs2/segment.c:2478
> >        nilfs_segctor_thread_construct fs/nilfs2/segment.c:2585 [inline]
> >        nilfs_segctor_thread+0x6cd/0xe00 fs/nilfs2/segment.c:2700
> >        kthread+0x70e/0x8a0 kernel/kthread.c:464
> >        ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
> >        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >
> > other info that might help us debug this:
> >
> > Chain exists of:
> >   sb_internal#2 --> &nilfs->ns_segctor_sem --> &nilfs_bmap_mdt_lock_key
> >
> >  Possible unsafe locking scenario:
> >
> >        CPU0                    CPU1
> >        ----                    ----
> >   lock(&nilfs_bmap_mdt_lock_key);
> >                                lock(&nilfs->ns_segctor_sem);
> >                                lock(&nilfs_bmap_mdt_lock_key);
> >   rlock(sb_internal#2);
> >
> >  *** DEADLOCK ***
> >
> > 1 lock held by segctord/5927:
> >  #0: ffff8880422660a0 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}, at: nilfs=
_bmap_propagate+0x2f/0x130 fs/nilfs2/bmap.c:328
> >
> > stack backtrace:
> > CPU: 0 UID: 0 PID: 5927 Comm: segctord Not tainted 6.15.0-rc5-syzkaller=
-00136-g9c69f8884904-dirty #0 PREEMPT(full)
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-=
1.16.3-2~bpo12+1 04/01/2014
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
> >  print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2079
> >  check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2211
> >  check_prev_add kernel/locking/lockdep.c:3166 [inline]
> >  check_prevs_add kernel/locking/lockdep.c:3285 [inline]
> >  validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
> >  __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
> >  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
> >  percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
> >  __sb_start_write include/linux/fs.h:1783 [inline]
> >  sb_start_intwrite include/linux/fs.h:1966 [inline]
> >  nilfs_transaction_begin+0x268/0x710 fs/nilfs2/segment.c:218
> >  nilfs_mdt_create_block fs/nilfs2/mdt.c:80 [inline]
> >  nilfs_mdt_get_block+0x193/0xab0 fs/nilfs2/mdt.c:258
> >  nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
> >  nilfs_palloc_get_entry_block+0x8c/0xa0 fs/nilfs2/alloc.c:355
> >  nilfs_dat_prepare_entry fs/nilfs2/dat.c:45 [inline]
> >  nilfs_dat_prepare_alloc fs/nilfs2/dat.c:82 [inline]
> >  nilfs_dat_prepare_update+0xb1/0x300 fs/nilfs2/dat.c:250
> >  nilfs_direct_propagate+0x1ac/0x370 fs/nilfs2/direct.c:279
> >  nilfs_bmap_propagate+0x77/0x130 fs/nilfs2/bmap.c:329
> >  nilfs_collect_file_data+0x4f/0xd0 fs/nilfs2/segment.c:589
> >  nilfs_segctor_apply_buffers+0x161/0x330 fs/nilfs2/segment.c:1010
> >  nilfs_segctor_scan_file+0x68e/0x8e0 fs/nilfs2/segment.c:1059
> >  nilfs_segctor_collect_blocks fs/nilfs2/segment.c:1267 [inline]
> >  nilfs_segctor_collect fs/nilfs2/segment.c:1547 [inline]
> >  nilfs_segctor_do_construct+0x1eac/0x6970 fs/nilfs2/segment.c:2122
> >  nilfs_segctor_construct+0x17b/0x690 fs/nilfs2/segment.c:2478
> >  nilfs_segctor_thread_construct fs/nilfs2/segment.c:2585 [inline]
> >  nilfs_segctor_thread+0x6cd/0xe00 fs/nilfs2/segment.c:2700
> >  kthread+0x70e/0x8a0 kernel/kthread.c:464
> >  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >  </TASK>
> >
> >
> > Tested on:
> >
> > commit:         9c69f888 Merge tag 'bcachefs-2025-05-08' of git://evil.=
.
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D11a694d4580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D91c351a0f62=
29e67
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D81394db39b0e2=
ed2db06
> > compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89=
dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10c74768=
580000
> >
> >
>
> This reports a different circular lock dependency than all other
> reports in this issue, so it appears to be a separate issue. I'd like
> to dig deeper.
>
> Ryusuke Konishi

Oops, I misunderstood.
This was the result of testing the following patch:

https://syzkaller.appspot.com/x/patch.diff?x=3D10c74768580000

Just sharing the info, the original issue (extid=3D81394db39b0e2ed2db06)
should be resolved with the following patch sent upstream:

https://lore.kernel.org/all/20250503053327.12294-1-konishi.ryusuke@gmail.co=
m/

Ryusuke Konishi
