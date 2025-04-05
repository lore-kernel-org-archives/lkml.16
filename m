Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2141119A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743854645; cv=none; b=OzOMbp7Wr3tLihkYwdjBV+363Y001jaDICwqSjLLHDbrWUi9BRehwjAbOb4I+TleFAY/GBddhbiZksDPJG5ECWZ/aewbPeIFlpLI09j1dl/nOjEN9M/tDzxrj6PaICOih5Y0aAyG5+urwe0MkzyM9/dBcSCv4IPn4kihO57YDjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743854645; c=relaxed/simple;
	bh=q4JFC1SidJBR/nT6zDOMvZQeI5/0DhspgZhpBkzY4K4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tO36xWhqm4PQZ6CwA+s3vGWGx4WpUM7xshcr5dP5h4r/tozE8x+H175O19GDKO1dxGcUX3S6LS7w/bt1yht9d3Rk1K1DMWNNM+ui4WsxdvD46bTL/i5DAMn5J+clWGTutOPstYdKMshTeFuJxoUPTDvQUTp5+6YAVv/UZ6H4vBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b5875e250so325958639f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 05:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743854643; x=1744459443;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+q5dj7ny8M8dL6zWqHTgnE6/oD0jvp/H6BALI6dOlk4=;
        b=I6Z5sYFXt9KQ6UZxvKIaYoFell8iaE2Sha+KqLLK8zaDOYm9TzIHmF5iG77JdQtEOk
         MC2pw5NJJ5Je8VvvFYAYyTaEtQHPGNuLd4ISlycL1yvXP21LguqpclQJP1crjykyxjWp
         sTgAPwmPt8nNJUH3YvdfBMsxFFhdaDQ/8qYH3sYt2fsj9QIsYVfgmHY91CIXegJf5YaA
         VV26+/eKAl35D1Kgy7sKhYCgDxCCdkpfaIkKTjsgGVOTJsuqDIrVz4qPp0rGCMh5yFRz
         96VwwfvIqo3+NqXWOW98SNa7qvswL0mI3i4TUtaZ5I5Gzyses9/lVlthPzYTLIxnCNA+
         FKaA==
X-Gm-Message-State: AOJu0YxQ9KZRgvwAAVsmhqQq/cm0GdyABnNYAXiJrP9GjOMvPTsGFLX8
	I+rNB0Vw3nApLZThw+Pw2DO8DbHbFrgU4wipBBDD0Biiv98D+JWJYwAvq6ZW8B7prtDkFZqHYP1
	uhTnv1yq5ezfZkesiONXK+nw9Nx0119en03KbDGZeakNT0bpZgqXibUM=
X-Google-Smtp-Source: AGHT+IHjThRj6Seu9Z+8w5r4YAAPOc9h3ZypLqQsAj5EkOiO1liKFhAyWJl/30lXkQkjdQNPGbnh4I0WNB2DyWHyP8xZdb2PvxBP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3103:b0:3d3:ff5c:287 with SMTP id
 e9e14a558f8ab-3d6ec57c85bmr23151435ab.14.1743854643021; Sat, 05 Apr 2025
 05:04:03 -0700 (PDT)
Date: Sat, 05 Apr 2025 05:04:03 -0700
In-Reply-To: <20250405100756.1027477-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f11c33.050a0220.0a13.0237.GAE@google.com>
Subject: Re: [syzbot] [rdma?] [s390?] [net?] KASAN: null-ptr-deref Read in smc_tcp_syn_recv_sock
From: syzbot <syzbot+827ae2bfb3a3529333e9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in smc_release

======================================================
WARNING: possible circular locking dependency detected
6.12.0-rc4-syzkaller-00261-g850925a8133c-dirty #0 Not tainted
------------------------------------------------------
syz.1.6963/21920 is trying to acquire lock:
ffff888033c0b750 ((work_completion)(&new_smc->smc_listen_work)){+.+.}-{0:0}, at: touch_work_lockdep_map kernel/workqueue.c:3895 [inline]
ffff888033c0b750 ((work_completion)(&new_smc->smc_listen_work)){+.+.}-{0:0}, at: start_flush_work kernel/workqueue.c:4149 [inline]
ffff888033c0b750 ((work_completion)(&new_smc->smc_listen_work)){+.+.}-{0:0}, at: __flush_work+0x46d/0xc30 kernel/workqueue.c:4181

but task is already holding lock:
ffff88805fe88dd8 (sk_lock-AF_SMC/1){+.+.}-{0:0}, at: smc_release+0x378/0x5f0 net/smc/af_smc.c:338

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (sk_lock-AF_SMC/1){+.+.}-{0:0}:
       lock_sock_nested+0x3a/0xf0 net/core/sock.c:3611
       smc_listen_out+0x1fa/0x490 net/smc/af_smc.c:1907
       smc_listen_out_connected net/smc/af_smc.c:1927 [inline]
       smc_listen_work+0x571/0x50c0 net/smc/af_smc.c:2441
       process_one_work+0x9c8/0x1ba0 kernel/workqueue.c:3229
       process_scheduled_works kernel/workqueue.c:3310 [inline]
       worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
       kthread+0x2c4/0x3a0 kernel/kthread.c:389
       ret_from_fork+0x48/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #0 ((work_completion)(&new_smc->smc_listen_work)){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain kernel/locking/lockdep.c:3904 [inline]
       __lock_acquire+0x250b/0x3ce0 kernel/locking/lockdep.c:5202
       lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5825
       touch_work_lockdep_map kernel/workqueue.c:3895 [inline]
       start_flush_work kernel/workqueue.c:4149 [inline]
       __flush_work+0x477/0xc30 kernel/workqueue.c:4181
       __cancel_work_sync+0x10c/0x130 kernel/workqueue.c:4337
       smc_clcsock_release+0x5f/0xe0 net/smc/smc_close.c:29
       __smc_release+0x5c2/0x880 net/smc/af_smc.c:303
       smc_close_non_accepted+0xda/0x200 net/smc/af_smc.c:1839
       smc_close_cleanup_listen net/smc/smc_close.c:45 [inline]
       smc_close_active+0xc3c/0x1070 net/smc/smc_close.c:225
       __smc_release+0x634/0x880 net/smc/af_smc.c:279
       smc_release+0x1fc/0x5f0 net/smc/af_smc.c:346
       __sock_release+0xb3/0x270 net/socket.c:658
       sock_close+0x1c/0x30 net/socket.c:1426
       __fput+0x3f9/0xb60 fs/file_table.c:431
       task_work_run+0x151/0x250 kernel/task_work.c:239
       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
       exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
       exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
       __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
       syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
       do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(sk_lock-AF_SMC/1);
                               lock((work_completion)(&new_smc->smc_listen_work));
                               lock(sk_lock-AF_SMC/1);
  lock((work_completion)(&new_smc->smc_listen_work));

 *** DEADLOCK ***

3 locks held by syz.1.6963/21920:
 #0: ffff8880746ea008 (&sb->s_type->i_mutex_key#10){+.+.}-{3:3}, at: inode_lock include/linux/fs.h:815 [inline]
 #0: ffff8880746ea008 (&sb->s_type->i_mutex_key#10){+.+.}-{3:3}, at: __sock_release+0x86/0x270 net/socket.c:657
 #1: ffff88805fe88dd8 (sk_lock-AF_SMC/1){+.+.}-{0:0}, at: smc_release+0x378/0x5f0 net/smc/af_smc.c:338
 #2: ffffffff8e1b8380 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #2: ffffffff8e1b8380 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #2: ffffffff8e1b8380 (rcu_read_lock){....}-{1:2}, at: start_flush_work kernel/workqueue.c:4123 [inline]
 #2: ffffffff8e1b8380 (rcu_read_lock){....}-{1:2}, at: __flush_work+0x103/0xc30 kernel/workqueue.c:4181

stack backtrace:
CPU: 0 UID: 0 PID: 21920 Comm: syz.1.6963 Not tainted 6.12.0-rc4-syzkaller-00261-g850925a8133c-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_circular_bug+0x41c/0x610 kernel/locking/lockdep.c:2074
 check_noncircular+0x31a/0x400 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain kernel/locking/lockdep.c:3904 [inline]
 __lock_acquire+0x250b/0x3ce0 kernel/locking/lockdep.c:5202
 lock_acquire.part.0+0x11b/0x380 kernel/locking/lockdep.c:5825
 touch_work_lockdep_map kernel/workqueue.c:3895 [inline]
 start_flush_work kernel/workqueue.c:4149 [inline]
 __flush_work+0x477/0xc30 kernel/workqueue.c:4181
 __cancel_work_sync+0x10c/0x130 kernel/workqueue.c:4337
 smc_clcsock_release+0x5f/0xe0 net/smc/smc_close.c:29
 __smc_release+0x5c2/0x880 net/smc/af_smc.c:303
 smc_close_non_accepted+0xda/0x200 net/smc/af_smc.c:1839
 smc_close_cleanup_listen net/smc/smc_close.c:45 [inline]
 smc_close_active+0xc3c/0x1070 net/smc/smc_close.c:225
 __smc_release+0x634/0x880 net/smc/af_smc.c:279
 smc_release+0x1fc/0x5f0 net/smc/af_smc.c:346
 __sock_release+0xb3/0x270 net/socket.c:658
 sock_close+0x1c/0x30 net/socket.c:1426
 __fput+0x3f9/0xb60 fs/file_table.c:431
 task_work_run+0x151/0x250 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f851fb7e719
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f85208c6038 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f851fd35f80 RCX: 00007f851fb7e719
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: 0000000000000003
RBP: 00007f851fbf132e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f851fd35f80 R15: 00007ffea8200be8
 </TASK>


Tested on:

commit:         850925a8 Merge tag '9p-for-6.12-rc5' of https://github..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=114cefb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=17c0d505695d6b0
dashboard link: https://syzkaller.appspot.com/bug?extid=827ae2bfb3a3529333e9
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=155d294c580000

