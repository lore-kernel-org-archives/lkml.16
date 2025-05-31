Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3CD18D63A
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748729318; cv=none; b=nJhY8Q/0QxjWkTAvN0wMA4M6qLUtCGaqMuQIkoZBpYJ94ZYKaRVHy285qVfEqa/576XDzzR+XkBhstuM3p0jZlgxGAjRiUFm52+yc2ua9Klb4yqaaQ4INkfYvM+CfiYeoAiiZH7Ni/ZX2LFUA/mqOIWdIUB5vGeNAywBtPh1Qes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748729318; c=relaxed/simple;
	bh=WLa7oNWA5CDRx2xlWQIm6EZZcYZWiI5vRgs+5RpVfw8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=n5gATeOfIh7uWwkZtvoFvRHFZ5OK0SlrIaX/8c3fAV6kiqscmJkGdg6qcvEif27ffpyWeV6Sv0hZnXIvfheFPW7YspZQo2kf4zXDgpq5g1UirpcsUlzAxxr5fKD1oJfOEngWv9NOgnTYqpPCnU+Xz37rVLcXeB7Ar2E7Z3DyDyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3dd759fd518so38493975ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 15:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748729315; x=1749334115;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKSaKzHAhnlkIYbXowCmdw9SvU1FsOjCtk72zMGXAS0=;
        b=Tj7e/UPmRBLic8gRTfXsgK11Yc0zg3xkdexzY0q70S0SKRWaWBnqEfBhh3OkfXFYqR
         GO9NN9X5g359PE5uaGKr1pQwugQuC6Em+3VfHeL2FRNXlJPLOyTxYB0kzjHTC49mh0kS
         o7axmIOBPHKwg99tnj8pTH0MCBoe7mFLPK1axa33dMCNsvI9dfJWHdeZlWfsTbSXrc67
         LR8Jy2SHu40Cc9Ihkv1KQmPYfMxjSPbasqf51cBVHnVj33fjrlE9ooBOsdT73gKWUZNb
         zQhfJE032Kij4R0CxHZE7sfEMuEfU0amSMtf5ggstNhnPz15WNKZUTrCaIwr82cr6h7/
         I8IA==
X-Forwarded-Encrypted: i=1; AJvYcCVSJCdKYz/QIiyXOqO/sgkIuApmZF3JlmqV+pevbcCz2oKiOqeDNQ7FFTNv2l+4h17v3bCW3ENf5ruNu0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZjPgZ6F19Rocpc46N57Qhe//HoFEcwMA/64UIW7cjRuHEFNK
	IQg5vcCbpQqnnVL8GlfyVKE3OknUM5bu4ksFpGyfxP0fBPrzvkka3kssYiGt+vtQRKZZLWMG0Q3
	TMaZdztaLgjdYlQihIPAhqyO2PVzs2dlTvsGviiAG421claCbGOr1GkvPHBU=
X-Google-Smtp-Source: AGHT+IGpL9XtdpJc1/Py6FFAuxDrAYTnA5CrpSFy8fTQrN8POgaVaVlqK1xcse5w5kf3MIvuj/RB1CGbxBEytJeXnVrqo9g6FtKU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:ca47:0:b0:3ce:4b12:fa17 with SMTP id
 e9e14a558f8ab-3dd99c41659mr87207635ab.19.1748729315516; Sat, 31 May 2025
 15:08:35 -0700 (PDT)
Date: Sat, 31 May 2025 15:08:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b7de3.a00a0220.d8eae.001e.GAE@google.com>
Subject: [syzbot] [gfs2?] kernel BUG in gfs2_quota_cleanup (2)
From: syzbot <syzbot+8f7c48186f31bbcfd78d@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    914873bc7df9 Merge tag 'x86-build-2025-05-25' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13e80482580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eeb82b5d1d67d535
dashboard link: https://syzkaller.appspot.com/bug?extid=8f7c48186f31bbcfd78d
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-914873bc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b88f5c802da5/vmlinux-914873bc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2481c0fe9c9f/bzImage-914873bc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f7c48186f31bbcfd78d@syzkaller.appspotmail.com

FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 1
CPU: 0 UID: 0 PID: 5313 Comm: syz.0.0 Not tainted 6.15.0-syzkaller-01972-g914873bc7df9 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 fail_dump lib/fault-inject.c:73 [inline]
 should_fail_ex+0x414/0x560 lib/fault-inject.c:174
 should_failslab+0xa8/0x100 mm/failslab.c:46
 slab_pre_alloc_hook mm/slub.c:4100 [inline]
 slab_alloc_node mm/slub.c:4176 [inline]
 kmem_cache_alloc_noprof+0x73/0x3c0 mm/slub.c:4203
 qd_alloc+0x50/0x250 fs/gfs2/quota.c:234
 gfs2_quota_init+0x777/0x1230 fs/gfs2/quota.c:1448
 gfs2_make_fs_rw+0x181/0x2b0 fs/gfs2/super.c:149
 gfs2_reconfigure+0x617/0xb20 fs/gfs2/ops_fstype.c:1595
 reconfigure_super+0x224/0x890 fs/super.c:1082
 vfs_cmd_reconfigure fs/fsopen.c:262 [inline]
 vfs_fsconfig_locked+0x171/0x320 fs/fsopen.c:291
 __do_sys_fsconfig fs/fsopen.c:467 [inline]
 __se_sys_fsconfig+0x78e/0x8d0 fs/fsopen.c:344
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x220 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f671238e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6713195038 EFLAGS: 00000246 ORIG_RAX: 00000000000001af
RAX: ffffffffffffffda RBX: 00007f67125b6080 RCX: 00007f671238e969
RDX: 0000000000000000 RSI: 0000000000000007 RDI: 0000000000000004
RBP: 00007f6713195090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000001 R14: 00007f67125b6080 R15: 00007ffc65f837d8
 </TASK>
------------[ cut here ]------------
kernel BUG at fs/gfs2/quota.c:1520!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5313 Comm: syz.0.0 Not tainted 6.15.0-syzkaller-01972-g914873bc7df9 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:gfs2_quota_cleanup+0x6ee/0x6f0 fs/gfs2/quota.c:1519
Code: ff 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c c2 fd ff ff 4c 89 f7 e8 b2 ac 2e fe e9 b5 fd ff ff e8 88 bf 69 07 e8 b3 cc cb fd 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00
RSP: 0018:ffffc9000d23f9a0 EFLAGS: 00010293
RAX: ffffffff83f407fd RBX: 0000000000000002 RCX: ffff888000634880
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: ffffc9000d23fab0 R08: ffff8880342e80af R09: 1ffff1100685d015
R10: dffffc0000000000 R11: ffffed100685d016 R12: 1ffff92001a47f38
R13: dffffc0000000000 R14: dffffc0000000000 R15: 0000000000000000
FS:  00007f67131956c0(0000) GS:ffff88808d291000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6713194fc8 CR3: 000000003f46f000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 gfs2_quota_init+0x10d8/0x1230 fs/gfs2/quota.c:1509
 gfs2_make_fs_rw+0x181/0x2b0 fs/gfs2/super.c:149
 gfs2_reconfigure+0x617/0xb20 fs/gfs2/ops_fstype.c:1595
 reconfigure_super+0x224/0x890 fs/super.c:1082
 vfs_cmd_reconfigure fs/fsopen.c:262 [inline]
 vfs_fsconfig_locked+0x171/0x320 fs/fsopen.c:291
 __do_sys_fsconfig fs/fsopen.c:467 [inline]
 __se_sys_fsconfig+0x78e/0x8d0 fs/fsopen.c:344
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x220 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f671238e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6713195038 EFLAGS: 00000246 ORIG_RAX: 00000000000001af
RAX: ffffffffffffffda RBX: 00007f67125b6080 RCX: 00007f671238e969
RDX: 0000000000000000 RSI: 0000000000000007 RDI: 0000000000000004
RBP: 00007f6713195090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000001 R14: 00007f67125b6080 R15: 00007ffc65f837d8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gfs2_quota_cleanup+0x6ee/0x6f0 fs/gfs2/quota.c:1519
Code: ff 44 89 f1 80 e1 07 80 c1 03 38 c1 0f 8c c2 fd ff ff 4c 89 f7 e8 b2 ac 2e fe e9 b5 fd ff ff e8 88 bf 69 07 e8 b3 cc cb fd 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00
RSP: 0018:ffffc9000d23f9a0 EFLAGS: 00010293
RAX: ffffffff83f407fd RBX: 0000000000000002 RCX: ffff888000634880
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: ffffc9000d23fab0 R08: ffff8880342e80af R09: 1ffff1100685d015
R10: dffffc0000000000 R11: ffffed100685d016 R12: 1ffff92001a47f38
R13: dffffc0000000000 R14: dffffc0000000000 R15: 0000000000000000
FS:  00007f67131956c0(0000) GS:ffff88808d291000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6713194fc8 CR3: 000000003f46f000 CR4: 0000000000352ef0
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
