Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA528003E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541985; cv=none; b=Se7tsS44sN1YhygmN5orXR4whu/68qm6ENGwsL+40ljODnqKbetohwizHEeredfTXDxZBHwTUwVcPz60zfm2Y+LlUwB4OCQ1fIYDY/F4Ob0HYMsXyxdsVpkLN4c2LFgL7S6bys5/gNZ1ZZcU3gsK4giLtwtUN15M5Zwf2utlw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541985; c=relaxed/simple;
	bh=sybmdH8juBQgh+8aDdMvxg8DAncPGBfUTZRfo4u2uiQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kWxlWgrnkwWIQMokov4YBGhKDJMVkC3uhHmqvRZv6ddhOY2rWGTpU3ucVzfQdm23KaV3z0Xr4e8nQ5u35/NsXJbvH7Jk2qYeypayq2n4bm4yJZQHI4dcaTu9rfzIFr4QkYcdBbb4Hv0wfvRove97Pg6/4xJtazUks5w1IlRlouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddce213201so41290265ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541983; x=1750146783;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tI//4SphqcVdKXN2qVB/uTZTlYbyxqewim7bNh30eVo=;
        b=habpRLwF7eimEGIOeHXVSUha++OWEOdDfG+GCGwMNCn/08ohQ0EhMVk4VkW2Z+wkza
         7LN7Pc9S/A5rlkTKiX3qbDmQMInpGwQviiTyVXS8flzOuVJr8O5E0Vetw/x4Kfgb2sVh
         QKkYHFIllOZ8Sm3/iDkUJ6bKhZuVp/G7Wkzl5j/IkfeiaxmgtN+wbCHjrqfHdoMVqkSI
         G6a5tIFMTzyBQ0DUDiw2MFK3RqZ6t2AH791SyMsJoAAEwtLz9L77IWmqBOiAaiNXcmnx
         UFoSO0CUoCL0kXh4vJs/6+tFNsmQKiNa5Qu2hl+vluum9nrOzlhAFNabKX+h98mY0cg/
         NFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvX/bicNFFM92NfJf8NxnO+lTo3Q48g7ksI2qtGceXVRB3QRxonfqnbGAKfJ692Iev78RaCp5588epyn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCWIvphpHjZZarsj24/sjm+svQn4tnVyetxEq/FexipPIcdlG
	DnNiN6H/VqdTnTjdcBX3BMU5jwvmRAooSZ3G+W6TsYjjijBrnFvv/pS25puMh7In0OeXsexsqeX
	c9Fr3joeFAoF9HKwEQ37D8RFvi/baCVZvL3GD8bZThhiuFw4gXwEcXhQhPLM=
X-Google-Smtp-Source: AGHT+IHsGP3HvPK/2p/nG2nWBAbT6a9yb8djT5Avth74V78fBmu43U9SuxFJvZUzPnLP6Z6IqSNHFpBSAF7OHdG3D+0DhdFi9SeW
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4403:10b0:3dc:7b3d:6a45 with SMTP id
 e9e14a558f8ab-3ddec7a20b2mr18427335ab.0.1749541983053; Tue, 10 Jun 2025
 00:53:03 -0700 (PDT)
Date: Tue, 10 Jun 2025 00:53:03 -0700
In-Reply-To: <782a6cbc-1156-4aad-a580-4f5a9c561a05@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6847e45f.a70a0220.27c366.005b.GAE@google.com>
Subject: Re: [syzbot] [wireless?] general protection fault in carl9170_usb_rx_complete
From: syzbot <syzbot+0d8afba53e8fb2633217@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in carl9170_usb_rx_complete

------------[ cut here ]------------
WARNING: CPU: 0 PID: 10 at drivers/net/wireless/ath/carl9170/usb.c:448 carl9170_usb_rx_complete+0x2e4/0x310 drivers/net/wireless/ath/carl9170/usb.c:448
Modules linked in:
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.16.0-rc1-syzkaller-dirty #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:carl9170_usb_rx_complete+0x2e4/0x310 drivers/net/wireless/ath/carl9170/usb.c:448
Code: 86 17 03 e9 88 fe ff ff e8 79 79 9b fd 4c 89 f7 e8 e1 5a 60 fd e9 14 ff ff ff e8 d7 6e f8 fd e9 b1 fd ff ff e8 5d 79 9b fd 90 <0f> 0b 90 e9 5e fe ff ff e8 ef 6e f8 fd e9 44 fd ff ff 48 89 34 24
RSP: 0018:ffffc90000007b28 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffff8881285bb080 RCX: ffffffff83e24372
RDX: ffff8881016f1d00 RSI: ffffffff83e243d3 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff8881285bba20
R13: ffff8881285bba48 R14: ffff8881285bba18 R15: 0100000000000004
FS:  0000000000000000(0000) GS:ffff88826917f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff0e3e5e00 CR3: 00000001370c0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 __usb_hcd_giveback_urb+0x38a/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x39b/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x180e/0x3a20 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x202/0xad0 kernel/time/hrtimer.c:1825
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1842
 handle_softirqs+0x205/0x8d0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:194
Code: f5 53 48 8b 74 24 10 48 89 fb 48 83 c7 18 e8 66 c1 2b fa 48 89 df e8 4e 15 2c fa f7 c5 00 02 00 00 75 23 9c 58 f6 c4 02 75 37 <bf> 01 00 00 00 e8 15 88 1f fa 65 8b 05 7e 6d 3b 05 85 c0 74 16 5b
RSP: 0018:ffffc900000af578 EFLAGS: 00000246
RAX: 0000000000000002 RBX: ffffffff938a36a8 RCX: 0000000000000007
RDX: 0000000000000000 RSI: ffffffff88af5ee8 RDI: ffffffff8768a280
RBP: 0000000000000206 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff8a7a0ed7 R11: 0000000000000001 R12: 1ffff92000015eb6
R13: ffffc900000af6d8 R14: 0000000000000000 R15: ffffffff938a36a8
 __debug_object_init+0x2de/0x3d0 lib/debugobjects.c:755
 timer_init_key_on_stack+0x2e/0x120 kernel/time/timer.c:816
 schedule_timeout+0x111/0x290 kernel/time/sleep_timeout.c:96
 schedule_timeout_uninterruptible kernel/time/sleep_timeout.c:158 [inline]
 msleep+0xa6/0xf0 kernel/time/sleep_timeout.c:318
 hub_port_reset+0x498/0x1e00 drivers/usb/core/hub.c:3133
 hub_port_init+0x1f9/0x3b50 drivers/usb/core/hub.c:4907
 hub_port_connect drivers/usb/core/hub.c:5464 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x2d43/0x5030 drivers/usb/core/hub.c:5917
 process_one_work+0x9cf/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5b3/0x6c0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	f5                   	cmc
   1:	53                   	push   %rbx
   2:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   7:	48 89 fb             	mov    %rdi,%rbx
   a:	48 83 c7 18          	add    $0x18,%rdi
   e:	e8 66 c1 2b fa       	call   0xfa2bc179
  13:	48 89 df             	mov    %rbx,%rdi
  16:	e8 4e 15 2c fa       	call   0xfa2c1569
  1b:	f7 c5 00 02 00 00    	test   $0x200,%ebp
  21:	75 23                	jne    0x46
  23:	9c                   	pushf
  24:	58                   	pop    %rax
  25:	f6 c4 02             	test   $0x2,%ah
  28:	75 37                	jne    0x61
* 2a:	bf 01 00 00 00       	mov    $0x1,%edi <-- trapping instruction
  2f:	e8 15 88 1f fa       	call   0xfa1f8849
  34:	65 8b 05 7e 6d 3b 05 	mov    %gs:0x53b6d7e(%rip),%eax        # 0x53b6db9
  3b:	85 c0                	test   %eax,%eax
  3d:	74 16                	je     0x55
  3f:	5b                   	pop    %rbx


Tested on:

commit:         19272b37 Linux 6.16-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12dcaa82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d9d9f47f21a57a6
dashboard link: https://syzkaller.appspot.com/bug?extid=0d8afba53e8fb2633217
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=106ac60c580000

