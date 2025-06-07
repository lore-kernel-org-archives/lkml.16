Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D562917BA1
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749284345; cv=none; b=EnJpf5yApcqGUw0U1Ue/rKZ2O57YgkvtNn97Brq5jT7Y/LmtMMkGK3FIFocJPQa2DZdL87/qh3YlZEAdx9LGiE7XKk8LqOgxBOs6r5DjqFdv8ZC5oIT+a/YN1fHJP0AGi8UKIhRZrnHtAzLybtLSysi6CrAdVMV6Ws90JZQ6L+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749284345; c=relaxed/simple;
	bh=fuQtQaVcJkVDt/9PSbR+SgpiwBeIp63eRtDDNABM/KQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fk2tlH7wmJb8MfFDHQaARvCN/REMrOi3FXaLv49PhqMIYMa3v84Tm76oSQSP696XizlsYDCGQCVTQkKS/szIl7BGdVfzVKgQ2bTY2HciUKR0tNrJxNsPN7vRk0G7ZoPL0+Ujk/ILrHpI8Cv6N8TQ3SyziftTZGj2xzqhs9cxzgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd03db24dso11268345ab.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 01:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749284343; x=1749889143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s13S3NOvrPfX80CzD383aMEo82Kfx5LZo2k62yffP9A=;
        b=Ed/bpxiEsm1aA7qT1cx/IqMZ46qj8IEuhHO6WwxtiKBkq6Awx8hbiZ9s8LEU/Lt5Hc
         JPfaQy7BA3UKBO0YfcAOeP/GVeqsSmx9bhWDQ+Opeileuw1VHA/nB65WpGPA73PDZ6d+
         VyZvd9mSk7boKOqYNnv0UDEzpAdsw9lYYlWP+u0sJMMnQ8F4Mods7/7ZE2J6NoHN+ez4
         6Jvk/0HEx2Ad7tkAWYH/4QkoMEC5gCFH+ER+tFQU72s04rYJhodMTZtcqo0s+t+NaLlW
         bnF0+PN3Z7uDe1Y1NEh7x8Zg/Yh4oa6qUjyAZ/o4qjGVRI27QzAozg8NfK0H7XE3XnaJ
         TPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwcsrGey1qZFIuxUfZrEZRALRe/Vn59o/OtVh8gTaN5ydQ2k9cpkN/3zCkwqoiHSs997I18cyMOvfSQZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWyCW1epv7t4Tvg9amynamKe/XnlnAJeEwURPueoMuFjjYAGpW
	/8qYrYF4miVf0IfkoZ5go3JQ6qNjE1MumaIzsSZYUPgDnccJl7vLgoHF4ha4wPCoAa6ofFsxDwd
	ItCI/OP8fVwfxY70peSIN6gUqIrgyvqR2UgjzEtTgkrFCbSwhkiB1PSzm+Kc=
X-Google-Smtp-Source: AGHT+IFYiL1PpgvwoeolRs9zGl64LBjlJb+m5CDUOzadVGB3p30oa5WoFktUHTGtF+vzYi3pnv5ccLHRRuiB0nqtP43x2HVqTul6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a26:b0:3dd:b4b5:5c9f with SMTP id
 e9e14a558f8ab-3ddce453399mr67680295ab.19.1749284342961; Sat, 07 Jun 2025
 01:19:02 -0700 (PDT)
Date: Sat, 07 Jun 2025 01:19:02 -0700
In-Reply-To: <20250607074300.873-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6843f5f6.a70a0220.27c366.0044.GAE@google.com>
Subject: Re: [syzbot] [usb?] stack segment fault in __usb_hcd_giveback_urb
From: syzbot <syzbot+9a4aec827829942045ff@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
stack segment fault in __usb_hcd_giveback_urb

Oops: stack segment: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-syzkaller-13655-gbdc7f8c5adad #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:__queue_work+0x9e/0xfe0 kernel/workqueue.c:2256
Code: 8b 1d fe 53 12 11 31 ff 89 de e8 5d 97 35 00 85 db 0f 85 fc 0c 00 00 e8 10 93 35 00 49 8d 97 c0 01 00 00 48 89 d5 48 c1 ed 03 <42> 0f b6 44 25 00 84 c0 48 89 54 24 08 0f 85 44 0d 00 00 8b 1a 89
RSP: 0018:ffffc90000007708 EFLAGS: 00010002
RAX: ffffffff818ac910 RBX: 0000000000000000 RCX: ffff88801d2b1e00
RDX: 00000000000001c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000038 R08: ffff888030913bf7 R09: 1ffff1100612277e
R10: dffffc0000000000 R11: ffffed100612277f R12: dffffc0000000000
R13: ffff888030913bf0 R14: 0000000000000008 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125c52000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c4d8c01950 CR3: 000000006f4f2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 queue_work_on+0x181/0x270 kernel/workqueue.c:2392
 __usb_hcd_giveback_urb+0x417/0x690 drivers/usb/core/hcd.c:1650
 dummy_timer+0x862/0x4550 drivers/usb/gadget/udc/dummy_hcd.c:1994
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x52c/0xc60 kernel/time/hrtimer.c:1825
 hrtimer_run_softirq+0x187/0x2b0 kernel/time/hrtimer.c:1842
 handle_softirqs+0x286/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:console_flush_all+0x7f7/0xc40 kernel/printk/printk.c:3227
Code: 48 21 c3 0f 85 e9 01 00 00 e8 e5 20 1f 00 48 8b 5c 24 20 4d 85 f6 75 07 e8 d6 20 1f 00 eb 06 e8 cf 20 1f 00 fb 48 8b 44 24 28 <42> 80 3c 20 00 74 08 48 89 df e8 ca 97 82 00 48 8b 1b 48 8b 44 24
RSP: 0018:ffffc900000f70a0 EFLAGS: 00000293
RAX: 1ffffffff1d36b07 RBX: ffffffff8e9b5838 RCX: ffff88801d2b1e00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900000f71f0 R08: ffffffff8fa112f7 R09: 1ffffffff1f4225e
R10: dffffc0000000000 R11: fffffbfff1f4225f R12: dffffc0000000000
R13: 0000000000000001 R14: 0000000000000200 R15: ffffffff8e9b57e0
 __console_flush_and_unlock kernel/printk/printk.c:3285 [inline]
 console_unlock+0xc4/0x270 kernel/printk/printk.c:3325
 vprintk_emit+0x5b7/0x7a0 kernel/printk/printk.c:2450
 dev_vprintk_emit+0x337/0x3f0 drivers/base/core.c:4917
 dev_printk_emit+0xe0/0x130 drivers/base/core.c:4928
 _dev_info+0x10a/0x160 drivers/base/core.c:4986
 usb_disconnect+0xdd/0x910 drivers/usb/core/hub.c:2298
 hub_port_connect drivers/usb/core/hub.c:5375 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5917
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__queue_work+0x9e/0xfe0 kernel/workqueue.c:2256
Code: 8b 1d fe 53 12 11 31 ff 89 de e8 5d 97 35 00 85 db 0f 85 fc 0c 00 00 e8 10 93 35 00 49 8d 97 c0 01 00 00 48 89 d5 48 c1 ed 03 <42> 0f b6 44 25 00 84 c0 48 89 54 24 08 0f 85 44 0d 00 00 8b 1a 89
RSP: 0018:ffffc90000007708 EFLAGS: 00010002
RAX: ffffffff818ac910 RBX: 0000000000000000 RCX: ffff88801d2b1e00
RDX: 00000000000001c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000038 R08: ffff888030913bf7 R09: 1ffff1100612277e
R10: dffffc0000000000 R11: ffffed100612277f R12: dffffc0000000000
R13: ffff888030913bf0 R14: 0000000000000008 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125c52000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c4d8c01950 CR3: 000000006f4f2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	8b 1d fe 53 12 11    	mov    0x111253fe(%rip),%ebx        # 0x11125404
   6:	31 ff                	xor    %edi,%edi
   8:	89 de                	mov    %ebx,%esi
   a:	e8 5d 97 35 00       	call   0x35976c
   f:	85 db                	test   %ebx,%ebx
  11:	0f 85 fc 0c 00 00    	jne    0xd13
  17:	e8 10 93 35 00       	call   0x35932c
  1c:	49 8d 97 c0 01 00 00 	lea    0x1c0(%r15),%rdx
  23:	48 89 d5             	mov    %rdx,%rbp
  26:	48 c1 ed 03          	shr    $0x3,%rbp
* 2a:	42 0f b6 44 25 00    	movzbl 0x0(%rbp,%r12,1),%eax <-- trapping instruction
  30:	84 c0                	test   %al,%al
  32:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  37:	0f 85 44 0d 00 00    	jne    0xd81
  3d:	8b 1a                	mov    (%rdx),%ebx
  3f:	89                   	.byte 0x89


Tested on:

commit:         bdc7f8c5 Merge tag 'mm-stable-2025-06-06-16-09' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=162f6c0c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fd0cea6d0f67318f
dashboard link: https://syzkaller.appspot.com/bug?extid=9a4aec827829942045ff
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Note: no patches were applied.
