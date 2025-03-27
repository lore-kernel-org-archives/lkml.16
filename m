Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE18019D086
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092847; cv=none; b=MAtfeF2xoM91BfAZ3ZM7iQHWuRjNUwtCAfweXMUhZ6FlecQATmFFLJxMS62HM8pWAQJjmgs5VS6UFr9S0zEFG4OIA+GVylepo/F+E8+mb5F05a34sVZvy4qqCyV/UV1iRSwOZQcygdu1dNEb+QQKTvkP0YaWES6uLhdAS8ZimFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092847; c=relaxed/simple;
	bh=KPCml6j7CHwydSRliwQIJzzHz7MfyFrREqAY9xWY4xQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rxgxjZETeT8dPUPMtW+SYtzWl63AIQ/XWujUaeD5ZOAUZocmXe9yOuCe80VZfRxQ4fozw0+IwWyo2IIgiZUzChJQV/mSypuu7Dv2ZRja3ZGggxhJeELACpPEs+iHEaIBpMxIZspzutPaiSjHKwGf5zt3wDKVWlRZEjQhPFfvUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d2a6b4b2d4so21212655ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092845; x=1743697645;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3dJYfOZG9N5/gGlh+JB+8S/OHwVNzQCaxyrmPC/PVNY=;
        b=UT+kIs9M3+AwI++v8CX3ca4LCwGHzPz0l2k+7zRnKo7ZNQqbHO3gJqG0mmG5Ycf9Kh
         cp3p9Zebgu+vo5Lor+dTRTFiOoypYc64JO+oh+kkLntlBLT2U09XBlJE7OzmvAg73PvE
         E6Uhk8bvZ96NTNqQqMydXflJefBytuy00E9nzP5e+miJ9Zisn/YaI/VpM01NXSr9QSVZ
         Wz5LkQwm5j/5sM+C9LOTgKGWj4xkrrmhPSB57ZAFNldYuNEOYfTlpX10hwsC9bcm6A2p
         auGeiZNbJaFMiFVceJT1TGDmHliFRwbFIH9xILDDaoC9/GIOfuEWK0lkzAyaH6KczW4r
         tQkg==
X-Forwarded-Encrypted: i=1; AJvYcCUdteVLW/fgYZq0erFxIASu3z9hXpaxp8x89DjACPiD/5cApa8+Td4bLr0Kc7OAU8ocfUO/dZuBL5nSG1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5yXgPRCF/+UcVtlPLeF5au1rfySjnmiv6Lpkldv+d3XtgtMk
	lROvZWydn2oBF8RtYnJyRtVobLiIBf+zY4wmMdneBmuT1bhkK5lxz98NHbOSV5BM0VDEOiuhJrH
	do7nfZCaFfWdszFrxFwhMIawFutVZrMOIbFhrJB9anTz2j4K3Okqb4oY=
X-Google-Smtp-Source: AGHT+IGrNMF37L8egpn1bDkjE3W7FUbtfHVQDLWO93iOohLOxhEaPIO4/RLDkN5d1GKjt9T1BDp/EPGJMq5FTnnQ7WZdBkXYrqJJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2149:b0:3cf:c9ad:46a1 with SMTP id
 e9e14a558f8ab-3d5ccddfb14mr42159795ab.13.1743092844752; Thu, 27 Mar 2025
 09:27:24 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:27:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e57c6c.050a0220.2f068f.0036.GAE@google.com>
Subject: [syzbot] [afs?] [ntfs3?] BUG: sleeping function called from invalid
 context in ovl_cache_entry_new
From: syzbot <syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, dhowells@redhat.com, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2df0c02dab82 x86 boot build: make git ignore stale 'tools'..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=138f0a4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f1762820c18874b
dashboard link: https://syzkaller.appspot.com/bug?extid=54e6c2176ba76c56217e
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178f0a4c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14182bb0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7fe089500003/disk-2df0c02d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d8df5abbd7c5/vmlinux-2df0c02d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/09d23e93d3a8/bzImage-2df0c02d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/586c05b92249/mount_0.gz

The issue was bisected to:

commit 1d0b929fc070b4115403a0a6206a0c6a62dd61f5
Author: David Howells <dhowells@redhat.com>
Date:   Mon Feb 24 09:52:58 2025 +0000

    afs: Change dynroot to create contents on demand

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1747aa4c580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14c7aa4c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=10c7aa4c580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+54e6c2176ba76c56217e@syzkaller.appspotmail.com
Fixes: 1d0b929fc070 ("afs: Change dynroot to create contents on demand")

BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:321
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 5821, name: syz-executor365
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
4 locks held by syz-executor365/5821:
 #0: ffff888032b155f8 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x247/0x310 fs/file.c:1213
 #1: ffff888077c90cf8 (&ovl_i_mutex_dir_key[depth]){++++}-{4:4}, at: wrap_directory_iterator+0x5a/0xd0 fs/readdir.c:54
 #2: ffff88807d2c0148 (&type->i_mutex_dir_key#6){++++}-{4:4}, at: iterate_dir+0x4a6/0x760 fs/readdir.c:101
 #3: ffffffff8eb3a760 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #3: ffffffff8eb3a760 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #3: ffffffff8eb3a760 (rcu_read_lock){....}-{1:3}, at: afs_dynroot_readdir+0x466/0xbe0 fs/afs/dynroot.c:351
CPU: 0 UID: 0 PID: 5821 Comm: syz-executor365 Not tainted 6.14.0-syzkaller-01103-g2df0c02dab82 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 __might_resched+0x558/0x6c0 kernel/sched/core.c:8798
 might_alloc include/linux/sched/mm.h:321 [inline]
 slab_pre_alloc_hook mm/slub.c:4089 [inline]
 slab_alloc_node mm/slub.c:4167 [inline]
 __do_kmalloc_node mm/slub.c:4317 [inline]
 __kmalloc_noprof+0xd0/0x4d0 mm/slub.c:4330
 kmalloc_noprof include/linux/slab.h:906 [inline]
 ovl_cache_entry_new+0x39/0x7b0 fs/overlayfs/readdir.c:152
 ovl_cache_entry_add_rb fs/overlayfs/readdir.c:188 [inline]
 ovl_fill_merge+0x416/0x830 fs/overlayfs/readdir.c:266
 dir_emit include/linux/fs.h:3853 [inline]
 afs_dynroot_readdir_cells fs/afs/dynroot.c:310 [inline]
 afs_dynroot_readdir+0x814/0xbe0 fs/afs/dynroot.c:352
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 ovl_dir_read+0xfe/0x570 fs/overlayfs/readdir.c:313
 ovl_dir_read_merged+0x315/0x5e0 fs/overlayfs/readdir.c:369
 ovl_cache_get fs/overlayfs/readdir.c:422 [inline]
 ovl_iterate+0x1196/0x21c0 fs/overlayfs/readdir.c:783
 wrap_directory_iterator+0x91/0xd0 fs/readdir.c:65
 iterate_dir+0x5a9/0x760 fs/readdir.c:108
 __do_sys_getdents fs/readdir.c:322 [inline]
 __se_sys_getdents+0x1ff/0x4e0 fs/readdir.c:308
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7c82f020f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff5a9e9b58 EFLAGS: 00000246 ORIG_RAX: 000000000000004e
RAX: ffffffffffffffda RBX: 00007fff5a9e9c20 RCX: 00007f7c82f020f9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
