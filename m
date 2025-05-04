Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014A4C83
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 01:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746323046; cv=none; b=ckYCMHirx8DS79i3EKnQtSUrhPAdbMvhxifD16zU/WYliILwo40bcSZReX6haivbc3ObbGC4FtKGmwdk5GaqlPi67AXR1+i8IeN4PJ9C3mhnEQHjnI6fW5Sie0J0xuvJUN3YcH1PZ+5AkYRPyHoosILTlCjIvEn7Imun58aSJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746323046; c=relaxed/simple;
	bh=q0370ddK63HwIKcCK8oZ8nHzQVHiD3Dh6HyTZ36exLs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T2h9Ctsp62q1qkMUlBQfBBjOHCIV+HKkeZ7q545fEtDpfL/3zZ/XvitVwxda+WwUMampnnBNCzC0oXvNTRkJdySL4RFFW1ptqglBMGz7rxah1r2IRG7R/DQZSn8YWJjvQTtVuTmdjLIvVJpJOQNvmT6eM6WbmLjdCwzIOj4yuaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85dad56a6cbso565069139f.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 18:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746323044; x=1746927844;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtTZHT7L3v8DUg6KqZuy809MkwIklfHr0nIwn0T1Sgw=;
        b=dlX7RphruN/QZR4HdDNSPomHw8dOplgqHzsuqnweauaJsd0mAvivz2rVSSdE1RQc/a
         73BgovMbt2zfbfeGaYselBNC3QdqQrAyS5DTXFKe4exd6FIN0Z8rHLZU23jB51Ef8slY
         /1cHjgR7mRsX2oPxL8tNX2HRyzGva4xBGil3p3E+bQ95MCUvf8JayIPGzRN/pZEanSKV
         qq3F7zJfxqNFoT8Y6x9oy0cGBrpaFJ0KIhnSRmtHS9ROzAW/uQtGKb+T9wUlW8vhADon
         oy5AHxB4zgjD6p1fCAtwL25VlbU685I42a5F9NV4DdKz6P5cF/YyD88LHawxslYfimGV
         PK5A==
X-Forwarded-Encrypted: i=1; AJvYcCUmn00Y1+o9uRwasLUpCzaM4j4GHE7HZnp+Peaurc3pP4VjDgkpUUK6WVQAdcTdIj9A61C09sh0rYRlWAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1ATo6h17TmatJ44nC5TBkToX+NiRAismx2KvQw/hTJBjSVHL
	bGw/4UBXr2jLWd3JB1ntwZfHsuqBbZO8cZAtU2y36G884zItmPRb67yBzal0YJl6x/jmIUjULxb
	4/lWvq5wt/9Gei0WVmg5JOA2E4W+V+D1XuLsfO+qitCKLquODFPY+Hl0=
X-Google-Smtp-Source: AGHT+IHbGvfw4819epX+Ipg9zhDw+P4HLbQG+2IfHP7bCUaMF5aGVp0zyESA9ePSiuXwb33NBFDNIVqZhCka2lkuf8fgwSab+deq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18c6:b0:3d9:3adb:e589 with SMTP id
 e9e14a558f8ab-3da56903330mr42934555ab.4.1746323043866; Sat, 03 May 2025
 18:44:03 -0700 (PDT)
Date: Sat, 03 May 2025 18:44:03 -0700
In-Reply-To: <20250503231531.1578-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6816c663.050a0220.11da1b.0020.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in dvb_usb_i2c_exit
From: syzbot <syzbot+0dcc341ee61fc9e4032f@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in module_put

Oops: general protection fault, probably for non-canonical address 0xfbd59c00000000bd: 0000 [#1] SMP KASAN NOPTI
KASAN: maybe wild-memory-access in range [0xdead0000000005e8-0xdead0000000005ef]
CPU: 0 UID: 0 PID: 6827 Comm: syz.3.19 Not tainted 6.15.0-rc4-syzkaller-00296-ge8ab83e34bdc-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
RIP: 0010:arch_atomic_read arch/x86/include/asm/atomic.h:23 [inline]
RIP: 0010:raw_atomic_read include/linux/atomic/atomic-arch-fallback.h:457 [inline]
RIP: 0010:raw_atomic_dec_if_positive include/linux/atomic/atomic-arch-fallback.h:2554 [inline]
RIP: 0010:atomic_dec_if_positive include/linux/atomic/atomic-instrumented.h:1594 [inline]
RIP: 0010:module_put.part.0+0x2c/0x1a0 kernel/module/main.c:874
Code: be 04 00 00 00 55 48 89 fd 53 48 8d 9f e8 04 00 00 48 89 df e8 45 85 7b 00 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 14 02 48 89 d8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 37
RSP: 0018:ffffc900030afda0 EFLAGS: 00010a06

RAX: dffffc0000000000 RBX: dead0000000005e8 RCX: 0000000000000000
RDX: 1bd5a000000000bd RSI: 0000000000000004 RDI: ffffc900030afd48
RBP: dead000000000100 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888029df6758
R13: ffff888029f8cfe0 R14: ffffffff87b61660 R15: ffff888029f8cfe0
FS:  0000555565b2c500(0000) GS:ffff8881249e2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2fd5ffff CR3: 000000006149d000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 i2c_put_adapter drivers/i2c/i2c-core-base.c:2624 [inline]
 i2c_put_adapter+0x36/0x60 drivers/i2c/i2c-core-base.c:2619
 i2cdev_release+0x53/0xa0 drivers/i2c/i2c-dev.c:632
 __fput+0x3ff/0xb70 fs/file_table.c:465
 task_work_run+0x14d/0x240 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x260 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6f3678e969
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffcf1eb9828 EFLAGS: 00000246
 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f6f369b7ba0 RCX: 00007f6f3678e969
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f6f369b7ba0 R08: 0000000000000000 R09: 00000003f1eb9b1f
R10: 000000000003fdc8 R11: 0000000000000246 R12: 000000000001e11e
R13: 00007ffcf1eb9920 R14: ffffffffffffffff R15: 00007ffcf1eb9940
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	be 04 00 00 00       	mov    $0x4,%esi
   5:	55                   	push   %rbp
   6:	48 89 fd             	mov    %rdi,%rbp
   9:	53                   	push   %rbx
   a:	48 8d 9f e8 04 00 00 	lea    0x4e8(%rdi),%rbx
  11:	48 89 df             	mov    %rbx,%rdi
  14:	e8 45 85 7b 00       	call   0x7b855e
  19:	48 89 da             	mov    %rbx,%rdx
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2e:	48 89 d8             	mov    %rbx,%rax
  31:	83 e0 07             	and    $0x7,%eax
  34:	83 c0 03             	add    $0x3,%eax
  37:	38 d0                	cmp    %dl,%al
  39:	7c 08                	jl     0x43
  3b:	84 d2                	test   %dl,%dl
  3d:	0f                   	.byte 0xf
  3e:	85 37                	test   %esi,(%rdi)


Tested on:

commit:         e8ab83e3 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126310f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca17f2d2ba38f7a0
dashboard link: https://syzkaller.appspot.com/bug?extid=0dcc341ee61fc9e4032f
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1002d774580000

