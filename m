Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AF15E96
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798364; cv=none; b=rpxdkBtx/v/hvCXfmXuWH4e2NnJFb92QpOsUDgYzzEcBLkWFyjzqfrNgx2vRNomNIjAZhK3CYQdb1QB+luUThxh0O5bosTHOIw+7eSrZTwY+JnagpmS0c/EKSLfHeoZPi2MPq3b36kC8hjVLnTsj/Bnz4d/Z/ZOey4OTbndBACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798364; c=relaxed/simple;
	bh=m6nFvziegp3Yg0+wMxpGOWyx/YPJipEw9E4ogyYzdAI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WPQ7GTS32Q7+7SCWpFdC2TIlOue0arKarDHj2jA/+AmjGv5SadgN1ljVlPVYpGKPxGp3gArvQDsG0SfhurkHBhoenGW5VCFM3/3TLSrVDV1VEkcdxP/b6jjileJgs5atLItd63HUuOEdAwLlp5giq0pYmYJMq3Mqpqx3EEgwfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d6e10f8747so24194385ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798362; x=1747403162;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fvMPkphuAtORQH/cgXKLrFz7aosXBRfxYaoKYR960s=;
        b=BbFN96Ll1eykXsFjq0Tt9ZFTZAZvdkjbaIoNWu8YvshVS+egyyed+382Fq6C3XUPzN
         tTb2DY+bMr48Jjwj4YKQp4PP9JiDP5VKR6z6dDfJXrzucOHqp8ajg6V/lth/E5HzQFrn
         qVKNj8e+458ifl6SHwl9XBxvTUBom40/CSroNMrPMRANcufISOnjCnuo90hNr+WX5qDq
         q51/M2idd+qxjlFhjJaD3fWT7D7utRii+jzgAyDQo9ZG+l0eRssqR7eXO2PzENzRUepF
         rGv1svuV3G54UmfZ4YfYntag9YTv1W6fR7byZy2o0YIgG2hKY1g9xiFOJl0Q4EsxQN3v
         YI6A==
X-Forwarded-Encrypted: i=1; AJvYcCVWEirtM2k6BLjl4HmZvgO2P0qjsrB8d4/oin7GhhseTcnvwWgnJkKnf0XfXYx8Jmv5+HfyRxUVHfMh8po=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgGcdvXPbvmNzK1zU+mA4XOc5K/NjsMoNMP/+FbeYewY6dyEAZ
	EpbflUwP9zksDNPXlGMYZJm/nijoAYL1Ocfe0lkluEfll+LRWQG7+qs6d43acwJWPqxTz6ci2X5
	PBEFS7vMqvakSPSIPKsF2d6UAA+Xao030x5m7RiC2Ok2dvtMCjvy90y0=
X-Google-Smtp-Source: AGHT+IHV2l8Cedqs065vwIjjaCTGzVfE7elGIjF77wfzt+5xHiUmp50TxYXohqflXlSC9ZbiNkiST2RdzTHFldCToBm3Fyk5PkZa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:398f:b0:3d5:891c:13fb with SMTP id
 e9e14a558f8ab-3da7e1e2714mr45061685ab.4.1746798361739; Fri, 09 May 2025
 06:46:01 -0700 (PDT)
Date: Fri, 09 May 2025 06:46:01 -0700
In-Reply-To: <tencent_C2C42D3D6D8894E8E82EECD6CD707A026F0A@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681e0719.050a0220.a19a9.0133.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] possible deadlock in nilfs_segctor_construct
From: syzbot <syzbot+81394db39b0e2ed2db06@syzkaller.appspotmail.com>
To: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in nilfs_mdt_get_block

======================================================
WARNING: possible circular locking dependency detected
6.15.0-rc5-syzkaller-00136-g9c69f8884904-dirty #0 Not tainted
------------------------------------------------------
segctord/5927 is trying to acquire lock:
ffff88803ffcc610 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mdt_create_block fs/nilfs2/mdt.c:80 [inline]
ffff88803ffcc610 (sb_internal#2){.+.+}-{0:0}, at: nilfs_mdt_get_block+0x193/0xab0 fs/nilfs2/mdt.c:258

but task is already holding lock:
ffff8880422660a0 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}, at: nilfs_bmap_propagate+0x2f/0x130 fs/nilfs2/bmap.c:328

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
       down_read+0x46/0x2e0 kernel/locking/rwsem.c:1524
       nilfs_bmap_lookup_at_level+0x92/0x3d0 fs/nilfs2/bmap.c:65
       nilfs_bmap_lookup fs/nilfs2/bmap.h:182 [inline]
       nilfs_mdt_submit_block+0x3a3/0x830 fs/nilfs2/mdt.c:144
       nilfs_mdt_read_block+0x46/0x320 fs/nilfs2/mdt.c:178
       nilfs_mdt_get_block+0x11f/0xab0 fs/nilfs2/mdt.c:254
       nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
       nilfs_palloc_get_desc_block fs/nilfs2/alloc.c:296 [inline]
       nilfs_palloc_prepare_alloc_entry+0x3a3/0xf40 fs/nilfs2/alloc.c:607
       nilfs_ifile_create_inode+0x111/0x2e0 fs/nilfs2/ifile.c:61
       nilfs_new_inode+0x1ed/0x750 fs/nilfs2/inode.c:321
       nilfs_create+0x100/0x2f0 fs/nilfs2/namei.c:98
       lookup_open fs/namei.c:3701 [inline]
       open_last_lookups fs/namei.c:3800 [inline]
       path_openat+0x14f1/0x3830 fs/namei.c:4036
       do_filp_open+0x1fa/0x410 fs/namei.c:4066
       do_sys_openat2+0x121/0x1c0 fs/open.c:1429
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_openat fs/open.c:1460 [inline]
       __se_sys_openat fs/open.c:1455 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1455
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&nilfs->ns_segctor_sem){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
       down_read+0x46/0x2e0 kernel/locking/rwsem.c:1524
       nilfs_transaction_begin+0x365/0x710 fs/nilfs2/segment.c:221
       nilfs_create+0xc9/0x2f0 fs/nilfs2/namei.c:95
       lookup_open fs/namei.c:3701 [inline]
       open_last_lookups fs/namei.c:3800 [inline]
       path_openat+0x14f1/0x3830 fs/namei.c:4036
       do_filp_open+0x1fa/0x410 fs/namei.c:4066
       do_sys_openat2+0x121/0x1c0 fs/open.c:1429
       do_sys_open fs/open.c:1444 [inline]
       __do_sys_openat fs/open.c:1460 [inline]
       __se_sys_openat fs/open.c:1455 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1455
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (sb_internal#2){.+.+}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3166 [inline]
       check_prevs_add kernel/locking/lockdep.c:3285 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
       __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
       percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
       __sb_start_write include/linux/fs.h:1783 [inline]
       sb_start_intwrite include/linux/fs.h:1966 [inline]
       nilfs_transaction_begin+0x268/0x710 fs/nilfs2/segment.c:218
       nilfs_mdt_create_block fs/nilfs2/mdt.c:80 [inline]
       nilfs_mdt_get_block+0x193/0xab0 fs/nilfs2/mdt.c:258
       nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
       nilfs_palloc_get_entry_block+0x8c/0xa0 fs/nilfs2/alloc.c:355
       nilfs_dat_prepare_entry fs/nilfs2/dat.c:45 [inline]
       nilfs_dat_prepare_alloc fs/nilfs2/dat.c:82 [inline]
       nilfs_dat_prepare_update+0xb1/0x300 fs/nilfs2/dat.c:250
       nilfs_direct_propagate+0x1ac/0x370 fs/nilfs2/direct.c:279
       nilfs_bmap_propagate+0x77/0x130 fs/nilfs2/bmap.c:329
       nilfs_collect_file_data+0x4f/0xd0 fs/nilfs2/segment.c:589
       nilfs_segctor_apply_buffers+0x161/0x330 fs/nilfs2/segment.c:1010
       nilfs_segctor_scan_file+0x68e/0x8e0 fs/nilfs2/segment.c:1059
       nilfs_segctor_collect_blocks fs/nilfs2/segment.c:1267 [inline]
       nilfs_segctor_collect fs/nilfs2/segment.c:1547 [inline]
       nilfs_segctor_do_construct+0x1eac/0x6970 fs/nilfs2/segment.c:2122
       nilfs_segctor_construct+0x17b/0x690 fs/nilfs2/segment.c:2478
       nilfs_segctor_thread_construct fs/nilfs2/segment.c:2585 [inline]
       nilfs_segctor_thread+0x6cd/0xe00 fs/nilfs2/segment.c:2700
       kthread+0x70e/0x8a0 kernel/kthread.c:464
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  sb_internal#2 --> &nilfs->ns_segctor_sem --> &nilfs_bmap_mdt_lock_key

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&nilfs_bmap_mdt_lock_key);
                               lock(&nilfs->ns_segctor_sem);
                               lock(&nilfs_bmap_mdt_lock_key);
  rlock(sb_internal#2);

 *** DEADLOCK ***

1 lock held by segctord/5927:
 #0: ffff8880422660a0 (&nilfs_bmap_mdt_lock_key){++++}-{4:4}, at: nilfs_bmap_propagate+0x2f/0x130 fs/nilfs2/bmap.c:328

stack backtrace:
CPU: 0 UID: 0 PID: 5927 Comm: segctord Not tainted 6.15.0-rc5-syzkaller-00136-g9c69f8884904-dirty #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2079
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2211
 check_prev_add kernel/locking/lockdep.c:3166 [inline]
 check_prevs_add kernel/locking/lockdep.c:3285 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3909
 __lock_acquire+0xaac/0xd20 kernel/locking/lockdep.c:5235
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5866
 percpu_down_read include/linux/percpu-rwsem.h:52 [inline]
 __sb_start_write include/linux/fs.h:1783 [inline]
 sb_start_intwrite include/linux/fs.h:1966 [inline]
 nilfs_transaction_begin+0x268/0x710 fs/nilfs2/segment.c:218
 nilfs_mdt_create_block fs/nilfs2/mdt.c:80 [inline]
 nilfs_mdt_get_block+0x193/0xab0 fs/nilfs2/mdt.c:258
 nilfs_palloc_get_block+0x18d/0x2b0 fs/nilfs2/alloc.c:239
 nilfs_palloc_get_entry_block+0x8c/0xa0 fs/nilfs2/alloc.c:355
 nilfs_dat_prepare_entry fs/nilfs2/dat.c:45 [inline]
 nilfs_dat_prepare_alloc fs/nilfs2/dat.c:82 [inline]
 nilfs_dat_prepare_update+0xb1/0x300 fs/nilfs2/dat.c:250
 nilfs_direct_propagate+0x1ac/0x370 fs/nilfs2/direct.c:279
 nilfs_bmap_propagate+0x77/0x130 fs/nilfs2/bmap.c:329
 nilfs_collect_file_data+0x4f/0xd0 fs/nilfs2/segment.c:589
 nilfs_segctor_apply_buffers+0x161/0x330 fs/nilfs2/segment.c:1010
 nilfs_segctor_scan_file+0x68e/0x8e0 fs/nilfs2/segment.c:1059
 nilfs_segctor_collect_blocks fs/nilfs2/segment.c:1267 [inline]
 nilfs_segctor_collect fs/nilfs2/segment.c:1547 [inline]
 nilfs_segctor_do_construct+0x1eac/0x6970 fs/nilfs2/segment.c:2122
 nilfs_segctor_construct+0x17b/0x690 fs/nilfs2/segment.c:2478
 nilfs_segctor_thread_construct fs/nilfs2/segment.c:2585 [inline]
 nilfs_segctor_thread+0x6cd/0xe00 fs/nilfs2/segment.c:2700
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         9c69f888 Merge tag 'bcachefs-2025-05-08' of git://evil..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a694d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
dashboard link: https://syzkaller.appspot.com/bug?extid=81394db39b0e2ed2db06
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10c74768580000

