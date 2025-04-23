Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41A71A315C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745433545; cv=none; b=GgGlXSZSlCdG5RTqkHNYRzLOL7jQ0+QGmVyg5JhsojX7JqipUZ+wjU1Wg9md6Pt6tcvZ50DPQgHdnDp7q+K666th7y5+s/0/jn8iUxr6p+tY6Jn1mBmFLgmjWxjfhVcvsIhPSOIx+Z0Pm78eEPVDzsOwGbQQp924Ij7IqbFFy3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745433545; c=relaxed/simple;
	bh=M//ZUs/ibHUHY7cyDKQGx7w4QJgtYY8elpIk58ZopPk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KkpCuXOUbIj1V2jfM9GHbNYNMjH+nax2yFEKnM89AolJ9C4c1QNwWM9Al38DMsi/J9VJlIbRh5dIOyRYgWSKL3KugcdlNqlfrB7FcDEabBHYwwNb0tp3hJR1Ve4XjB5vxytqTzEeTXlAY5ajhlDwWqsKO2Tp9aDLfTBRLlamKac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d90a7e86f7so4092555ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433543; x=1746038343;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6RC2wJYLSD3Erp7rCDbjabfU1XRJGenYQKl673HI6Y=;
        b=nPUTwVB3wZ9rIzhAnVfxW59eegvQVzyZcs2DMlC3AhSl3KTyxvL3jWuuAfLdyi9H3h
         Y1DGVInuchW8p+cFpqwG7XXG8mkod5Kvz6jBbm3yzKRsaxN16bY9hxA31Wq8h4GQHCbT
         2XikcY17nnAMInkMPh8YPnN6eoA+lMfJxgjN1N6V96SUt9GjzymvUDRyGxmt+MexYpch
         oFjKEDAsgAlhEkdafKw1iMGJKs4/qwif2BZQAnlwPVG97IiXalU0Tsef+2tdgb4e+sMo
         izy1aRqxaCyOILZFVFicYSpDsRKMzS5tagNyKuCv5huBHXnxJJvBnZIa93AuHm5HBn5p
         mGog==
X-Forwarded-Encrypted: i=1; AJvYcCUH9t5/XxOSY9gW4eLbXXXd8Sjj82Y8qvnPKy1vw06VKCwayyd018VcHxtGLAxvD1M4m2BsuS9AxR1djVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYVEYXY3DlEVoSIsHfcpy93fKUj+GPWHJs4uz4FSDf7/i8g3t
	V4mIgGy5ySun+IF4jZdQOpMG0tymibeyAjIvZduejUhJ6mzK0AHGVEvC2hEtzjiPA+PP8ruCBO1
	FXq1rOOq8lQDonQrW2cznYLlpb8o+7cZWWlre1xf0zebQQHw9bfd+Suk=
X-Google-Smtp-Source: AGHT+IEecm0zz0yio5jlwATgg8/y7rndH+LRnv1+hh0C7bCpbq+jUHEbepQPCb5roOUApICjH4ZLri3fCdor4oxmdmcimPiC2bfR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2707:b0:3d8:1cba:1854 with SMTP id
 e9e14a558f8ab-3d88ed6e8efmr199805655ab.1.1745433542837; Wed, 23 Apr 2025
 11:39:02 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:39:02 -0700
In-Reply-To: <20250423110503.4262-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680933c6.050a0220.2c0118.0abd.GAE@google.com>
Subject: Re: [syzbot] [fs?] INFO: task hung in vfs_rename (2)
From: syzbot <syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in vfs_rename

INFO: task syz.0.16:6726 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc3-syzkaller-00032-ga79be02bba5c-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.16        state:D stack:24200 pid:6726  tgid:6725  ppid:6628   task_flags:0x400140 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x1b33/0x51f0 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x163/0x360 kernel/sched/core.c:6860
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6917
 rwsem_down_write_slowpath+0xedd/0x1420 kernel/locking/rwsem.c:1176
 __down_write_common kernel/locking/rwsem.c:1304 [inline]
 __down_write kernel/locking/rwsem.c:1313 [inline]
 down_write+0x1da/0x220 kernel/locking/rwsem.c:1578
 inode_lock include/linux/fs.h:867 [inline]
 vfs_rename+0x6ba/0xf10 fs/namei.c:5088
 do_renameat2+0xdbc/0x1410 fs/namei.c:5272
 __do_sys_renameat2 fs/namei.c:5306 [inline]
 __se_sys_renameat2 fs/namei.c:5303 [inline]
 __x64_sys_renameat2+0xce/0xe0 fs/namei.c:5303
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2a8618e169
RSP: 002b:00007f2a86fb8038 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 00007f2a863b5fa0 RCX: 00007f2a8618e169
RDX: 0000000000000004 RSI: 0000200000000240 RDI: 0000000000000004
RBP: 00007f2a86210a68 R08: 0000000000000000 R09: 0000000000000000
R10: 00002000000001c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f2a863b5fa0 R15: 00007ffe0a55d7f8
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x30/0x180 kernel/locking/lockdep.c:6764
2 locks held by klogd/5191:
 #0: ffff8880b8739998 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:605
 #1: ffffffff8ee55700 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}, at: local_lock_acquire include/linux/local_lock_internal.h:38 [inline]
 #1: ffffffff8ee55700 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}, at: put_cpu_partial+0x72/0x250 mm/slub.c:3246
2 locks held by getty/5581:
 #0: ffff888035d420a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332e2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x5bb/0x1700 drivers/tty/n_tty.c:2222
6 locks held by syz.0.16/6726:
 #0: ffff88802578e420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88802578e730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88802578e730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff888074f88910 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888074f88910 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888074ed15f0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888074ed15f0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888074ed02a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888074ed02a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff888074ed15f0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888074ed15f0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.1.17/6779:
 #0: ffff88807cc5e420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88807cc5e730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88807cc5e730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff888074f895f0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888074f895f0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888074f8afb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888074f8afb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888074f89c60 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888074f89c60 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff888074f8afb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888074f8afb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.2.18/6796:
 #0: ffff88802fa2e420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88802fa2e730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88802fa2e730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff888074f8b620 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888074f8b620 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888074f8cfe0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888074f8cfe0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888074f8bc90 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888074f8bc90 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff888074f8cfe0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888074f8cfe0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.3.19/6813:
 #0: ffff888012f68420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff888012f68730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff888012f68730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff888074ed2940 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888074ed2940 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888074ed4300 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888074ed4300 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888074ed2fb0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888074ed2fb0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff888074ed4300 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888074ed4300 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.4.20/6837:
 #0: ffff88807df2c420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88807df2c730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88807df2c730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff888074ed4970 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888074ed4970 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888074f8f010 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888074f8f010 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888074f8dcc0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888074f8dcc0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff888074f8f010 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888074f8f010 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.5.21/6860:
 #0: ffff88805d98a420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88805d98a730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88805d98a730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff888074ed5650 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888074ed5650 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff88805b0b0f80 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff88805b0b0f80 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888074f8f680 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888074f8f680 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff88805b0b0f80 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff88805b0b0f80 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.6.22/6883:
 #0: 
ffff8880133c0420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff8880133c0730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff8880133c0730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff888074ed6330 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888074ed6330 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff88805b0682a0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff88805b0682a0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888074ed69a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888074ed69a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff88805b0682a0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff88805b0682a0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.7.23/6912:
 #0: ffff888079842420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff888079842730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff888079842730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff88805b0b1c60 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff88805b0b1c60 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff88805b0695f0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff88805b0695f0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff88805b0b22d0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff88805b0b22d0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff88805b0695f0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff88805b0695f0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
6 locks held by syz.8.24/6938:
 #0: ffff88814d47a420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88814d47a730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88814d47a730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5f6/0x1410 fs/namei.c:5218
 #2: ffff88805b069c60 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff88805b069c60 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff88805b06afb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff88805b06afb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff88805b0b2fb0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff88805b0b2fb0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x644/0xf10 fs/namei.c:5086
 #5: ffff88805b06afb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff88805b06afb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6ba/0xf10 fs/namei.c:5088
4 locks held by syz-executor/6941:

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc3-syzkaller-00032-ga79be02bba5c-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x4ab/0x4e0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:274 [inline]
 watchdog+0x1058/0x10a0 kernel/hung_task.c:437
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 6941 Comm: syz-executor Not tainted 6.15.0-rc3-syzkaller-00032-ga79be02bba5c-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:io_serial_in+0x76/0xb0 drivers/tty/serial/8250/8250_port.c:409
Code: c0 f6 33 fc 89 e9 41 d3 e6 48 83 c3 40 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 81 9f 9b fc 44 03 33 44 89 f2 ec <0f> b6 c0 5b 41 5e 41 5f 5d c3 cc cc cc cc 89 e9 80 e1 07 38 c1 7c
RSP: 0018:ffffc90003e9e998 EFLAGS: 00000006
RAX: 1ffffffff3548f05 RBX: ffffffff9aa47960 RCX: 0000000000000000
RDX: 00000000000003f9 RSI: 0000000000000000 RDI: 0000000000000020
RBP: 0000000000000000 R08: ffffffff858ec596 R09: fffff520007d3d14
R10: dffffc0000000000 R11: ffffffff858ec550 R12: 0000000000000000
R13: dffffc0000000000 R14: 00000000000003f9 R15: dffffc0000000000
FS:  0000555587553500(0000) GS:ffff8881250cf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe8470e7d60 CR3: 0000000034592000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 serial_port_in include/linux/serial_core.h:791 [inline]
 serial8250_console_write+0x4c0/0x1e00 drivers/tty/serial/8250/8250_port.c:3420
 console_emit_next_record kernel/printk/printk.c:3138 [inline]
 console_flush_all+0x86b/0xec0 kernel/printk/printk.c:3226
 __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
 console_unlock+0x151/0x3b0 kernel/printk/printk.c:3325
 vprintk_emit+0x761/0xa40 kernel/printk/printk.c:2450
 _printk+0xd5/0x120 kernel/printk/printk.c:2475
 caif_netlink_parms net/caif/chnl_net.c:424 [inline]
 ipcaif_newlink+0x201/0x4f0 net/caif/chnl_net.c:450
 rtnl_newlink_create+0x39b/0xcb0 net/core/rtnetlink.c:3833
 __rtnl_newlink net/core/rtnetlink.c:3950 [inline]
 rtnl_newlink+0x18b0/0x1fe0 net/core/rtnetlink.c:4065
 rtnetlink_rcv_msg+0x80f/0xd70 net/core/rtnetlink.c:6955
 netlink_rcv_skb+0x208/0x480 net/netlink/af_netlink.c:2534
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x7f8/0x9a0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8c3/0xcd0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg+0x221/0x270 net/socket.c:727
 __sys_sendto+0x365/0x4c0 net/socket.c:2180
 __do_sys_sendto net/socket.c:2187 [inline]
 __se_sys_sendto net/socket.c:2183 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2183
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe84638fffc
Code: 2a 5f 02 00 44 8b 4c 24 2c 4c 8b 44 24 20 89 c5 44 8b 54 24 28 48 8b 54 24 18 b8 2c 00 00 00 48 8b 74 24 10 8b 7c 24 08 0f 05 <48> 3d 00 f0 ff ff 77 34 89 ef 48 89 44 24 08 e8 70 5f 02 00 48 8b
RSP: 002b:00007ffd204ef3a0 EFLAGS: 00000293 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 00007fe8470e4620 RCX: 00007fe84638fffc
RDX: 0000000000000038 RSI: 00007fe8470e4670 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007ffd204ef3f4 R09: 000000000000000c
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000003
R13: 0000000000000000 R14: 00007fe8470e4670 R15: 0000000000000000
 </TASK>


Tested on:

commit:         a79be02b Fix mis-uses of 'cc-option' for warning disab..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1057ba6f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bbffc3b5b4301e1
dashboard link: https://syzkaller.appspot.com/bug?extid=321477fad98ea6dd35b7
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=166c9f54580000

