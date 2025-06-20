Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0727CCF0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412431; cv=none; b=RXeXD4wC6YWC1+0dRiCsQwfpMSu2fsJNM1kbqN8XvkBot/loOcPPoG0C08B7dPuT1W5mhKO9B8QjW7x1/cT3+Q96QVQBDKtan9m/TNMpcXWrVwHG/icvm/MNRAr+ZSd5rF+2YA0ei/EYjBKaWcOWWR7eS/+kXDHGLISXOoYc+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412431; c=relaxed/simple;
	bh=QqkGynWfXVCb+qnj2BDhT3g7Sb9hk9lpL7a/c38o9zQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=JDyzas9VozylT6fUzJQGAqQUtgcHud6aZD3/jfBI1C3RTqK1tRRMiLdD5KDs4sU8Ef8UqJRAVs0dA7mqqKHjeY20IPjIxxGxFh5DlvljjOwUSnmGzEeSQIyTAPzLSa4XXHhXseRPtdgAkJi9FF+Sn8/Wp3uxJ2HTuidZ7QMRYIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-86cfea700daso123088339f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412429; x=1751017229;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAjNxy6TghG6L3EGpwR7lEojQyZ2mW/MhP24+gdEsHw=;
        b=lUHsEBD3h67aTl7LvHMz2vXjimUUoX/yQ/DvkItdE7Kl/Hbp3kbXu6ZvZMaQrWTxvx
         QdRr/v1lovmgKKe0ISsR5XWJj5qIIqVx1DhbY+7RH2h3P0ZhTTFm/4n0pigrw3Qom4Gt
         Zy52QTNc7iRcb3JTOnt2ae/FWBezKJXrbNXmi+616rXO84ttKMBebEIO+Ex4U8YZvevs
         cQCUQmc7bjM6NhgzPOYRWofxJ7wM1Y0FTFj5J8drhJdZ0r8NOhXFBvTu9N9tAHXh5sro
         p7ykR/S72AON+E9v/ASpcmpjuKVwg3ad994WaOLnlOWl8KTyFNZv59mglDu3kLv6i9Nr
         UcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMu3Gex0R0cUndzvC22CRqdAT0fUqk/jHjTjnvlhxwq2l6XR0bPZ7da6uilu1IIk1ZSiWKVHlW0l60Ogg=@vger.kernel.org
X-Gm-Message-State: AOJu0YymKPCbiVF2r7IUN3bYc5/VR+L9tkGFHXEc90KtKI+dLVP2Cpzi
	LIyBf25gBBmy7vnAM/CeovQd0PYcAM4vPsDtr2+4TmGb2wLDxheLcs3mmhYiaoB/dpuq4Om9R1B
	qfTlkeFmpbYGa1JyD6dN/Ah62U1tNdOE1ypbY9KHIHZP76PFMXqw7p480WDM=
X-Google-Smtp-Source: AGHT+IGja+6x2hLd1b25s+awfl342tqQsbFFuZOlmBJKZScO5T6OhxP9LsmVP+k1tVPMjrqfavR3ZZRekl7gzBOKmC+fjV1T68Zb
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1646:b0:3db:86fc:d328 with SMTP id
 e9e14a558f8ab-3de38c2e1c2mr24035785ab.5.1750412429065; Fri, 20 Jun 2025
 02:40:29 -0700 (PDT)
Date: Fri, 20 Jun 2025 02:40:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68552c8d.a00a0220.137b3.0040.GAE@google.com>
Subject: [syzbot] [mm?] WARNING: bad unlock balance in move_page_tables
From: syzbot <syzbot+d400c4dc8b94eed678bc@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	pfalcato@suse.de, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    050f8ad7b58d Add linux-next specific files for 20250616
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1032490c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2efc7740224b93a
dashboard link: https://syzkaller.appspot.com/bug?extid=d400c4dc8b94eed678bc
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/49faa18d2f53/disk-050f8ad7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c6f9cd7fe5d/vmlinux-050f8ad7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/84a08d6403ee/bzImage-050f8ad7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d400c4dc8b94eed678bc@syzkaller.appspotmail.com

=====================================
WARNING: bad unlock balance detected!
6.16.0-rc2-next-20250616-syzkaller #0 Not tainted
-------------------------------------
syz.9.959/9941 is trying to release lock (&mapping->i_mmap_rwsem) at:
[<ffffffff821011d1>] i_mmap_unlock_write include/linux/fs.h:557 [inline]
[<ffffffff821011d1>] maybe_drop_rmap_locks mm/mremap.c:197 [inline]
[<ffffffff821011d1>] move_pgt_entry mm/mremap.c:686 [inline]
[<ffffffff821011d1>] move_page_tables+0xf51/0x2940 mm/mremap.c:1358
but there are no more locks to release!

other info that might help us debug this:
1 lock held by syz.9.959/9941:
 #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
 #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: do_mremap mm/mremap.c:2371 [inline]
 #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: __do_sys_mremap mm/mremap.c:2453 [inline]
 #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: __se_sys_mremap+0x3c0/0xc60 mm/mremap.c:2421

stack backtrace:
CPU: 1 UID: 0 PID: 9941 Comm: syz.9.959 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5301
 __lock_release kernel/locking/lockdep.c:5540 [inline]
 lock_release+0x269/0x3e0 kernel/locking/lockdep.c:5892
 up_write+0x2d/0x420 kernel/locking/rwsem.c:1629
 i_mmap_unlock_write include/linux/fs.h:557 [inline]
 maybe_drop_rmap_locks mm/mremap.c:197 [inline]
 move_pgt_entry mm/mremap.c:686 [inline]
 move_page_tables+0xf51/0x2940 mm/mremap.c:1358
 copy_vma_and_data mm/mremap.c:1807 [inline]
 move_vma+0xd5e/0x2010 mm/mremap.c:1913
 mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
 do_mremap mm/mremap.c:2396 [inline]
 __do_sys_mremap mm/mremap.c:2453 [inline]
 __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4030f8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4031dde038 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 00007f40311b6240 RCX: 00007f4030f8e929
RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
RBP: 00007f4031010b39 R08: 0000200000a00000 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f40311b6240 R15: 00007ffc335a19c8
 </TASK>
------------[ cut here ]------------
DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff88807b05b2e0, owner = 0x0, curr 0xffff88802cc51e00, list empty
WARNING: kernel/locking/rwsem.c:1368 at __up_write kernel/locking/rwsem.c:1367 [inline], CPU#1: syz.9.959/9941
WARNING: kernel/locking/rwsem.c:1368 at up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630, CPU#1: syz.9.959/9941
Modules linked in:
CPU: 1 UID: 0 PID: 9941 Comm: syz.9.959 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:__up_write kernel/locking/rwsem.c:1367 [inline]
RIP: 0010:up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630
Code: d0 48 c7 c7 60 ee 8a 8b 48 c7 c6 80 f0 8a 8b 48 8b 14 24 4c 89 f1 4d 89 e0 4c 8b 4c 24 08 41 52 e8 23 3b e6 ff 48 83 c4 08 90 <0f> 0b 90 90 e9 6d fd ff ff 48 c7 c1 34 81 a1 8f 80 e1 07 80 c1 03
RSP: 0018:ffffc90013b0f530 EFLAGS: 00010296
RAX: 3396a5242025d900 RBX: ffff88807b05b2e0 RCX: 0000000000080000
RDX: ffffc9000e491000 RSI: 0000000000031dc6 RDI: 0000000000031dc7
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfaa14 R12: 0000000000000000
R13: ffff88807b05b338 R14: ffff88807b05b2e0 R15: 1ffff1100f60b65d
FS:  00007f4031dde6c0(0000) GS:ffff888125d40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4031dddf98 CR3: 0000000057f30000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 i_mmap_unlock_write include/linux/fs.h:557 [inline]
 maybe_drop_rmap_locks mm/mremap.c:197 [inline]
 move_pgt_entry mm/mremap.c:686 [inline]
 move_page_tables+0xf51/0x2940 mm/mremap.c:1358
 copy_vma_and_data mm/mremap.c:1807 [inline]
 move_vma+0xd5e/0x2010 mm/mremap.c:1913
 mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
 do_mremap mm/mremap.c:2396 [inline]
 __do_sys_mremap mm/mremap.c:2453 [inline]
 __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4030f8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4031dde038 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 00007f40311b6240 RCX: 00007f4030f8e929
RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
RBP: 00007f4031010b39 R08: 0000200000a00000 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f40311b6240 R15: 00007ffc335a19c8
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
