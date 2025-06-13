Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6D326B761
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814649; cv=none; b=Dpmfc03mV4vdACbbHJEIz8vQLDTgwoWYyC9E6td2QhlyL9cZ7pZJul9x5t7Y1VIgKz3kJLp2dphYSq/1egb2LkTppbXr9+vj8KRDQMuZ7ergoj8xPiawDLxPmnFm65iCjyBB9cxJslI68aGunofGLnHbsZ95iLfcnSUkuTfWiPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814649; c=relaxed/simple;
	bh=CGazjHvtPLR+n+nraHqXK60GXztxc5Ty1HT6JYo1GE8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sS0eLrmhAdFZxblJJNCW7RnTf/fREbOy6bYHNUwApS+fOvbV7AWhpJBMmwDXrcN8CYSbmVnwYmXePDr9TjVOsO28CA/1xwGuvVrqqaMxmxCYPeGTt8U5fSheUwhf5wlAyYDDl4FobTy8tpnL4wS06/Rg3NkjLvEE11Yf3xfpDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86d0aa2dc99so171194439f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814647; x=1750419447;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01E6f5NyJDwmtzVDXOANJOOLyRyTfojGhsVBy8J5eMM=;
        b=DnvtzEGhx0XptfSle3zptGikWAUwUxJ2AZsBlnGaEvLlXZ7XmfAGhKMOInLnSVUA3y
         GmYuVjzz+Y6VqjqLMrubFvG3AI7Nd8ASdyjDFQPlHnkwUNrlHvSj1lGRpWRIPF76Aqmz
         +wpyhGSUgYH9YZSLhkgFtZaW+1WgF7ugWpXT86p95xF6/0nroZv1PM0ivShiT5UMOuWF
         FUQvc7NVZY5vzgqs7sZ6zRkQONUbQU9phCH1i98xvCImqvYwaqH1VCMSeS4nbAUZY6Uw
         KQ29ZrqdazXjYjfzcloNbH6THerQV9PUL+lVVlQPIIEZreOLXpiDnBlu23SCB3t56ayn
         dQDg==
X-Forwarded-Encrypted: i=1; AJvYcCUu3uM8WAVbrAxcQWqGjO4VQ0ekNlI9i7YenuCLgaKu+yWSvCPMncZBi6ETjSFVdPl6jeMmQ/t7XIjh0Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIZu78kOtpALZKRvkPz3XyAiE1PM4uRc+kAsuKqO4EqmYqT0q
	Y+gpeB+gGPgEu3QQwMo46G0EQsPds3Mu2txqgD+ReUWFAeWiiCflr5ng0sVaZ5wN6555bJb/gRu
	w9GRQDND7cV7zIaKL3IB3HXqwfmauN/BbnRHBHUXRK+obHzFU0aJofkxk5Ts=
X-Google-Smtp-Source: AGHT+IH2V3mFt2EYaks4rh55v1OqK2tPnYn9+0ROvQwt36ptpn6T1KZuMAgjcxi2hbyb3ZYrloTySqAcaaa65Y+SxNsKdL3q7uKc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2593:b0:3dd:d995:5a97 with SMTP id
 e9e14a558f8ab-3de00bea30dmr26645245ab.12.1749814647001; Fri, 13 Jun 2025
 04:37:27 -0700 (PDT)
Date: Fri, 13 Jun 2025 04:37:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684c0d76.050a0220.be214.029f.GAE@google.com>
Subject: [syzbot] [gfs2?] kernel BUG in gfs2_jindex_free (2)
From: syzbot <syzbot+150563285f78ac3e9bd4@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    19272b37aa4f Linux 6.16-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108dca82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c07f08ee4bcfb276
dashboard link: https://syzkaller.appspot.com/bug?extid=150563285f78ac3e9bd4
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-19272b37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b70bcabfccd8/vmlinux-19272b37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/57e93b736a7a/bzImage-19272b37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+150563285f78ac3e9bd4@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 1024
hfsplus: failed to load root directory
loop0: detected capacity change from 0 to 32768
gfs2: fsid=syz:syz: Trying to join cluster "lock_nolock", "syz:syz"
gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
gfs2: fsid=syz:syz.0: journal 0 mapped with 1 extents in 0ms
gfs2: fsid=syz:syz.0: first mount done, others may mount
gfs2: fsid=syz:syz.0: fatal: I/O error - block = 9377, function = gfs2_ail1_empty_one, file = fs/gfs2/log.c, line = 328
gfs2: fsid=syz:syz.0: about to withdraw this file system
gfs2: fsid=syz:syz.0: Journal recovery skipped for jid 0 until next mount.
gfs2: fsid=syz:syz.0: Glock dequeues delayed: 0
gfs2: fsid=syz:syz.0: File system withdrawn
CPU: 0 UID: 0 PID: 5325 Comm: syz.0.0 Not tainted 6.16.0-rc1-syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 gfs2_withdraw+0x111e/0x14f0 fs/gfs2/util.c:354
 revoke_lo_before_commit+0x2f/0xe60 fs/gfs2/lops.c:857
 lops_before_commit fs/gfs2/lops.h:42 [inline]
 gfs2_log_flush+0xb8b/0x24c0 fs/gfs2/log.c:1105
 gfs2_sync_fs+0x6d/0xb0 fs/gfs2/super.c:662
 sync_filesystem+0x1cf/0x230 fs/sync.c:66
 gfs2_reconfigure+0xbb/0xb20 fs/gfs2/ops_fstype.c:1555
 reconfigure_super+0x224/0x890 fs/super.c:1075
 vfs_cmd_reconfigure fs/fsopen.c:262 [inline]
 vfs_fsconfig_locked+0x171/0x320 fs/fsopen.c:291
 __do_sys_fsconfig fs/fsopen.c:467 [inline]
 __se_sys_fsconfig+0x78e/0x8d0 fs/fsopen.c:344
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3a8ed8e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f3a8fb52038 EFLAGS: 00000246 ORIG_RAX: 00000000000001af
RAX: ffffffffffffffda RBX: 00007f3a8efb5fa0 RCX: 00007f3a8ed8e929
RDX: 0000000000000000 RSI: 0000000000000007 RDI: 000000000000000c
RBP: 00007f3a8ee10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f3a8efb5fa0 R15: 00007fff7917f738
 </TASK>
------------[ cut here ]------------
kernel BUG at fs/gfs2/super.c:76!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5325 Comm: syz.0.0 Not tainted 6.16.0-rc1-syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:gfs2_jindex_free+0x43e/0x440 fs/gfs2/super.c:76
Code: cc cc cc cc cc 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c ea fd ff ff e8 52 d1 2b fe e9 e0 fd ff ff e8 08 02 6e 07 e8 13 59 c8 fd 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00
RSP: 0018:ffffc9000fec7800 EFLAGS: 00010293
RAX: ffffffff83f805dd RBX: dead000000000122 RCX: ffff888000514880
RDX: 0000000000000000 RSI: 0000000000000008 RDI: 00000000ffffffff
RBP: ffffc9000fec78c0 R08: ffff888042458d4f R09: 1ffff1100848b1a9
R10: dffffc0000000000 R11: ffffed100848b1aa R12: ffff888042458818
R13: dffffc0000000000 R14: ffff888035c49400 R15: ffff888035c49478
FS:  0000000000000000(0000) GS:ffff88808d252000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c2ed7e1b88 CR3: 0000000011bd9000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 gfs2_put_super+0x8af/0x950 fs/gfs2/super.c:638
 generic_shutdown_super+0x135/0x2c0 fs/super.c:643
 kill_block_super+0x44/0x90 fs/super.c:1753
 deactivate_locked_super+0xb9/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d1/0x260 kernel/task_work.c:227
 exit_task_work include/linux/task_work.h:40 [inline]
 do_exit+0x6ad/0x22e0 kernel/exit.c:955
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1104
 get_signal+0x1286/0x1340 kernel/signal.c:3034
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3a8ed8e929
Code: Unable to access opcode bytes at 0x7f3a8ed8e8ff.
RSP: 002b:00007f3a8fb52038 EFLAGS: 00000246 ORIG_RAX: 00000000000001af
RAX: fffffffffffffffb RBX: 00007f3a8efb5fa0 RCX: 00007f3a8ed8e929
RDX: 0000000000000000 RSI: 0000000000000007 RDI: 000000000000000c
RBP: 00007f3a8ee10b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f3a8efb5fa0 R15: 00007fff7917f738
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gfs2_jindex_free+0x43e/0x440 fs/gfs2/super.c:76
Code: cc cc cc cc cc 89 f9 80 e1 07 80 c1 03 38 c1 0f 8c ea fd ff ff e8 52 d1 2b fe e9 e0 fd ff ff e8 08 02 6e 07 e8 13 59 c8 fd 90 <0f> 0b 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66 0f 1f 00
RSP: 0018:ffffc9000fec7800 EFLAGS: 00010293
RAX: ffffffff83f805dd RBX: dead000000000122 RCX: ffff888000514880
RDX: 0000000000000000 RSI: 0000000000000008 RDI: 00000000ffffffff
RBP: ffffc9000fec78c0 R08: ffff888042458d4f R09: 1ffff1100848b1a9
R10: dffffc0000000000 R11: ffffed100848b1aa R12: ffff888042458818
R13: dffffc0000000000 R14: ffff888035c49400 R15: ffff888035c49478
FS:  0000000000000000(0000) GS:ffff88808d252000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c2ed7e1b88 CR3: 00000000122c6000 CR4: 0000000000352ef0
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
