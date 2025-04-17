Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2584722839A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881506; cv=none; b=pSZZhEH08qj1wJUaYzkYPJiiG9/8cPoA99Fu9jEswWIAMgUZur74CBHcU5/9LE6+UOghfIRBy3Z6Zjxe8fY2CPZ4fCO6zUaY6eXGsCLKD9U7w/S2390Aj1VCfBfACemrOh4SCnGPt56+C/YaQmuy9KiM3283Wc1YyHmvmpDE6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881506; c=relaxed/simple;
	bh=PW8c1mWvkfR+W+kDvV9842WyzO/tTkTc3JwNFZ3+Noo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IkTjgMyJ/jDCaKQWld2gHpjgCwwrILA15mNGHQsAtCWO7GFvmTdKO1OhfmtEFBe7U7bnV2gepdB6Qa6hW6tVl8cXlSqtuevt9fmUtGQMBr/lUnd/wNfZr3vFQoGMWD2VDnf8eGiJHkdTrY3odZqK2/fu4DjxmyEXFyHjlrl5V4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so5531365ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881503; x=1745486303;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBHJfolbH6LTPpISuqRD4FxIFHlU3xIPXVQPhFDXFw0=;
        b=IG/nS94atsjLyfqPbDUR2prOco2M85AvFj1UuZIVgZEhgKwbeWQ3uuVnkwZBKwhvj2
         DPs3QJrqXqqLMA21nU53A1CUNKAoB1vD/Lv2WXNbMXEUbEv9u7gBF/JYpCWlRk9HQI1F
         rO2UE1qcojgPSXHKvWkSw1wVPiciRbyZo7rGLYFsYNThaMZX44SxRm8ClaAo1WhL8FaF
         CdNCPTOrSvGYN/vL5cPLdiE0HVGowVZVB2MStG8XZUtN6pbH05aqIi3lJ819fkzde1ON
         6XoyEJRpbov3inAc9fG3nF5OeGcaIU9YdFTBmwnupQIwl5qSHRzF9XfEG1WAojCh7V5h
         aQjA==
X-Forwarded-Encrypted: i=1; AJvYcCWcuX/XYT4fO86M/t4Sq3Tl/Hf2FjiAvGaClir9LnY+v9Xu09ZFT5SK2spTWY9Yk8cY/vpd3XT5cnquYT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Zv+6oRnvArEEjvYXwzLOlHOwmLuU2oA3e8/zRm+e9RPccpNw
	aRMok1wZFD2wtVgygvsSxR+t6kFTLlpOYWe/tZNEDk0kcP0TWIJKciCDJgbSpyC5D7634RGyPkE
	W1oa1K6qM5jx5E1js076hIeuZ4SyVq5fthJFuuTRXyWADH79OVdIhJ6I=
X-Google-Smtp-Source: AGHT+IFQ2r648nK2DZ6wrTInFuOr6gpYzVmaIHY7z3M7jrXaQPJZmNIXqb/Fu+7gACHl+VcvR6A5WiDkmp0WeckXGdaR2o7vh3i5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3e8d:b0:3d8:1ed0:e167 with SMTP id
 e9e14a558f8ab-3d81ed0e200mr3586855ab.14.1744881503233; Thu, 17 Apr 2025
 02:18:23 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:18:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6800c75f.050a0220.5cdb3.0010.GAE@google.com>
Subject: [syzbot] [afs?] BUG: sleeping function called from invalid context in lock_mm_and_find_vma
From: syzbot <syzbot+844241a52d3e9dccc8d1@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7cdabafc0012 Merge tag 'trace-v6.15-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13750fe4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fb8650d88e9fb80f
dashboard link: https://syzkaller.appspot.com/bug?extid=844241a52d3e9dccc8d1
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0f9317cc7b92/disk-7cdabafc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b9e0f7e75505/vmlinux-7cdabafc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5c11cc51cada/bzImage-7cdabafc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+844241a52d3e9dccc8d1@syzkaller.appspotmail.com

BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1546
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 6316, name: syz.2.49
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
3 locks held by syz.2.49/6316:
 #0: ffff8880341be9b8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff88805d998148 (&type->i_mutex_dir_key#16){.+.+}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x466/0xbe0 fs/afs/dynroot.c:351
CPU: 1 UID: 0 PID: 6316 Comm: syz.2.49 Not tainted 6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 __might_resched+0x558/0x6c0 kernel/sched/core.c:8818
 down_read_killable+0x9c/0xcb0 kernel/locking/rwsem.c:1546
 mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:193
 get_mmap_lock_carefully mm/memory.c:6355 [inline]
 lock_mm_and_find_vma+0x29c/0x2f0 mm/memory.c:6406
 do_user_addr_fault arch/x86/mm/fault.c:1360 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x1c1/0x920 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir64+0x297/0x690 fs/readdir.c:370
Code: 80 ff 48 89 df 4c 89 f6 e8 b6 a1 80 ff 4c 39 f3 0f 82 5f 02 00 00 48 39 eb 0f 87 56 02 00 00 0f 01 cb 0f ae e8 48 8b 44 24 58 <49> 89 46 08 48 8b 4c 24 18 48 8b 44 24 50 48 89 01 48 8b 44 24 20
RSP: 0018:ffffc90004317be8 EFLAGS: 00050283
RAX: 0000000000000006 RBX: 0000000000000020 RCX: ffff888021749e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000020
RBP: 00007ffffffff000 R08: ffffffff8242a51a R09: 0000000000000004
R10: ffffc90004317bf0 R11: ffffffff8242a2a0 R12: ffff888140ed9661
R13: ffffc90004317e50 R14: 0000000000000000 R15: 0000000000000005
 dir_emit include/linux/fs.h:3861 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x814/0xbe0 fs/afs/dynroot.c:352
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:403 [inline]
 __se_sys_getdents64+0x1e4/0x4c0 fs/readdir.c:389
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f420138d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f41ff1d5038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 00007f42015a6160 RCX: 00007f420138d169
RDX: 0000000000000022 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f420140e990 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f42015a6160 R15: 00007ffd0e8c7678
 </TASK>

=============================
[ BUG: Invalid wait context ]
6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 Tainted: G        W          
-----------------------------
syz.2.49/6316 is trying to lock:
ffff88807d326fe0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:193
other info that might help us debug this:
context-{5:5}
3 locks held by syz.2.49/6316:
 #0: ffff8880341be9b8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff88805d998148 (&type->i_mutex_dir_key#16){.+.+}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8ed3dfa0 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x466/0xbe0 fs/afs/dynroot.c:351
stack backtrace:
CPU: 1 UID: 0 PID: 6316 Comm: syz.2.49 Tainted: G        W           6.15.0-rc1-syzkaller-00325-g7cdabafc0012 #0 PREEMPT(full) 
Tainted: [W]=WARN
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4831 [inline]
 check_wait_context kernel/locking/lockdep.c:4903 [inline]
 __lock_acquire+0xc30/0xd80 kernel/locking/lockdep.c:5185
 lock_acquire+0x116/0x2f0 kernel/locking/lockdep.c:5866
 down_read_killable+0xcb/0xcb0 kernel/locking/rwsem.c:1547
 mmap_read_lock_killable+0x1d/0x70 include/linux/mmap_lock.h:193
 get_mmap_lock_carefully mm/memory.c:6355 [inline]
 lock_mm_and_find_vma+0x29c/0x2f0 mm/memory.c:6406
 do_user_addr_fault arch/x86/mm/fault.c:1360 [inline]
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x1c1/0x920 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir64+0x297/0x690 fs/readdir.c:370
Code: 80 ff 48 89 df 4c 89 f6 e8 b6 a1 80 ff 4c 39 f3 0f 82 5f 02 00 00 48 39 eb 0f 87 56 02 00 00 0f 01 cb 0f ae e8 48 8b 44 24 58 <49> 89 46 08 48 8b 4c 24 18 48 8b 44 24 50 48 89 01 48 8b 44 24 20
RSP: 0018:ffffc90004317be8 EFLAGS: 00050283
RAX: 0000000000000006 RBX: 0000000000000020 RCX: ffff888021749e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000020
RBP: 00007ffffffff000 R08: ffffffff8242a51a R09: 0000000000000004
R10: ffffc90004317bf0 R11: ffffffff8242a2a0 R12: ffff888140ed9661
R13: ffffc90004317e50 R14: 0000000000000000 R15: 0000000000000005
 dir_emit include/linux/fs.h:3861 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x814/0xbe0 fs/afs/dynroot.c:352
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents64 fs/readdir.c:403 [inline]
 __se_sys_getdents64+0x1e4/0x4c0 fs/readdir.c:389
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f420138d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f41ff1d5038 EFLAGS: 00000246 ORIG_RAX: 00000000000000d9
RAX: ffffffffffffffda RBX: 00007f42015a6160 RCX: 00007f420138d169
RDX: 0000000000000022 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f420140e990 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f42015a6160 R15: 00007ffd0e8c7678
 </TASK>
----------------
Code disassembly (best guess):
   0:	80 ff 48             	cmp    $0x48,%bh
   3:	89 df                	mov    %ebx,%edi
   5:	4c 89 f6             	mov    %r14,%rsi
   8:	e8 b6 a1 80 ff       	call   0xff80a1c3
   d:	4c 39 f3             	cmp    %r14,%rbx
  10:	0f 82 5f 02 00 00    	jb     0x275
  16:	48 39 eb             	cmp    %rbp,%rbx
  19:	0f 87 56 02 00 00    	ja     0x275
  1f:	0f 01 cb             	stac
  22:	0f ae e8             	lfence
  25:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
* 2a:	49 89 46 08          	mov    %rax,0x8(%r14) <-- trapping instruction
  2e:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  33:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  38:	48 89 01             	mov    %rax,(%rcx)
  3b:	48 8b 44 24 20       	mov    0x20(%rsp),%rax


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
