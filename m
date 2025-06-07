Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE225228C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 01:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749258990; cv=none; b=RaMekjcy7ygV4s/BgWdWEdZQ8j9TMGNIfJeh5F8KXpatVWA6b3aJoZTN4JB8H7+T/VbW5rbwviPlKMg1c92meGv/aAgIsOhapXC3yxRLCj7apdCdvETBg67lIWfdCoX2B7NbYNZy1tgcZ31CvBYPwLxTclk9fUWjlfu25zYtMKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749258990; c=relaxed/simple;
	bh=CY70dFmXDKIoT3YRR12Hwsmgpg5TB3IvZaWppqjdr3g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=a5pPRfvDKum5X4JV9kDJclIYvk7Fd+nTVw6t/4q1zq8qces4p261KdRxRaDyGf5BLcoRONYqcxquu8L/CtElZJdXxNt1fHF5tpqkeX/WcVQDmNjYpQLbC5yLVN3gOO/useTOlwN6pps1CJxyNas8Z3OtR2oJVOhPWLAOPU576ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-86d1218df67so212150839f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 18:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749258987; x=1749863787;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viQc7sIXGySKplhOlBYYnNqFF+RSKL+DcKgMgR9qxCQ=;
        b=T+kHTDkCnBdmsMMs6LlPSaUXnrTPz2FflGMMEg3r368oX5PrAkzSIJ3+9ZSMdBLaYf
         MkjXZE1K5ac8hVEpmiWM3tdg8s5vRspE4Whvzn1pep6LbG0rLFy8X2/JLwwxXITI7Wba
         ZZU+qd31ZNbmZjPpTFyWrVJMJlfAOfLAMlMfYnx3w352uKMgWlMJtRN1vK5cOEsI5wWr
         EL9b/YEFEhkFGhtbShOctWsbuo5IJeCJJ3r6HGxFV+q9S6hfEFlmt5cbIPT7udUuAOIr
         Pc6mOl8ebx9zHizF3LcP/h73sdZnOZT2y9/c3cO8Csw/aqIuC6AES/vyqTTRzL7Tz78L
         SQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWubFgNpUmp/he+ucuX6Y4d35gpY0068yJzL5W/G5cvg2JYZkH/l/M65HTxJNUNk8zIAGE0ZQMLrVvZWTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMPmUhJFCalQHAwPQSEU06w0RET0EdKUdNzUYUGlYrCHcGdcoV
	5uk1BKeo7Hg9ggZh6mgETsCPdd4Dq6U0lrEoOfAGU/E8YtLKVChr4ccB+0XuUJDTC6ccylietm8
	XPuUafRNPyVI4IMTVn3+W1ZuEbWi+NBiuENXYdOQMbFfPS40yBmSdzxwLBZ8=
X-Google-Smtp-Source: AGHT+IFESxBhGNj87C1lxPw1fq/SqtPYueHBQ7aQzMp5D8sitgEe9uoXErH+V82nsyeg/1U9rtHxoSBjmcoKXuv1L5TRmVanEekE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:180e:b0:3dd:cc26:61c7 with SMTP id
 e9e14a558f8ab-3ddce454199mr65010095ab.20.1749258987570; Fri, 06 Jun 2025
 18:16:27 -0700 (PDT)
Date: Fri, 06 Jun 2025 18:16:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <684392eb.a00a0220.29ac89.004f.GAE@google.com>
Subject: [syzbot] [usb?] stack segment fault in __usb_hcd_giveback_urb
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, marcello.bauer@9elements.com, 
	stern@rowland.harvard.edu, sylv@sylv.io, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7f9039c524a3 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10e2180c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6acfdd5e5c8ef3d0
dashboard link: https://syzkaller.appspot.com/bug?extid=9a4aec827829942045ff
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13fd0570580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c7c1d4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/28a04aa25fd8/disk-7f9039c5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5f13feaf2dfc/vmlinux-7f9039c5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5f3d17075519/bzImage-7f9039c5.xz

The issue was bisected to:

commit a7f3813e589fd8e2834720829a47b5eb914a9afe
Author: Marcello Sylvester Bauer <sylv@sylv.io>
Date:   Thu Apr 11 14:51:28 2024 +0000

    usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16a2b80c580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=15a2b80c580000
console output: https://syzkaller.appspot.com/x/log.txt?x=11a2b80c580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com
Fixes: a7f3813e589f ("usb: gadget: dummy_hcd: Switch to hrtimer transfer scheduler")

Oops: stack segment: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 5905 Comm: kworker/0:9 Not tainted 6.15.0-syzkaller-11061-g7f9039c524a3 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:__queue_work+0x9e/0xfe0 kernel/workqueue.c:2256
Code: 8b 1d de 93 11 11 31 ff 89 de e8 fd 95 35 00 85 db 0f 85 fc 0c 00 00 e8 b0 91 35 00 49 8d 97 c0 01 00 00 48 89 d5 48 c1 ed 03 <42> 0f b6 44 25 00 84 c0 48 89 54 24 08 0f 85 44 0d 00 00 8b 1a 89
RSP: 0018:ffffc90000007708 EFLAGS: 00010002
RAX: ffffffff818ac930 RBX: 0000000000000000 RCX: ffff888030365a00
RDX: 00000000000001c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000038 R08: ffff88807e0d3bf7 R09: 1ffff1100fc1a77e
R10: dffffc0000000000 R11: ffffed100fc1a77f R12: dffffc0000000000
R13: ffff88807e0d3bf0 R14: 0000000000000008 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125c5e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007efc1f35ecf0 CR3: 0000000075fe4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 queue_work_on+0x181/0x270 kernel/workqueue.c:2392
 __usb_hcd_giveback_urb+0x41a/0x690 drivers/usb/core/hcd.c:1650
 dummy_timer+0x862/0x4550 drivers/usb/gadget/udc/dummy_hcd.c:1994
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x52c/0xc60 kernel/time/hrtimer.c:1825
 hrtimer_run_softirq+0x187/0x2b0 kernel/time/hrtimer.c:1842
 handle_softirqs+0x283/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 common_interrupt+0xbb/0xe0 arch/x86/kernel/irq.c:285
 </IRQ>
 <TASK>
 asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:693
RIP: 0010:console_flush_all+0x7f7/0xc40 kernel/printk/printk.c:3227
Code: 48 21 c3 0f 85 e9 01 00 00 e8 e5 22 1f 00 48 8b 5c 24 20 4d 85 f6 75 07 e8 d6 22 1f 00 eb 06 e8 cf 22 1f 00 fb 48 8b 44 24 28 <42> 80 3c 20 00 74 08 48 89 df e8 8a ac 82 00 48 8b 1b 48 8b 44 24
RSP: 0018:ffffc900047ef0a0 EFLAGS: 00000293
RAX: 1ffffffff1d36baf RBX: ffffffff8e9b5d78 RCX: ffff888030365a00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900047ef1f0 R08: ffffffff8fa0e0f7 R09: 1ffffffff1f41c1e
R10: dffffc0000000000 R11: fffffbfff1f41c1f R12: dffffc0000000000
R13: 0000000000000001 R14: 0000000000000200 R15: ffffffff8e9b5d20
 __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
 console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
 vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
 dev_vprintk_emit+0x337/0x3f0 drivers/base/core.c:4917
 dev_printk_emit+0xe0/0x130 drivers/base/core.c:4928
 _dev_info+0x10a/0x160 drivers/base/core.c:4986
 usb_disconnect+0xdd/0x910 drivers/usb/core/hub.c:2298
 hub_port_connect drivers/usb/core/hub.c:5371 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__queue_work+0x9e/0xfe0 kernel/workqueue.c:2256
Code: 8b 1d de 93 11 11 31 ff 89 de e8 fd 95 35 00 85 db 0f 85 fc 0c 00 00 e8 b0 91 35 00 49 8d 97 c0 01 00 00 48 89 d5 48 c1 ed 03 <42> 0f b6 44 25 00 84 c0 48 89 54 24 08 0f 85 44 0d 00 00 8b 1a 89
RSP: 0018:ffffc90000007708 EFLAGS: 00010002
RAX: ffffffff818ac930 RBX: 0000000000000000 RCX: ffff888030365a00
RDX: 00000000000001c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000038 R08: ffff88807e0d3bf7 R09: 1ffff1100fc1a77e
R10: dffffc0000000000 R11: ffffed100fc1a77f R12: dffffc0000000000
R13: ffff88807e0d3bf0 R14: 0000000000000008 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125c5e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007efc1f35ecf0 CR3: 0000000075fe4000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	8b 1d de 93 11 11    	mov    0x111193de(%rip),%ebx        # 0x111193e4
   6:	31 ff                	xor    %edi,%edi
   8:	89 de                	mov    %ebx,%esi
   a:	e8 fd 95 35 00       	call   0x35960c
   f:	85 db                	test   %ebx,%ebx
  11:	0f 85 fc 0c 00 00    	jne    0xd13
  17:	e8 b0 91 35 00       	call   0x3591cc
  1c:	49 8d 97 c0 01 00 00 	lea    0x1c0(%r15),%rdx
  23:	48 89 d5             	mov    %rdx,%rbp
  26:	48 c1 ed 03          	shr    $0x3,%rbp
* 2a:	42 0f b6 44 25 00    	movzbl 0x0(%rbp,%r12,1),%eax <-- trapping instruction
  30:	84 c0                	test   %al,%al
  32:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  37:	0f 85 44 0d 00 00    	jne    0xd81
  3d:	8b 1a                	mov    (%rdx),%ebx
  3f:	89                   	.byte 0x89


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
