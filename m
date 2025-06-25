Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE504207F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750811860; cv=none; b=HwemB5D05b56v0hL242yGAoB1ecihrc1fESr58jIy0vtGFGyF13I97vUyWZF5axvtqjNR9h8iA192OZ7DuNudebmjR/xuLA8uq9LlB5xGt4pKeJaaOEMTHXqrhpJnuRzextJCBU/QO2QFsTC1jZ52IMuKbn+QMXQEyZXWyJKWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750811860; c=relaxed/simple;
	bh=Jt3UcNydwSanecu+g9vYQd8WbQipS4OTlsZTFMGVwXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jgn/nXqaqBfHbG1FEi88xy9ub3zMTH9rBk9FyJluUj/L/bzBt8eXp4oemLpus86iZjEfb0rVF0i+JY+MuBJxuox8uBsR0/QRwgV3F7Xe5rDFzIjbqqVKjt8PhiAj4EydGy6NGB/B5JbogTrOLLgapztpIlPHe6Sz7SsXWVib6gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 685B44C300007A7C; Wed, 25 Jun 2025 08:37:24 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7869486685395
X-SMAIL-UIID: 46486D784DE14E91A2EBDBFB0C7ACAEB-20250625-083724-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+a5d1c9dfa91705cd2f6d@syzkaller.appspotmail.com>
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] possible deadlock in ntfs_file_mmap_prepare
Date: Wed, 25 Jun 2025 08:37:11 +0800
Message-ID: <20250625003712.1681-1-hdanton@sina.com>
In-Reply-To: <685af3b1.a00a0220.2e5631.0090.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 24 Jun 2025 11:51:29 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    5d4809e25903 Add linux-next specific files for 20250620
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=17c65b0c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=58afc4b78b52b7e3
> dashboard link: https://syzkaller.appspot.com/bug?extid=a5d1c9dfa91705cd2f6d
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1776a182580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17762dd4580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/16492bf6b788/disk-5d4809e2.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/7be284ded1de/vmlinux-5d4809e2.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/467d717f0d9c/bzImage-5d4809e2.xz
> mounted in repro #1: https://storage.googleapis.com/syzbot-assets/6f34591c3e45/mount_0.gz
> mounted in repro #2: https://storage.googleapis.com/syzbot-assets/d137199587c7/mount_3.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a5d1c9dfa91705cd2f6d@syzkaller.appspotmail.com
> 
> loop0: detected capacity change from 0 to 4096
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.16.0-rc2-next-20250620-syzkaller #0 Not tainted
> ------------------------------------------------------
> syz-executor414/5843 is trying to acquire lock:
> ffff8880739bcd08 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:869 [inline]
> ffff8880739bcd08 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}, at: ntfs_file_mmap_prepare+0x599/0x770 fs/ntfs3/file.c:314
> 
> but task is already holding lock:
> ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
> ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_pgoff+0x1bd/0x4c0 mm/util.c:577
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #1 (&mm->mmap_lock){++++}-{4:4}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        gup_fast_fallback+0x22e/0x2270 mm/gup.c:3366
>        iov_iter_extract_user_pages lib/iov_iter.c:1846 [inline]
>        iov_iter_extract_pages+0x35a/0x5e0 lib/iov_iter.c:1909
>        dio_refill_pages fs/direct-io.c:172 [inline]
>        dio_get_page fs/direct-io.c:213 [inline]
>        do_direct_IO fs/direct-io.c:915 [inline]
>        __blockdev_direct_IO+0x1166/0x3490 fs/direct-io.c:1243
>        blockdev_direct_IO include/linux/fs.h:3497 [inline]
>        ntfs_direct_IO+0x20b/0x410 fs/ntfs3/inode.c:813
>        generic_file_read_iter+0x319/0x510 mm/filemap.c:2881
>        do_iter_readv_writev+0x56b/0x7f0 fs/read_write.c:-1
>        vfs_readv+0x253/0x850 fs/read_write.c:1018
>        do_preadv fs/read_write.c:1132 [inline]
>        __do_sys_preadv2 fs/read_write.c:1191 [inline]
>        __se_sys_preadv2+0x179/0x290 fs/read_write.c:1182
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> #0 (&sb->s_type->i_mutex_key#15){+.+.}-{4:4}:
>        check_prev_add kernel/locking/lockdep.c:3168 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3287 [inline]
>        validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
>        __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
>        inode_lock include/linux/fs.h:869 [inline]
>        ntfs_file_mmap_prepare+0x599/0x770 fs/ntfs3/file.c:314

The bad on the ntfs3 side given locking order [3]
 *
 *  ->i_rwsem			(generic_perform_write)
 *    ->mmap_lock		(fault_in_readable->do_page_fault)
 *
[3] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/filemap.c#n100

>        vfs_mmap_prepare include/linux/fs.h:2294 [inline]
>        call_mmap_prepare mm/vma.c:2585 [inline]
>        __mmap_region mm/vma.c:2657 [inline]
>        mmap_region+0xb4a/0x2080 mm/vma.c:2746
>        do_mmap+0xc45/0x10d0 mm/mmap.c:561
>        vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
>        ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> other info that might help us debug this:
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(&mm->mmap_lock);
>                                lock(&sb->s_type->i_mutex_key#15);
>                                lock(&mm->mmap_lock);
>   lock(&sb->s_type->i_mutex_key#15);
> 
>  *** DEADLOCK ***
> 
> 1 lock held by syz-executor414/5843:
>  #0: ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
>  #0: ffff888023ca6d60 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_pgoff+0x1bd/0x4c0 mm/util.c:577
> 
> stack backtrace:
> CPU: 1 UID: 0 PID: 5843 Comm: syz-executor414 Not tainted 6.16.0-rc2-next-20250620-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2046
>  check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2178
>  check_prev_add kernel/locking/lockdep.c:3168 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3287 [inline]
>  validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
>  __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
>  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>  down_write+0x96/0x1f0 kernel/locking/rwsem.c:1577
>  inode_lock include/linux/fs.h:869 [inline]
>  ntfs_file_mmap_prepare+0x599/0x770 fs/ntfs3/file.c:314
>  vfs_mmap_prepare include/linux/fs.h:2294 [inline]
>  call_mmap_prepare mm/vma.c:2585 [inline]
>  __mmap_region mm/vma.c:2657 [inline]
>  mmap_region+0xb4a/0x2080 mm/vma.c:2746
>  do_mmap+0xc45/0x10d0 mm/mmap.c:561
>  vm_mmap_pgoff+0x31b/0x4c0 mm/util.c:579
>  ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:607
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fd3b0279469
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 21 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff0b2f7dd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
> RAX: ffffffffffffffda RBX: 0000200000000080 RCX: 00007fd3b0279469
> RDX: 000000000000000e RSI: 0000000000001000 RDI: 0000200000001000
> RBP: 00002000000000c0 R08: 0000000000000005 R09: 0000000000000000
> R10: 0000000000000011 R11: 0000000000000246 R12: 0031656c69662f2e
> R13: 0000200000000040 R14: 431bde82d7b634db R15: 00007fff0b2f7e40
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 
