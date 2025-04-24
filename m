Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371B226CF0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496067; cv=none; b=hs9F3mvcuGxvgWL0X2CMg9bcQqy9W/6xFv7cc5O1R8lM4kQlW+D7S+5LP6d5mui1oJTaK/3ISVLUSpJSJOgsOqfSNsUxyLw9yYq8Smz+R4qZZp8h7HWWMs2yDZyaGQGNz6477ecCGSM7T+46+LQwgjAxLmoIqbBpsXrnBnc0V/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496067; c=relaxed/simple;
	bh=xx18+6HF4aER7sl3n1jJDUXOIbtDOIVs8qCqowCLCEo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qm94HnYN/SAG2Fb/el163d2Qub0dz6ckf6Y13UipZNsgJRH7Cbv+L4i2xDMe1mzcgzhCZHgfh7Kiy6iq9gtd9HPrx1NAnCXIOB5JGaySCtFLF8D6nbicp57ZhTL+y7sMNj+6kDlO3lYGe56PgRIhVON6ZH/6ssSVkon5/GP9wAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d43541a706so8712335ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496064; x=1746100864;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=as/VPUgsNj2x2gH4v1yBgkxtfns4B9SE+XDVA72+CpU=;
        b=b4xl9UORahAPdVFRbfxk55SUP3qeJy/vAHserRnBgg6EfxqraqirtIcl1PfsHAp7xt
         taOaOzYah+tV5OkB+nEkejW6uqLEjp7pYQcw+cl6sfmGHjAhd9Ccs6gJ+UOTE3klx2pa
         gLZV02aOCgkUjYAiY/1MvZid6WKkCNduWBg5H69jhqyAdLzdUrB9kTuxprJtzhqbFkt4
         qnMrI0A2VbGu7XUmVQp8ufdr0qjgGIrX2UboMVe8+ro99Z8QIKArFys+YJ11hxLyJD1l
         JZyLLSdznf1tvuiueJU0VV/BfgflBBIidxypJJ2Zaj5HfTMFJkLyLYcweasB6fJq/T8M
         ky0A==
X-Forwarded-Encrypted: i=1; AJvYcCUEH4PqPkZZ8HicI9e9Dga1zq4ZsaaFvaWgfozAx/DQ9ghRKo6n9sONrJZgJjUzU9SXwFeudAadQICdxEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/t99D7RfOm/AtmplVQXOGEH42zgJHQcpwCauxsY0D+X5vqRZH
	FfI60mFNUe/NhdSOCLMAMB10hytXmlY9kUs1zXuKnATNnhuqo8Qxioq6Cfgj0Ybr9OGXONPphRH
	i11A12oMRp0mtSBXIZpBaZfo6ILv1eswCcgrvXjgGYSwzI1UD5O2SjDo=
X-Google-Smtp-Source: AGHT+IG31A2ZvnZtt6W0xuDSCDRzGoH1g+OInK1BEaUU4Lj9tgaCL6Pf8yLgpsXmYDXi+FBEvYx+qhmdMTd2mMjXIFCGGdSj9Nuf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c8:b0:3d2:6768:c4fa with SMTP id
 e9e14a558f8ab-3d93041b5c0mr23772405ab.21.1745496063823; Thu, 24 Apr 2025
 05:01:03 -0700 (PDT)
Date: Thu, 24 Apr 2025 05:01:03 -0700
In-Reply-To: <20250424110546.4284-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <680a27ff.050a0220.2c0118.0bf5.GAE@google.com>
Subject: Re: [syzbot] [fs?] INFO: task hung in vfs_rename (2)
From: syzbot <syzbot+321477fad98ea6dd35b7@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in vfs_rename

INFO: task syz.0.16:6758 blocked for more than 143 seconds.
      Not tainted 6.15.0-rc3-syzkaller-00032-ga79be02bba5c-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.16        state:D stack:24088 pid:6758  tgid:6757  ppid:6641   task_flags:0x400140 flags:0x00004004
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
 vfs_rename+0x6b9/0xf10 fs/namei.c:5086
 do_renameat2+0x106c/0x1440 fs/namei.c:5272
 __do_sys_renameat2 fs/namei.c:5306 [inline]
 __se_sys_renameat2 fs/namei.c:5303 [inline]
 __x64_sys_renameat2+0xce/0xe0 fs/namei.c:5303
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f85e2b8e169
RSP: 002b:00007f85e3ac8038 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 00007f85e2db5fa0 RCX: 00007f85e2b8e169
RDX: 0000000000000004 RSI: 0000200000000240 RDI: 0000000000000004
RBP: 00007f85e2c10a68 R08: 0000000000000000 R09: 0000000000000000
R10: 00002000000001c0 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f85e2db5fa0 R15: 00007fffcd12b258
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8ed3df20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x30/0x180 kernel/locking/lockdep.c:6764
2 locks held by kworker/u8:3/47:
 #0: ffff8880b8739998 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:605
 #1: ffff8880b8723b08 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x389/0x7a0 kernel/sched/psi.c:975
2 locks held by getty/5593:
 #0: ffff888035d2a0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900036db2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x5bb/0x1700 drivers/tty/n_tty.c:2222
6 locks held by syz.0.16/6758:
 #0: ffff888024c56420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff888024c56730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff888024c56730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff888070bc8910 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888070bc8910 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff8880709c15f0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff8880709c15f0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff8880709c02a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff8880709c02a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff8880709c15f0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff8880709c15f0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.1.17/6888:
 #0: ffff88802e1aa420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88802e1aa730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88802e1aa730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff888070bc95f0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888070bc95f0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888070bcafb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888070bcafb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888070bc9c60 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888070bc9c60 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff888070bcafb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888070bcafb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.2.18/6905:
 #0: ffff88807dcc0420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88807dcc0730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88807dcc0730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff8880709c22d0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff8880709c22d0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff8880709c3c90 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff8880709c3c90 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff8880709c2940 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff8880709c2940 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff8880709c3c90 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff8880709c3c90 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.3.19/6922:
 #0: ffff88807e762420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88807e762730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88807e762730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff888070bcbc90 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888070bcbc90 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888070bcd650 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888070bcd650 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888070bcc300 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888070bcc300 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff888070bcd650 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888070bcd650 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.4.20/6945:
 #0: ffff88807d390420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88807d390730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88807d390730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff888070bce330 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888070bce330 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888070be82a0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888070be82a0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888070bce9a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888070bce9a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff888070be82a0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888070be82a0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.5.21/6968:
 #0: ffff888073312420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff888073312730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff888073312730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff8880709c4970 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff8880709c4970 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888070be8f80 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888070be8f80 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff8880709c4fe0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff8880709c4fe0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff888070be8f80 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888070be8f80 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.6.22/6991:
 #0: ffff88807d4ce420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff88807d4ce730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff88807d4ce730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff888070be95f0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888070be95f0 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888070beafb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888070beafb0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888070be9c60 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888070be9c60 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff888070beafb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888070beafb0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.7.23/7020:
 #0: ffff888035186420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff888035186730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff888035186730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff888070bebc90 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888070bebc90 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff888070bed650 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff888070bed650 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888070bec300 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888070bec300 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff888070bed650 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff888070bed650 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
6 locks held by syz.8.24/7045:
 #0: ffff888142fa6420 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:556
 #1: ffff888142fa6730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: lock_rename fs/namei.c:3269 [inline]
 #1: ffff888142fa6730 (&type->s_vfs_rename_key){+.+.}-{4:4}, at: do_renameat2+0x5ea/0x1440 fs/namei.c:5216
 #2: ffff888070bee330 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #2: ffff888070bee330 (&sb->s_type->i_mutex_key#19/1){+.+.}-{4:4}, at: lock_two_directories+0x1a8/0x220 fs/namei.c:3245
 #3: ffff88805b6682a0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #3: ffff88805b6682a0 (&sb->s_type->i_mutex_key#19/5){+.+.}-{4:4}, at: lock_two_directories+0x1d1/0x220 fs/namei.c:3246
 #4: ffff888070bee9a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:902 [inline]
 #4: ffff888070bee9a0 (&sb->s_type->i_mutex_key#19/2){+.+.}-{4:4}, at: vfs_rename+0x63f/0xf10 fs/namei.c:5084
 #5: ffff88805b6682a0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
 #5: ffff88805b6682a0 (&sb->s_type->i_mutex_key#19){++++}-{4:4}, at: vfs_rename+0x6b9/0xf10 fs/namei.c:5086
3 locks held by syz-executor/7048:

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.15.0-rc3-syzkaller-00032-ga79be02bba5c-dirty #0 PREEMPT(full) 
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 47 Comm: kworker/u8:3 Not tainted 6.15.0-rc3-syzkaller-00032-ga79be02bba5c-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: bat_events batadv_nc_worker
RIP: 0010:unwind_next_frame+0x188f/0x23b0 arch/x86/kernel/unwind_orc.c:648
Code: 49 83 c7 03 48 89 d8 48 c1 e8 03 0f b6 04 28 84 c0 0f 85 50 0a 00 00 4c 89 f8 48 c1 e8 03 0f b6 04 28 84 c0 0f 85 5c 0a 00 00 <48> 0f bf 03 48 8b 74 24 08 48 01 c6 49 8d 54 24 40 4c 89 e7 e8 38
RSP: 0018:ffffc900000072c8 EFLAGS: 00000246
RAX: 0000000000000000 RBX: ffffffff918407d8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffc90000007400
RBP: dffffc0000000000 R08: ffffc900000073ff R09: 0000000000000000
R10: ffffc900000073f0 R11: fffff52000000e80 R12: ffffc900000073a0
R13: ffffc90000008000 R14: ffffffff918407da R15: ffffffff918407d9
FS:  0000000000000000(0000) GS:ffff888124fcf000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8db9ee7d60 CR3: 000000000eb38000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 arch_stack_walk+0x11e/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x11a/0x1d0 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x66/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4161 [inline]
 slab_alloc_node mm/slub.c:4210 [inline]
 kmem_cache_alloc_node_noprof+0x1f2/0x3b0 mm/slub.c:4262
 kmalloc_reserve+0xa8/0x2a0 net/core/skbuff.c:577
 __alloc_skb+0x1f2/0x480 net/core/skbuff.c:668
 __netdev_alloc_skb+0x105/0xa10 net/core/skbuff.c:732
 netdev_alloc_skb include/linux/skbuff.h:3413 [inline]
 dev_alloc_skb include/linux/skbuff.h:3426 [inline]
 __ieee80211_beacon_get+0x9a7/0x15e0 net/mac80211/tx.c:5475
 ieee80211_beacon_get_tim+0xb7/0x330 net/mac80211/tx.c:5597
 ieee80211_beacon_get include/net/mac80211.h:5648 [inline]
 mac80211_hwsim_beacon_tx+0x3a2/0x860 drivers/net/wireless/virtual/mac80211_hwsim.c:2313
 __iterate_interfaces+0x297/0x570 net/mac80211/util.c:761
 ieee80211_iterate_active_interfaces_atomic+0xd8/0x170 net/mac80211/util.c:797
 mac80211_hwsim_beacon+0xd4/0x1f0 drivers/net/wireless/virtual/mac80211_hwsim.c:2347
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x5a6/0xd40 kernel/time/hrtimer.c:1825
 hrtimer_run_softirq+0x19a/0x2c0 kernel/time/hrtimer.c:1842
 handle_softirqs+0x2d6/0x9b0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xfb/0x220 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:check_preemption_disabled+0x1e/0x120 lib/smp_processor_id.c:14
Code: 90 90 90 90 90 90 90 90 90 90 90 90 41 57 41 56 41 55 41 54 53 48 83 ec 10 4c 8d 25 3c 31 3d 07 65 49 8b 04 24 48 89 44 24 08 <65> 8b 1d 3f 31 3d 07 65 8b 05 34 31 3d 07 a9 ff ff ff 7f 74 24 65
RSP: 0018:ffffc90000b87980 EFLAGS: 00000282
RAX: a0fb20d63b9f4f00 RBX: ffffffff93651020 RCX: ffff888020e8da00
RDX: 0000000000000000 RSI: ffffffff8ca0e2a0 RDI: ffffffff8ca0e260
RBP: ffffffff8bf24ea5 R08: ffffffff8bf25051 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff93651020
R13: 1ffff1100b4e0b13 R14: ffff88805a7808e0 R15: ffffffff8ed3df20
 rcu_is_watching_curr_cpu include/linux/context_tracking.h:128 [inline]
 rcu_is_watching+0x15/0xb0 kernel/rcu/tree.c:736
 trace_lock_release include/trace/events/lock.h:69 [inline]
 lock_release+0x4e/0x3e0 kernel/locking/lockdep.c:5877
 rcu_lock_release include/linux/rcupdate.h:341 [inline]
 rcu_read_unlock include/linux/rcupdate.h:871 [inline]
 batadv_nc_process_nc_paths+0x2f0/0x3a0 net/batman-adv/network-coding.c:699
 batadv_nc_worker+0x42a/0x610 net/batman-adv/network-coding.c:728
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xac3/0x18e0 kernel/workqueue.c:3319
 worker_thread+0x870/0xd50 kernel/workqueue.c:3400
 kthread+0x7b7/0x940 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


Tested on:

commit:         a79be02b Fix mis-uses of 'cc-option' for warning disab..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=114b3fcf980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bbffc3b5b4301e1
dashboard link: https://syzkaller.appspot.com/bug?extid=321477fad98ea6dd35b7
compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15447d9b980000

