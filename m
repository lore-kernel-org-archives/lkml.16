Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72981CCEF6
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738445183; cv=none; b=OCtKKZR4l/ivhfTSoIo/LJUFfeA+J6S3Xym8RmgFSowRgnr+P/p6QYaZ0JnoiT0HcnTE8t/IQEDxAceiOJGbbi0ZB9nFhTfI7R8IA6FvoLJxz1sFXkpqD99d+F57F161ofOkxgYG8JxnA5iC+MiBj4odduaGNR9Cb/nusqdHH+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738445183; c=relaxed/simple;
	bh=vzv62sbR1e9BETUQNTu1DJkjXVjg/9YBLDPja/syxtc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZWrngsTdZDFaQN24bOrVR5uDuRKH4gmhFp6Yx7VnI4foHUshMCacKMRb2LhzV3hX97HmubvbcArWi7TLDFB2kOB2VHukeT7Y0ee4AnYfOlF9F1auUYxjaaSFu1XVJU2q10Ewtsq6jDpsCFWaey2NRVxsi3QCP4wLMnQUbz77l0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d0246e4c2dso11410085ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 13:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738445181; x=1739049981;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GeUGSkFBm2yZhWw++6r8guat9DiS4wxbj9f33pBQ+yo=;
        b=Nw4vmS7m+VRHgdb2fMz/AoELV0RPjEMEfobm9g76GgOwSQ5l8o8MLzYMbTMJ29Su7d
         2EBRVNdEzW/2hjtBlwDr1zTPW36lqr3S7R6G3meREY0C/mG6zCIAjJYM8+gllfd4gtrp
         4/hxcqHMwiyj220MSipv1s6rVQjz8nS5aMwvTTVIUbsHU9Tprlw72nRET5CytJvtYW2F
         bR0btkmnArlcd1ya6t/yaZeoHtEtLQgqQw9o8Y6r8Gb3ws59QXytnQsRx6xzf6bkBuTi
         s2vToJttEuwIPrQjD3Inqphw86OGNXRat8cHEO53l2ViGI71yJyt8QTdvlOfV3WJPNM3
         598Q==
X-Forwarded-Encrypted: i=1; AJvYcCWq2Wif9EI5juJUNBcgJ14nFyFvHo+QSbYQDaY5N3W2/J//tyQqRusW8wOgRXlziCHjtNwatP+bTsFFndU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8fI45u06r+ZgUvY5R3043FRtZUBHzWnXuU9chYk1JLuBNq3bW
	KFf5uwUojCWdBzsUFeLgCZKz8w8cwX1k7WxlCE5nEMsPkfwlfEGIhnSNmkdfgBzPThi6S/JL0nB
	YZ5QxnaX/h7be190mobcKyURaCpu5oYYbJmbb1vka3VS7iLHuVA8G/Jg=
X-Google-Smtp-Source: AGHT+IE8UkTNI4V1mnUvd8NLLJ3xYmFwH6nMTW5TNFly9joHMnTD0mj1NdzJM0cndNyPEyy/9jmN7kKpnGE+/cGmJmShpjgtkGLl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1f8a:b0:3cf:bb11:a3a4 with SMTP id
 e9e14a558f8ab-3cffe44792emr158781375ab.15.1738445180801; Sat, 01 Feb 2025
 13:26:20 -0800 (PST)
Date: Sat, 01 Feb 2025 13:26:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679e917c.050a0220.d7c5a.0061.GAE@google.com>
Subject: [syzbot] [kernel?] upstream test error: BUG: corrupted list in worker_enter_idle
From: syzbot <syzbot+418416ca0fea920ad5c0@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cd45f362fc1f Merge tag 'bootconfig-fixes-v6.13' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=171245f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccb9b8c423893ece
dashboard link: https://syzkaller.appspot.com/bug?extid=418416ca0fea920ad5c0
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/96de592686f9/disk-cd45f362.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/29b0ccfb6fff/vmlinux-cd45f362.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a5dd22f0f711/bzImage-cd45f362.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+418416ca0fea920ad5c0@syzkaller.appspotmail.com

Bluetooth: hci0: unexpected cc 0x1001 length: 249 > 9
Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > 4
Bluetooth: hci0: unexpected cc 0x0c25 length: 249 > 3
Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > 2
 slab kmalloc-192 start ffff88811a55b180 pointer offset 0 size 192
list_add corruption. next->prev should be prev (ffff88810315c040), but was 0000000000000000. (next=ffff88811a55b180).
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:31!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
CPU: 1 UID: 0 PID: 6062 Comm: kworker/u9:2 Not tainted 6.13.0-syzkaller-09196-gcd45f362fc1f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue:  0x0 (hci0)
RIP: 0010:__list_add_valid_or_report+0x211/0x2a0 lib/list_debug.c:29
Code: c7 83 20 03 00 00 00 00 00 00 4d 85 db 74 05 e8 35 46 51 01 48 c7 c7 0d 2a 39 91 4c 89 ee 4c 89 e2 4c 89 f1 e8 10 90 fc ff 90 <0f> 0b 4c 89 ef e8 d5 de 1a 01 4d 8b 7d 00 4c 89 ef e8 d9 3a 51 01
RSP: 0018:ffff888012477c78 EFLAGS: 00010086
RAX: 0000000000000075 RBX: ffff88812f4dccc8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff888012477ce8 R08: ffffffff81a6e036 R09: 0000000000000000
R10: ffff88823fc64a90 R11: 0000000000000004 R12: 0000000000000000
R13: ffff88810315c040 R14: ffff88811a55b180 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88813fd00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000ff846b34 CR3: 000000012f796000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __list_add_valid include/linux/list.h:88 [inline]
 __list_add include/linux/list.h:150 [inline]
 list_add include/linux/list.h:169 [inline]
 worker_enter_idle+0x5d3/0x870 kernel/workqueue.c:1047
 worker_thread+0x1261/0x14f0 kernel/workqueue.c:3410
 kthread+0x6b9/0xef0 kernel/kthread.c:464
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__list_add_valid_or_report+0x211/0x2a0 lib/list_debug.c:29
Code: c7 83 20 03 00 00 00 00 00 00 4d 85 db 74 05 e8 35 46 51 01 48 c7 c7 0d 2a 39 91 4c 89 ee 4c 89 e2 4c 89 f1 e8 10 90 fc ff 90 <0f> 0b 4c 89 ef e8 d5 de 1a 01 4d 8b 7d 00 4c 89 ef e8 d9 3a 51 01
RSP: 0018:ffff888012477c78 EFLAGS: 00010086
RAX: 0000000000000075 RBX: ffff88812f4dccc8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff888012477ce8 R08: ffffffff81a6e036 R09: 0000000000000000
R10: ffff88823fc64a90 R11: 0000000000000004 R12: 0000000000000000
R13: ffff88810315c040 R14: ffff88811a55b180 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88813fd00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000ff846b34 CR3: 000000012f796000 CR4: 00000000003526f0
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
