Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2C61876
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743329068; cv=none; b=cKKeyPKxqJi5S0BJY1zFXPcWE2upE8lXk/yTwFuawqO26bidd9Rg9lXca5BMWFzXU2jvL750z/Dt+zC5rm0T7ldhkVWkG1d8tQcJrSgSftxhqw/4Fr6zO5ggturMxLlxZ/suujSTC08wxqjz9w/bzXI5wZ4R9t+CvDR17W+y1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743329068; c=relaxed/simple;
	bh=CKA/q8SUwicv45fZSYdr5M9GG+0Vb8WTCuH0zxxBMuw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qjWJeJiGd0/8tuQKP4czFvmYUHoNVeET5a1LXmZQgte0i6/WpL9NhB1kb/GCYTNE889JdybianhuOByn7T5tODQ0fwpQ2/9O1041yGDaacDRiSJ7mGHgkrp4UfTuhr4M1l/k9dVKBIMuCFQ20PKiuBi9eyASDAHMwi8IqqR88VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-84cdae60616so383130839f.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 03:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329065; x=1743933865;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5DBVfHx8Lp9VK1V60rXQ7/31BcaR07XDIHKYhbjfz8=;
        b=cDZbch1YyKswCUGufiygLv30Bff5cUkMfQMfyTTrd362WlgG6t56K7iPPfzpmp0VB/
         k4jyyvNt8VZEBkZAn6VGnyuF/ABesLjc3a0tjRGLUhIsyoPdUjX6x5KAu2SGtSoAJYsV
         rznMNPtcK0k5Ry8sUEq5CrKPj4ls3KbLlZoU5w+9RfeLJAQ3zP+Tyl1EGqkay/29Prje
         o42eyXu65L/mFVoNj+st4g1o4FImc4urw9+0N1/+LoONIaBnxxNrkfmi5A4xq1M2yojw
         YalpN42ybhxxuhhUopC59ikNOH7eCV1G9tt5euPSSHxxIAfKPJxaRZkiI+EcDnqjLQ4O
         2mGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0iQVKxhwzzA948yB4qqNm02p2VIJx4YsEB8xvfWWYKUqySJG4KkcQ0DXEyWCmRedKndcfOnkH4pfFj/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhb6bWAgjVKbh4lsc59L8mrs+TbzZ6GtMz2tV081ys9SR1ttHn
	gaIfet/DG2q+UvAhx7P3bAiHGQEpGeqsBf+oIMeP/Uc5AUx3df06plRky+x6oTJ3FLlwyYYkEF7
	Ue6pcSSr/SD1qmdbA3/pMJ7KuLGnNaxD43ZXgRfmXwr6DLMI81ay6kv8=
X-Google-Smtp-Source: AGHT+IFA0YZNlTkL2dkGSagzsOgk+UJLV0BiH+e0f2bvPo+oPJeJVUwy4CSKPpnxG5VeWCURHH+dWhFbo1K11tSJgfBxnoVWC1HA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3387:b0:3d0:443d:a5c3 with SMTP id
 e9e14a558f8ab-3d5e08f0fd1mr61192345ab.3.1743329065427; Sun, 30 Mar 2025
 03:04:25 -0700 (PDT)
Date: Sun, 30 Mar 2025 03:04:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e91729.050a0220.1547ec.009e.GAE@google.com>
Subject: [syzbot] [afs?] BUG: sleeping function called from invalid context in __do_fault
From: syzbot <syzbot+8245611446194a52150d@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, marc.dionne@auristor.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2df0c02dab82 x86 boot build: make git ignore stale 'tools'..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b39804580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=235ad3ee10cb70e
dashboard link: https://syzkaller.appspot.com/bug?extid=8245611446194a52150d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-2df0c02d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed59f8925c2f/vmlinux-2df0c02d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0cb2f671427e/bzImage-2df0c02d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8245611446194a52150d@syzkaller.appspotmail.com

tmpfs: Unknown parameter 'he'
BUG: sleeping function called from invalid context at ./include/linux/pagemap.h:1163
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 13591, name: syz.4.2234
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
4 locks held by syz.4.2234/13591:
 #0: ffff888059b53978 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2a2/0x370 fs/file.c:1213
 #1: ffff88805f558b88 (&type->i_mutex_dir_key#11){.+.+}-{4:4}, at: iterate_dir+0x18b/0xb40 fs/readdir.c:101
 #2: ffffffff8e3be0c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8e3be0c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8e3be0c0 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x619/0xf50 fs/afs/dynroot.c:351
 #3: ffff88805fe66fe0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_trylock include/linux/mmap_lock.h:209 [inline]
 #3: ffff88805fe66fe0 (&mm->mmap_lock){++++}-{4:4}, at: get_mmap_lock_carefully mm/memory.c:6237 [inline]
 #3: ffff88805fe66fe0 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x35/0x6e0 mm/memory.c:6297
CPU: 1 UID: 0 PID: 13591 Comm: syz.4.2234 Not tainted 6.14.0-syzkaller-01103-g2df0c02dab82 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 __might_resched+0x3c0/0x5e0 kernel/sched/core.c:8798
 folio_lock include/linux/pagemap.h:1163 [inline]
 __do_fault+0x39b/0x490 mm/memory.c:5011
 do_shared_fault mm/memory.c:5473 [inline]
 do_fault mm/memory.c:5547 [inline]
 do_pte_missing+0x1a6/0x3ea0 mm/memory.c:4059
 handle_pte_fault mm/memory.c:5888 [inline]
 __handle_mm_fault+0x1043/0x2a50 mm/memory.c:6031
 handle_mm_fault+0x3fa/0xaa0 mm/memory.c:6200
 do_user_addr_fault+0x7a9/0x1430 arch/x86/mm/fault.c:1388
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x5c/0xc0 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir+0x2b7/0x5f0 fs/readdir.c:292
Code: e8 3e 02 85 ff 0f 01 cb 0f ae e8 48 8b 04 24 49 89 47 08 e8 2b 02 85 ff 4c 8b 7c 24 30 48 8b 44 24 10 49 89 07 e8 19 02 85 ff <66> 45 89 6f 10 e8 0f 02 85 ff 49 63 f5 0f b6 7c 24 1c 48 89 34 24
RSP: 0018:ffffc900061f7c68 EFLAGS: 00050293
RAX: 0000000000000000 RBX: ffffc900061f7e80 RCX: ffffffff8235f3aa
RDX: ffff888026960000 RSI: ffffffff8235f427 RDI: 0000000000000006
RBP: 0000200000002008 R08: 0000000000000006 R09: 0000200000001fd8
R10: 0000200000002008 R11: 0000000000000000 R12: 0000000000000003
R13: 0000000000000018 R14: ffff888104a78b21 R15: 0000200000001ff0
 dir_emit include/linux/fs.h:3853 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x9bb/0xf50 fs/afs/dynroot.c:352
 iterate_dir+0x293/0xb40 fs/readdir.c:108
 __do_sys_getdents fs/readdir.c:322 [inline]
 __se_sys_getdents fs/readdir.c:308 [inline]
 __x64_sys_getdents+0x14d/0x2c0 fs/readdir.c:308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff213d8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff214c28038 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007ff213fa5fa0 RCX: 00007ff213d8d169
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 0000000000000008
RBP: 00007ff213e0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007ff213fa5fa0 R15: 00007fff179edc58
 </TASK>

=============================
[ BUG: Invalid wait context ]
6.14.0-syzkaller-01103-g2df0c02dab82 #0 Tainted: G        W         
-----------------------------
syz.4.2234/13591 is trying to lock:
ffff888105efd338 (&fbdefio->lock){+.+.}-{4:4}, at: fb_deferred_io_track_page drivers/video/fbdev/core/fb_defio.c:187 [inline]
ffff888105efd338 (&fbdefio->lock){+.+.}-{4:4}, at: fb_deferred_io_page_mkwrite drivers/video/fbdev/core/fb_defio.c:237 [inline]
ffff888105efd338 (&fbdefio->lock){+.+.}-{4:4}, at: fb_deferred_io_mkwrite+0x110/0x980 drivers/video/fbdev/core/fb_defio.c:245
other info that might help us debug this:
context-{5:5}
4 locks held by syz.4.2234/13591:
 #0: ffff888059b53978 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2a2/0x370 fs/file.c:1213
 #1: ffff88805f558b88 (&type->i_mutex_dir_key#11){.+.+}-{4:4}, at: iterate_dir+0x18b/0xb40 fs/readdir.c:101
 #2: ffffffff8e3be0c0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #2: ffffffff8e3be0c0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #2: ffffffff8e3be0c0 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x619/0xf50 fs/afs/dynroot.c:351
 #3: ffff88805fe66fe0 (&mm->mmap_lock){++++}-{4:4}, at: mmap_read_trylock include/linux/mmap_lock.h:209 [inline]
 #3: ffff88805fe66fe0 (&mm->mmap_lock){++++}-{4:4}, at: get_mmap_lock_carefully mm/memory.c:6237 [inline]
 #3: ffff88805fe66fe0 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x35/0x6e0 mm/memory.c:6297
stack backtrace:
CPU: 1 UID: 0 PID: 13591 Comm: syz.4.2234 Tainted: G        W          6.14.0-syzkaller-01103-g2df0c02dab82 #0 PREEMPT(full) 
Tainted: [W]=WARN
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4831 [inline]
 check_wait_context kernel/locking/lockdep.c:4903 [inline]
 __lock_acquire+0x3ff/0x1ba0 kernel/locking/lockdep.c:5185
 lock_acquire kernel/locking/lockdep.c:5866 [inline]
 lock_acquire+0x179/0x350 kernel/locking/lockdep.c:5823
 __mutex_lock_common kernel/locking/mutex.c:587 [inline]
 __mutex_lock+0x19a/0xb00 kernel/locking/mutex.c:732
 fb_deferred_io_track_page drivers/video/fbdev/core/fb_defio.c:187 [inline]
 fb_deferred_io_page_mkwrite drivers/video/fbdev/core/fb_defio.c:237 [inline]
 fb_deferred_io_mkwrite+0x110/0x980 drivers/video/fbdev/core/fb_defio.c:245
 do_page_mkwrite+0x177/0x380 mm/memory.c:3256
 do_shared_fault mm/memory.c:5485 [inline]
 do_fault mm/memory.c:5547 [inline]
 do_pte_missing+0x29c/0x3ea0 mm/memory.c:4059
 handle_pte_fault mm/memory.c:5888 [inline]
 __handle_mm_fault+0x1043/0x2a50 mm/memory.c:6031
 handle_mm_fault+0x3fa/0xaa0 mm/memory.c:6200
 do_user_addr_fault+0x7a9/0x1430 arch/x86/mm/fault.c:1388
 handle_page_fault arch/x86/mm/fault.c:1480 [inline]
 exc_page_fault+0x5c/0xc0 arch/x86/mm/fault.c:1538
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0010:filldir+0x2b7/0x5f0 fs/readdir.c:292
Code: e8 3e 02 85 ff 0f 01 cb 0f ae e8 48 8b 04 24 49 89 47 08 e8 2b 02 85 ff 4c 8b 7c 24 30 48 8b 44 24 10 49 89 07 e8 19 02 85 ff <66> 45 89 6f 10 e8 0f 02 85 ff 49 63 f5 0f b6 7c 24 1c 48 89 34 24
RSP: 0018:ffffc900061f7c68 EFLAGS: 00050293
RAX: 0000000000000000 RBX: ffffc900061f7e80 RCX: ffffffff8235f3aa
RDX: ffff888026960000 RSI: ffffffff8235f427 RDI: 0000000000000006
RBP: 0000200000002008 R08: 0000000000000006 R09: 0000200000001fd8
R10: 0000200000002008 R11: 0000000000000000 R12: 0000000000000003
R13: 0000000000000018 R14: ffff888104a78b21 R15: 0000200000001ff0
 dir_emit include/linux/fs.h:3853 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x9bb/0xf50 fs/afs/dynroot.c:352
 iterate_dir+0x293/0xb40 fs/readdir.c:108
 __do_sys_getdents fs/readdir.c:322 [inline]
 __se_sys_getdents fs/readdir.c:308 [inline]
 __x64_sys_getdents+0x14d/0x2c0 fs/readdir.c:308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff213d8d169
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff214c28038 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007ff213fa5fa0 RCX: 00007ff213d8d169
RDX: 00000000000000b8 RSI: 0000200000001fc0 RDI: 0000000000000008
RBP: 00007ff213e0e2a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007ff213fa5fa0 R15: 00007fff179edc58
 </TASK>
----------------
Code disassembly (best guess):
   0:	e8 3e 02 85 ff       	call   0xff850243
   5:	0f 01 cb             	stac
   8:	0f ae e8             	lfence
   b:	48 8b 04 24          	mov    (%rsp),%rax
   f:	49 89 47 08          	mov    %rax,0x8(%r15)
  13:	e8 2b 02 85 ff       	call   0xff850243
  18:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  1d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  22:	49 89 07             	mov    %rax,(%r15)
  25:	e8 19 02 85 ff       	call   0xff850243
* 2a:	66 45 89 6f 10       	mov    %r13w,0x10(%r15) <-- trapping instruction
  2f:	e8 0f 02 85 ff       	call   0xff850243
  34:	49 63 f5             	movslq %r13d,%rsi
  37:	0f b6 7c 24 1c       	movzbl 0x1c(%rsp),%edi
  3c:	48 89 34 24          	mov    %rsi,(%rsp)


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
