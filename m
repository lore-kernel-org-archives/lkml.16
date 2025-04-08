Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E1E2686AD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113217; cv=none; b=QzyAEpZ86TrJUYh2qfLjO0T9U9AowPsSsoRsiSZlC1it8m+aAJZUke85VUt3g8aYxpSauU3ynroNtmb1kH7VDzbSdsZOqdndmR/RsDk0GGFXPqPxcGDxtRenkQTmscKc7ZBFqXRvajg2Zfoo4QzdTp4441DMDVXI+55gQOJzUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113217; c=relaxed/simple;
	bh=7hOinPgImX8WMe+TJO6lNzRnH5FkFhGMdHRt21qxEv0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DrmMe7yMzg9LVBMdMD/PmhBjA6QJgFLa5HqDd+Z0jWXi8Fo7FzWoWbhH5alXs6CEVSq5o0cxk5NjmORnzML42bDp2r/MIWr40ctdQk2RJREqu39OQrRvnRYwWssiov68TIvyR4jzNe58qzv8lWzcA0Bu4l0y+uVCQhr0/T022zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so127341005ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113214; x=1744718014;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRBfxxIWVER2OelCgMB5ckH55iW3hNOq0xALtqRN0Zo=;
        b=FrcUq1FM6bL4ORPNZl+IHJG319Vi4X57oCbPtWXIrTBp5q/44Z9Y0Dktg0E7JcY8z7
         Rs8nJyLVPKjFYqMzLcOSMNNY7AnFhKAVxefE8tRqkWj8WxrfU4ktGnRllefuT4m04Nb3
         Nls7dBW1rfc+eD/buEwugForepBuNcp4CbMUUhIcmC5QatarSU+PuPv3oKLF0wrCP1So
         q3KGd0Z2Zer1+U4mEPOIzV0djjLkoMlUVFgT9hazdraSrVU1CeBme7MiP6N6sM7lkn6V
         CBjf7nulMQL3sfFLboG5ZdeK8fJgcC6OYZN+jmZphvat886coK4p7zKKUD5BMqRWlAbH
         W4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8DulgcV0HAk8UR2Bue9EQkDjZITuQ4Lx7afUw7M8UqfhNXfMSfUXjPxHZf6SqgHScKOjfb2zyp3NE9dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9jb6ASdBCWmP4zvaMTvP6h4FJ7WXhRipsTofyuKarx3bDtz7
	2ECl2uaFpeaLU2Lt2l/ktJ8lhtnA4RUhBOmk3VfSk7tX97K/Rtj/p3nigHwcq2Q2LeCWcMoDxLQ
	Oa+v5JSGUSIRqSHb5Va9CYsXJv2eJCx6Gv7GhPnQGkpuLnOxblVru/Y4=
X-Google-Smtp-Source: AGHT+IHNu/ie94iiJFQUH7oyUr7nfmh1A2JhjCxzQlOMMMjD17BD9ciAjlNwGZt8s0UkMn/MH5eaDT7TDhuy/b/FNYrNGb2hs1vt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c9:b0:3d4:6dcf:d8f5 with SMTP id
 e9e14a558f8ab-3d6ec52d0c9mr110552915ab.1.1744113214671; Tue, 08 Apr 2025
 04:53:34 -0700 (PDT)
Date: Tue, 08 Apr 2025 04:53:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f50e3e.050a0220.396535.0560.GAE@google.com>
Subject: [syzbot] [bcachefs?] WARNING in bch2_dev_free
From: syzbot <syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com>
To: kent.overstreet@linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a4cda136f021 Add linux-next specific files for 20250404
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12c3db4c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a257c454bb1afb7
dashboard link: https://syzkaller.appspot.com/bug?extid=aec9606169fbc3a12ca6
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ca0c04580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11c3db4c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/59048bc9c206/disk-a4cda136.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad2ba7306f20/vmlinux-a4cda136.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b3bef7acbf10/bzImage-a4cda136.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/110624be1513/mount_0.gz

The issue was bisected to:

commit dcffc3b1ae3251d796a25c673f614e3099ca83d3
Author: Kent Overstreet <kent.overstreet@linux.dev>
Date:   Sun Mar 30 03:11:08 2025 +0000

    bcachefs: Split up bch_dev.io_ref

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13948c04580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10548c04580000
console output: https://syzkaller.appspot.com/x/log.txt?x=17948c04580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+aec9606169fbc3a12ca6@syzkaller.appspotmail.com
Fixes: dcffc3b1ae32 ("bcachefs: Split up bch_dev.io_ref")

bcachefs (loop0): shutting down
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5844 at fs/bcachefs/super.c:1229 bch2_dev_free+0x228/0x290 fs/bcachefs/super.c:1229
Modules linked in:
CPU: 0 UID: 0 PID: 5844 Comm: syz-executor121 Not tainted 6.14.0-next-20250404-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
RIP: 0010:bch2_dev_free+0x228/0x290 fs/bcachefs/super.c:1229
Code: ff e8 4c cf 74 00 4c 89 ef e8 44 cf 74 00 48 89 df 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d e9 ee 53 96 07 e8 59 e9 32 fd 90 <0f> 0b 90 e9 09 fe ff ff e8 4b e9 32 fd 90 0f 0b 90 e9 15 fe ff ff
RSP: 0018:ffffc9000406fb88 EFLAGS: 00010293
RAX: ffffffff849073d7 RBX: ffff888035282000 RCX: ffff888034af9e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff8880352820c0 R08: ffffffff850552f7 R09: 0000000000000000
R10: ffff888035282208 R11: ffffed1006a5044a R12: ffff888075e003f0
R13: ffff8880352820b0 R14: ffff888075e00000 R15: ffff888075e007b2
FS:  000055558bb20380(0000) GS:ffff888124f8f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000045bdd0 CR3: 00000000122a0000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 bch2_fs_free+0x2b0/0x400 fs/bcachefs/super.c:688
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x422/0x4c0 fs/namespace.c:1435
 task_work_run+0x251/0x310 kernel/task_work.c:227
 ptrace_notify+0x2dc/0x390 kernel/signal.c:2520
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc7/0x1d0 kernel/entry/common.c:173
 syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
 syscall_exit_to_user_mode+0x24a/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f49b0cec447
Code: 07 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffd94723978 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f49b0cec447
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffd94723a30
RBP: 00007ffd94723a30 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000206 R12: 00007ffd94724aa0
R13: 000055558bb216c0 R14: 0000000000000001 R15: 431bde82d7b634db
 </TASK>


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
