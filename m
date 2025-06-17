Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DCBE65
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147893; cv=none; b=RUZKxEmoMc1P8Mx9E62zHW9v6oYFFB9qoFEr+hnmaFqAJzTzsrl8a6ZGM9PHSb/cufMVjRXCs0Y8juXFUEkCHP9vJMwNxIYp5nGRI/iyYrdTFGFxAfp2D+2t3RTNdV6/aRs5yIimmpSQFPXrc5znbUeM5OCFUHvM+wv3xlETxyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147893; c=relaxed/simple;
	bh=BI7RwyuzscKlUbx6sWqCbc8t0miAH0Q20fqfT0TGP5I=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=R95dq1Dd7Bkw/vSRvo8d+K3L+Fzw0tGmp/DHSnIgseQ52q35p2NUOt9pwRFmQ1Iti2GD1pEUNQqEXt6gYHb+b30A2+DtHhGgonmk0ku7UvedsmpdMlYWDPWztDx4Y1a3xVrTpgtAZ1bdsz8T78WddPKyEiIOthdPZtnKanDi+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3ddbec809acso64414875ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750147891; x=1750752691;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPi7Ekv5g3ZL6/X6dunEU4RdGlyN0m7FkX1Pfyz6sh0=;
        b=VBBQfX7cWNXRpxH+22XbfkpnjNg6v7P7sknEXJiVAE43KTx+4tG4b4sHHqmZCzM/Z9
         vf7elqj9YGJCONlqHPrxnolZkwfJEVIqbTwH4L3+4Q+jiQqTyfsluWDHvjF3zEgsiXBb
         6kemLLy3uFN3GLSv8PCpVR3oi0tktdWedvhbWyQlUyAt7CmruIas0kuSwNYNcHxXAuEf
         bAld8l60QD+sQHCSUt4VAKWoxeigdo8xsYGbg0a9R/oM3sL5LmxgyW40edrwEO1yYVwl
         czq5PYjr7obSbj6QH+gHkvUT433Vhg5eISZvgZ7Q6Psr97Fk6QJ6gXJZQolgBjdwjQuB
         5elw==
X-Forwarded-Encrypted: i=1; AJvYcCUZu2TLVsKxIpm7HY6I/SHpBwbNv6O/DHhn3iHZ3yr9YB0c7xFR4gFDo3Xa5JLvq4xLxxFFUO9f3yM98G8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yiEzaUXnNvsIfcOXfhKOEr8aMmn3KjGWPi9T9IuLPan7kpqm
	8VNN/aaFrQyK0zmbTi/M7BeVmzGZY4MOBMYt818aEw3iLOWEwsFZDJltu9gHXfLN41V/euAdBzV
	x36aEnhcu2yhGEBQboAhVZYRjVUeDfxqH2lKrx4XnS1OuhDvm8OmSFwAJHX4=
X-Google-Smtp-Source: AGHT+IH/J7Wpt4NFbRv9BtURosJVddO1HK+FYtLEPiQsoCWa/FprlUSFtXDb3q/U3AcZivmNe1ep5qKlh8mgPPJMm/4JnoKWmUq0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:260e:b0:3dd:d18a:2d71 with SMTP id
 e9e14a558f8ab-3de07c4c33cmr154018645ab.2.1750147891201; Tue, 17 Jun 2025
 01:11:31 -0700 (PDT)
Date: Tue, 17 Jun 2025 01:11:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68512333.a70a0220.395abc.0205.GAE@google.com>
Subject: [syzbot] [mm?] WARNING: bad unlock balance in move_pgt_entry
From: syzbot <syzbot+52343d77314d6c0447fe@syzkaller.appspotmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	pfalcato@suse.de, syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    050f8ad7b58d Add linux-next specific files for 20250616
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16389e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2efc7740224b93a
dashboard link: https://syzkaller.appspot.com/bug?extid=52343d77314d6c0447fe
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11389e82580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16824370580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/49faa18d2f53/disk-050f8ad7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c6f9cd7fe5d/vmlinux-050f8ad7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/84a08d6403ee/bzImage-050f8ad7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+52343d77314d6c0447fe@syzkaller.appspotmail.com

=====================================
WARNING: bad unlock balance detected!
6.16.0-rc2-next-20250616-syzkaller #0 Not tainted
-------------------------------------
syz-executor359/6969 is trying to release lock (&mapping->i_mmap_rwsem) at:
[<ffffffff82104277>] i_mmap_unlock_write include/linux/fs.h:557 [inline]
[<ffffffff82104277>] maybe_drop_rmap_locks mm/mremap.c:197 [inline]
[<ffffffff82104277>] move_pgt_entry+0xfa7/0x1170 mm/mremap.c:686
but there are no more locks to release!

other info that might help us debug this:
1 lock held by syz-executor359/6969:
 #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
 #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: do_mremap mm/mremap.c:2371 [inline]
 #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: __do_sys_mremap mm/mremap.c:2453 [inline]
 #0: ffff88802f641760 (&mm->mmap_lock){++++}-{4:4}, at: __se_sys_mremap+0x3c0/0xc60 mm/mremap.c:2421

stack backtrace:
CPU: 1 UID: 0 PID: 6969 Comm: syz-executor359 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full) 
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
 move_pgt_entry+0xfa7/0x1170 mm/mremap.c:686
 move_page_tables+0xcde/0x2940 mm/mremap.c:1367
 copy_vma_and_data mm/mremap.c:1807 [inline]
 move_vma+0xd5e/0x2010 mm/mremap.c:1913
 mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
 do_mremap mm/mremap.c:2396 [inline]
 __do_sys_mremap mm/mremap.c:2453 [inline]
 __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f33da2e43b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 11 1d 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f33da273168 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 00007f33da3673f8 RCX: 00007f33da2e43b9
RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
RBP: 00007f33da3673f0 R08: 0000200000a00000 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000246 R12: 00007f33da3673fc
R13: 000000000000006e R14: 00007ffccf0ef660 R15: 00007ffccf0ef748
 </TASK>
------------[ cut here ]------------
DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff888033554d00, owner = 0x0, curr 0xffff888033b15a00, list empty
WARNING: kernel/locking/rwsem.c:1368 at __up_write kernel/locking/rwsem.c:1367 [inline], CPU#1: syz-executor359/6969
WARNING: kernel/locking/rwsem.c:1368 at up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630, CPU#1: syz-executor359/6969
Modules linked in:
CPU: 1 UID: 0 PID: 6969 Comm: syz-executor359 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:__up_write kernel/locking/rwsem.c:1367 [inline]
RIP: 0010:up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630
Code: d0 48 c7 c7 60 ee 8a 8b 48 c7 c6 80 f0 8a 8b 48 8b 14 24 4c 89 f1 4d 89 e0 4c 8b 4c 24 08 41 52 e8 23 3b e6 ff 48 83 c4 08 90 <0f> 0b 90 90 e9 6d fd ff ff 48 c7 c1 34 81 a1 8f 80 e1 07 80 c1 03
RSP: 0018:ffffc9000b2ff498 EFLAGS: 00010282
RAX: 636aee1c3dfaec00 RBX: ffff888033554d00 RCX: ffff888033b15a00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfaa14 R12: 0000000000000000
R13: ffff888033554d58 R14: ffff888033554d00 R15: 1ffff110066aa9a1
FS:  00007f33da2736c0(0000) GS:ffff888125d40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f33da29ba90 CR3: 000000002c068000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 i_mmap_unlock_write include/linux/fs.h:557 [inline]
 maybe_drop_rmap_locks mm/mremap.c:197 [inline]
 move_pgt_entry+0xfa7/0x1170 mm/mremap.c:686
 move_page_tables+0xcde/0x2940 mm/mremap.c:1367
 copy_vma_and_data mm/mremap.c:1807 [inline]
 move_vma+0xd5e/0x2010 mm/mremap.c:1913
 mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
 do_mremap mm/mremap.c:2396 [inline]
 __do_sys_mremap mm/mremap.c:2453 [inline]
 __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f33da2e43b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 11 1d 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f33da273168 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
RAX: ffffffffffffffda RBX: 00007f33da3673f8 RCX: 00007f33da2e43b9
RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
RBP: 00007f33da3673f0 R08: 0000200000a00000 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000246 R12: 00007f33da3673fc
R13: 000000000000006e R14: 00007ffccf0ef660 R15: 00007ffccf0ef748
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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
