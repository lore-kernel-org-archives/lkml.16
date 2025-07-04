Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B142BEFFF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646032; cv=none; b=mdcf/eHnOGYbfRPmzxiSNbq8Kv7zQB+7bX4061OhMqSnQNudy19hv2SbWo6Vx/rAIX5EAYBzegtxJUkqVEUEYgc88jEf6XBr2JRNAghMdDR5Ad6mOGqBAYdlc+dOhQzwUGeMzwD9bIn5LyQlOdk5caVVp6Dbvg003fLe7Jta8ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646032; c=relaxed/simple;
	bh=a35sr+yMGBcMJitY/cYTMunw0c35pEr/MOeRf0FDzD4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Q9vB2HMa7gnczR2VUspUI+XK34oVFkCEJPh4/SkoBOiKIKnYNEynm33HG3bDB4sJXpL6FxaZBiJCvwzSrBtrRCmD8d0v4M8mvcDsoQSSpWPP3ZPna7/sZiM6n3Azbs+y3UvKY72E6yLQN8agCg9W1ebxJDSVADVzvslTMFzelF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3df6030ea24so11489295ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646030; x=1752250830;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOVL64Q/jgrdwGbsFRSs7XPFscMdGwk+nxulL4tOy4g=;
        b=XHXu2GvUaK0B/tsA1fzhQef/3tAEVCOU5gKpykBxsKq2w163+3YnGT/ngbWWteimrr
         2FM+9iGCs4tgVED1QmcTRdDxZKfIO4ZL+nLlb3uehi4BFGA8E7cqHVex9VJkTG9R4cZ5
         HeE/dXIw8cKmXDaORhp/3yoKN0b6qHRUQiaHPJvFn5GoXgYnf16qF0fukku0p6IInvQR
         Ylevw7p6JOSA8yaA7OgSYfkAdtY87n+G0rf8tqOMKg3OqGciNgJnoY0Bqb45oEq1O6oE
         DVLc6KfAsRG95ow0L8G7tb5UTG8JXMgT3k3djFmmg4oMjmygYdHv5hinkwR8gnCQd/hC
         N/xA==
X-Forwarded-Encrypted: i=1; AJvYcCWnqXclBZyWmBpHq8YIrHypsLAKbAhLmwQK6lEfXZD9w8tYXHbmt/Z8FUL9EerCSi2VyNI37v6lksEFFFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3SACXGstrguUqDlT9ZJkhfzq/PQTEGNLVgQdaJ1ivyDI0CVI
	nzco301MglrOhD3Od8Gl4tlwwRyTk1hJTltAISE1p1QnLQOafiAQNXKvBYN4xEVsJlsxU2CieUm
	vPBbgoFZnkTiOYyMa9EepDkKPMiGFhKZWk9rw+k51KN93SV9Auu5tjNu5T5w=
X-Google-Smtp-Source: AGHT+IGCNYf5EoJ2PbSU0jhtlpsjjyjYa5ggWxwtyrMpbNnb3Cts8QsCet/TwefC3oSxZDdZF/pI7SH3Pw0vLtcSHsWoly8RsGa6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a82:b0:3df:3be7:59d1 with SMTP id
 e9e14a558f8ab-3e13557638emr24015565ab.11.1751646029734; Fri, 04 Jul 2025
 09:20:29 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:20:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867ff4d.a70a0220.29cf51.0023.GAE@google.com>
Subject: [syzbot] [kernel?] UBSAN: shift-out-of-bounds in das16m1_attach
From: syzbot <syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4c06e63b9203 Merge tag 'for-6.16-rc4-tag' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=102c73d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
dashboard link: https://syzkaller.appspot.com/bug?extid=c52293513298e0fd9a94
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166c6c8c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142c73d4580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4c06e63b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/15f2393c96b6/vmlinux-4c06e63b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/44c28e8ae1a0/bzImage-4c06e63b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c52293513298e0fd9a94@syzkaller.appspotmail.com

UBSAN: shift-out-of-bounds in drivers/comedi/drivers/das16m1.c:525:9
shift exponent 67108867 is too large for 32-bit type 'int'
CPU: 0 UID: 0 PID: 6101 Comm: syz.0.16 Not tainted 6.16.0-rc4-syzkaller-00123-g4c06e63b9203 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:233 [inline]
 __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
 das16m1_attach.cold+0x19/0x1e drivers/comedi/drivers/das16m1.c:525
 comedi_device_attach+0x3b3/0x900 drivers/comedi/drivers.c:996
 do_devconfig_ioctl+0x1a7/0x580 drivers/comedi/comedi_fops.c:855
 comedi_unlocked_ioctl+0x15bb/0x2e90 drivers/comedi/comedi_fops.c:2136
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x18b/0x210 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f1d8718e929
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe20aa5098 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f1d873b5fa0 RCX: 00007f1d8718e929
RDX: 0000200000000080 RSI: 0000000040946400 RDI: 0000000000000003
RBP: 00007f1d87210b39 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f1d873b5fa0 R14: 00007f1d873b5fa0 R15: 0000000000000003
 </TASK>
---[ end trace ]---


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
