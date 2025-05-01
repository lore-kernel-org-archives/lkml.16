Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B25215191
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 19:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746126514; cv=none; b=aKT6RjLaLPMfX7qWXFsgpNBTIdmX+J+hxZ+jXG7BTdXW7XsYqsvT5pkOC5p4cKjkfx36UCeI/9nKBc5npmKZNlXYeSTl1oz9Wr9PWnDS6HUUTPfcleH3H5BpMVZ//qW9FjfEdEko3f3ogIK53RGA8BC3VOswhqO6d/rIcm6l9UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746126514; c=relaxed/simple;
	bh=hRXMGmdX4sI8PQPsecBDBIMgkvQACYqlRhAyIet5RHE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iBCnn3nVDhhjqbey3XqEUTBuJJi4V9erV1YxPvW8z1ud1coXbp/+Hniq7xv0UNWyM70TTMX/JirXzwlZsJfuBxcAMTsOW+M7LntnnX8Yj6NMptHz5yTX0oY9JjepecL2twL0OSLZ+7vJFhmjvyo53FzpyPxnlMzdFwjOZ17v5Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-85dad56a6cbso192720939f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 12:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746126511; x=1746731311;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKP0lSrriF9M2Hik4O8+o4MWhOfGEa/NCauFRhbmwFo=;
        b=igPqBUXARlNe1njki9fImhe5v/Z4qxVlrsWZ8JyJ1PAuFvAjKOaE7DFszsnWg+KIZI
         DsyhB6QchTsGsNXPzyEn2F8jXTm/Ip1chCCgN6xhJ7cov1HXE+m7Avx+nCqK5CpvyCfQ
         XkKz0outB7rklv3G66KO1ifQMXGf2QoNh555mMBz2D3Evs0utWVjH1EUv4iX7tFNbxSM
         z+HwCVjDJ2wbAcfajjADWMtEDUCgGQmheuRcd8oFcbDa7spRKgMxt9knTgqH6Zc8nwkh
         iWrMTF0TiJB2jLrYFbQ0in9/tsootGT28xq4Si+wN2vb6QxwcRCcLyHVnxOODWT3/nsA
         MrrA==
X-Forwarded-Encrypted: i=1; AJvYcCU8BVuXwELwgBZkEgRXSju+C2sLIddz/EIpfYsLf6by7LGgy/gin2Pw1PglfZCQbCcxMKHgNz4CB6pOFo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm++Vb5NLnrazVexulLVhI8BUS/acSF4N/tkaz1Jeq2oJPcR/Y
	CmzlYXlHEMMNg36SAbnfRaXvvBqvLyNiZO3NEZLE1M6XMGKNUY+Ah42MsaJagmNzIg/cOrsdaVN
	QShNs1qR6NjWEd4sicG/+D9k+AD+pYmFy0oYQUZ8i6tD/cXhYPjoHHh4=
X-Google-Smtp-Source: AGHT+IEKiWNk1mXSSHpM3FyNvmEXp5QK823Fw7T2826WsGtZPwsVPjsueu214zge0quVLGWXKXz5EE1fPib6+7boPeWql/E6Kmq3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:b46:b0:3d9:43fe:8e49 with SMTP id
 e9e14a558f8ab-3d97c1ade2bmr804945ab.8.1746126510880; Thu, 01 May 2025
 12:08:30 -0700 (PDT)
Date: Thu, 01 May 2025 12:08:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6813c6ae.050a0220.53db9.0001.GAE@google.com>
Subject: [syzbot] [gfs2?] stack segment fault in gfs2_glock_dq
From: syzbot <syzbot+e0dbe53de58ffe4a5f31@syzkaller.appspotmail.com>
To: agruenba@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5bc1018675ec Merge tag 'pci-v6.15-fixes-3' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17231270580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=90837c100b88a636
dashboard link: https://syzkaller.appspot.com/bug?extid=e0dbe53de58ffe4a5f31
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f34374580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10a31270580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-5bc10186.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3a2f39285e07/vmlinux-5bc10186.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2a37a55f34fb/bzImage-5bc10186.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/21cc0a3e6bd7/mount_0.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=13f34374580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e0dbe53de58ffe4a5f31@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: first mount done, others may mount
gfs2: fsid=syz:syz.0: Error 10 writing to journal, jid=0
Oops: stack segment: 0000 [#1] SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5304 Comm: syz-executor172 Not tainted 6.15.0-rc3-syzkaller-00342-g5bc1018675ec #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:gfs2_glock_dq+0x60/0xb20 fs/gfs2/glock.c:1657
Code: 4c 89 ff e8 12 2c 37 fe 4c 89 64 24 28 4c 89 7c 24 30 4d 8b 2f 4d 8d 7d 10 4c 89 fd 48 c1 ed 03 48 b8 00 00 00 00 00 fc ff df <80> 7c 05 00 00 74 08 4c 89 ff e8 e1 2b 37 fe 49 8b 45 10 48 89 44
RSP: 0018:ffffc9000d357c20 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: dffffc0000000000 RCX: ffff88801e8a8000
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffc9000d357d00
RBP: 0000000000000002 R08: ffff888042107a3b R09: 1ffff11008420f47
R10: dffffc0000000000 R11: ffffed1008420f48 R12: 1ffff92001a6afa2
R13: 0000000000000000 R14: ffffc9000d357d00 R15: 0000000000000010
FS:  00007feba52726c0(0000) GS:ffff88808d6cc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000003fd8e000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 gfs2_glock_dq_uninit+0x25/0xb0 fs/gfs2/glock.c:1723
 gfs2_seek_data+0x16c/0x240 fs/gfs2/inode.c:2133
 gfs2_llseek+0x1a4/0x240 fs/gfs2/file.c:75
 vfs_llseek fs/read_write.c:387 [inline]
 ksys_lseek fs/read_write.c:400 [inline]
 __do_sys_lseek fs/read_write.c:410 [inline]
 __se_sys_lseek fs/read_write.c:408 [inline]
 __x64_sys_lseek+0x14c/0x1e0 fs/read_write.c:408
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feba52bd689
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 81 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007feba5272218 EFLAGS: 00000246 ORIG_RAX: 0000000000000008
RAX: ffffffffffffffda RBX: 00007feba537c648 RCX: 00007feba52bd689
RDX: 0000000000000003 RSI: 0000000002000005 RDI: 0000000000000008
RBP: 00007feba537c640 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007feba5349028
R13: 0031656c69662f2e R14: 0000200000000240 R15: 0000200000000140
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gfs2_glock_dq+0x60/0xb20 fs/gfs2/glock.c:1657
Code: 4c 89 ff e8 12 2c 37 fe 4c 89 64 24 28 4c 89 7c 24 30 4d 8b 2f 4d 8d 7d 10 4c 89 fd 48 c1 ed 03 48 b8 00 00 00 00 00 fc ff df <80> 7c 05 00 00 74 08 4c 89 ff e8 e1 2b 37 fe 49 8b 45 10 48 89 44
RSP: 0018:ffffc9000d357c20 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: dffffc0000000000 RCX: ffff88801e8a8000
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffc9000d357d00
RBP: 0000000000000002 R08: ffff888042107a3b R09: 1ffff11008420f47
R10: dffffc0000000000 R11: ffffed1008420f48 R12: 1ffff92001a6afa2
R13: 0000000000000000 R14: ffffc9000d357d00 R15: 0000000000000010
FS:  00007feba52726c0(0000) GS:ffff88808d6cc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feba52f9090 CR3: 000000003fd8e000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	4c 89 ff             	mov    %r15,%rdi
   3:	e8 12 2c 37 fe       	call   0xfe372c1a
   8:	4c 89 64 24 28       	mov    %r12,0x28(%rsp)
   d:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
  12:	4d 8b 2f             	mov    (%r15),%r13
  15:	4d 8d 7d 10          	lea    0x10(%r13),%r15
  19:	4c 89 fd             	mov    %r15,%rbp
  1c:	48 c1 ed 03          	shr    $0x3,%rbp
  20:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  27:	fc ff df
* 2a:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	4c 89 ff             	mov    %r15,%rdi
  34:	e8 e1 2b 37 fe       	call   0xfe372c1a
  39:	49 8b 45 10          	mov    0x10(%r13),%rax
  3d:	48                   	rex.W
  3e:	89                   	.byte 0x89
  3f:	44                   	rex.R


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
