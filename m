Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAB322423F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749729231; cv=none; b=mvDb67ABuTllAu/iMGuieH0muGCW0zvnpJP02ATVNJJKMMxMd2ACj+hU4XADcNTb8HKfPiT97mZdwZt791j/lU8mva9Y6sa8Uek9pWp4p6I/xfqvRzFZFEv42a5DjdBfX92pURRd/0wrztDYMdqfNl9jhpF8ZmpgpYExHZSCpL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749729231; c=relaxed/simple;
	bh=1C2yAIIy7OGcEYabR2U09H+hzSWRshP9Ax+WnW3xHKc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qQFGM5tdVxF/XXSplTkhnIx49ZzfXWr98K2Fq16YgoHX1zU3NXdcNBlABOUgccXPFU8SGwZ2uRzYjxeWMNDJOTR9vX7JM6+ijzzE1C18gobVE2jNFHycOhhOM7U3cM/6Dw3jLoctCx9KCo9FFdXTZoPzda0peYQmlEuICDxhMKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ddcfea00afso12513545ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749729229; x=1750334029;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbCYqtgQM/2uCi1H+7FOwx8MUF+3jfIwZXDmPlaYdg0=;
        b=IPcttQRa7GqYKDm2dL4mjFXUgxTnyKC7L/HL518D4k/91fkIKFixSNoyhHPJkOwP1w
         1ORrnOthW8mrahurbWpr34vjDgjozSaYvRtXP0y6Z7k/ZpIbZyMaTIXVJBpzpuOnXarl
         wMyzAZRD66I3N+yCJEaUka//+fPRTd2XJtciGi2xAlpoG+jw4RrpJrUjG4lAg2qkSOl3
         7wCT8haPqqezk6GaHXP/q0PzE8zdve756SldIe8l9GPDETC9vh5bL7utoMRC03kVpxcj
         rlSLEvqhsU6+nYSl6TtL46DF5JOXL+xE+3Ko2zWz7fZ2vbEIloapWtnvP1R1h2AaQVF7
         KJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCUUpIV3rk6B/XR//pMfzeoNXE4ha2S3HQtL0INwbfZv6/jkoBV3pAhZUI8V7vQI2sQTj3Xv60zOHCq8blQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt42HR2viL6CdmFpxXIgwcqDBHxBfuggPKfsKzMh7fOc05Muj9
	znqDCNrJbnLEVwrEDzAIfJ0e3aw/6Yw85v55E7pd59I0ewqT36QIitBFsh6GUOPnftx1YTBNhyn
	9toye8hiieQt4QkzMUfM/z9zKZfJNLDr/Sh1srF1RQr7xxZozMDkScWN8gCY=
X-Google-Smtp-Source: AGHT+IHToXxNvmkgz2AiT0BybVKbzheJB526J2nJVD6yokZMVeVK7464SRVitUjZaf+xyL47VgML/i2lUOSMKr6fJZ7jUHGjBYyK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2189:b0:3dd:cacb:b88d with SMTP id
 e9e14a558f8ab-3ddfb60061dmr25464405ab.14.1749729217947; Thu, 12 Jun 2025
 04:53:37 -0700 (PDT)
Date: Thu, 12 Jun 2025 04:53:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684abfc1.a00a0220.e7731.0015.GAE@google.com>
Subject: [syzbot] [jfs?] kernel BUG in clear_inode (3)
From: syzbot <syzbot+6e516bb515d93230bc7b@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    488ef3560196 KEYS: Invert FINAL_PUT bit
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10a1a10c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=162faeb2d1eaefb4
dashboard link: https://syzkaller.appspot.com/bug?extid=6e516bb515d93230bc7b
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=149b59d4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14373682580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bcad4b7e6e0/disk-488ef356.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ed0e62aacc9/vmlinux-488ef356.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2e5e305c130c/bzImage-488ef356.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/21a324a97f5b/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=1346e60c580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6e516bb515d93230bc7b@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/inode.c:753!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 5829 Comm: syz-executor199 Not tainted 6.16.0-rc1-syzkaller-00005-g488ef3560196 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:clear_inode+0x169/0x190 fs/inode.c:753
Code: 4c 89 f7 e8 59 20 e8 ff e9 60 ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c c0 4c 89 f7 e8 2f 21 e8 ff eb b6 e8 b8 d3 86 ff 90 <0f> 0b e8 b0 d3 86 ff 90 0f 0b e8 a8 d3 86 ff 90 0f 0b e8 a0 d3 86
RSP: 0018:ffffc900043bf870 EFLAGS: 00010093
RAX: ffffffff82397a38 RBX: ffff88807e1cb248 RCX: ffff888034aeda00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000877eec R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff88807e1cb470 R15: 0000000000000001
FS:  0000555556cc1380(0000) GS:ffff888125d86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555556cca6f8 CR3: 0000000077920000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 jfs_evict_inode+0xb1/0x440 fs/jfs/inode.c:166
 evict+0x501/0x9c0 fs/inode.c:810
 __dentry_kill+0x209/0x660 fs/dcache.c:669
 shrink_kill+0xa9/0x2c0 fs/dcache.c:1114
 shrink_dentry_list+0x2e0/0x5e0 fs/dcache.c:1141
 shrink_dcache_parent+0xa1/0x2c0 fs/dcache.c:-1
 do_one_tree+0x23/0xe0 fs/dcache.c:1604
 shrink_dcache_for_umount+0xa0/0x170 fs/dcache.c:1621
 generic_shutdown_super+0x67/0x2c0 fs/super.c:621
 kill_block_super+0x44/0x90 fs/super.c:1753
 deactivate_locked_super+0xbc/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 ptrace_notify+0x281/0x2c0 kernel/signal.c:2520
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc6/0x1d0 kernel/entry/common.c:173
 syscall_exit_to_user_mode_work include/linux/entry-common.h:412 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2ad/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f724b14c587
Code: 07 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffffbe47da8 EFLAGS: 00000202 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000014e57 RCX: 00007f724b14c587
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffffbe47e60
RBP: 00007ffffbe47e60 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000202 R12: 00007ffffbe48ed0
R13: 0000555556cc26c0 R14: 431bde82d7b634db R15: 00007ffffbe48ef0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:clear_inode+0x169/0x190 fs/inode.c:753
Code: 4c 89 f7 e8 59 20 e8 ff e9 60 ff ff ff 44 89 f1 80 e1 07 80 c1 03 38 c1 7c c0 4c 89 f7 e8 2f 21 e8 ff eb b6 e8 b8 d3 86 ff 90 <0f> 0b e8 b0 d3 86 ff 90 0f 0b e8 a8 d3 86 ff 90 0f 0b e8 a0 d3 86
RSP: 0018:ffffc900043bf870 EFLAGS: 00010093
RAX: ffffffff82397a38 RBX: ffff88807e1cb248 RCX: ffff888034aeda00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000877eec R12: dffffc0000000000
R13: dffffc0000000000 R14: ffff88807e1cb470 R15: 0000000000000001
FS:  0000555556cc1380(0000) GS:ffff888125d86000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555556cca6f8 CR3: 0000000077920000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
