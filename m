Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708481DF258
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749857553; cv=none; b=puJUePkOnhU3tJ2zXrkY1USHziOL/zzmdPgeBYYjxwvuCbE0xftz5nMTgzc5h0oTil9zVhSHo4gOHsizqjX5oHf6sdhyJ1BRN6N/WZUMS/FGRhn3dGJ3kmk2GxcRn+DSG4ZhENwnm8C+uG8jHlr8D8r2Vd1C6oQsNA8wCCG/ync=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749857553; c=relaxed/simple;
	bh=UDqaCvAIdirfawmGp34dqRheS5JfCbkZZ8jW7eT1xDA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IPSGs0tedZjWYnPyar34NcV+hkGDF3PnXnYK92gyuJFS69U+oflBNyro5LqFHPlD8tYGFaTL3Mg/RW96B9y/rtvdDsHl3ytznmljrT8ITV+2pKHhWqs8OpX7JZPA29nlZIubppHueQwmPaIw3EK/zfcNibqUcoSFjq+1kNXW2nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddc5137992so30227485ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749857550; x=1750462350;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGrDk590oj5l4YMCQPrjJdpXxax7r8Aqn6OXYAddFc8=;
        b=AM6CNHzR+m2x5JR5KOpy0INV8A8g/7c+IyT3y6qC0EytDblwQk+bR4e6eVQXm8Hs4a
         Q7kOo5xyg57yRJ8oNBcVR+PN2A1D44LBYlcxnx4VRHBlI9EudAvxTMq33vaSiDX3z6U6
         VtICpHg2z+YrIH4eOYfCyYukHCUvfyB1KvG6RPX5BMovI+z7+JI4VD8vZrPkeIfmaBzw
         r0MXhnvnaCOSvYJWULnGn//fwtPJbb1uBtwgziFAsUGPNprowkNtRffzNWcFmG7e+Cvv
         PmsPR2RpbDEpipoXgDrMbkZS7R999cCGb0ColWvThNCGv1+YCO9AC6Fbc3ve8INZ8a+O
         kK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXToRyGTHIIDMDaCxTKUIT/mCAsbWXzyCjffjd5PM3VYFdbHY/0a52Uc9b8n2HUR94qBs8LWSWjslJ1AL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc9t9YGUxX5Z5ho3EqmXg+IJGxemAGxwWeVQ0ZdgGHlJzdyBLV
	Wm0IiDcM2OndsT74uMLIhd7cqDRuB28SW6hBtaHf79HYASJDQfuD9z4aD1XH9mehHrEl+BQE1Q6
	D8CSWnIGOc1P2tClLI+5FHalit7KafBiJipW2Cpt/YGX/dQeRBkclAvkpxg0=
X-Google-Smtp-Source: AGHT+IHGbocCoWkDDO+t3uXpA2pWI1xImojiPlt7aYrdXlY4jZ0GM7N7S0M+v5LezbxL5CqFjRTTVkXtH0QcqiC46/BZl/bNjUqa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160b:b0:3dd:bb7e:f1af with SMTP id
 e9e14a558f8ab-3de07cedfc2mr17993855ab.20.1749857550693; Fri, 13 Jun 2025
 16:32:30 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:32:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684cb50e.a00a0220.279073.0019.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in mnt_want_write (6)
From: syzbot <syzbot+a16a4917cc8df9582272@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    475c850a7fdd Add linux-next specific files for 20250606
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17aea9d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28859360c84ac63d
dashboard link: https://syzkaller.appspot.com/bug?extid=a16a4917cc8df9582272
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2f1cf8485b7a/disk-475c850a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/976adb9f739e/vmlinux-475c850a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0ac20b1308b7/bzImage-475c850a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a16a4917cc8df9582272@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.15.0-next-20250606-syzkaller #0 Not tainted
------------------------------------------------------
syz.1.1351/13335 is trying to acquire lock:
ffff888035b3c428 (sb_writers#5){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:557

but task is already holding lock:
ffff888059674100 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
ffff888059674100 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}, at: open_last_lookups fs/namei.c:3804 [inline]
ffff888059674100 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}, at: path_openat+0x8da/0x3830 fs/namei.c:4043

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       down_read+0x46/0x2e0 kernel/locking/rwsem.c:1524
       inode_lock_shared include/linux/fs.h:882 [inline]
       lookup_slow+0x46/0x70 fs/namei.c:1833
       walk_component+0x2d2/0x400 fs/namei.c:2138
       lookup_last fs/namei.c:2639 [inline]
       path_lookupat+0x163/0x430 fs/namei.c:2663
       filename_lookup+0x212/0x570 fs/namei.c:2692
       kern_path+0x35/0x50 fs/namei.c:2825
       lookup_bdev+0xc0/0x280 block/bdev.c:1205
       resume_store+0x169/0x460 kernel/power/hibernate.c:1272
       kernfs_fop_write_iter+0x378/0x4f0 fs/kernfs/file.c:334
       new_sync_write fs/read_write.c:593 [inline]
       vfs_write+0x54b/0xa90 fs/read_write.c:686
       ksys_write+0x145/0x250 fs/read_write.c:738
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&of->mutex){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:747
       kernfs_fop_write_iter+0x1e0/0x4f0 fs/kernfs/file.c:325
       iter_file_splice_write+0x937/0x1000 fs/splice.c:738
       do_splice_from fs/splice.c:935 [inline]
       do_splice+0xc79/0x1660 fs/splice.c:1348
       __do_splice fs/splice.c:1430 [inline]
       __do_sys_splice fs/splice.c:1633 [inline]
       __se_sys_splice+0x2e1/0x460 fs/splice.c:1615
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&pipe->mutex){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:747
       iter_file_splice_write+0x1e6/0x1000 fs/splice.c:683
       do_splice_from fs/splice.c:935 [inline]
       do_splice+0xc79/0x1660 fs/splice.c:1348
       __do_splice fs/splice.c:1430 [inline]
       __do_sys_splice fs/splice.c:1633 [inline]
       __se_sys_splice+0x2e1/0x460 fs/splice.c:1615
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (sb_writers#5){.+.+}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
       __sb_start_write include/linux/fs.h:1793 [inline]
       sb_start_write+0x4d/0x1c0 include/linux/fs.h:1929
       mnt_want_write+0x41/0x90 fs/namespace.c:557
       ovl_create_object+0xfc/0x310 fs/overlayfs/dir.c:628
       lookup_open fs/namei.c:3708 [inline]
       open_last_lookups fs/namei.c:3807 [inline]
       path_openat+0x14f1/0x3830 fs/namei.c:4043
       do_filp_open+0x1fa/0x410 fs/namei.c:4073
       do_sys_openat2+0x121/0x1c0 fs/open.c:1437
       do_sys_open fs/open.c:1452 [inline]
       __do_sys_creat fs/open.c:1530 [inline]
       __se_sys_creat fs/open.c:1524 [inline]
       __x64_sys_creat+0x8f/0xc0 fs/open.c:1524
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  sb_writers#5 --> &of->mutex --> &ovl_i_mutex_dir_key[depth]#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ovl_i_mutex_dir_key[depth]#2);
                               lock(&of->mutex);
                               lock(&ovl_i_mutex_dir_key[depth]#2);
  rlock(sb_writers#5);

 *** DEADLOCK ***

2 locks held by syz.1.1351/13335:
 #0: ffff888027172428
 (sb_writers#27){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:557
 #1: 
ffff888059674100
 (&ovl_i_mutex_dir_key[depth]
#2){++++}-{4:4}, at: inode_lock include/linux/fs.h:867 [inline]
#2){++++}-{4:4}, at: open_last_lookups fs/namei.c:3804 [inline]
#2){++++}-{4:4}, at: path_openat+0x8da/0x3830 fs/namei.c:4043

stack backtrace:
CPU: 1 UID: 0 PID: 13335 Comm: syz.1.1351 Not tainted 6.15.0-next-20250606-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2046
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2178
 check_prev_add kernel/locking/lockdep.c:3168 [inline]
 check_prevs_add kernel/locking/lockdep.c:3287 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
 percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
 percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
 __sb_start_write include/linux/fs.h:1793 [inline]
 sb_start_write+0x4d/0x1c0 include/linux/fs.h:1929
 mnt_want_write+0x41/0x90 fs/namespace.c:557
 ovl_create_object+0xfc/0x310 fs/overlayfs/dir.c:628
 lookup_open fs/namei.c:3708 [inline]
 open_last_lookups fs/namei.c:3807 [inline]
 path_openat+0x14f1/0x3830 fs/namei.c:4043
 do_filp_open+0x1fa/0x410 fs/namei.c:4073
 do_sys_openat2+0x121/0x1c0 fs/open.c:1437
 do_sys_open fs/open.c:1452 [inline]
 __do_sys_creat fs/open.c:1530 [inline]
 __se_sys_creat fs/open.c:1524 [inline]
 __x64_sys_creat+0x8f/0xc0 fs/open.c:1524
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f14eef8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f14ecdf6038 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 00007f14ef1b5fa0 RCX: 00007f14eef8e929
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00002000000002c0
RBP: 00007f14ef010b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f14ef1b5fa0 R15: 00007fff1db0f028
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
